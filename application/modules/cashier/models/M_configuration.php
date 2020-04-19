<?php defined('BASEPATH') OR exit('No direct script access allowed');

class M_configuration extends CI_Model {

  public function set($name, $array) {
    $this->db->select('name');
    $this->db->where('name', $name);
    $check = $this->db->get('configuration')->row()->name;

    if(!empty($check)) {
      $this->db->where('name', $name);
      return $this->db->update('configuration', array(
        'value' => json_encode($array),
      ));
    } else {
      return $this->db->insert('configuration', array(
        'name'  => $name,
        'value' => json_encode($array),
      ));
    }
  }

  public function get($name) {
    $this->db->select('value');
    $this->db->where('name', $name);
    $check = $this->db->get('configuration')->row_array();

    if(!empty($check['value'])) {
      return json_decode($check['value'], true);
    } else {
      return array();
    }
  }
}