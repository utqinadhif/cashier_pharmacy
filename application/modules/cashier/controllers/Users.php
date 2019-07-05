<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Users extends MX_Controller {
	
	function __construct() {
		parent::__construct();
	}

	public function index() {
		$this->users();
	}

	public function users() {
		$this->_sess = modules::run('cashier/users/_check_session');
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->template->inject_partial('menu', modules::run('cashier/js/_menu', $this->_sess));

		$conf = modules::run('cashier/js/_conf');
		$this->template->inject_partial('theme', @$conf['theme']);

		$this->template->build('users');
	}

	public function login() {
		$this->template->set_layout('layout_blank');

		$redirect = $this->input->get('_');
		$action   = !empty($redirect) ? base_url('cashier/users/login_action?_=' . $redirect) : base_url('cashier/users/login_action');

		$this->template->build('login', array(
			'msg'    => $this->session->flashdata('user_login'),
			'action' => $action,
			'store'  => @$this->_conf['store']
		));
	}

	public function logout() {
		$this->session->unset_userdata('user');
		$this->session->unset_userdata('purchase_product');
		$this->session->unset_userdata('purchase_draft_product');
		$this->session->unset_userdata('process_temp');

		redirect(base_url('cashier/users/login'));
	}

	public function _check_session($is_return = FALSE) {
    $dt = $this->session->userdata('user');
    if(empty($dt)) {
    	if($is_return) return array();
    	else {
    		if($this->input->is_ajax_request()) {
	    		echo json_encode(array(
	    			/*datatables*/
						'draw'            => 0,
						'recordsTotal'    => 0,
						'recordsFiltered' => 0,
						'data'            => array(),
						/*select2*/
						'list'            => array(),
						'total'           =>	0,
						/*default*/
						'success'         => 2,
						'msg'             => 'Tidak diijinkan',
						'login'           => base_url('cashier/users/login?_='.actual_link())
	    		));
	    		die;
				} else redirect(base_url('cashier/users/login?_='.actual_link()));
    	}
    } else return $dt;
	}

	public function _check_privilege($sess, $allow)
	{
		$bool = false;
		if(!empty($sess))
		{
			$bool = is_array($allow) ? in_array($sess['privilege'], $allow) : $sess['privilege'] == $allow;
			if(!$bool)
			{
				if($this->input->is_ajax_request())
				{ 
					echo json_encode(array(
						/*datatables*/
						'draw'            => 0,
						'recordsTotal'    => 0,
						'recordsFiltered' => 0,
						'data'            => array(),
						/*select2*/
						'list'            => array(),
						'total'           =>	0,
						/*default*/
						'success'         => 0,
						'msg'             => 'Anda tidak memiliki hak akses.',
					));
					die;
				}else{
					redirect(base_url());
				}
			}
		}else{
			if($this->input->is_ajax_request())
			{
				echo json_encode(array(
					/*datatables*/
					'draw'            => 0,
					'recordsTotal'    => 0,
					'recordsFiltered' => 0,
					'data'            => array(),
					/*select2*/
					'list'            => array(),
					'total'           =>	0,
					/*default*/
					'success'         => 2,
					'msg'             => 'Anda harus login.',
					'login'           => base_url()
				));
				die;
			}else{
				redirect(base_url());
			}
		}
		return $bool;
	}

	public function login_action() {

		if(!empty(modules::run('users/_check_session', TRUE))) redirect(base_url());

		$username = $this->input->post('username');
		$password = $this->input->post('password');
		$redirect = $this->input->get('_');

		if(!empty($username) && !empty($password)) {
			$this->load->model('M_users');
			$userdata = $this->M_users->get_by_name($username);
			if(!empty($userdata)) {
				if(password_verify($password, $userdata['password'])) {
					if(!empty($userdata['privilege'])) {
						$sess = array(
							'username'  => $userdata['name'],
							'privilege' => $userdata['privilege'],
							'id'        => $userdata['id'],
						);
						$this->session->set_userdata('user', $sess);
						if(empty($redirect)) redirect(base_url());
						else redirect(urldecode(base64_decode($redirect)));
					} else {
						$this->session->set_flashdata('user_login', 'Anda tidak memiliki akses pada aplikasi ini!');
					}
				} else {
					$this->session->set_flashdata('user_login', 'Password Salah!!');
				}
			} else {
				$this->session->set_flashdata('user_login', 'Data tidak ditemukan!');
			}
		}
		redirect(base_url('cashier/users/login?_='.actual_link()));
	}
}