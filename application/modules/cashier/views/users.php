<?php defined('BASEPATH') OR exit('No direct script access allowed');

add_js('datatables.net/jquery.dataTables.min.js');
add_js('datatables.net-bs/js/dataTables.bootstrap.min.js');
add_css('datatables.net-bs/css/dataTables.bootstrap.min.css');

add_js('modules/users.js');
?>
<div class="box">
  <div class="box-header with-border">
    <h3 class="box-title">List Pengguna</h3>
    <div class="box-tools pull-right">
      <a href="#" class="btn btn-flat btn-default btn-xs" id="users_add"><i class="fa fa-fw fa-plus"></i> Tambah</a>
      <a href="#" class="btn btn-flat btn-warning btn-xs" id="users_refresh"><i class="fa fa-fw fa-sync"></i> Refresh</a>
    </div>
  </div>
  <div class="box-body">
  	<div class="form-inline">
  		<div class="form-group">
  			<input id="users_search_name" class="form-control" type="text" placeholder="Cari nama users">
  		</div>
  		<div class="form-group">
  			<select class="form-control" name="users_search_privilege" id="users_search_privilege">
		    	<option value="">:: Cari Privilege ::</option>
		    	<option value="1">Admin</option>
		    	<option value="2">Kasir</option>
		    </select>
  		</div>
  	</div>
  	<hr>
  	<div class="table-responsive">
      <table class="table table-bordered table-hover" id="users_dt" width="100%">
        <thead>
          <tr>
            <th>Pilihan</th>
            <th>Nama</th>
            <th>Privilege</th>
            <th>User</th>
            <th>Dibuat</th>
            <th>Diedit</th>
          </tr>
        </thead>
      </table>
    </div>
  </div>
</div>
<div class="modal fade reset_on_hidden" id="users_mdl" role="dialog" tabindex='-1'>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span></button>
        <h4 class="modal-title">Tambah Edit Pengguna</h4>
      </div>
      <form id="users_form" action="">
        <input name="users_add_edit_id" id="users_add_edit_id" type="hidden">
        <div class="modal-body">
				  <div class="form-group">
				    <label>Nama</label>
				    <input name="users_add_edit_name" id="users_add_edit_name" class="form-control" type="text" placeholder="Masukkan nama pengguna" required>
				  </div>
				  <div class="form-group">
				    <label>Password Baru</label>
				    <input name="users_add_edit_password" id="users_add_edit_password" class="form-control" type="password" placeholder="Masukkan password baru" required>
				  </div>
				  <div class="form-group">
				    <label>Ulangi Password</label>
				    <input name="users_add_edit_repassword" id="users_add_edit_repassword" class="form-control" type="password" placeholder="Ulangi password sekali lagi" required>
				  </div>
				  <div class="form-group">
				    <label>Privilege</label>
				    <select class="form-control" name="users_add_edit_privilege" id="users_add_edit_privilege" required>
				    	<option value="">:: Pilih Privilege ::</option>
				    	<option value="1">Admin</option>
				    	<option value="2">Kasir</option>
				    </select>
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