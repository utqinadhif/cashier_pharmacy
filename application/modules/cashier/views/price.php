<?php defined('BASEPATH') OR exit('No direct script access allowed');

add_js('datatables.net/jquery.dataTables.min.js');
add_js('datatables.net-bs/js/dataTables.bootstrap.min.js');
add_css('datatables.net-bs/css/dataTables.bootstrap.min.css');

add_js('modules/price.js');
?>
<div class="box">
  <div class="box-header with-border">
    <h3 class="box-title">List Harga</h3>
    <div class="box-tools pull-right">
      <a href="#" class="btn btn-flat btn-default btn-xs" id="price_add"><i class="fa fa-fw fa-plus"></i> Tambah</a>
      <a href="#" class="btn btn-flat btn-warning btn-xs" id="price_refresh"><i class="fa fa-fw fa-sync"></i> Refresh</a>
    </div>
  </div>
  <div class="box-body">
  	<div class="form-inline">
  		<div class="form-group">
  			<input id="price_search_name" class="form-control" type="text" placeholder="Cari nama harga">
  		</div>
  	</div>
  	<hr>
  	<div class="table-responsive">
      <table class="table table-bordered table-hover" id="price_dt" width="100%">
        <thead>
          <tr>
            <th>Opsi</th>
            <th>Nama Harga</th>
            <th>Default</th>
            <th>User</th>
            <th>Dibuat</th>
            <th>Diedit</th>
          </tr>
        </thead>
      </table>
    </div>
  </div>
</div>
<div class="modal fade reset_on_hidden" id="price_mdl" role="dialog" tabindex='-1'>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span></button>
        <h4 class="modal-title">Tambah Edit Harga</h4>
      </div>
      <form id="price_form" action="">
        <input name="price_add_edit_id" id="price_add_edit_id" type="hidden">
        <div class="modal-body">
          <div class="form-group">
            <label>Nama Harga</label>
            <input name="price_add_edit_name" id="price_add_edit_name" class="form-control" type="text" placeholder="Masukkan nama harga">
          </div>
          <div class="form-group">
            <div class="checkbox">
              <label><input name="price_add_edit_default" id="price_add_edit_default" type="checkbox" value="1">Default</label>
            </div>
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