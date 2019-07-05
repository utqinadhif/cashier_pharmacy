<?php defined('BASEPATH') OR exit('No direct script access allowed');

class M_purchase extends CI_Model {

  public function add($session, $array, $usess) {
    $this->db->trans_begin();

    $this->db->insert('purchase', $array);

    $purchase_id = $this->db->insert_id();

    $total_kind    = 0;   
    $total_product = 0;
    $total_price   = 0;

    $update_product = array();

    foreach ($session as &$dsess) {
      $total_kind++;
      $total_product += $dsess['stock'];
      $total_price   += $dsess['total'];

      $dsess['purchase_id'] = $purchase_id;
      $dsess['user_id']     = $usess['id'];
      $dsess['username']    = $usess['username'];
      $dsess['expired']     = date('Y-m-d', strtotime($dsess['expired']));

      unset($dsess['created']);
      unset($dsess['updated']);

      if($dsess['product_id'] == $dsess['product_name']) {
        $this->db->insert('product', array(
          'name'     => $dsess['product_name'],
          'user_id'  => $usess['id'],
          'username' => $usess['username'],
        ));
        $dsess['product_id'] = $this->db->insert_id();
      }

      $this->db->where('id', $dsess['product_id']);
      $this->db->set('stock', 'stock+' . $dsess['stock'], false);
      $this->db->set('user_id', $usess['id']);
      $this->db->set('username', $usess['username']);
      $this->db->update('product');
    }

    $this->db->insert_batch('purchase_product', $session);

    $this->db->where('id', $purchase_id);
    $this->db->update('purchase', array(
      'code'          => date('ymd', strtotime($array['date'])) . sprintf('%06s', $purchase_id),
      'total_kind'    => $total_kind,
      'total_product' => $total_product,
      'total_price'   => $total_price,
      'user_id'       => $usess['id'],
      'is_valid'      => 1,
      'username'      => $usess['username'],
    ));

    if ($this->db->trans_status() === false) {
      $this->db->trans_rollback();
      return false;
    } else {
      $this->db->trans_commit();
      return true;
    }
  }

  public function edit($session, $array, $purchase_id, $usess) {
    $this->db->trans_begin();

    $total_kind    = 0;   
    $total_product = 0;
    $total_price   = 0;

    $this->db->where('purchase_id', $purchase_id);
    $purprod = $this->db->get('purchase_product')->result_array();

    $npurprod = array();
    foreach ($purprod as $dt) $npurprod[$dt['product_id']] = $dt;

    $nsess = array();
    foreach ($session as &$dt) {
      if($dt['product_id'] == $dt['product_name']) {
        $this->db->insert('product', array(
          'name'     => $dt['product_name'],
          'user_id'  => $usess['id'],
          'username' => $usess['username'],
        ));
        $dt['product_id'] = $this->db->insert_id();
      }

      $nsess[$dt['product_id']] = $dt;

      $dt['purchase_id'] = $purchase_id;
      $dt['user_id']     = $usess['id'];
      $dt['username']    = $usess['username'];      
      $dt['expired']     = date('Y-m-d', strtotime($dt['expired']));

      unset($dt['created']);
      unset($dt['updated']);

      $total_kind++;
      $total_product += $dt['stock'];
      $total_price   += $dt['total'];
    }

    // default
    $ret = array(
      'status' => true,
      'msg'    => 'Sukses',
    );

    // get array from nsess
    $add_id = array_diff(array_keys($nsess), array_keys($npurprod));

    foreach ($add_id as $dadd_id) {
      $this->db->where('id', $dadd_id);
      $this->db->set('stock', 'stock+' . $nsess[$dadd_id]['stock'], false);
      $this->db->set('user_id', $usess['id']);
      $this->db->set('username', $usess['username']);
      if (!$this->db->update('product')) {
        $ret = array(
          'status' => false,
          'msg'    => '[Penambahan] Cek kembali stok ' . $nsess[$dadd_id]['product_name'],
        );
        break;
      }
    }    

    // get array from npurprod
    if ($ret['status']) {
      $delete_id = array_diff(array_keys($npurprod), array_keys($nsess));

      foreach ($delete_id as $ddelete_id) {
        $this->db->select('stock');
        $this->db->where('id', $ddelete_id);
        $cdprd = $this->db->get('product')->row();

        if(!empty($cuprd)) {
          $cstock = $cdprd->stock;
          if ($cstock - $npurprod[$ddelete_id]['stock'] >= 0) {
            $this->db->where('id', $ddelete_id);
            $this->db->set('stock', 'stock-' . $npurprod[$ddelete_id]['stock'], false);
            $this->db->set('user_id', $usess['id']);
            $this->db->set('username', $usess['username']);
            $this->db->update('product');
          } else {
            $ret = array(
              'status' => false,
              'msg'    => '[Penghapusan] Cek kembali stok ' . $npurprod[$ddelete_id]['product_name'],
            );
            break;
          }      
        }
      }      
    }

    // get same
    if($ret['status']) {
      $same_id = array_intersect(array_keys($npurprod), array_keys($nsess));

      foreach ($same_id as $dsame_id) {
        $this->db->select('stock');
        $this->db->where('id', $dsame_id);
        $cuprd = $this->db->get('product')->row();

        if(!empty($cuprd)) {
          $cstock = $cuprd->stock;
          $tstock = $nsess[$dsame_id]['stock'] - $npurprod[$dsame_id]['stock'];

          if ($cstock + $tstock >= 0) {
            $this->db->where('id', $dsame_id);
            $this->db->set('stock', 'stock+' . $tstock, false);
            $this->db->set('user_id', $usess['id']);
            $this->db->set('username', $usess['username']);
            $this->db->update('product');
          } else {
            $ret = array(
              'status' => false,
              'msg'    => '[Perubahan] Cek kembali stok ' . $npurprod[$dsame_id]['product_name'],
            );
            break;        
          }
        }
      }
    }

    if ($ret['status']) {
      $this->db->where('id', $purchase_id);
      $this->db->update('purchase', array(
        'date'             => $array['date'],
        'distributor_id'   => $array['distributor_id'],
        'distributor_name' => $array['distributor_name'],
        'code'             => date('ymd', strtotime($array['date'])) . sprintf('%06s', $purchase_id),
        'total_kind'       => $total_kind,
        'total_product'    => $total_product,
        'total_price'      => $total_price,
        'user_id'          => $usess['id'],
        'username'         => $usess['username'],
      ));

      $this->db->where('purchase_id', $purchase_id);
      $this->db->delete('purchase_product');

      $this->db->insert_batch('purchase_product', $session);
    }    

    if ($this->db->trans_status() === false || !$ret['status']) {
      $this->db->trans_rollback();
      $ret = array(
        'status' => false,
        'msg'    => 'Kesalahan sistem',
      );
    } else {
      $this->db->trans_commit();
    }

    return $ret;
  }

  public function delete($purchase_id, $usess) {
    $this->db->trans_begin();

    // default
    $ret = array(
      'status' => true,
      'msg'    => 'Sukses',
    );

    $this->db->select('product_id, product_name,stock');
    $this->db->where('purchase_id', $purchase_id);
    $purprod = $this->db->get('purchase_product')->result_array();

    foreach ($purprod as $dt) {
      $this->db->select('stock');
      $this->db->where('id', $dt['product_id']);
      $cdelprd = $this->db->get('product')->row();

      if(!empty($cdelprd)) {
        $cstock = $cdelprd->stock;

        if ($cstock - $dt['stock'] >= 0) {
          $this->db->where('id', $dt['product_id']);
          $this->db->set('stock', 'stock-' . $dt['stock'], false);
          $this->db->set('user_id', $usess['id']);
          $this->db->set('username', $usess['username']);
          $this->db->update('product');
        } else {
          $ret = array(
            'status' => false,
            'msg'    => '[Penghapusan] Cek kembali stok ' . $dt['product_name'],
          );
          break;
        }
      }
    }

    if ($this->db->trans_status() === false || !$ret['status']) {
      $this->db->trans_rollback();
      $ret = array(
        'status' => false,
        'msg'    => 'Kesalahan sistem',
      );
    } else {
      $this->db->where('purchase_id', $purchase_id);
      $this->db->delete('purchase_product');

      $this->db->where('id', $purchase_id);
      $this->db->delete('purchase');

      $this->db->trans_commit();
    }

    return $ret;
  }
}