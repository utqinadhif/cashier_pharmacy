<?php defined('BASEPATH') OR exit('No direct script access allowed');

class M_distributor extends CI_Model {

  public $insert_id;
  
  public function add($array) {
    $q = $this->db->insert('distributor', $array);

    $this->insert_id = $this->db->insert_id();

    return $q;
  }

  public function edit($array, $id) {
    $this->db->trans_begin();
    // purchase
    $this->db->where('store_id', $id);
    $this->db->update('sale_credit', array(
      'store_name' => $array['name']
    ));

  	$this->db->where('id', $id);
    $this->db->update('distributor', $array);

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
    return $this->db->delete('distributor');
  }

  public function search($q, $page = 1, $per_page = 10) {
    $offset = $per_page * ($page - 1);
    
    $total       = $this->db->like('name', $q)->get('distributor')->num_rows();
    $distributor = $this->db->like('name', $q)->order_by('name', 'asc')->limit($per_page, $offset)->get('distributor')->result_array();

    return array(
      'list'  => $distributor, 
      'total' => $total
    );
  }

  public function detail($id) {
    $this->db->where('id', $id);
    return $this->db->get('distributor')->row_array();
  }

  public function get_by_name($name = '', $curr = 0) {
    if(!empty($curr)) $this->db->where('id!=', $curr);
    $this->db->where('name', $name);
    return $this->db->get('distributor')->row_array();
  }

  public function get_by_id($id) {
    $this->db->select('name');
    $this->db->where('id', $id);
    return $this->db->get('distributor')->row()->name;
  }
}