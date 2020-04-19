<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Js extends MX_Controller {

	function __construct() {
		parent::__construct();
	}

	public function index() {
		ob_start('ob_gzhandler');
		header('content-type: text/javascript; charset: UTF-8');
		header('cache-control: must-revalidate');
		$offset = 60 * 60 * 24 * 365;
		$expire = 'expires: ' . gmdate('D, d M Y H:i:s', time() + $offset) . ' GMT';
		header($expire);

		include_once FCPATH . str_replace('/', DIRECTORY_SEPARATOR, 'themes/default/js/jquery.js');
    include_once FCPATH . str_replace('/', DIRECTORY_SEPARATOR, 'themes/default/bootstrap/js/bootstrap.min.js');
    include_once FCPATH . str_replace('/', DIRECTORY_SEPARATOR, 'themes/cashier/js/script.js');
    include_once FCPATH . str_replace('/', DIRECTORY_SEPARATOR, 'themes/cashier/src/adminlte2/js/adminlte.min.js');
	}

	public function _menu($sess, $show_form = false, $default = null) {
		$menu = $sess['privilege'] == 1 ? $this->_menu_admin() : $this->_menu_cashier();
		$form = $show_form ? $this->_form_sale($default) : '';
		return $form . $menu;
	}

	private function _form_sale($default) {
		ob_start();
		?>
		<form class="navbar-form navbar-left" role="search">
      <div class="form-group">
        <input type="text" class="form-control" name="process_search_name" id="process_search_name" placeholder="Search">
      </div>
      <div class="form-group">
	    	<button type="button" class="btn btn-flat btn-default" id="process_search_price" ids="<?php echo $default['id'];?>"><i class="fa fa-money-check-alt"></i><span class="hidden-sm"> Harga</span> <span class="badge bg-green"><?php echo $default['name'];?></span></button>
	    	<button type="button" class="btn btn-flat btn-default" id="process_search_category" ids="0"><i class="fa fa-list"></i><span class="hidden-sm"> Kategori</span> <span class="badge bg-red">Semua</span></button>
	    </div>
    </form>
    <?php
		return ob_get_clean();
	}

	private function _menu_admin() {
		ob_start();
		?>
    <ul class="nav navbar-nav navbar-right">
      <li>
        <a href="<?php echo base_url();?>"><i class="fa fa-home"></i><span class="hidden-sm"> Beranda</span></a>
      </li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cash-register"></i><span class="hidden-sm"> Transaksi</span> <i class="caret"></i></a>
        <ul class="dropdown-menu" role="menu">
          <li>
            <a href="<?php echo base_url('cashier/process');?>">Kasir</a>
          </li>                        
          <li>
            <a href="<?php echo base_url('cashier/transaction/purchase');?>">Pembelian</a>
          </li>
          <li>
            <a href="<?php echo base_url('cashier/transaction/sale');?>">Penjualan</a>
          </li>
          <li class="divider"></li>
          <li>
            <a href="<?php echo base_url('cashier/transaction/purchase_draft');?>">Draft Pembelian</a>
          </li>
          <li class="divider"></li>
          <li>
            <a href="<?php echo base_url('cashier/report/purchase');?>">Laporan Pembelian</a>
          </li>
          <li>
            <a href="<?php echo base_url('cashier/report/sale');?>">Laporan Penjualan</a>
          </li>
        </ul>
      </li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-database"></i><span class="hidden-sm"> Master Data</span> <i class="caret"></i></a>
        <ul class="dropdown-menu" role="menu">
          <li>
            <a href="<?php echo base_url('cashier/master/sender');?>">Dokter Pengirim</a>
          </li>           
          <li>
            <a href="<?php echo base_url('cashier/master/distributor');?>">Distributor</a>
          </li>
          <li>
            <a href="<?php echo base_url('cashier/master/price');?>">Harga</a>
          </li>
          <li class="divider"></li> 
          <li>
            <a href="<?php echo base_url('cashier/master/category');?>">Kategori Obat</a>
          </li>
          <li>
            <a href="<?php echo base_url('cashier/master/product_price');?>">Harga Obat</a>
          </li>
          <li>
            <a href="<?php echo base_url('cashier/master/product');?>">Obat</a>
          </li>
          <li class="divider"></li>         
          <li>
            <a href="<?php echo base_url('cashier/users');?>">Akun</a>
          </li> 
        </ul>
      </li>
      <li>
        <a href="<?php echo base_url('cashier/configuration');?>"><i class="fa fa-cogs"></i><span class="hidden-sm"> Konfigurasi</span></a>
      </li>
      <li>
        <a href="<?php echo base_url('cashier/users/logout');?>"><i class="fa fa-door-open"></i><span class="hidden-sm"> Logout</span></a>
      </li>
    </ul>
		<?php
		return ob_get_clean();
	}

	private function _menu_cashier() {
		ob_start();
		?>
    <ul class="nav navbar-nav navbar-right">
      <li>
        <a href="<?php echo base_url();?>"><i class="fa fa-home"></i><span class="hidden-sm"> Beranda</span></a>
      </li>
      <li>
        <a href="<?php echo base_url('cashier/process');?>"><i class="fa fa-calculator"></i><span class="hidden-sm"> Kasir</span></a>
      </li>
      <li>
        <a href="<?php echo base_url('cashier/transaction/purchase_draft');?>"><i class="fa fa-money-check-alt"></i> <span class="hidden-sm"> Draft Pembelian</span></a>
      </li>
      <li>
        <a href="<?php echo base_url('cashier/transaction/sale');?>"><i class="fa fa-cash-register"></i> <span class="hidden-sm"> Penjualan</span></a>
      </li>
      <li>
        <a href="<?php echo base_url('cashier/users/logout');?>"><i class="fa fa-door-open"></i><span class="hidden-sm"> Logout</span></a>
      </li>
    </ul>
		<?php
		return ob_get_clean();
	}

	public function _conf() {
		$this->load->model('M_configuration');
		return $this->M_configuration->get('general');
	}
}