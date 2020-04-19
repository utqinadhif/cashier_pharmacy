<?php defined('BASEPATH') OR exit('No direct script access allowed');

class M_product extends CI_Model {

  public $insert_id;

  public function add($array) {
    $q = $this->db->insert('product', $array);

    $this->insert_id = $this->db->insert_id();

    return $q;
  }

  public function edit($array, $id) {
    $this->db->trans_begin();

    // purchase product
    $this->db->where('product_id', $id);
    $this->db->update('purchase_product', array(
      'product_name' => $array['name']
    ));

    // sale product
    $this->db->where('product_id', $id);
    $this->db->update('sale_product', array(
      'product_name' => $array['name']
    ));

  	$this->db->where('id', $id);
    $this->db->update('product', $array);

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
    return $this->db->delete('product');
  }

  public function search($q, $page = 1, $per_page = 10) {
    $offset = $per_page * ($page - 1);
    
    $total  = $this->db->like('name', $q)->get('product')->num_rows();
    $product = $this->db->like('name', $q)->order_by('name', 'asc')->limit($per_page, $offset)->get('product')->result_array();

    return array(
      'list'  => $product, 
      'total' => $total
    );
  }

  public function detail($id) {
    $this->db->where('id', $id);
    return $this->db->get('product')->row_array();
  }

  public function get_by_name($name = '', $curr = 0) {
    if(!empty($curr)) $this->db->where('id!=', $curr);
    $this->db->where('name', $name);
    return $this->db->get('product')->row_array();
  }

  public function price_product_add($product, $product_id, $sess) {
    $arr = array();
    foreach ($product as $price_id => $price) {
      $arr[] = array(
        'product_id' => $product_id,
        'price_id'   => $price_id,
        'price'      => $price,
        'user_id'    => $sess['id'],
        'username'   => $sess['username'],
      );
    }
    $this->db->insert_batch('product_price', $arr); 
  }

  public function price_product_edit($product, $product_id, $sess) {
    $this->db->select('price_id');
    $this->db->where('product_id', $product_id);
    $cur = $this->db->get('product_price')->result_array();

    $old_price_product = array();
    foreach ($cur as $c) {
      $old_price_product[] = $c['price_id'];
    }

    $arr_update = array();
    $arr_insert = array();
    foreach ($product as $price_id => $price) {
      if(in_array($price_id, $old_price_product)) {
        $arr_update[] = array(
          'product_id' => $product_id,
          'price_id'   => $price_id,
          'price'      => $price,
          'user_id'    => $sess['id'],
          'username'   => $sess['username'],
        );
      } else {
        $arr_insert[] = array(
          'product_id' => $product_id,
          'price_id'   => $price_id,
          'price'      => $price,
          'user_id'    => $sess['id'],
          'username'   => $sess['username'],
        );
      }
    }

    if(!empty($arr_update)) {
      $this->db->where('product_id', $product_id);
      $this->db->update_batch('product_price', $arr_update, 'price_id');
    }

    if(!empty($arr_insert)) $this->db->insert_batch('product_price', $arr_insert);
  }

  public function product_price($product_id) {
    $this->db->where('product_id', $product_id);
    return $this->db->get('product_price')->result_array();
  }

  public function edit_price($array, $id) {
    $this->db->trans_begin();
    // sale credit
    /*$this->db->where('store_id', $id);
    $this->db->update('sale_credit', array(
      'store_name' => $array['name']
    ));*/

    $this->db->where('id', $id);
    $this->db->update('product_price', $array);

    if ($this->db->trans_status() === false) {
      $this->db->trans_rollback();
      return false;
    } else {
      $this->db->trans_commit();
      return true;
    }
  }
}