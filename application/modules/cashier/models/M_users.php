<?php defined('BASEPATH') OR exit('No direct script access allowed');

class M_users extends CI_Model {
  
  public function add($array) {
    return $this->db->insert('users', $array);
  }

  public function edit($array, $id) {
    $this->db->trans_begin();
    // product
    $this->db->where('user_id', $id);
    $this->db->update('product', array(
      'username' => $array['name']
    ));
    // sender
    $this->db->where('user_id', $id);
    $this->db->update('sender', array(
      'username' => $array['name']
    ));
    // sale
    $this->db->where('user_id', $id);
    $this->db->update('sale', array(
      'username' => $array['name']
    ));
    // sale product
    $this->db->where('user_id', $id);
    $this->db->update('sale_product', array(
      'username' => $array['name']
    ));
    // purchase
    $this->db->where('user_id', $id);
    $this->db->update('purchase', array(
      'username' => $array['name']
    ));
    // purchase product
    $this->db->where('user_id', $id);
    $this->db->update('purchase_product', array(
      'username' => $array['name']
    ));

  	$this->db->where('id', $id);
    $this->db->update('users', $array);

    if ($this->db->trans_status() === false) {
      $this->db->trans_rollback();
      return false;
    } else {
      $this->db->trans_commit();
      return true;
    }
  }

  public function delete($id) {
    $this->db->where('id', $id);
    return $this->db->delete('users');
  }

  public function get_by_name($name = '') {
    if(!empty($curr)) $this->db->where('id!=', $curr);
    $this->db->where('name', $name);
    return $this->db->get('users')->row_array();
  }
}