<?php defined('BASEPATH') OR exit('No direct script access allowed');

add_js('datatables.net/jquery.dataTables.min.js');
add_js('datatables.net-bs/js/dataTables.bootstrap.min.js');
add_css('datatables.net-bs/css/dataTables.bootstrap.min.css');

add_js('modules/sender.js');
?>
<div class="box">
  <div class="box-header with-border">
    <h3 class="box-title">List Pengirim</h3>
    <div class="box-tools pull-right">
      <a href="#" class="btn btn-flat btn-default btn-xs" id="sender_add"><i class="fa fa-fw fa-plus"></i> Tambah</a>
      <a href="#" class="btn btn-flat btn-warning btn-xs" id="sender_refresh"><i class="fa fa-fw fa-sync"></i> Refresh</a>
    </div>
  </div>
  <div class="box-body">
  	<div class="form-inline">
  		<div class="form-group">
  			<input id="sender_search_name" class="form-control" type="text" placeholder="Cari nama pengirim">
  		</div>
  		<div class="form-group">
  			<input id="sender_search_address" class="form-control" type="text" placeholder="Cari alamat pengirim">
  		</div>
      <div class="form-group">
        <input id="sender_search_phone" class="form-control" type="text" placeholder="Cari nomor hp pengirim">
      </div>
  	</div>
  	<hr>
  	<div class="table-responsive">
      <table class="table table-bordered table-hover" id="sender_dt" width="100%">
        <thead>
          <tr>
            <th>Opsi</th>
            <th>Nama Pengirim</th>
            <th>Alamat</th>
            <th>Nomor HP</th>
            <th>User</th>
            <th>Dibuat</th>
            <th>Diedit</th>
          </tr>
        </thead>
      </table>
    </div>
  </div>
</div>
<div class="modal fade reset_on_hidden" id="sender_mdl" role="dialog" tabindex='-1'>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span></button>
        <h4 class="modal-title">Tambah Edit Pengirim</h4>
      </div>
      <form id="sender_form" action="">
        <input name="sender_add_edit_id" id="sender_add_edit_id" type="hidden">
        <div class="modal-body">
          <div class="form-group">
            <label>Nama Pengirim</label>
            <input name="sender_add_edit_name" id="sender_add_edit_name" class="form-control" type="text" placeholder="Masukkan nama pengirim">
          </div>
          <div class="form-group">
            <label>Nomor HP</label>
            <input name="sender_add_edit_phone" id="sender_add_edit_phone" class="form-control" type="text" placeholder="Masukkan nomor hp">
          </div>
          <div class="form-group">
            <label>Alamat</label>
            <textarea name="sender_add_edit_address" id="sender_add_edit_address" class="form-control" placeholder="Masukkan alamat"></textarea>
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