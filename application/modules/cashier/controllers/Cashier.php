<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Cashier extends MX_Controller {
	
	function __construct() {
		parent::__construct();

		$this->_sess = modules::run('cashier/users/_check_session');

		$conf = modules::run('cashier/js/_conf');
		$this->template->inject_partial('theme', @$conf['theme']);
	}

	public function index() {
		$this->template->inject_partial('menu', modules::run('cashier/js/_menu', $this->_sess));

		$this->load->model('M_cashier');
		$this->template->build('dashboard', $this->M_cashier->dashboard());
	}

	public function process() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		$this->load->model('M_price');
		$default = $this->M_price->get_default();

		$this->template->inject_partial('menu', modules::run('cashier/js/_menu', $this->_sess, true, $default));

		$this->load->model(array('M_category', 'M_price', 'M_sale'));

		$this->template->build('process', array(
			'paid'     => $this->M_sale->frequently(),
			'category' => $this->M_category->get_all(),
			'price'    => $this->M_price->get_all(),
		));
	}
}