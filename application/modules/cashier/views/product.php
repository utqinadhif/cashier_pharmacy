<?php defined('BASEPATH') OR exit('No direct script access allowed');

add_js('datatables.net/jquery.dataTables.min.js');
add_js('datatables.net-bs/js/dataTables.bootstrap.min.js');
add_css('datatables.net-bs/css/dataTables.bootstrap.min.css');

add_js('modules/product.js');
?>
<div class="box">
  <div class="box-header with-border">
    <h3 class="box-title">List Obat</h3>
    <div class="box-tools pull-right">
      <a href="#" class="btn btn-flat btn-default btn-xs" id="product_add"><i class="fa fa-fw fa-plus"></i> Tambah</a>
      <a href="#" class="btn btn-flat btn-warning btn-xs" id="product_refresh"><i class="fa fa-fw fa-sync"></i> Refresh</a>
    </div>
  </div>
  <div class="box-body">
    <div class="form-inline">
      <div class="form-group">
        <input id="product_search_name" class="form-control" type="text" placeholder="Cari nama obat">
      </div>
      <div class="form-group">
        <select name="product_search_category" id="product_search_category" class="form-control">
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
    </div>
    <hr>
    <div class="table-responsive">
      <table class="table table-bordered table-hover" id="product_dt" width="100%">
        <thead>
          <tr>
            <th>Opsi</th>
            <th>Nama Obat</th>
            <th>Kategori Id</th>
            <th>Kategori</th>
            <th>Stok</th>
            <th>Unit</th>
            <th>User</th>
            <th>Dibuat</th>
            <th>Diedit</th>
          </tr>
        </thead>
      </table>
    </div>
  </div>
</div>
<div class="modal fade reset_on_hidden" id="product_mdl" role="dialog" tabindex='-1'>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span></button>
        <h4 class="modal-title">Tambah Edit Obat</h4>
      </div>
      <form id="product_form" action="">
        <input name="product_add_edit_id" id="product_add_edit_id" type="hidden">
        <div class="modal-body">
          <div class="form-group">
            <label>Nama Obat</label>
            <input name="product_add_edit_name" id="product_add_edit_name" class="form-control" type="text" placeholder="Masukkan nama obat">
          </div>
          <div class="form-group">
            <label>Satuan</label>
            <input name="product_add_edit_unit" id="product_add_edit_unit" class="form-control" type="text" placeholder="Masukkan satuan obat">
          </div>
          <div class="form-group">
            <label>Kategori</label>
            <select name="product_add_edit_category" id="product_add_edit_category" class="form-control">
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
          <?php
          foreach ($price as $prc) {
            ?>
            <div class="form-group">
              <label>Harga <i>" <?php echo $prc['name'];?> "</i></label>
              <input name="product_add_edit_price[<?php echo $prc['id'];?>]" id="product_add_edit_price_<?php echo $prc['id'];?>" class="form-control" type="text" placeholder="Masukkan harga <?php echo $prc['name'];?>">
            </div>
            <?php
          }
          ?>
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