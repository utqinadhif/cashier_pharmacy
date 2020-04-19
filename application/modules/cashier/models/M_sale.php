<?php defined('BASEPATH') OR exit('No direct script access allowed');

class M_sale extends CI_Model {

  public function frequently() {
    $this->db->select('count(paid) as counts,paid');
    $this->db->group_by('paid');
    $this->db->order_by('counts');
    $this->db->limit(10);
    return $this->db->get('sale')->result_array();
  }

  public function get_sale_id($invoice) {
  	$this->db->select('id');
  	$this->db->where('invoice', $invoice);
    return $this->db->get('sale')->row()->id;
  }

  public function retur($sale_id, $usess) {
    $this->db->trans_begin();

    $this->db->where('id', $sale_id);
    $this->db->update('sale', array(
      'retur' => 1
    ));

    $this->db->where('sale_id', $sale_id);
    $sale_product = $this->db->get('sale_product')->result_array();

    foreach ($sale_product as $dsp) {
      $this->db->where('id', $dsp['product_id']);
      $this->db->set('stock', 'stock+' . $dsp['qty'], false);
      $this->db->set('user_id', $usess['id']);
      $this->db->set('username', $usess['username']);
      $r = $this->db->update('product');

      if(!$r) break;
    }

    $ret = $this->db->trans_status();
    if ($ret === false) {
      $this->db->trans_rollback();
    } else {
      $this->db->trans_commit();
    }

    return $ret;
  }

  public function check_retur($sale_id) {
    $this->db->select('retur');
    $this->db->where('id', $sale_id);
    $retur = $this->db->get('sale')->row()->retur;

    return $retur;
  }
}