<?php defined('BASEPATH') OR exit('No direct script access allowed');

add_js('datatables.net/jquery.dataTables.min.js');
add_js('datatables.net-bs/js/dataTables.bootstrap.min.js');
add_css('datatables.net-bs/css/dataTables.bootstrap.min.css');

add_js('bootstrap-datepicker/js/bootstrap-datepicker.min.js');
add_js('bootstrap-datepicker/js/run_bootstrap-datepicker.min.js');
add_css('bootstrap-datepicker/css/bootstrap-datepicker.min.css');

add_js('select2/js/nselect2.min.js');
add_css('select2/css/nselect2.min.css', 3);

add_js('modules/sale.js');
?>
<div class="nav-tabs-custom">
  <ul class="nav nav-tabs">
    <li class="active"><a href="#sale" id="list_nav" data-toggle="tab">Riwayat Transaksi</a></li>
    <li><a href="#detail" id="detail_nav" data-toggle="tab">Detail <b class="detail_invoice"></b></a></li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="sale">
      <a href="#" class="btn btn-flat btn-warning btn-xs" id="sale_refresh"><i class="fa fa-fw fa-sync"></i> Refresh</a>
      <hr>
      <div class="form-inline">
        <div class="form-group">
          <input id="sale_search_invoice" class="form-control" type="number" placeholder="Cari kode invoice">
        </div>
        <div class="form-group">
          <input id="sale_search_sender" class="form-control" type="text" placeholder="Cari nama dokter pengirim">
        </div>
        <div class="form-group">
          <select class="form-control" id="sale_search_additional">
            <option value="">Semua</option>
            <option value="1">Susulan</option>
            <option value="0">Normal</option>
          </select>
        </div>
        <div class="form-group">
          <select class="form-control" id="sale_search_retur">
            <option value="">Semua</option>
            <option value="1">Retur</option>
            <option value="0">Tidak</option>
          </select>
        </div>
        <div class="input-group input-daterange" id="sale_search_date">
          <input id="sale_search_date_from" type="text" class="form-control no_radius" value="<?php echo date('d-m-Y');?>" readonly>
          <div class="input-group-addon">sd</div>
          <input id="sale_search_date_to" type="text" class="form-control no_radius" value="<?php echo date('d-m-Y');?>" readonly>
        </div>
      </div>
      <hr>
      <div class="table-responsive">
        <table class="table table-bordered table-hover" id="sale_dt" width="100%">
          <thead>
            <tr>
              <th>Pilihan</th>
              <th>Invoice</th>
              <th>Pengirim</th>
              <th>Total</th>
              <th>Discount</th>
              <th>Grand Total</th>
              <th>Tunai</th>
              <th>Kembalian</th>
              <th>Susulan</th>
              <th>Retur</th>
              <th>User</th>
              <th>Dibuat</th>
              <th>Diedit</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
    <div class="tab-pane" id="detail">
      <form id="sale_detail_form">
        <div class="form-inline">
          <div class="form-group">
            <input id="sale_detail_invoice" name="invoice" class="form-control" type="number" placeholder="Cari kode invoice">
          </div>
          <div class="form-group">
          <button class="btn btn-flat btn-warning" type="submit"><i class="fa fa-fw fa-search"></i> Cari</button>
          <button class="btn btn-flat btn-default" type="reset"><i class="fa fa-fw fa-undo"></i> Reset</button>
        </div>
      </form>      
      <hr>
      <div class="table-responsive">
        <table class="table table-bordered table-hover" id="sale_product_dt" width="100%">
          <thead>
            <tr>
              <th>Nama Barang</th>
              <th>Harga</th>
              <th>Diskon</th>
              <th>Qty</th>
              <th>Total</th>                 
              <th>Dibuat</th>
              <th>Diedit</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
  </div>
</div>