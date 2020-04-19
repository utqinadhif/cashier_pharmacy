<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Configuration extends MX_Controller {
	
	function __construct() {
		parent::__construct();

		$this->_sess = modules::run('cashier/users/_check_session');

		$this->template->inject_partial('menu', modules::run('cashier/js/_menu', $this->_sess));

		$conf = modules::run('cashier/js/_conf');
		$this->template->inject_partial('theme', @$conf['theme']);
	}

	public function index() {
		$this->configuration();
	}

	public function configuration() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);
		
		$this->template->inject_partial('title', 'Konfigurasi');

		$this->load->model('M_configuration');

		$this->template->build('configuration', $this->M_configuration->get('general'));
	}

	public function action() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);
		
		if(
			!empty($store = $this->input->post('store'))
		) {
			$this->load->model('M_configuration');

			$this->M_configuration->set('general', array(
				'store'        => $store,
				'address'      => $this->input->post('address'),
				'phone'        => $this->input->post('phone'),
				'printer'      => $this->input->post('printer'),
				'theme'        => $this->input->post('theme'),
			));
			$this->session->set_flashdata('configuration', 'Data berhasil disimpan!');
			redirect(base_url('cashier/configuration'));
		} else {
			$this->session->set_flashdata('configuration', 'Data gagal disimpan!');
			redirect(base_url('cashier/configuration'));
		}
	}
}