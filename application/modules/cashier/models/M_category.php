<?php defined('BASEPATH') OR exit('No direct script access allowed');

class M_category extends CI_Model {

  public $insert_id;

  public function add($array) {
    $q = $this->db->insert('category', $array);

    $this->insert_id = $this->db->insert_id();

    return $q;
  }

  public function edit($array, $id) {
    $this->db->trans_begin();

  	$this->db->where('id', $id);
    $this->db->update('category', $array);

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
    return $this->db->delete('category');
  }

  public function search($q, $page = 1, $per_page = 10) {
    $offset = $per_page * ($page - 1);
    
    $total = $this->db->like('name', $q)->get('category')->num_rows();
    $category = $this->db->like('name', $q)->order_by('name', 'asc')->limit($per_page, $offset)->get('category')->result_array();

    return array(
      'list'  => $category, 
      'total' => $total
    );
  }

  public function detail($id) {
    $this->db->where('id', $id);
    return $this->db->get('category')->row_array();
  }

  public function get_by_name($name = '', $curr = 0) {
    if(!empty($curr)) $this->db->where('id!=', $curr);
    $this->db->where('name', $name);
    return $this->db->get('category')->row_array();
  }

  public function get_all() {
    $this->db->select('id,name');
    return $this->db->get('category')->result_array();
  }
}