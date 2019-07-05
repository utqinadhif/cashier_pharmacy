<?php defined('BASEPATH') OR exit('No direct script access allowed');

add_js('datatables.net/jquery.dataTables.min.js');
add_js('datatables.net-bs/js/dataTables.bootstrap.min.js');
add_css('datatables.net-bs/css/dataTables.bootstrap.min.css');

add_js('bootstrap-datepicker/js/bootstrap-datepicker.min.js');
add_js('bootstrap-datepicker/js/run_bootstrap-datepicker.min.js');
add_css('bootstrap-datepicker/css/bootstrap-datepicker.min.css');

add_js('modules/report_sale.js');
?>
<h4>Laporan Penjualan</h4>
<div class="nav-tabs-custom">
  <ul class="nav nav-tabs">
    <li class="active"><a href="#daily" data-toggle="tab" aria-expanded="false">Harian</a></li>
    <li><a href="#sender" data-toggle="tab" aria-expanded="false">Berdasarkan Pengirim</a></li>
    <li><a href="#product" data-toggle="tab" aria-expanded="false">Berdasarkan Obat</a></li>
    <li><a href="#price" data-toggle="tab" aria-expanded="false">Berdasarkan Jenis Harga</a></li>
    <li class="pull-right"><a class="text-muted"><i class="fa fa-th"></i> Laporan Penjualan</a></li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="daily">
      <div class="form-inline">
        <div class="input-group input-daterange" id="daily_search_date">
          <input id="daily_search_date_from" type="text" class="form-control no_radius" value="<?php echo date('d-m-Y');?>" readonly>
          <div class="input-group-addon">sd</div>
          <input id="daily_search_date_to" type="text" class="form-control no_radius" value="<?php echo date('d-m-Y');?>" readonly>
        </div>
        <div class="pull-right">
          <span class="label label-warning">Total: <b id="daily_total">0</b></span>
        </div>
      </div>
      <hr>
      <div class="table-responsive">
        <table class="table table-bordered table-hover" id="daily_dt" width="100%">
          <thead>
            <tr>
              <th>Tanggal Penjualan</th>
              <th>Jumlah Transaksi</th>
              <th>Item</th>
              <th>Jumlah Barang</th>
              <th>Total</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
    <div class="tab-pane" id="sender">
      <div class="form-inline">
        <div class="form-group">
          <input id="sender_search_sender" class="form-control" type="text" placeholder="Cari nama pengirim">
        </div>
        <div class="input-group input-daterange" id="sender_search_date">
          <input id="sender_search_date_from" type="text" class="form-control no_radius" value="<?php echo date('d-m-Y');?>" readonly>
          <div class="input-group-addon">sd</div>
          <input id="sender_search_date_to" type="text" class="form-control no_radius" value="<?php echo date('d-m-Y');?>" readonly>
        </div>
        <div class="pull-right">
          <span class="label label-warning">Total: <b id="sender_total">0</b></span>
        </div>
      </div>
      <hr>
      <div class="table-responsive">
        <table class="table table-bordered table-hover" id="sender_dt" width="100%">
          <thead>
            <tr>
              <th>Pengirim</th>
              <th>Tanggal Penjualan</th>
              <th>Item</th>
              <th>Jumlah Barang</th>
              <th>Total</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
    <div class="tab-pane" id="product">
      <div class="form-inline">
        <div class="form-group">
          <input id="product_search_product" class="form-control" type="text" placeholder="Cari nama obat">
        </div>
        <div class="input-group input-daterange" id="product_search_date">
          <input id="product_search_date_from" type="text" class="form-control no_radius" value="<?php echo date('d-m-Y');?>" readonly>
          <div class="input-group-addon">sd</div>
          <input id="product_search_date_to" type="text" class="form-control no_radius" value="<?php echo date('d-m-Y');?>" readonly>
        </div>
        <div class="pull-right">
          <span class="label label-warning">Total: <b id="product_total">0</b></span>
        </div>
      </div>
      <hr>
      <div class="table-responsive">
        <table class="table table-bordered table-hover" id="product_dt" width="100%">
          <thead>
            <tr>
              <th>Nama Obat</th>
              <th>Tanggal Penjualan</th>
              <th>Jumlah Barang</th>
              <th>Total</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
    <div class="tab-pane" id="price">
      <div class="form-inline">
        <div class="form-group">
          <input id="price_search_price" class="form-control" type="text" placeholder="Cari jenis harga">
        </div>
        <div class="input-group input-daterange" id="price_search_date">
          <input id="price_search_date_from" type="text" class="form-control no_radius" value="<?php echo date('d-m-Y');?>" readonly>
          <div class="input-group-addon">sd</div>
          <input id="price_search_date_to" type="text" class="form-control no_radius" value="<?php echo date('d-m-Y');?>" readonly>
        </div>
        <div class="pull-right">
          <span class="label label-warning">Total: <b id="price_total">0</b></span>
        </div>
      </div>
      <hr>
      <div class="table-responsive">
        <table class="table table-bordered table-hover" id="price_dt" width="100%">
          <thead>
            <tr>
              <th>Jenis Harga</th>
              <th>Tanggal Penjualan</th>
              <th>Item</th>
              <th>Jumlah Barang</th>
              <th>Total</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
  </div>
</div>