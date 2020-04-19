<?php defined('BASEPATH') OR exit('No direct script access allowed');

class M_purchase_draft_product extends CI_Model {

  public function get($purchase_id) {
    $this->db->select('product_id,product_name,price,stock,total,username,expired,created,updated');
    $this->db->where('purchase_id', $purchase_id);
    return $this->db->get('purchase_product')->result_array();
  }

  public function get_product_name($id) {
    $this->db->select('name');
    $this->db->where('id', $id);
    $product_name = $this->db->get('product')->row();

    return !empty($product_name) ? $product_name->name : $id;
  }
}