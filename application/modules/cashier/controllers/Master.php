<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Master extends MX_Controller {
	
	function __construct() {
		parent::__construct();

		$this->_sess = modules::run('cashier/users/_check_session');

		$this->template->inject_partial('menu', modules::run('cashier/js/_menu', $this->_sess));

		$conf = modules::run('cashier/js/_conf');
		$this->template->inject_partial('theme', @$conf['theme']);
	}

	public function index() {}

	/*distributor*/
	public function distributor() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->template->build('distributor');
	}

	/*price*/
	public function price() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->template->build('price');
	}

	/*sender*/
	public function sender() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->template->build('sender');
	}

	/*product*/
	public function product() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->load->model(array('M_category', 'M_price'));

		$this->template->build('product', array(
			'category' => $this->M_category->get_all(),
			'price'    => $this->M_price->get_all(),
		));
	}

	public function category() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->template->build('category');
	}

	public function product_price() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->load->model(array('M_category', 'M_price'));

		$this->template->build('product_price', array(
			'category' => $this->M_category->get_all(),
			'price'    => $this->M_price->get_all(),
		));
	}
}