<?php defined('BASEPATH') OR exit('No direct script access allowed');

add_js('datatables.net/jquery.dataTables.min.js');
add_js('datatables.net-bs/js/dataTables.bootstrap.min.js');
add_css('datatables.net-bs/css/dataTables.bootstrap.min.css');

add_js('bootstrap-datepicker/js/bootstrap-datepicker.min.js');
add_js('bootstrap-datepicker/js/run_bootstrap-datepicker.min.js');
add_css('bootstrap-datepicker/css/bootstrap-datepicker.min.css');

add_js('select2/js/nselect2.min.js');
add_css('select2/css/nselect2.min.css', 3);

add_js('modules/process.js');
?>
<div class="row">
  <div class="col-md-8 col-sm-7 col-xs-12">
    <div class="row display-flex" id="product" style="overflow-x: scroll;"></div>
  </div>
  <div class="col-md-4 col-sm-5 col-xs-12">
    <div class="box">
      <div class="box-header with-border">
        <h3 class="box-title">Daftar Barang Sementara</h3>
        <div class="box-tools pull-right">
          <div class="dropdown">
            <button class="btn btn-default btn-xs btn-flat dropdown-toggle" type="button" data-toggle="dropdown">Pilihan
            <span class="caret"></span></button>
            <ul class="dropdown-menu">
              <li><a href="#" id="process_latest">Lihat Transaksi Terakhir</a></li>
              <li><a href="#" id="process_cancel">Batal</a></li>
              <li><a href="#" id="process_refresh">Refresh</a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="box-body">
        <div class="table-responsive" id="finish" style="overflow-x: scroll;">
          <table class="table table-bordered table-hover" id="process_add_dt" width="100%">
            <thead>
              <tr>
                <th>Pilihan</th>
                <th>Nama Barang</th>
                <th>Total</th>
              </tr>
            </thead>
          </table>
        </div>
        <button id="process_finish" class="btn btn-flat btn-danger btn-block">Selesaikan <b id="total_temp">0</b> ?</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="price_mdl" role="dialog" tabindex='-1'>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span></button>
        <h4 class="modal-title">Pilih Harga</h4>
      </div>
      <div class="modal-body">
        <div class="row display-flex">
          <?php
          foreach ($price as $prc) {
            ?>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <a href="#" class="select_price" ids="<?php echo $prc['id'];?>">
                <div class="small-box bg-fuchsia">
                  <div class="inner">
                    <h4><b><?php echo $prc['name'];?></b></h4>
                    <i>Harga</i>
                  </div>
                  <div class="icon">
                    <i class="fa fa-dollar-sign"></i>
                  </div>
                  <i class="small-box-footer">::</i>
                </div>
              </a>
            </div>
            <?php
          }
          ?>
        </div>          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="category_mdl" role="dialog" tabindex='-1'>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span></button>
        <h4 class="modal-title">Pilih Kategori</h4>
      </div>
      <div class="modal-body">
        <div class="row display-flex">
          <div class="col-md-6 col-sm-6 col-xs-12">
            <a href="#" class="select_category" ids="0">
              <div class="small-box bg-maroon">
                <div class="inner">
                  <h4><b>Semua</b></h4>
                  <i>Kategori</i>
                </div>
                <div class="icon">
                  <i class="fa fa-tags"></i>
                </div>
                <i class="small-box-footer">::</i>
              </div>
            </a>
          </div>
          <?php
          foreach ($category as $cat) {
            ?>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <a href="#" class="select_category" ids="<?php echo $cat['id'];?>">
                <div class="small-box bg-maroon">
                  <div class="inner">
                    <h4><b><?php echo $cat['name'];?></b></h4>
                    <i>Kategori</i>
                  </div>
                  <div class="icon">
                    <i class="fa fa-tags"></i>
                  </div>
                  <i class="small-box-footer">::</i>
                </div>
              </a>
            </div>
            <?php
          }
          ?>
        </div>          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade reset_on_hidden" id="discount_mdl" role="dialog" tabindex='-1'>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span></button>
        <h4 class="modal-title">Diskon Obat</h4>
      </div>
      <form id="discount_form">
        <input type="text" name="discount_product_id" id="discount_product_id" style="display: none;">
        <div class="modal-body">
          <div class="form-group">
            <label>Harga Normal</label>
            <input id="discount_normal" class="form-control" type="text" readonly="1">
          </div>
          <div class="form-group">
            <label>Diskon</label>
            <input name="discount_price" id="discount_price" class="form-control" type="number" placeholder="Masukkan diskon">
          </div>
          <div class="form-group">
            <div class="alert alert-warning">
              <strong>Harga Baru :</strong> <b id="discount_new" class="form-control-static">0</b>
            </div>
          </div>         
        </div>
        <div class="modal-footer">
          <button type="submit" id="discount_submit" class="btn btn-success btn-flat">Simpan</button>
          <button type="reset" class="hidden">Reset</button>
          <button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Close</button>
        </div>
      </form>         
    </div>
  </div>
</div>
<div class="modal fade reset_on_hidden" id="finish_mdl" role="dialog" tabindex='-1'>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span></button>
        <h4 class="modal-title">Penyelesaian Transaksi</h4>
      </div>
      <form id="finish_form">
        <input type="text" name="finish_price" id="finish_price" style="display: none;">
        <div class="modal-body">
          <div class="row">
            <div class="col-md-4">
              <div class="form-group">
                <label>Tanggal Transaksi</label>
                <input name="finish_date" id="finish_date" class="form-control ddatepicker input-sm" config='{"autoclose":"true","format":"dd-mm-yyyy"}' type="text" placeholder="Masukkan tanggal transaksi" readonly value="<?php echo date('d-m-Y');?>">
              </div>
            </div>
            <div class="col-md-8">
              <div class="form-group">
                <label>Pengirim</label>
                <select class="form-control" name="finish_sender" id="finish_sender" tabindex="-1" style="width:100%"></select>
              </div>
            </div>
          </div>          
          <div class="form-group">
            <div class="alert alert-warning">
              <strong>Total Transaksi :</strong> <b id="finish_total" class="form-control-static">0</b>
            </div>
          </div>
          <div class="form-group">
            <label>Tunai</label>
            <input name="finish_paid" id="finish_paid" class="form-control input-lg" type="number" placeholder="Masukkan uang tunai">
          </div>
          <div class="form-group">
            <?php
            foreach ($paid as $npaid) {
              ?>
              <a class="badge bg-red frequently" data-paid="<?php echo $npaid['paid'];?>" href="#"><?php echo $npaid['paid'];?></a>
              <?php
            }
            ?>
          </div>
          <div class="form-group">
            <div class="alert alert-info">
              <strong>Kembalian :</strong> <b id="finish_changes" class="form-control-static">0</b>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <label class="pull-left">
            <input type="checkbox" name="finish_print" value="1" checked>
            Print
          </label>
          <button type="submit" id="finish_submit" class="btn btn-success btn-flat">Simpan</button>
          <button type="reset" class="hidden">Reset</button>
          <button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Close</button>
        </div>
      </form>         
    </div>
  </div>
</div>
<div class="modal fade reset_on_hidden" id="latest_mdl" role="dialog" tabindex='-1'>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span></button>
        <h4 class="modal-title">Transaksi Terakhir</h4>
      </div>
      <div class="modal-body">
        <h4>Detail Transaksi</h4>
        <table class="table table-bordered table-hover" id="latest_sale" width="100%">
          <tbody></tbody>
        </table>
        <h4>Detail Obat</h4>
        <table class="table table-bordered table-hover" id="latest_sale_product" width="100%">
          <thead>
            <tr>
              <th>Nama Obat</th>
              <th>Qty</th>
              <th>Harga</th>
              <th>Diskon</th>
              <th>Total</th>
            </tr>
          </thead>
          <tbody></tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success btn-flat" id="latest_reprint">Print Ulang</button>
        <button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Close</button>
      </div>      
    </div>
  </div>
</div>
<div class="modal fade reset_on_hidden" id="qty_mdl" role="dialog" tabindex='-1'>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span></button>
        <h4 class="modal-title">Qty Obat</h4>
      </div>
      <form id="qty_form">
        <input type="text" name="qty_product_id" id="qty_product_id" style="display: none;">
        <div class="modal-body">
          <div class="form-group">
            <label>Qty</label>
            <input id="qty_qty" name="qty_qty" class="form-control" type="text" placeholder="Masukkan jumlah obat">
          </div>    
        </div>
        <div class="modal-footer">
          <button type="submit" id="discount_submit" class="btn btn-success btn-flat">Simpan</button>
          <button type="reset" class="hidden">Reset</button>
          <button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Close</button>
        </div>
      </form>         
    </div>
  </div>
</div>
<script type="text/template" id="show_product_tpl">
  <div class="col-md-4 col-sm-6 col-xs-12">
    <a href="#" class="select_product" title="{name}" product_id="{id}" price="{price}">
      <div class="small-box bg-aqua">
        <div class="inner">
          <h4><b>{name}</b></h4>
          <b>{price}</b>
        </div>
        <div class="icon">
          <i class="fa fa-tablets"></i>
        </div>
        <i class="small-box-footer">{category} - {stock} {unit}</i>
      </div>    
    </a>
  </div>
</script>