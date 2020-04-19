<?php defined('BASEPATH') OR exit('No direct script access allowed');

add_js('datatables.net/jquery.dataTables.min.js');
add_js('datatables.net-bs/js/dataTables.bootstrap.min.js');
add_css('datatables.net-bs/css/dataTables.bootstrap.min.css');

add_js('modules/product_price.js');
?>
<div class="box">
  <div class="box-header with-border">
    <h3 class="box-title">List Harga Obat</h3>
    <div class="box-tools pull-right">
      <a href="#" class="btn btn-flat btn-warning btn-xs" id="product_price_refresh"><i class="fa fa-fw fa-sync"></i> Refresh</a>
    </div>
  </div>
  <div class="box-body">
    <div class="form-inline">
      <div class="form-group">
        <input id="product_price_search_name" class="form-control" type="text" placeholder="Cari nama obat">
      </div>
      <div class="form-group">
        <select name="product_price_search_category" id="product_price_search_category" class="form-control">
          <option value="">Pilih Kategori</option>
          <?php
          foreach ($category as $cat) {
            ?>
            <option value="<?php echo $cat['id'];?>"><?php echo $cat['name'];?></option>
            <?php
          }
          ?>
        </select>
      </div>
      <div class="form-group">
        <select name="product_price_search_price" id="product_price_search_price" class="form-control">
          <option value="">Pilih Harga</option>
          <?php
          foreach ($price as $prc) {
            ?>
            <option value="<?php echo $prc['id'];?>"><?php echo $prc['name'];?></option>
            <?php
          }
          ?>
        </select>
      </div>
    </div>
    <hr>
    <div class="table-responsive">
      <table class="table table-bordered table-hover" id="product_price_dt" width="100%">
        <thead>
          <tr>
            <th>Opsi</th>
            <th>Nama Obat</th>
            <th>Kategori</th>
            <th>Jenis Harga</th>
            <th>Harga</th>
            <th>User</th>
            <th>Dibuat</th>
            <th>Diedit</th>
          </tr>
        </thead>
      </table>
    </div>
  </div>
</div>
<div class="modal fade reset_on_hidden" id="product_price_mdl" role="dialog" tabindex='-1'>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span></button>
        <h4 class="modal-title">Edit Harga Obat</h4>
      </div>
      <form id="product_price_form" action="">
        <input name="product_price_add_edit_id" id="product_price_add_edit_id" type="hidden">
        <div class="modal-body">
          <div class="form-group">
            <label>Nama Obat</label>
            <p id="product_price_add_edit_name" class="form-control-static"></p>
          </div>
          <div class="form-group">
            <label>Kategori</label>
            <p id="product_price_add_edit_category" class="form-control-static"></p>
          </div>
          <div class="form-group">
            <label>Jenis Harga</label>
            <p id="product_price_add_edit_price_name" class="form-control-static"></p>
          </div>
          <div class="form-group">
            <label>Harga</label>
            <input name="product_price_add_edit_price" id="product_price_add_edit_price" class="form-control" type="text" placeholder="Masukkan nama obat">
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-success btn-flat">Simpan</button>
          <button type="reset" class="hidden">Reset</button>
          <button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Close</button>
        </div>
      </form>
    </div>
  </div>
</div>