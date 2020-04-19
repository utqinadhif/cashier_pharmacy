<?php defined('BASEPATH') OR exit('No direct script access allowed');

class M_purchase_draft extends CI_Model {

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
    }

    $this->db->insert_batch('purchase_product', $session);

    $this->db->where('id', $purchase_id);
    $this->db->update('purchase', array(
      'code'          => date('ymd', strtotime($array['date'])) . sprintf('%06s', $purchase_id),
      'total_kind'    => $total_kind,
      'total_product' => $total_product,
      'total_price'   => $total_price,
      'is_valid'      => 0,
      'user_id'       => $usess['id'],
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

    if ($this->db->trans_status() === false) {
      $this->db->trans_rollback();
      $ret = array(
        'status' => false,
        'msg'    => 'Kesalahan sistem',
      );
    } else {
      $this->db->trans_commit();
      $ret = array(
        'status' => true,
        'msg'    => 'Sukses',
      );
    }

    return $ret;
  }

  public function delete($purchase_id, $usess) {
    $this->db->trans_begin();

    $this->db->where('purchase_id', $purchase_id);
    $this->db->delete('purchase_product');

    $this->db->where('id', $purchase_id);
    $this->db->delete('purchase');

    if ($this->db->trans_status() === false) {
      $this->db->trans_rollback();
      $ret = array(
        'status' => false,
        'msg'    => 'Kesalahan sistem',
      );
    } else {
      $this->db->trans_commit();
      $ret = array(
        'status' => true,
        'msg'    => 'Sukses',
      );
    }

    return $ret;
  }

  public function validasi($id, $usess) {
    $this->db->trans_begin();

    $this->db->where('id', $id);
    $this->db->update('purchase', array(
      'is_valid' => 1
    ));

    $this->db->where('purchase_id', $id);
    $purprod = $this->db->get('purchase_product')->result_array();

    $npurprod = array();
    foreach ($purprod as $dt) $npurprod[$dt['product_id']] = $dt;

    foreach ($npurprod as $dsess) {
      if($dsess['product_id'] == $dsess['product_name']) {
        $this->db->insert('product', array(
          'name' => $dsess['product_name']
        ));
        $dsess['product_id'] = $this->db->insert_id();
      }

      $this->db->where('id', $dsess['product_id']);
      $this->db->set('stock', 'stock+' . $dsess['stock'], false);
      $this->db->set('user_id', $usess['id']);
      $this->db->set('username', $usess['username']);
      $this->db->update('product');
    }

    if ($this->db->trans_status() === false) {
      $this->db->trans_rollback();
      return false;
    } else {
      $this->db->trans_commit();
      return true;
    }
  }
}