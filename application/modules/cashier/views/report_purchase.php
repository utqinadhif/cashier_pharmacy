<?php defined('BASEPATH') OR exit('No direct script access allowed');

add_js('datatables.net/jquery.dataTables.min.js');
add_js('datatables.net-bs/js/dataTables.bootstrap.min.js');
add_css('datatables.net-bs/css/dataTables.bootstrap.min.css');

add_js('bootstrap-datepicker/js/bootstrap-datepicker.min.js');
add_js('bootstrap-datepicker/js/run_bootstrap-datepicker.min.js');
add_css('bootstrap-datepicker/css/bootstrap-datepicker.min.css');

add_js('modules/report_purchase.js');
?>
<h4>Laporan Pembelian</h4>
<div class="nav-tabs-custom">
  <ul class="nav nav-tabs">
    <li class="active"><a href="#daily" data-toggle="tab" aria-expanded="false">Harian</a></li>
    <li><a href="#distributor" data-toggle="tab" aria-expanded="false">Berdasarkan Distributor</a></li>
    <li><a href="#product" data-toggle="tab" aria-expanded="false">Berdasarkan Obat</a></li>
    <li><a href="#expired" data-toggle="tab" aria-expanded="false">Berdasarkan Expired</a></li>    
    <li class="pull-right"><a class="text-muted"><i class="fa fa-th"></i> Laporan Pembelian</a></li>
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
              <th>Tanggal Pembelian</th>
              <th>Jumlah Transaksi</th>
              <th>Item</th>
              <th>Jumlah Obat</th>
              <th>Total</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
    <div class="tab-pane" id="distributor">
      <div class="form-inline">
        <div class="form-group">
          <input id="distributor_search_distributor" class="form-control" type="text" placeholder="Cari nama distributor">
        </div>
        <div class="input-group input-daterange" id="distributor_search_date">
          <input id="distributor_search_date_from" type="text" class="form-control no_radius" value="<?php echo date('d-m-Y');?>" readonly>
          <div class="input-group-addon">sd</div>
          <input id="distributor_search_date_to" type="text" class="form-control no_radius" value="<?php echo date('d-m-Y');?>" readonly>
        </div>
        <div class="pull-right">
          <span class="label label-warning">Total: <b id="distributor_total">0</b></span>
        </div>
      </div>
      <hr>
      <div class="table-responsive">
        <table class="table table-bordered table-hover" id="distributor_dt" width="100%">
          <thead>
            <tr>
              <th>Distributor</th>
              <th>Tanggal Pembelian</th>
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
              <th>Tanggal Pembelian</th>
              <th>Jumlah Barang</th>
              <th>Total</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
    <div class="tab-pane" id="expired">
      <div class="form-inline">
        <div class="form-group">
          <input id="expired_search_product" class="form-control" type="text" placeholder="Cari nama obat">
        </div>
        <div class="input-group input-daterange" id="expired_search_date">
          <input id="expired_search_date_from" type="text" class="form-control no_radius" value="<?php echo date('d-m-Y');?>" readonly>
          <div class="input-group-addon">sd</div>
          <input id="expired_search_date_to" type="text" class="form-control no_radius" value="<?php echo date('d-m-Y');?>" readonly>
        </div>
        <div class="pull-right">
          <span class="label label-warning">Total: <b id="expired_total">0</b></span>
        </div>
      </div>
      <hr>
      <div class="table-responsive">
        <table class="table table-bordered table-hover" id="expired_dt" width="100%">
          <thead>
            <tr>
              <th>Nama Obat</th>
              <th>Tanggal Pembelian</th>
              <th>Tanggal Expired</th>
              <th>Jumlah Barang</th>
              <th>Total</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
  </div>
</div>