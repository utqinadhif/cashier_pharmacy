<?php defined('BASEPATH') OR exit('No direct script access allowed');

add_js('datatables.net/jquery.dataTables.min.js');
add_js('datatables.net-bs/js/dataTables.bootstrap.min.js');
add_css('datatables.net-bs/css/dataTables.bootstrap.min.css');

add_js('bootstrap-datepicker/js/bootstrap-datepicker.min.js');
add_js('bootstrap-datepicker/js/run_bootstrap-datepicker.min.js');
add_css('bootstrap-datepicker/css/bootstrap-datepicker.min.css');

add_js('select2/js/nselect2.min.js');
add_css('select2/css/nselect2.min.css', 3);

add_js('modules/purchase.js');
?>
<div class="box">
  <div class="box-header with-border">
    <h3 class="box-title">List Pembelian</h3>
    <div class="box-tools pull-right">
      <a href="#" class="btn btn-flat btn-default btn-xs" id="purchase_add"><i class="fa fa-fw fa-plus"></i> Tambah</a>
      <a href="#" class="btn btn-flat btn-warning btn-xs" id="purchase_refresh"><i class="fa fa-fw fa-sync"></i> Refresh</a>
    </div>
  </div>
  <div class="box-body">
    <div class="form-inline">
      <div class="form-group">
        <input id="purchase_search_code" class="form-control" type="text" placeholder="Cari kode pembelian">
      </div>
      <div class="form-group">
        <input id="purchase_search_invoice" class="form-control" type="text" placeholder="Cari faktur">
      </div>
      <div class="input-group input-daterange" id="purchase_search_date">
        <input id="purchase_search_date_from" type="text" class="form-control no_radius" value="<?php echo date('d-m-Y');?>" readonly>
        <div class="input-group-addon">sd</div>
        <input id="purchase_search_date_to" type="text" class="form-control no_radius" value="<?php echo date('d-m-Y');?>" readonly>
      </div>
    </div>
    <hr>
    <div class="table-responsive">
      <table class="table table-bordered table-hover" id="purchase_dt" width="100%">
        <thead>
          <tr>
            <th>Pilihan</th>
            <th>Kode Pembelian</th>
            <th>Faktur</th>
            <th>Distributor</th>
            <th>Tanggal Pembelian</th>
            <th>Item</th>
            <th>Jumlah Barang</th>
            <th>Total</th>
            <th>User</th>
            <th>Dibuat</th>
            <th>Diedit</th>
          </tr>
        </thead>
      </table>
    </div>
  </div>
</div>  
<div class="modal fade" id="purchase_mdl" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span></button>
        <h4 class="modal-title">Tambah Edit Pembelian</h4>
      </div>
      <form method="POST" id="purchase_add_edit">          
        <div class="modal-body">
          <input type="text" class="hidden" name="purchase_add_id" id="purchase_add_id">
          <div class="form-group">
            <label>Tanggal Pembelian</label>
            <input name="purchase_add_date" id="purchase_add_date" class="form-control ddatepicker" type="text" placeholder="Pilih tanggal pembelian" config='{"autoclose":"true","format":"dd-mm-yyyy"}' value="<?php echo date('d-m-Y');?>" required readonly>
          </div>
          <div class="form-group">
            <label>Faktur</label>
            <input name="purchase_add_invoice" id="purchase_add_invoice" class="form-control" type="text" placeholder="Masukkan faktur">
          </div>
          <div class="form-group">
            <label>Distributor</label>
            <select class="form-control" name="purchase_add_distributor" id="purchase_add_distributor" tabindex="-1" required style="width:100%"></select>
          </div>
          <div class="form-group">
            <a href="#" class="btn btn-flat btn-default btn-xs" id="purchase_product_add"><i class="fa fa-fw fa-plus"></i> Tambah Barang</a>
            <a href="#" class="btn btn-flat btn-warning btn-xs" id="purchase_product_refresh"><i class="fa fa-fw fa-sync"></i> Refresh</a>
          </div>
          <hr>
          <div class="table-responsive">
            <table class="table table-bordered table-hover" id="purchase_product_dt" width="100%">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Pilihan</th>
                  <th>Nama Barang</th>
                  <th>Harga</th>
                  <th>Stok</th>
                  <th>Total</th>
                  <th>User</th>
                  <th>Dibuat</th>
                  <th>Diedit</th>
                </tr>
              </thead>
            </table>
          </div>
        </div>
        <div class="modal-footer">
          <button type="reset" class="hidden">Reset</button>
          <button type="submit" class="btn btn-success btn-flat">Simpan</button>
          <button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Close</button>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="modal fade" id="purchase_product_mdl" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span></button>
        <h4 class="modal-title">Tambah Edit Pembelian :: Tambah Barang</h4>
      </div>
      <form method="POST" id="purchase_product">
        <input type="text" class="hidden" name="purchase_product_add_product_isedit" id="purchase_product_add_product_isedit">
	      <div class="modal-body">
				  <div class="form-group">
				    <label>Barang</label>
				    <select class="form-control" name="purchase_product_add_product_id" id="purchase_product_add_product_id" tabindex="-1" required style="width:100%"></select>
				  </div>
          <div class="form-group">
            <label>Harga Satuan</label>
            <input name="purchase_product_add_price" id="purchase_product_add_price" class="form-control" type="number" placeholder="Masukkan harga" required>
          </div>
				  <div class="form-group">
				    <label>Stok</label>
				    <input name="purchase_product_add_stock" id="purchase_product_add_stock" class="form-control" type="number" placeholder="Masukkan jumlah" required>
				  </div>
          <div class="form-group">
            <label>Expired</label>
            <input name="purchase_product_add_expired" id="purchase_product_add_expired" class="form-control ddatepicker" type="text" placeholder="Masukkan Expired" required readonly value="<?php echo date('d-m-Y');?>" config='{"autoclose":"true","format":"dd-mm-yyyy"}'>
          </div>
	      </div>
	      <div class="modal-footer">
          <button type="reset" class="hidden">Reset</button>
          <button type="submit" class="btn btn-success btn-flat">Simpan</button>
	        <button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Close</button>
	      </div>
			</form>
    </div>
  </div>
</div>