<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Ajax extends MX_Controller {
	
	function __construct() {
		parent::__construct();

		if(!$this->input->is_ajax_request()) {
			die('No direct script access allowed');
		}

		$this->_sess = modules::run('cashier/users/_check_session');
	}

	/*sender*/
	public function sender_list() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->load->library('Datatables');

		if (!empty($name = $this->input->post('custom[sender_search_name]'))) $this->datatables->like('name', $name);

		if (!empty($address = $this->input->post('custom[sender_search_address]'))) $this->datatables->like('address', $address);

		if (!empty($phone = $this->input->post('custom[sender_search_phone]'))) $this->datatables->like('phone', $phone);

    $this->datatables->select('id,name,address,phone,username,created,updated');
    $this->datatables->from('sender');

    $this->load->helper('modules');
    $this->datatables->edit_column('id', '
    	<div class="dropdown">
			  <button class="btn btn-danger btn-xs btn-flat dropdown-toggle" type="button" data-toggle="dropdown">Pilihan
			  <span class="caret"></span></button>
			  <ul class="dropdown-menu" data-id="$1" data-name="$2" data-address="$3" data-phone="$4">
			    <li><a href="#" class="sender_option_edit">Edit</a></li>
			    <li><a href="#" class="sender_option_delete">Hapus</a></li>
			  </ul>
			</div>
			', 'id,name,address,phone');

    $this->datatables->edit_column('created', '$1', 'dateclock_ind(created)');
    $this->datatables->edit_column('updated', '$1', 'dateclock_ind(updated)');

    echo $this->datatables->generate();
	}

	public function sender_add_edit() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);
		if (
			!empty($sender_add_edit_name    = $this->input->post('sender_add_edit_name')) &&
			!empty($sender_add_edit_address = $this->input->post('sender_add_edit_address')) &&
			!empty($sender_add_edit_phone   = $this->input->post('sender_add_edit_phone'))
		) {
			$this->load->model('M_sender');

			$array = array(
				'name'     => $sender_add_edit_name, 
				'address'  => $sender_add_edit_address,				
				'phone'    => $sender_add_edit_phone,				
				'user_id'  => $this->_sess['id'],
				'username' => $this->_sess['username'],
			);

			$sender_add_edit_id = $this->input->post('sender_add_edit_id');
			$exist              = $this->M_sender->get_by_name($sender_add_edit_name, $sender_add_edit_id);
			if(!empty($exist)) {
				$q   = false;
				$msg = 'Nama pengirim sudah ada';
			} else {
				if (!empty($sender_add_edit_id)) {
					$q = $this->M_sender->edit($array, $sender_add_edit_id);
				} else {		
					$q = $this->M_sender->add($array);
				}
			}

			if ($q) {
				$ret = array(
					'success' => 1,
					'msg'			=> 'Sukses menambah/ mengedit pengirim'
				);
			} else {
				$ret = array(
					'success' => 0,
					'msg'			=> !empty($msg) ? $msg : 'Kesalahan sistem'
				);			
			}
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	public function sender_delete() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		if (
			!empty($id  = $this->input->post('id'))
		) {
			$this->load->model('M_sender');

			$q = $this->M_sender->delete($id);

			if ($q) {
				$ret = array(
					'success' => 1,
					'msg'			=> 'Sukses menghapus pengirim'
				);
			} else {
				$ret = array(
					'success' => 0,
					'msg'			=> 'Kesalahan sistem'
				);			
			}
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	public function sender_search() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		$q    = $this->input->get('q');
		$page = $this->input->get('page');
		$page = $page == 0 ? 1 : $page;

		$this->load->model('M_sender');
		$res = $this->M_sender->search($q, $page);
		
		echo json_encode($res);
	}

	/*distributor*/
	public function distributor_list() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->load->library('Datatables');

		if (!empty($name = $this->input->post('custom[distributor_search_name]'))) $this->datatables->like('name', $name);

		if (!empty($address = $this->input->post('custom[distributor_search_address]'))) $this->datatables->like('address', $address);

		if (!empty($phone = $this->input->post('custom[distributor_search_phone]'))) $this->datatables->like('phone', $phone);

    $this->datatables->select('id,name,address,phone,username,created,updated');
    $this->datatables->from('distributor');

    $this->load->helper('modules');
    $this->datatables->edit_column('id', '
    	<div class="dropdown">
			  <button class="btn btn-danger btn-xs btn-flat dropdown-toggle" type="button" data-toggle="dropdown">Pilihan
			  <span class="caret"></span></button>
			  <ul class="dropdown-menu" data-id="$1" data-name="$2" data-address="$3" data-phone="$4">
			    <li><a href="#" class="distributor_option_edit">Edit</a></li>
			    <li><a href="#" class="distributor_option_delete">Hapus</a></li>
			  </ul>
			</div>
			', 'id,name,address,phone');

    $this->datatables->edit_column('created', '$1', 'dateclock_ind(created)');
    $this->datatables->edit_column('updated', '$1', 'dateclock_ind(updated)');

    echo $this->datatables->generate();
	}

	public function distributor_add_edit() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);
		if (
			!empty($distributor_add_edit_name    = $this->input->post('distributor_add_edit_name')) &&
			!empty($distributor_add_edit_address = $this->input->post('distributor_add_edit_address')) &&
			!empty($distributor_add_edit_phone   = $this->input->post('distributor_add_edit_phone'))
		) {
			$this->load->model('M_distributor');

			$array = array(
				'name'     => $distributor_add_edit_name, 
				'address'  => $distributor_add_edit_address,				
				'phone'    => $distributor_add_edit_phone,				
				'user_id'  => $this->_sess['id'],
				'username' => $this->_sess['username'],
			);

			$distributor_add_edit_id = $this->input->post('distributor_add_edit_id');
			$exist                   = $this->M_distributor->get_by_name($distributor_add_edit_name, $distributor_add_edit_id);
			if(!empty($exist)) {
				$q   = false;
				$msg = 'Nama distributor sudah ada';
			} else {
				if (!empty($distributor_add_edit_id)) {
					$q = $this->M_distributor->edit($array, $distributor_add_edit_id);
				} else {		
					$q = $this->M_distributor->add($array);
				}
			}

			if ($q) {
				$ret = array(
					'success' => 1,
					'msg'			=> 'Sukses menambah/ mengedit distributor'
				);
			} else {
				$ret = array(
					'success' => 0,
					'msg'			=> !empty($msg) ? $msg : 'Kesalahan sistem'
				);			
			}
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	public function distributor_delete() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		if (
			!empty($id  = $this->input->post('id'))
		) {
			$this->load->model('M_distributor');

			$q = $this->M_distributor->delete($id);

			if ($q) {
				$ret = array(
					'success' => 1,
					'msg'			=> 'Sukses menghapus dokter distributor'
				);
			} else {
				$ret = array(
					'success' => 0,
					'msg'			=> 'Kesalahan sistem'
				);			
			}
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	public function distributor_search() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		$q    = $this->input->get('q');
		$page = $this->input->get('page');
		$page = $page == 0 ? 1 : $page;

		$this->load->model('M_distributor');
		$res = $this->M_distributor->search($q, $page);
		
		echo json_encode($res);
	}

	/*price*/
	public function price_list() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->load->library('Datatables');

		if (!empty($name = $this->input->post('custom[price_search_name]'))) $this->datatables->like('name', $name);

    $this->datatables->select('id,name,is_main,username,created,updated');
    $this->datatables->from('price');

    $this->load->helper('modules');
    $this->datatables->edit_column('id', '
    	<div class="dropdown">
			  <button class="btn btn-danger btn-xs btn-flat dropdown-toggle" type="button" data-toggle="dropdown">Pilihan
			  <span class="caret"></span></button>
			  <ul class="dropdown-menu" data-id="$1" data-name="$2" data-default="$3">
			    <li><a href="#" class="price_option_edit">Edit</a></li>
			    <li><a href="#" class="price_option_delete">Hapus</a></li>
			  </ul>
			</div>
			', 'id,name,is_main');

    $this->datatables->edit_column('is_main', '$1', 'price_default(is_main)');
    $this->datatables->edit_column('created', '$1', 'dateclock_ind(created)');
    $this->datatables->edit_column('updated', '$1', 'dateclock_ind(updated)');

    echo $this->datatables->generate();
	}

	public function price_add_edit() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);
		if (
			!empty($price_add_edit_name = $this->input->post('price_add_edit_name')) 
		) {
			$this->load->model('M_price');

			$array = array(
				'name'     => $price_add_edit_name,
				'is_main'  => @intval($this->input->post('price_add_edit_default')),
				'user_id'  => $this->_sess['id'],
				'username' => $this->_sess['username'],
			);

			$price_add_edit_id = $this->input->post('price_add_edit_id');
			$exist             = $this->M_price->get_by_name($price_add_edit_name, $price_add_edit_id);
			if(!empty($exist)) {
				$q   = false;
				$msg = 'Nama harga sudah ada';
			} else {
				if(!empty($array['is_main'])) $this->M_price->set_no_default();

				if (!empty($price_add_edit_id)) {
					$q = $this->M_price->edit($array, $price_add_edit_id);
				} else {		
					$q = $this->M_price->add($array);
				}

				$this->M_price->set_default();
			}

			if ($q) {
				$ret = array(
					'success' => 1,
					'msg'			=> 'Sukses menambah/ mengedit harga'
				);
			} else {
				$ret = array(
					'success' => 0,
					'msg'			=> !empty($msg) ? $msg : 'Kesalahan sistem'
				);			
			}
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	public function price_delete() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		if (
			!empty($id  = $this->input->post('id'))
		) {
			$this->load->model('M_price');

			$q = $this->M_price->delete($id);

			if ($q) {
				$this->M_price->set_default();

				$ret = array(
					'success' => 1,
					'msg'			=> 'Sukses menghapus harga'
				);
			} else {
				$ret = array(
					'success' => 0,
					'msg'			=> 'Kesalahan sistem'
				);			
			}
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	/*users*/
	public function users_add_edit() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		if (
			!empty($users_add_edit_name      = $this->input->post('users_add_edit_name')) &&
			!empty($users_add_edit_privilege = $this->input->post('users_add_edit_privilege')) &&
			!empty($users_add_edit_password  = $this->input->post('users_add_edit_password'))
		) {
			$this->load->model('M_users');

			$array = array(
				'name'      => $users_add_edit_name, 
				'privilege' => $users_add_edit_privilege,
				'password'  => password_hash($users_add_edit_password, PASSWORD_BCRYPT),
				'user_id'   => $this->_sess['id'],
				'username'  => $this->_sess['username']
			);

			if (!empty($users_add_edit_id = $this->input->post('users_add_edit_id'))) {
				$q = $this->M_users->edit($array, $users_add_edit_id);

				if ($this->_sess['id'] == $users_add_edit_id) {
					$sess = array(
						'username'  => $users_add_edit_name,
						'privilege' => $users_add_edit_privilege,
						'id'        => $users_add_edit_id,
					);
					$this->session->set_userdata('user', $sess);
				}
			} else {
				$exist = $this->M_users->get_by_name($users_add_edit_name);
				if(!empty($exist)) {
					$q   = false;
					$msg = 'Nama user sudah ada';
				} else {
					$q = $this->M_users->add($array);
				}
			}

			if ($q) {
				$ret = array(
					'success' => 1,
					'msg'			=> 'Sukses menambah/ mengedit pengguna'
				);
			} else {
				$ret = array(
					'success' => 0,
					'msg'			=> !empty($msg) ? $msg : 'Kesalahan sistem'
				);			
			}
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	public function users_delete() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		if (
			!empty($id  = $this->input->post('id'))
		) {
			$this->load->model('M_users');

			$q = $this->M_users->delete($id);

			if ($q) {
				$ret = array(
					'success' => 1,
					'msg'			=> 'Sukses menghapus pengguna'
				);

				if ($this->_sess['id'] == $id) {
					$this->session->unset_userdata('user');
					$this->session->unset_userdata('purchase_product');
					$this->session->unset_userdata('sale_temp');

					$ret = array(
	    			/*datatables*/
						'draw'            => 0,
						'recordsTotal'    => 0,
						'recordsFiltered' => 0,
						'data'            => array(),
						/*select2*/
						'list'            => array(),
						'total'           => 0,
						/*default*/
						'success'         => 2,
						'msg'             => 'Tidak diijinkan',
						'login'           => base_url('cashier/users/login?_='.actual_link())
	    		);
				}
			} else {
				$ret = array(
					'success' => 0,
					'msg'			=> 'Kesalahan sistem'
				);			
			}
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	public function users_list() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->load->library('Datatables');
		$this->load->helper('modules');

		$custom = $this->input->post('custom');

		if (!empty($name = $custom['users_search_name'])) $this->datatables->like('name', $name);

		if (!empty($privilege = $custom['users_search_privilege'])) $this->datatables->where('privilege', $privilege);

		$this->datatables->where('user_id!=', 0);

    $this->datatables->select('id,name,privilege,username,created,updated');
    $this->datatables->where('is_admin', 0);
    $this->datatables->from('users');

    $this->datatables->edit_column('id', '
    	<div class="dropdown">
			  <button class="btn btn-danger btn-xs btn-flat dropdown-toggle" type="button" data-toggle="dropdown">Pilihan
			  <span class="caret"></span></button>
			  <ul class="dropdown-menu" data-id="$1" data-name="$2" data-privilege="$3">
			    <li><a href="#" class="users_option_edit">Edit</a></li>
			    <li><a href="#" class="users_option_delete">Hapus</a></li>
			  </ul>
			</div>
			', 'id,name,privilege');

    $this->datatables->edit_column('privilege', '$1', 'user_privilege(privilege)');

    $this->load->helper('modules');
    $this->datatables->edit_column('created', '$1', 'dateclock_ind(created)');
    $this->datatables->edit_column('updated', '$1', 'dateclock_ind(updated)');

    echo $this->datatables->generate();
	}

	/*category*/
	public function category_list() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->load->library('Datatables');

		if (!empty($name = $this->input->post('custom[category_search_name]'))) $this->datatables->like('name', $name);

    $this->datatables->select('id,name,username,created,updated');
    $this->datatables->from('category');

    $this->load->helper('modules');
    $this->datatables->edit_column('id', '
    	<div class="dropdown">
			  <button class="btn btn-danger btn-xs btn-flat dropdown-toggle" type="button" data-toggle="dropdown">Pilihan
			  <span class="caret"></span></button>
			  <ul class="dropdown-menu" data-id="$1" data-name="$2">
			    <li><a href="#" class="category_option_edit">Edit</a></li>
			    <li><a href="#" class="category_option_delete">Hapus</a></li>
			  </ul>
			</div>
			', 'id,name');

    $this->datatables->edit_column('created', '$1', 'dateclock_ind(created)');
    $this->datatables->edit_column('updated', '$1', 'dateclock_ind(updated)');

    echo $this->datatables->generate();
	}

	public function category_add_edit() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);
		if (
			!empty($category_add_edit_name = $this->input->post('category_add_edit_name')) 
		) {
			$this->load->model('M_category');

			$array = array(
				'name'     => $category_add_edit_name,
				'user_id'  => $this->_sess['id'],
				'username' => $this->_sess['username'],
			);

			$category_add_edit_id = $this->input->post('category_add_edit_id');
			$exist             = $this->M_category->get_by_name($category_add_edit_name, $category_add_edit_id);
			if(!empty($exist)) {
				$q   = false;
				$msg = 'Nama kategori sudah ada';
			} else {
				if (!empty($category_add_edit_id)) {
					$q = $this->M_category->edit($array, $category_add_edit_id);
				} else {		
					$q = $this->M_category->add($array);
				}
			}

			if ($q) {
				$ret = array(
					'success' => 1,
					'msg'			=> 'Sukses menambah/ mengedit kategori'
				);
			} else {
				$ret = array(
					'success' => 0,
					'msg'			=> !empty($msg) ? $msg : 'Kesalahan sistem'
				);			
			}
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	public function category_delete() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		if (
			!empty($id  = $this->input->post('id'))
		) {
			$this->load->model('M_category');

			$q = $this->M_category->delete($id);

			if ($q) {
				$ret = array(
					'success' => 1,
					'msg'			=> 'Sukses menghapus kategori'
				);
			} else {
				$ret = array(
					'success' => 0,
					'msg'			=> 'Kesalahan sistem'
				);			
			}
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	/*product*/
	public function product_list() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->load->library('Datatables');

		if (!empty($name = $this->input->post('custom[product_search_name]'))) $this->datatables->like('p.name', $name);

		if (!empty($category = $this->input->post('custom[product_search_category]'))) $this->datatables->where('c.id', $category);

    $this->datatables->select("p.id,p.name as product,c.id as category_id,c.name as category,p.stock,p.unit,p.username,p.created,p.updated");
    $this->datatables->from('product p');
    $this->datatables->join('category c', 'p.category_id=c.id', 'left');

    $this->load->helper('modules');
    $this->datatables->edit_column('id', '
    	<div class="dropdown">
			  <button class="btn btn-danger btn-xs btn-flat dropdown-toggle" type="button" data-toggle="dropdown">Pilihan
			  <span class="caret"></span></button>
			  <ul class="dropdown-menu" data-id="$1" data-name="$2" data-category_id="$3" data-unit="$4">
			    <li><a href="#" class="product_option_edit">Edit</a></li>
			    <li><a href="#" class="product_option_delete">Hapus</a></li>
			  </ul>
			</div>
			', 'id,product,category_id,unit');

    $this->datatables->edit_column('created', '$1', 'dateclock_ind(created)');
    $this->datatables->edit_column('updated', '$1', 'dateclock_ind(updated)');

    echo $this->datatables->generate();
	}

	public function product_add_edit() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);
		if (
			!empty($product_add_edit_name     = $this->input->post('product_add_edit_name')) &&
			!empty($product_add_edit_unit     = $this->input->post('product_add_edit_unit')) && 
			!empty($product_add_edit_category = $this->input->post('product_add_edit_category'))
		) {
			$this->load->model('M_product');

			$array = array(
				'name'        => $product_add_edit_name,			
				'unit'        => $product_add_edit_unit,			
				'category_id' => $product_add_edit_category,			
				'user_id'     => $this->_sess['id'],
				'username'    => $this->_sess['username'],
			);

			$product_add_edit_id = $this->input->post('product_add_edit_id');
			$exist               = $this->M_product->get_by_name($product_add_edit_name, $product_add_edit_id);
			if(!empty($exist)) {
				$q   = false;
				$msg = 'Nama obat sudah ada';
			} else {
				$product_add_edit_price = $this->input->post('product_add_edit_price');

				if (!empty($product_add_edit_id)) {
					$q = $this->M_product->edit($array, $product_add_edit_id);
					$this->M_product->price_product_edit($product_add_edit_price, $product_add_edit_id, $this->_sess);
				} else {		
					$q = $this->M_product->add($array);
					$this->M_product->price_product_add($product_add_edit_price, $this->M_product->insert_id, $this->_sess);
				}
			}

			if ($q) {
				$ret = array(
					'success' => 1,
					'msg'			=> 'Sukses menambah/ mengedit obat'
				);
			} else {
				$ret = array(
					'success' => 0,
					'msg'			=> !empty($msg) ? $msg : 'Kesalahan sistem'
				);			
			}
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	public function product_delete() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		if (
			!empty($id  = $this->input->post('id'))
		) {
			$this->load->model('M_product');

			$q = $this->M_product->delete($id);

			if ($q) {
				$ret = array(
					'success' => 1,
					'msg'			=> 'Sukses menghapus obat'
				);
			} else {
				$ret = array(
					'success' => 0,
					'msg'			=> 'Kesalahan sistem'
				);			
			}
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	public function product_price() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		if (
			!empty($product_id  = $this->input->post('id'))
		) {
			$this->load->model('M_product');

			$data = $this->M_product->product_price($product_id);

			$ret = array(
				'success' => 1,
				'msg'     => 'Sukses',
				'data'    => $data
			);
		} else {
			$ret = array(
				'success' => 0,  
				'msg'     => 'Inputan tidak lengkap',
				'data'    => array()
			);
		}

		echo json_encode($ret);
	}

	public function product_price_list() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->load->library('Datatables');

		if (!empty($name = $this->input->post('custom[product_price_search_name]'))) $this->datatables->like('p.name', $name);

		if (!empty($category = $this->input->post('custom[product_price_search_category]'))) $this->datatables->where('c.id', $category);

		if (!empty($price = $this->input->post('custom[product_price_search_price]'))) $this->datatables->where('pr.id', $price);

    $this->datatables->select('pp.id,p.name as product,c.name as category,pr.name as price_name,pp.price,p.username,p.created,p.updated');
    $this->datatables->from('product_price pp');
    $this->datatables->join('price pr', 'pp.price_id=pr.id');
    $this->datatables->join('product p', 'pp.product_id=p.id');
    $this->datatables->join('category c', 'p.category_id=c.id');
    
    $this->load->helper('modules');
    $this->datatables->edit_column('id', '<button class="btn btn-danger btn-xs btn-flat product_price_option_edit" data-id="$1" data-name="$2" data-category="$3" data-price_name="$4" data-price="$5">Edit</button>', 'id,product,category,price_name,price');

    $this->datatables->edit_column('created', '$1', 'dateclock_ind(created)');
    $this->datatables->edit_column('updated', '$1', 'dateclock_ind(updated)');

    echo $this->datatables->generate();
	}

	public function product_price_add_edit() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);
		if (
			!empty($product_price_add_edit_id    = $this->input->post('product_price_add_edit_id')) &&
			!empty($product_price_add_edit_price = $this->input->post('product_price_add_edit_price'))
		) {
			$this->load->model('M_product');

			$array = array(
				'price'    => $product_price_add_edit_price,
				'user_id'  => $this->_sess['id'],
				'username' => $this->_sess['username'],
			);
			$q = $this->M_product->edit_price($array, $product_price_add_edit_id);

			if ($q) {
				$ret = array(
					'success' => 1,
					'msg'			=> 'Sukses menambah/ mengedit harga obat'
				);
			} else {
				$ret = array(
					'success' => 0,
					'msg'			=> !empty($msg) ? $msg : 'Kesalahan sistem'
				);			
			}
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	public function product_search() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		$q    = $this->input->get('q');
		$page = $this->input->get('page');
		$page = $page == 0 ? 1 : $page;

		$this->load->model('M_product');
		$res = $this->M_product->search($q, $page);
		
		echo json_encode($res);
	}

	/*purchase*/
	public function purchase_list() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->load->library('Datatables');

		$custom = $this->input->post('custom');

		if (!empty($code = $custom['purchase_search_code'])) $this->datatables->like('code', $code, 'both');

		if (!empty($invoice = $custom['purchase_search_invoice'])) $this->datatables->like('invoice', $invoice, 'both');

		if (!empty($dfrom = $custom['purchase_search_date_from']) && !empty($dto = $custom['purchase_search_date_to'])) {
			$dfrom = date('Y-m-d', strtotime($dfrom));
			$dto   = date('Y-m-d', strtotime($dto));
			$this->datatables->where("date BETWEEN '$dfrom' AND '$dto'");
		} else if (!empty($dfrom = $custom['purchase_search_date_from'])) {
			$this->datatables->where('date >', date('Y-m-d', strtotime($dfrom)));
		} else if (!empty($dto = $custom['purchase_search_date_to'])) {
			$this->datatables->where('date <', date('Y-m-d', strtotime($dto)));
		}

		$this->datatables->where('is_valid', 1);

    $this->datatables->select('id,code,invoice,distributor_id,distributor_name,date,total_kind,total_product,total_price,username,created,updated');
    $this->datatables->from('purchase');

    $this->datatables->edit_column('id', '
    	<div class="dropdown">
			  <button class="btn btn-danger btn-xs btn-flat dropdown-toggle" type="button" data-toggle="dropdown">Pilihan
			  <span class="caret"></span></button>
			  <ul class="dropdown-menu" data-id="$1" data-date="$2" data-distributor_id="$3" data-distributor_name="$4" data-invoice="$5">
			    <li><a href="#" class="purchase_edit">Edit</a></li>
			    <li><a href="#" class="purchase_delete">Hapus</a></li>
			  </ul>
			</div>
			', 'id,date_formater(date),distributor_id,distributor_name,invoice');

    $this->load->helper('modules');
    $this->datatables->edit_column('date', '$1', 'date_ind(created)');
    $this->datatables->edit_column('created', '$1', 'dateclock_ind(created)');
    $this->datatables->edit_column('updated', '$1', 'dateclock_ind(updated)');

    $this->datatables->unset_column('distributor_id');

    echo $this->datatables->generate();
	}

	public function purchase_delete() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		if (
			!empty($id = $this->input->post('id'))
		) {
			$this->load->model('M_purchase');

			$q = $this->M_purchase->delete($id, $this->_sess);

			if ($q) {
				$ret = array(
					'success' => 1,
					'msg'			=> 'Sukses menghapus pembelian'
				);
			} else {
				$ret = array(
					'success' => 0,
					'msg'			=> 'Kesalahan sistem'
				);			
			}
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	public function purchase_add_edit() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		if (
			!empty($purchase_add_date        = $this->input->post('purchase_add_date')) && 
			!empty($purchase_add_distributor = $this->input->post('purchase_add_distributor'))
		) {
			$this->load->model('M_purchase');

			$session = $this->session->userdata('purchase_product');

	    if (!empty($session)) {
	    	$this->load->model('M_distributor');

	    	$array_purchase = array(
					'date'             => date('Y-m-d', strtotime($purchase_add_date)),
					'distributor_id'   => $purchase_add_distributor,
					'distributor_name' => $this->M_distributor->get_by_id($purchase_add_distributor),
					'invoice'          => $this->input->post('purchase_add_invoice'),
	    	);

	    	if (!empty($purchase_add_id = $this->input->post('purchase_add_id'))) {
					// edit
					$edit = $this->M_purchase->edit($session, $array_purchase, $purchase_add_id, $this->_sess);
					if ($edit['status']) {
						$ret = array(
							'success' => 1,
							'msg'			=> 'Sukses mengubah pembelian'
						);
					} else {
						$ret = array(
							'success' => 0,
							'msg'			=> $edit['msg']
						);			
					}
				} else {
					// add
					if ($this->M_purchase->add($session, $array_purchase, $this->_sess)) {
						$ret = array(
							'success' => 1,
							'msg'			=> 'Sukses menambah pembelian'
						);
					} else {
						$ret = array(
							'success' => 0,
							'msg'			=> 'Kesalahan sistem'
						);			
					}
				}
			} else {
	    	$ret = array(
					'success' => 0,
					'msg'			=> 'Sesi edit tidak ditemukan'
				);
	    }
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	/*purchase product*/
	public function purchase_product_list() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		if (!empty($this->input->post('db'))) {
			if (!empty($purchase_id = $this->input->post('purchase_id'))) {
				// edit from database
				$this->load->model('M_purchase_product');
				$data = $this->M_purchase_product->get($purchase_id);

				$this->session->set_userdata('purchase_product', $data);
			} else {
				$this->session->unset_userdata('purchase_product');
			}
		}

		$session  = $this->session->userdata('purchase_product');
		$fsession = !empty($session) ? $session : array();

		$data = !empty($data) ? $data : $fsession;

		$this->load->helper('modules');
		foreach ($data as &$ndt) {
			$ndt['created'] = dateclock_ind($ndt['created']);
			$ndt['updated'] = dateclock_ind($ndt['updated']);
		}

		echo json_encode(array(
			'data' => $data,
		));
	}

	public function purchase_product_add_edit() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		if (
			!empty($purchase_product_add_product_id = $this->input->post('purchase_product_add_product_id')) &&
			!empty($purchase_product_add_price      = $this->input->post('purchase_product_add_price')) &&
			!empty($purchase_product_add_stock      = $this->input->post('purchase_product_add_stock')) &&
			!empty($purchase_product_add_expired    = $this->input->post('purchase_product_add_expired'))
		) {
			$this->load->model('M_purchase_product');

			$session = $this->session->userdata('purchase_product');


			if (!empty($session) && is_array($session)) {
				$found = false;
				foreach ($session as &$dsess) {
					if ($dsess['product_id'] == $purchase_product_add_product_id) {
						if (!empty($this->input->post('purchase_product_add_product_isedit'))) $dsess['stock'] = $purchase_product_add_stock;
						else $dsess['stock'] += $purchase_product_add_stock;

						$dsess['price']   = $purchase_product_add_price;
						$dsess['expired'] = $purchase_product_add_expired;
						$dsess['total']   = $dsess['stock'] * $dsess['price'];

						$found = true;
						break;
					}
				}

				if (!$found) {
					$session[] = array(
						'product_id'   => $purchase_product_add_product_id,
						'product_name' => $this->M_purchase_product->get_product_name($purchase_product_add_product_id),
						'price'        => $purchase_product_add_price,
						'stock'        => $purchase_product_add_stock,
						'total'        => $purchase_product_add_price * $purchase_product_add_stock,
						'expired'      => $purchase_product_add_expired,
						'username'     => $this->_sess['username'],
						'created'      => date('Y-m-d H:i:s'),
						'updated'      => date('Y-m-d H:i:s'),
					);
				}
			} else {
				$session[] = array(
					'product_id'   => $purchase_product_add_product_id,
					'product_name' => $this->M_purchase_product->get_product_name($purchase_product_add_product_id),
					'price'        => $purchase_product_add_price,
					'stock'        => $purchase_product_add_stock,
					'total'        => $purchase_product_add_price * $purchase_product_add_stock,
					'expired'      => $purchase_product_add_expired,
					'username'     => $this->_sess['username'],
					'created'      => date('Y-m-d H:i:s'),
					'updated'      => date('Y-m-d H:i:s'),
				);
			}

			$this->session->set_userdata('purchase_product', $session);

			$ret = array(
				'success' => 1,
				'msg'			=> 'Sukses menambah/ mengedit barang pembelian'
			);
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	public function purchase_product_delete() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		if (
			!empty($product_id = $this->input->post('product_id'))
		) {
			$session = $this->session->userdata('purchase_product');

			foreach ($session as $key => &$dsess) {
				if ($dsess['product_id'] == $product_id) unset($session[$key]);
			}

			$this->session->set_userdata('purchase_product', array_values($session));

			$ret = array(
				'success' => 1,
				'msg'			=> 'Sukses menghapus pembelian barang'
			);
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	/*purchase draft*/
	public function purchase_draft_list() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		$this->load->library('Datatables');

		$custom = $this->input->post('custom');

		if (!empty($code = $custom['purchase_draft_search_code'])) $this->datatables->like('code', $code, 'both');

		if (!empty($invoice = $custom['purchase_draft_search_invoice'])) $this->datatables->like('invoice', $invoice, 'both');

		if (!empty($dfrom = $custom['purchase_draft_search_date_from']) && !empty($dto = $custom['purchase_draft_search_date_to'])) {
			$dfrom = date('Y-m-d', strtotime($dfrom));
			$dto   = date('Y-m-d', strtotime($dto));
			$this->datatables->where("date BETWEEN '$dfrom' AND '$dto'");
		} else if (!empty($dfrom = $custom['purchase_search_date_from'])) {
			$this->datatables->where('date >', date('Y-m-d', strtotime($dfrom)));
		} else if (!empty($dto = $custom['purchase_search_date_to'])) {
			$this->datatables->where('date <', date('Y-m-d', strtotime($dto)));
		}

		$this->datatables->where('is_valid', 0);

    $this->datatables->select('id,code,invoice,distributor_id,distributor_name,date,total_kind,total_product,total_price,username,created,updated');
    $this->datatables->from('purchase');

    if($this->_sess['privilege'] == 1) {
	    $this->datatables->edit_column('id', '
	    	<div class="dropdown">
				  <button class="btn btn-danger btn-xs btn-flat dropdown-toggle" type="button" data-toggle="dropdown">Pilihan
				  <span class="caret"></span></button>
				  <ul class="dropdown-menu" data-id="$1" data-date="$2" data-distributor_id="$3" data-distributor_name="$4" data-invoice="$5">
				    <li><a href="#" class="purchase_draft_validasi">Validasi</a></li>
				    <li><a href="#" class="purchase_draft_edit">Edit</a></li>
				    <li><a href="#" class="purchase_draft_delete">Hapus</a></li>
				  </ul>
				</div>
				', 'id,date_formater(date),distributor_id,distributor_name,invoice');
    } else {
    	$this->datatables->edit_column('id', '
	    	<div class="dropdown">
				  <button class="btn btn-danger btn-xs btn-flat dropdown-toggle" type="button" data-toggle="dropdown">Pilihan
				  <span class="caret"></span></button>
				  <ul class="dropdown-menu" data-id="$1" data-date="$2" data-distributor_id="$3" data-distributor_name="$4" data-invoice="$5">
				    <li><a href="#" class="purchase_draft_edit">Edit</a></li>
				    <li><a href="#" class="purchase_draft_delete">Hapus</a></li>
				  </ul>
				</div>
				', 'id,date_formater(date),distributor_id,distributor_name,invoice');
    }


    $this->load->helper('modules');
    $this->datatables->edit_column('date', '$1', 'date_ind(created)');
    $this->datatables->edit_column('created', '$1', 'dateclock_ind(created)');
    $this->datatables->edit_column('updated', '$1', 'dateclock_ind(updated)');

    $this->datatables->unset_column('distributor_id');

    echo $this->datatables->generate();
	}

	public function purchase_draft_delete() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		if (
			!empty($id = $this->input->post('id'))
		) {
			$this->load->model('M_purchase_draft');

			$q = $this->M_purchase_draft->delete($id, $this->_sess);

			if ($q) {
				$ret = array(
					'success' => 1,
					'msg'			=> 'Sukses menghapus pembelian'
				);
			} else {
				$ret = array(
					'success' => 0,
					'msg'			=> 'Kesalahan sistem'
				);			
			}
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	public function purchase_draft_add_edit() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		if (
			!empty($purchase_draft_add_date        = $this->input->post('purchase_draft_add_date')) && 
			!empty($purchase_draft_add_distributor = $this->input->post('purchase_draft_add_distributor'))
		) {
			$this->load->model('M_purchase_draft');

			$session = $this->session->userdata('purchase_draft_product');

	    if (!empty($session)) {
	    	$this->load->model('M_distributor');

	    	$array_purchase = array(
					'date'             => date('Y-m-d', strtotime($purchase_draft_add_date)),
					'distributor_id'   => $purchase_draft_add_distributor,
					'distributor_name' => $this->M_distributor->get_by_id($purchase_draft_add_distributor),
					'invoice'          => $this->input->post('purchase_draft_add_invoice'),
	    	);

	    	if (!empty($purchase_draft_add_id = $this->input->post('purchase_draft_add_id'))) {
					// edit
					$edit = $this->M_purchase_draft->edit($session, $array_purchase, $purchase_draft_add_id, $this->_sess);
					if ($edit['status']) {
						$ret = array(
							'success' => 1,
							'msg'			=> 'Sukses mengubah pembelian'
						);
					} else {
						$ret = array(
							'success' => 0,
							'msg'			=> $edit['msg']
						);			
					}
				} else {
					// add
					if ($this->M_purchase_draft->add($session, $array_purchase, $this->_sess)) {
						$ret = array(
							'success' => 1,
							'msg'			=> 'Sukses menambah pembelian'
						);
					} else {
						$ret = array(
							'success' => 0,
							'msg'			=> 'Kesalahan sistem'
						);			
					}
				}
			} else {
	    	$ret = array(
					'success' => 0,
					'msg'			=> 'Sesi edit tidak ditemukan'
				);
	    }
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	public function purchase_draft_validasi() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		if (
			!empty($id = $this->input->post('id'))
		) {
			$this->load->model('M_purchase_draft');

			$q = $this->M_purchase_draft->validasi($id, $this->_sess);

			if ($q) {
				$ret = array(
					'success' => 1,
					'msg'			=> 'Sukses memvalidasi draft pembelian'
				);
			} else {
				$ret = array(
					'success' => 0,
					'msg'			=> 'Kesalahan sistem'
				);			
			}
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);		
	}

	/*purchase draft product*/
	public function purchase_draft_product_list() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		if (!empty($this->input->post('db'))) {
			if (!empty($purchase_draft_id = $this->input->post('purchase_draft_id'))) {
				// edit from database
				$this->load->model('M_purchase_draft_product');
				$data = $this->M_purchase_draft_product->get($purchase_draft_id);

				$this->session->set_userdata('purchase_draft_product', $data);
			} else {
				$this->session->unset_userdata('purchase_draft_product');
			}
		}

		$session  = $this->session->userdata('purchase_draft_product');
		$fsession = !empty($session) ? $session : array();

		$data = !empty($data) ? $data : $fsession;

		$this->load->helper('modules');
		foreach ($data as &$ndt) {
			$ndt['created'] = dateclock_ind($ndt['created']);
			$ndt['updated'] = dateclock_ind($ndt['updated']);
		}

		echo json_encode(array(
			'data' => $data,
		));
	}

	public function purchase_draft_product_add_edit() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		if (
			!empty($purchase_draft_product_add_product_id = $this->input->post('purchase_draft_product_add_product_id')) &&
			!empty($purchase_draft_product_add_price      = $this->input->post('purchase_draft_product_add_price')) &&
			!empty($purchase_draft_product_add_stock      = $this->input->post('purchase_draft_product_add_stock')) &&
			!empty($purchase_draft_product_add_expired    = $this->input->post('purchase_draft_product_add_expired'))
		) {
			$this->load->model('M_purchase_draft_product');

			$session = $this->session->userdata('purchase_draft_product');


			if (!empty($session) && is_array($session)) {
				$found = false;
				foreach ($session as &$dsess) {
					if ($dsess['product_id'] == $purchase_draft_product_add_product_id) {
						if (!empty($this->input->post('purchase_draft_product_add_product_isedit'))) $dsess['stock'] = $purchase_draft_product_add_stock;
						else $dsess['stock'] += $purchase_draft_product_add_stock;

						$dsess['price']   = $purchase_draft_product_add_price;
						$dsess['expired'] = $purchase_draft_product_add_expired;
						$dsess['total']   = $dsess['stock'] * $dsess['price'];

						$found = true;
						break;
					}
				}

				if (!$found) {
					$session[] = array(
						'product_id'   => $purchase_draft_product_add_product_id,
						'product_name' => $this->M_purchase_draft_product->get_product_name($purchase_draft_product_add_product_id),
						'price'        => $purchase_draft_product_add_price,
						'stock'        => $purchase_draft_product_add_stock,
						'total'        => $purchase_draft_product_add_price * $purchase_draft_product_add_stock,
						'expired'      => $purchase_draft_product_add_expired,
						'username'     => $this->_sess['username'],
						'created'      => date('Y-m-d H:i:s'),
						'updated'      => date('Y-m-d H:i:s'),
					);
				}
			} else {
				$session[] = array(
					'product_id'   => $purchase_draft_product_add_product_id,
					'product_name' => $this->M_purchase_draft_product->get_product_name($purchase_draft_product_add_product_id),
					'price'        => $purchase_draft_product_add_price,
					'stock'        => $purchase_draft_product_add_stock,
					'total'        => $purchase_draft_product_add_price * $purchase_draft_product_add_stock,
					'expired'      => $purchase_draft_product_add_expired,
					'username'     => $this->_sess['username'],
					'created'      => date('Y-m-d H:i:s'),
					'updated'      => date('Y-m-d H:i:s'),
				);
			}

			$this->session->set_userdata('purchase_draft_product', $session);

			$ret = array(
				'success' => 1,
				'msg'			=> 'Sukses menambah/ mengedit barang pembelian'
			);
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	public function purchase_draft_product_delete() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		if (
			!empty($product_id = $this->input->post('product_id'))
		) {
			$session = $this->session->userdata('purchase_draft_product');

			foreach ($session as $key => &$dsess) {
				if ($dsess['product_id'] == $product_id) unset($session[$key]);
			}

			$this->session->set_userdata('purchase_draft_product', array_values($session));

			$ret = array(
				'success' => 1,
				'msg'			=> 'Sukses menghapus pembelian barang'
			);
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}	

	/*sale*/
	public function sale_list() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		$this->load->helper('modules');

		$this->load->library('Datatables');

		$custom = $this->input->post('custom');

		if (!empty($sale_search_invoice = $custom['sale_search_invoice'])) $this->datatables->like('invoice', $sale_search_invoice);

		if (!empty($sale_search_sender = $custom['sale_search_sender'])) $this->datatables->like('sender_name', $sale_search_sender);

		if (null != ($sale_search_additional = $custom['sale_search_additional'])) $this->datatables->where('additional', $sale_search_additional);
		
		if (null != ($sale_search_retur = $custom['sale_search_retur'])) $this->datatables->where('retur', $sale_search_retur);

		if (!empty($dfrom = $custom['sale_search_date_from']) && !empty($dto = $custom['sale_search_date_to'])) {
			$dfrom = date('Y-m-d', strtotime($dfrom));
			$dto   = date('Y-m-d', strtotime($dto));
			$this->datatables->where("DATE(created) BETWEEN '$dfrom' AND '$dto'");
		} else if (!empty($dfrom = $custom['sale_search_date_from'])) {
			$this->datatables->where('DATE(created) >', date('Y-m-d', strtotime($dfrom)));
		} else if (!empty($dto = $custom['sale_search_date_to'])) {
			$this->datatables->where('DATE(created) <', date('Y-m-d', strtotime($dto)));
		}

    $this->datatables->select('id,invoice,sender_name,total,discount,grand_total,paid,changes,additional,retur,username,created,updated');
    $this->datatables->from('sale');

    $this->datatables->edit_column('id', '
    	<div class="dropdown">
			  <button class="btn btn-danger btn-xs btn-flat dropdown-toggle" type="button" data-toggle="dropdown">Pilihan
			  <span class="caret"></span></button>
			  <ul class="dropdown-menu" data-invoice="$1" data-id="$2" data-retur="$3">
			    <li><a href="#" class="sale_detail">Detail</a></li>
			    <li><a href="#" class="sale_retur">Retur</a></li>
			    <li><a href="#" class="sale_reprint">Cetak Ulang</a></li>
			  </ul>
			</div>
			', 'invoice,id,retur');

    $this->datatables->edit_column('additional', '$1', 'sale_additional(additional)');
    $this->datatables->edit_column('retur', '$1', 'sale_additional(retur)');

    $this->datatables->edit_column('created', '$1', 'dateclock_ind(created)');
    $this->datatables->edit_column('updated', '$1', 'dateclock_ind(updated)');

    echo $this->datatables->generate();
	}

	public function sale_get_id() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		if (!empty($invoice = $this->input->post('invoice'))) {
			
			$this->load->model('M_sale');
			$sale_id = $this->M_sale->get_sale_id($invoice);

			if(!empty($sale_id)) {
				$ret = array(
					'success' => 1,
					'msg'     => 'Sukses',
					'sale_id' => $sale_id
				);
			} else {
				$ret = array(
					'success' => 0,
					'msg'			=> 'Invoice tidak ditemukan',
					'sale_id' => 0
				);
			}
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak boleh kosong',
				'sale_id' => 0
			);
		}

		echo json_encode($ret);
	}

	public function sale_product_list() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		$sale_id = $this->input->post('sale_id');

		$this->load->library('Datatables');

		$this->datatables->where('sale_id', $sale_id);

    $this->datatables->select('product_name,price,discount,qty,total,created,updated');
    $this->datatables->from('sale_product');

    $this->load->helper('modules');
    $this->datatables->edit_column('created', '$1', 'dateclock_ind(created)');
    $this->datatables->edit_column('updated', '$1', 'dateclock_ind(updated)');

    echo $this->datatables->generate();
	}

	public function sale_retur() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		if (
			!empty($id  = $this->input->post('id'))
		) {
			$this->load->model('M_sale');

			if(!$this->M_sale->check_retur($id)) {
				$q = $this->M_sale->retur($id, $this->_sess);

				if ($q) {
					$ret = array(
						'success' => 1,
						'msg'			=> 'Sukses meretur transaksi'
					);
				} else {
					$ret = array(
						'success' => 0,
						'msg'			=> 'Kesalahan sistem'
					);			
				}
			} else {
				$ret = array(
					'success' => 0,
					'msg'			=> 'Transaksi sudah diretur'
				);	
			}
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);		
	}

	/*process*/
	public function process_show_product() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		$this->load->model('M_process');
		$data = $this->M_process->show_product($this->input->post());

		echo json_encode(array(
			'success' => 1,
			'msg'     => 'Sukses',
			'data'    => $data,
		));
	}

	public function process_temp() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));
		if (!empty($this->input->post('reset'))) $this->session->unset_userdata('process_temp');

		$session = $this->session->userdata('process_temp');

		echo json_encode(array(
			'data' => !empty($session) ? $session : array(),
		));
	}

	public function process_temp_add() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		if (
			!empty($product_id = $this->input->post('product_id')) &&
			!empty($price = $this->input->post('price')) 
		) {
			$session = $this->session->userdata('process_temp');

			$this->load->model('M_process');
			$product = $this->M_process->get_product($product_id);

			if (!empty($session) && is_array($session)) {
				$found = false;

				foreach ($session as &$dsess) {
					if ($dsess['product_id'] == $product_id) {
						$dsess['qty']            += 1;
						$dsess['total']          = $dsess['qty'] * ($dsess['price'] - $dsess['discount']);
						$dsess['discount_total'] = $dsess['qty'] * $dsess['discount'];

						$found = true;
						break;
					}
				}

				if (!$found)  {
					$session[] = array(
						'product_id'     => $product_id,
						'product_name'   => $product['name'],
						'qty'            => 1,
						'unit'           => $product['unit'],
						'price'          => $price,						
						'discount'       => 0,
						'discount_total' => 0,
						'total'          => $price,
					);
				}
			} else {
				$session[] = array(
					'product_id'     => $product_id,
					'product_name'   => $product['name'],
					'qty'            => 1,
					'unit'           => $product['unit'],
					'price'          => $price,
					'discount'       => 0,
					'discount_total' => 0,
					'total'          => $price,
				);
			}

			$this->session->set_userdata('process_temp', $session);

			$ret = array(
				'success' => 1,
				'msg'			=> 'Sukses menambah/ mengedit barang penjualan'
			);
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	public function process_temp_delete() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		if (
			!empty($product_id = $this->input->post('product_id'))
		) {
			$session = $this->session->userdata('process_temp');

			foreach ($session as $key => &$dsess) {
				if ($dsess['product_id'] == $product_id) {
					unset($session[$key]);
					break;
				}
			}

			$this->session->set_userdata('process_temp', array_values($session));

			$ret = array(
				'success' => 1,
				'msg'			=> 'Sukses menghapus obat'
			);
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	public function process_finish() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		$this->load->model('M_process');
		$ret = $this->M_process->finish($this->input->post(), $this->_sess);

		echo json_encode($ret);
	}

	public function process_discount() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		if (
			!empty($discount_product_id = $this->input->post('discount_product_id'))
		) {
			$discount_price = $this->input->post('discount_price');
			$session        = $this->session->userdata('process_temp');

			foreach ($session as $key => &$dsess) {
				if ($dsess['product_id'] == $discount_product_id) {
					$dsess['discount']       = $discount_price;
					$dsess['discount_total'] = $dsess['discount'] * $dsess['qty'] ;
					$dsess['total']          = $dsess['qty'] * ($dsess['price'] - $dsess['discount']);
				}
			}

			$this->session->set_userdata('process_temp', array_values($session));

			$ret = array(
				'success' => 1,
				'msg'			=> 'Sukses mengubah diskon'
			);
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	public function process_qty() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		if (
			!empty($qty_product_id = $this->input->post('qty_product_id'))
		) {
			$qty_qty = $this->input->post('qty_qty');
			$session = $this->session->userdata('process_temp');

			foreach ($session as $key => &$dsess) {
				if ($dsess['product_id'] == $qty_product_id) {
					$dsess['qty']            = $qty_qty;
					$dsess['discount_total'] = $dsess['discount'] * $dsess['qty'];
					$dsess['total']          = $dsess['qty'] * ($dsess['price'] - $dsess['discount']);
				}
			}

			$this->session->set_userdata('process_temp', array_values($session));

			$ret = array(
				'success' => 1,
				'msg'			=> 'Sukses mengubah qty'
			);
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	public function process_latest() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		$this->load->model('M_process');

		echo json_encode(array(
			'success' => 1,
			'msg'    => 'sukses',
			'data'   => $this->M_process->latest()
		));
	}

	public function process_reprint() {
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		if (
			!empty($sale_id = $this->input->post('id'))
		) {
			$this->load->model('M_process');
			$this->M_process->reprint($sale_id);

			$ret = array(
				'success' => 1,
				'msg'			=> 'Sukses mencetak ulang'
			);
		} else {
			$ret = array(
				'success' => 0,
				'msg'			=> 'Inputan tidak lengkap'
			);
		}

		echo json_encode($ret);
	}

	/*report purchase*/
	public function report_purchase_daily() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->load->library('Datatables');

		$custom = $this->input->post('custom');

		if (!empty($dfrom = $custom['daily_search_date_from']) && !empty($dto = $custom['daily_search_date_to'])) {
			$dfrom = date('Y-m-d', strtotime($dfrom));
			$dto   = date('Y-m-d', strtotime($dto));
			$this->datatables->where("date BETWEEN '$dfrom' AND '$dto'");
		} else if (!empty($dfrom = $custom['daily_search_date_from'])) {
			$this->datatables->where('date >', date('Y-m-d', strtotime($dfrom)));
		} else if (!empty($dto = $custom['daily_search_date_to'])) {
			$this->datatables->where('date <', date('Y-m-d', strtotime($dto)));
		}

    $this->datatables->select('date,transaction,kind,qty,total');
    $this->datatables->from('report_purchase_daily');

    $this->datatables->edit_column('date', '$1', 'date_ind(date)');

    echo $this->datatables->generate();
	}

	public function report_purchase_distributor() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->load->library('Datatables');

		$custom = $this->input->post('custom');

		if (!empty($distributor = $custom['distributor_search_distributor'])) $this->datatables->like('distributor_name', $distributor);

		if (!empty($dfrom = $custom['distributor_search_date_from']) && !empty($dto = $custom['distributor_search_date_to'])) {
			$dfrom = date('Y-m-d', strtotime($dfrom));
			$dto   = date('Y-m-d', strtotime($dto));
			$this->datatables->where("date BETWEEN '$dfrom' AND '$dto'");
		} else if (!empty($dfrom = $custom['distributor_search_date_from'])) {
			$this->datatables->where('date >', date('Y-m-d', strtotime($dfrom)));
		} else if (!empty($dto = $custom['distributor_search_date_to'])) {
			$this->datatables->where('date <', date('Y-m-d', strtotime($dto)));
		}

    $this->datatables->select('distributor_name,date,kind,qty,total');
    $this->datatables->from('report_purchase_distributor');

    $this->datatables->edit_column('date', '$1', 'date_ind(date)');

    echo $this->datatables->generate();
	}

	public function report_purchase_expired() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->load->library('Datatables');

		$custom = $this->input->post('custom');

		if (!empty($product = $custom['expired_search_product'])) $this->datatables->like('product_name', $product);

		if (!empty($dfrom = $custom['expired_search_date_from']) && !empty($dto = $custom['expired_search_date_to'])) {
			$dfrom = date('Y-m-d', strtotime($dfrom));
			$dto   = date('Y-m-d', strtotime($dto));
			$this->datatables->where("expired BETWEEN '$dfrom' AND '$dto'");
		} else if (!empty($dfrom = $custom['expired_search_date_from'])) {
			$this->datatables->where('expired >', date('Y-m-d', strtotime($dfrom)));
		} else if (!empty($dto = $custom['expired_search_date_to'])) {
			$this->datatables->where('expired <', date('Y-m-d', strtotime($dto)));
		}

		$this->datatables->where('is_valid', 1);

    $this->datatables->select('pp.product_name,p.date,pp.expired,pp.stock,pp.total');
    $this->datatables->from('purchase_product pp');
    $this->datatables->join('purchase p', 'pp.purchase_id=p.id', 'inner');

    $this->datatables->edit_column('date', '$1', 'date_ind(date)');
    $this->datatables->edit_column('expired', '$1', 'date_ind(expired)');

    echo $this->datatables->generate();
	}

	public function report_purchase_product() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->load->library('Datatables');

		$custom = $this->input->post('custom');

		if (!empty($product = $custom['product_search_product'])) $this->datatables->like('product_name', $product);

		if (!empty($dfrom = $custom['product_search_date_from']) && !empty($dto = $custom['product_search_date_to'])) {
			$dfrom = date('Y-m-d', strtotime($dfrom));
			$dto   = date('Y-m-d', strtotime($dto));
			$this->datatables->where("date BETWEEN '$dfrom' AND '$dto'");
		} else if (!empty($dfrom = $custom['product_search_date_from'])) {
			$this->datatables->where('date >', date('Y-m-d', strtotime($dfrom)));
		} else if (!empty($dto = $custom['product_search_date_to'])) {
			$this->datatables->where('date <', date('Y-m-d', strtotime($dto)));
		}

    $this->datatables->select('product_name, date, stock, total');
    $this->datatables->from('report_purchase_product');

    $this->datatables->edit_column('date', '$1', 'date_ind(date)');

    echo $this->datatables->generate();
	}

	/*report sale*/
	public function report_sale_daily() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->load->library('Datatables');

		$custom = $this->input->post('custom');

		if (!empty($dfrom = $custom['daily_search_date_from']) && !empty($dto = $custom['daily_search_date_to'])) {
			$dfrom = date('Y-m-d', strtotime($dfrom));
			$dto   = date('Y-m-d', strtotime($dto));
			$this->datatables->where("date BETWEEN '$dfrom' AND '$dto'");
		} else if (!empty($dfrom = $custom['daily_search_date_from'])) {
			$this->datatables->where('date >', date('Y-m-d', strtotime($dfrom)));
		} else if (!empty($dto = $custom['daily_search_date_to'])) {
			$this->datatables->where('date <', date('Y-m-d', strtotime($dto)));
		}

    $this->datatables->select('date,transaction,kind,qty,total');
    $this->datatables->from('report_sale_daily');

    $this->datatables->edit_column('date', '$1', 'date_ind(date)');

    echo $this->datatables->generate();
	}

	public function report_sale_sender() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->load->library('Datatables');

		$custom = $this->input->post('custom');

		if (!empty($sender = $custom['sender_search_sender'])) $this->datatables->like('sender_name', $sender);

		if (!empty($dfrom = $custom['sender_search_date_from']) && !empty($dto = $custom['sender_search_date_to'])) {
			$dfrom = date('Y-m-d', strtotime($dfrom));
			$dto   = date('Y-m-d', strtotime($dto));
			$this->datatables->where("date BETWEEN '$dfrom' AND '$dto'");
		} else if (!empty($dfrom = $custom['sender_search_date_from'])) {
			$this->datatables->where('date >', date('Y-m-d', strtotime($dfrom)));
		} else if (!empty($dto = $custom['sender_search_date_to'])) {
			$this->datatables->where('date <', date('Y-m-d', strtotime($dto)));
		}

    $this->datatables->select('sender_name,date,kind,qty,total');
    $this->datatables->from('report_sale_sender');

    $this->datatables->edit_column('date', '$1', 'date_ind(date)');

    echo $this->datatables->generate();
	}

	public function report_sale_product() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->load->library('Datatables');

		$custom = $this->input->post('custom');

		if (!empty($product = $custom['product_search_product'])) $this->datatables->like('product_name', $product);

		if (!empty($dfrom = $custom['product_search_date_from']) && !empty($dto = $custom['product_search_date_to'])) {
			$dfrom = date('Y-m-d', strtotime($dfrom));
			$dto   = date('Y-m-d', strtotime($dto));
			$this->datatables->where("date BETWEEN '$dfrom' AND '$dto'");
		} else if (!empty($dfrom = $custom['product_search_date_from'])) {
			$this->datatables->where('date >', date('Y-m-d', strtotime($dfrom)));
		} else if (!empty($dto = $custom['product_search_date_to'])) {
			$this->datatables->where('date <', date('Y-m-d', strtotime($dto)));
		}

    $this->datatables->select('product_name,date,qty,total');
    $this->datatables->from('report_sale_product');

    $this->datatables->edit_column('date', '$1', 'date_ind(date)');

    echo $this->datatables->generate();
	}

	public function report_sale_price() {
		modules::run('cashier/users/_check_privilege', $this->_sess, 1);

		$this->load->library('Datatables');

		$custom = $this->input->post('custom');

		if (!empty($price = $custom['price_search_price'])) $this->datatables->like('price_name', $price);

		if (!empty($dfrom = $custom['price_search_date_from']) && !empty($dto = $custom['price_search_date_to'])) {
			$dfrom = date('Y-m-d', strtotime($dfrom));
			$dto   = date('Y-m-d', strtotime($dto));
			$this->datatables->where("date BETWEEN '$dfrom' AND '$dto'");
		} else if (!empty($dfrom = $custom['price_search_date_from'])) {
			$this->datatables->where('date >', date('Y-m-d', strtotime($dfrom)));
		} else if (!empty($dto = $custom['price_search_date_to'])) {
			$this->datatables->where('date <', date('Y-m-d', strtotime($dto)));
		}

    $this->datatables->select('price_name,date,kind,qty,total');
    $this->datatables->from('report_sale_price');

    $this->datatables->edit_column('date', '$1', 'date_ind(date)');

    echo $this->datatables->generate();
	}
}