<?php defined('BASEPATH') OR exit('No direct script access allowed');

add_js('datatables.net/jquery.dataTables.min.js');
add_js('datatables.net-bs/js/dataTables.bootstrap.min.js');
add_css('datatables.net-bs/css/dataTables.bootstrap.min.css');

add_js('modules/category.js');
?>
<div class="box">
  <div class="box-header with-border">
    <h3 class="box-title">List Kategori</h3>
    <div class="box-tools pull-right">
      <a href="#" class="btn btn-flat btn-default btn-xs" id="category_add"><i class="fa fa-fw fa-plus"></i> Tambah</a>
      <a href="#" class="btn btn-flat btn-warning btn-xs" id="category_refresh"><i class="fa fa-fw fa-sync"></i> Refresh</a>
    </div>
  </div>
  <div class="box-body">
  	<div class="form-inline">
  		<div class="form-group">
  			<input id="category_search_name" class="form-control" type="text" placeholder="Cari kategori obat">
  		</div>
  	</div>
  	<hr>
  	<div class="table-responsive">
      <table class="table table-bordered table-hover" id="category_dt" width="100%">
        <thead>
          <tr>
            <th>Opsi</th>
            <th>Kategori</th>
            <th>User</th>
            <th>Dibuat</th>
            <th>Diedit</th>
          </tr>
        </thead>
      </table>
    </div>
  </div>
</div>
<div class="modal fade reset_on_hidden" id="category_mdl" role="dialog" tabindex='-1'>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span></button>
        <h4 class="modal-title">Tambah Edit Kategori</h4>
      </div>
      <form id="category_form" action="">
        <input name="category_add_edit_id" id="category_add_edit_id" type="hidden">
        <div class="modal-body">
          <div class="form-group">
            <label>Kategori</label>
            <input name="category_add_edit_name" id="category_add_edit_name" class="form-control" type="text" placeholder="Masukkan kategori obat">
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