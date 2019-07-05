<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Report extends MX_Controller {
	
	function __construct() {
		parent::__construct();

		$this->_sess = modules::run('cashier/users/_check_session');

		$this->template->inject_partial('menu', modules::run('cashier/js/_menu', $this->_sess));

		$conf = modules::run('cashier/js/_conf');
		$this->template->inject_partial('theme', @$conf['theme']);
	}

	public function index() {}

	public function purchase() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->template->build('report_purchase');		
	}

	public function sale() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->template->build('report_sale');		
	}
}