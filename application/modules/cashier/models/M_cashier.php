<?php defined('BASEPATH') OR exit('No direct script access allowed');

class M_cashier extends CI_Model {

  public function dashboard() {
    $this->db->select('count(DISTINCT(purchase.id)) as counts, count(DISTINCT(purchase_product.product_id)) as kind, sum(purchase_product.stock) as qty,sum(purchase_product.total) as total');
    $this->db->join('purchase', 'purchase.id=purchase_product.purchase_id', 'inner');
    $this->db->group_by('date');
    $this->db->where('date', date('Y-m-d'));
    $this->db->where('is_valid', 1);
    $purchase = $this->db->get('purchase_product')->row_array();

    $this->db->select('count(DISTINCT(purchase.id)) as counts, count(DISTINCT(purchase_product.product_id)) as kind, sum(purchase_product.stock) as qty,sum(purchase_product.total) as total');
    $this->db->join('purchase', 'purchase.id=purchase_product.purchase_id', 'inner');
    $this->db->group_by('date');
    $this->db->where('date', date('Y-m-d'));
    $this->db->where('is_valid', 0);
    $purchase_draft = $this->db->get('purchase_product')->row_array();

    $this->db->select('count(DISTINCT(sale.id)) as counts, count(DISTINCT(sale_product.product_id)) as kind, sum(sale_product.qty) as qty,sum(sale_product.total) as total');
    $this->db->join('sale', 'sale.id=sale_product.sale_id', 'inner');
    $this->db->group_by('cast(sale.created as date)');
    $this->db->where('date(sale.created)', date('Y-m-d'));
    $this->db->where('retur', 0);
    $sale = $this->db->get('sale_product')->row_array();

    $this->db->select('count(DISTINCT(sale.id)) as counts, count(DISTINCT(sale_product.product_id)) as kind, sum(sale_product.qty) as qty,sum(sale_product.total) as total');
    $this->db->join('sale', 'sale.id=sale_product.sale_id', 'inner');
    $this->db->group_by('cast(sale.created as date)');
    $this->db->where('date(sale.created)', date('Y-m-d'));
    $this->db->where('retur', 1);
    $retur = $this->db->get('sale_product')->row_array();

    return array(
      'purchase'             => @intval($purchase['counts']),
      'purchase_qty'         => @intval($purchase['qty']),
      'purchase_kind'        => @intval($purchase['kind']),
      'purchase_total'       => @intval($purchase['total']),
      'purchase_draft'       => @intval($purchase_draft['counts']),
      'purchase_draft_qty'   => @intval($purchase_draft['qty']),
      'purchase_draft_kind'  => @intval($purchase_draft['kind']),
      'purchase_draft_total' => @intval($purchase_draft['total']),
      'sale'                 => @intval($sale['counts']),
      'sale_qty'             => @intval($sale['qty']),
      'sale_kind'            => @intval($sale['kind']),
      'sale_total'           => @intval($sale['total']),
      'retur'                => @intval($retur['counts']),
      'retur_qty'            => @intval($retur['qty']),
      'retur_kind'           => @intval($retur['kind']),
      'retur_total'          => @intval($retur['total']),
    );
  }
}