<?php defined('BASEPATH') OR exit('No direct script access allowed');

class M_price extends CI_Model {

  public $insert_id;

  public function add($array) {
    $q = $this->db->insert('price', $array);

    $this->insert_id = $this->db->insert_id();

    return $q;
  }

  public function edit($array, $id) {
    $this->db->trans_begin();

  	$this->db->where('id', $id);
    $this->db->update('price', $array);

    if ($this->db->trans_status() === false) {
      $this->db->trans_rollback();
      return false;
    } else {
      $this->db->trans_commit();
      return true;
    }
  }

  public function delete($id) {
    $this->db->where('price_id', $id);
    $this->db->delete('product_price');

    $this->db->where('id', $id);
    return $this->db->delete('price');
  }

  public function search($q, $page = 1, $per_page = 10) {
    $offset = $per_page * ($page - 1);
    
    $total = $this->db->like('name', $q)->get('price')->num_rows();
    $price = $this->db->like('name', $q)->order_by('name', 'asc')->limit($per_page, $offset)->get('price')->result_array();

    return array(
      'list'  => $price, 
      'total' => $total
    );
  }

  public function detail($id) {
    $this->db->where('id', $id);
    return $this->db->get('price')->row_array();
  }

  public function get_by_name($name = '', $curr = 0) {
    if(!empty($curr)) $this->db->where('id!=', $curr);
    $this->db->where('name', $name);
    return $this->db->get('price')->row_array();
  }

  public function set_default() {
    $this->db->select('COUNT(id) as count');
    $count = $this->db->get('price')->row()->count;

    if($count == 1) {
      $this->db->update('price', array(
        'is_main' => 1
      ));
    }
  }

  public function set_no_default() {
    $this->db->update('price', array(
      'is_main' => 0
    ));
  }

  public function get_all() {
    $this->db->select('id,name');
    return $this->db->get('price')->result_array();
  }

  public function get_default() {
    $this->db->select('id,name');
    $this->db->where('is_main', 1);
    $r = $this->db->get('price')->row_array();

    if(empty($r)) {
      $this->db->select('id,name');
      $this->db->limit(1);
      $this->db->order_by('id');
      $r = $this->db->get('price')->row_array();
    }

    return $r;
  }
}