<?php defined('BASEPATH') OR exit('No direct script access allowed');

class M_process extends CI_Model {

  public function show_product($post) {
    if (!empty($name = $post['process_search_name'])) $this->db->like('p.name', $name);

    if (!empty($category = $post['process_search_category'])) $this->db->where('p.category_id', $category);

    if (!empty($price = $post['process_search_price'])) $this->db->where('pp.price_id', $price);

    $this->db->select('p.id,p.name,p.stock,p.unit,pp.price,c.name as category');
    $this->db->join('category c', 'c.id=p.category_id', 'left');
    $this->db->join('product_price pp', 'pp.product_id=p.id', 'inner');
    $this->db->limit(50);

    return $this->db->get('product p')->result_array();
  }

  public function get_product($id) {
    $this->db->select('name,unit');
    $this->db->where('id', $id);
    return $this->db->get('product')->row_array();
  }

  public function check_stock($product_ids, &$sess) {
    $this->db->select('id, name, stock');
    $this->db->where_in('id', $product_ids);
    $r = $this->db->get('product')->result_array();

    $ret = array(
     'success' => 1,
     'msg'     => 'Stok tersedia'
    );

    foreach ($r as $product) {
      if($product['stock'] < $sess[$product['id']]['qty']) {
        $ret = array(
         'success' => 0,
         'msg'     => 'Qty ' . $product['name'] . ' anda ' . $sess[$product['id']]['qty'] . ' melebihi stok. Stok ' . $product['name'] . ' adalah ' . $product['stock'],
        );
        break;
      }
    }

    return $ret;
  }

  public function get_sender($sender_id = '') {
    $sender = '';
    if(!empty($sender_id)) {
      $this->db->select('name');
      $this->db->where('id', $sender_id);
      $sender = $this->db->get('sender')->row()->name;
    }

    return $sender;
  }

  public function get_price($price_id = '') {
    $price = '';
    if(!empty($price_id)) {
      $this->db->select('name');
      $this->db->where('id', $price_id);
      $price = $this->db->get('price')->row()->name;
    }

    return $price;
  }

  public $sale_id;

  public function save_sale($array) {
    $r = $this->db->insert('sale', $array);
    $this->sale_id = $this->db->insert_id();
    return $r;
  }

  public function save_sale_product($array) {
    return $this->db->insert_batch('sale_product', $array);
  }

  public function product_update($sess, $usess) {
    foreach ($sess as $product_id => $dsess) {
      $this->db->where('id', $product_id);
      $this->db->set('stock', 'stock-' . $dsess['qty'], false);
      $this->db->set('user_id', $usess['id']);
      $this->db->set('username', $usess['username']);
      $r = $this->db->update('product');

      if(!$r) break;
    }
    return $r;
  }

  public function invoice($sale_id, $invoice) {
    $this->db->where('id', $sale_id);
    return $this->db->update('sale', array(
      'invoice' => $invoice
    ));
  }

  public function finish($post, $usess) {
    $session = $this->session->userdata('process_temp');

    if (!empty($session)) {
      $this->db->trans_begin();

      // check not enough stock
      $sess = array();
      foreach ($session as $dts) {
        if (!empty($sess[$dts['product_id']])) $sess[$dts['product_id']]['qty'] += $dts['qty']; 
        else $sess[$dts['product_id']] = $dts;
      }

      $product_ids = array_keys($sess);

      $ret = $this->check_stock($product_ids, $sess);

      if ($ret['success']) {
        // insert sale set iscomplete 1 if total < pay
        $total    = 0;
        $discount = 0;
        $qty      = 0;
        $kind     = 0;

        foreach ($session as &$dts) {
          $total    += $dts['price'] * $dts['qty'];
          $discount += $dts['discount'] * $dts['qty'];
          $qty      += $dts['qty'];
          $kind ++;

          $dts['user_id']      = $usess['id'];
          $dts['username']     = $usess['username'];
        }

        $grand_total = $total - $discount;

        $paid    = @intval($post['finish_paid']);
        $changes = $paid - $grand_total;

        $sender_id   = @intval($post['finish_sender']);
        $sender_name = $this->get_sender($sender_id);

        $price_id   = @intval($post['finish_price']);
        $price_name = $this->get_price($price_id);
        
        $sale_array = array(
          'sender_id'   => $sender_id,
          'sender_name' => $sender_name,
          'total'       => $total,
          'discount'    => $discount,
          'grand_total' => $grand_total,
          'paid'        => $paid,
          'changes'     => $changes,
          'qty'         => $qty,
          'kind'        => $kind,
          'price_id'    => $price_id,
          'price_name'  => $price_name,
          'user_id'     => $usess['id'],
          'username'    => $usess['username'],
        );

        $finish_date = $post['finish_date'];

        if (date('Y-m-d', strtotime($finish_date)) != date('Y-m-d')) {
          $sale_array['additional'] = 1;
          $sale_array['created']    = date('Y-m-d', strtotime($finish_date)) . ' ' . date('H:i:s');
        }

        $ret['success'] = $this->save_sale($sale_array);
        if ($ret['success']) {
          $sale_id = $this->sale_id;

          $osession = array();

          // insert sale product
          foreach ($session as &$dts) {
            $osession[]     = $dts;
            $dts['sale_id'] = $sale_id;
            unset($dts['discount_total']);
            unset($dts['unit']);      
          }
          $ret['success'] = $this->save_sale_product($session);

          if ($ret['success']) {
            $invoice = date('ymd') . sprintf('%06s', $sale_id);

            // check print request
            if (!empty($post['finish_print'])) {
              $conf = modules::run('cashier/js/_conf');
             
              // direct
              modules::run('cashier/prints/_sale', array(
                'sale'         => $sale_array,
                'sale_product' => $osession,
                'invoice'      => $invoice,
                'sale_id'      => $sale_id,
                'user_id'      => $usess['id'],
                'username'     => $usess['username'],
              ));
            }

            // increse stock
            $this->product_update($sess, $usess);

            // update invoice
            $this->invoice($sale_id, $invoice);

            // delete session
            $this->session->unset_userdata('process_temp');

            $ret = array(
              'success' => 1,
              'msg'     => 'Berhasil menyelesaikan transaksi',
            );
          }
        }
      }

      if ($this->db->trans_status() === false || !$ret['success']) {
        $this->db->trans_rollback();
        $ret = array(
          'success' => 0,
          'msg'     => !empty($ret['msg']) ? $ret['msg'] : 'Kesalahan sistem. Silahkan logout dan ulangi lagi.',
        );
      } else {
        $this->db->trans_commit();
      }
    } else {
      $ret = array(
        'success' => 0,
        'msg'     => 'Data sesi tidak ditemukan'
      );
    }

    return $ret;
  }

  public function latest() {
    $this->db->order_by('id', 'desc');
    $this->db->limit(1);
    $sale_l = $this->db->get('sale')->row_array();

    $sale_l_n = array(
      'Invoice'     => @intval($sale_l['invoice']),
      'Total'       => @intval($sale_l['total']),
      'Diskon'      => @intval($sale_l['discount']),
      'Grand Total' => @intval($sale_l['grand_total']),
      'Tunai'       => @intval($sale_l['paid']),
      'Kembalian'   => @intval($sale_l['changes']),
    );

    $sale_product_l = array();

    if(!empty($sale_l)) {
      $this->db->where('sale_id', $sale_l['id']);
      $sale_product_l = $this->db->get('sale_product')->result_array();
    }

    return array(
      'sale'         => $sale_l_n,
      'sale_product' => $sale_product_l,
      'id'           => $sale_l['id']
    );
  }

  public function reprint($sale_id) {
    $conf = modules::run('cashier/js/_conf');

    $this->db->order_by('id', 'desc');
    $this->db->limit(1);
    $sale_array = $this->db->get('sale')->row_array();

    $this->db->where('sale_id', $sale_id);
    $osession = $this->db->get('sale_product')->result_array();

    // direct
    modules::run('cashier/prints/_sale', array(
      'sale'         => $sale_array,
      'sale_product' => $osession,
      'invoice'      => $sale_array['invoice'],
      'sale_id'      => $sale_id,
      'user_id'      => $sale_array['user_id'],
      'username'     => $sale_array['username'],
    ));
  }
}