<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Transaction extends MX_Controller {
	
	function __construct() {
		parent::__construct();

		$this->_sess = modules::run('cashier/users/_check_session');

		$this->template->inject_partial('menu', modules::run('cashier/js/_menu', $this->_sess));

		$conf = modules::run('cashier/js/_conf');
		$this->template->inject_partial('sidebar', @$conf['menu']);
		$this->template->inject_partial('theme', @$conf['theme']);
	}

	public function index() {}

	/*sale*/
	public function sale() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		$this->template->inject_partial('title', 'Kredit');

		$this->template->build('sale');
	}

	/*purchase*/
	public function purchase() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->template->inject_partial('title', 'Pembelian');

		$this->template->build('purchase');
	}

	public function purchase_draft() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		$this->template->inject_partial('title', 'Draft Pembelian');

		$this->template->build('purchase_draft');
	}
}