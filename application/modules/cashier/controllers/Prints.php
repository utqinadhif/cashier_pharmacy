<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Prints extends MX_Controller {
	
	function __construct() {
		parent::__construct();

		$this->_sess = modules::run('cashier/users/_check_session');
	}

	public function index() {}

	public function html() {}

	public function _sale($data) {		
		modules::run('cashier/users/_check_privilege', $this->_sess, array(1, 2));

		extract($data);

		$conf = modules::run('cashier/js/_conf');

		$size   = 40;
		$mid    = intval($size/2);
		$qur    = intval($size/4);
		$rmid   = $size-$mid;
		$tmpdir = sys_get_temp_dir();   	# ambil direktori temporary untuk simpan file.
		$file   = tempnam($tmpdir, $sale_id);  # nama file temporary yang akan dicetak
		$handle = fopen($file, 'w');

		$font = chr(27) . chr(33) . chr(1);

    // $this -> connector -> write(self::ESC . "p" . chr($pin + 48) . chr($on_ms / 2) . chr($off_ms / 2));
    // $open = chr(27) . chr(112) . chr(0) . chr(25);
		$open = chr(27) . "p" . chr(48) . chr(1) . chr(1);

		$res = $font.$this->_justify($conf['store'], $size)."\n";
		$res .= $this->_justify($conf['address'], $size)."\n";
		$res .= $this->_justify($conf['phone'], $size)."\n";

		$res .= str_repeat('=', $size)."\n";

		foreach ($sale_product as $product) {
			$res .= $this->_flat($product['product_name'], $qur);
			$res .= $this->_flat(money($product['qty']) . ' ' . $product['unit'], $qur, 'r');
			$res .= $this->_flat(money($product['price']), $qur, 'r');
			$res .= $this->_flat(money($product['qty'] * $product['price']), $qur, 'r')."\n";

			if(!empty($product['discount'])) {
				$res .= $this->_flat('Disc', $qur);
				$res .= $this->_flat('@' . money($product['discount']), $qur, 'r');
				$res .= $this->_flat(money($product['qty'] * ($product['price'] - $product['discount'])), $qur, 'r')."\n";				
			}
		}
		$res .= str_repeat('=', $size)."\n";

		$res .= $this->_flat($username, $qur);
		$res .= $this->_flat('Total :', $qur+5, 'r');
		$res .= $this->_flat(money($sale['total']), 2*$qur-5, 'r')."\n";

		$res .= $this->_flat(date('d-m-Y'), $qur);
		$res .= $this->_flat('Disc :', $qur+5, 'r');
		$res .= $this->_flat(money($sale['discount']), 2*$qur-5, 'r')."\n";

		$res .= $this->_flat(' ', $qur);
		$res .= $this->_flat('Stlh disc :', $qur+5, 'r');
		$res .= $this->_flat(money($sale['grand_total']), 2*$qur-5, 'r')."\n";

		$res .= $this->_flat(' ', $qur);
		$res .= $this->_flat('Dibayar :', $qur+5, 'r');
		$res .= $this->_flat(money($sale['paid']), 2*$qur-5, 'r')."\n";

		$res .= $this->_flat(' ', $qur);
		$res .= $this->_flat('Kembali :', $qur+5, 'r');
		$res .= $this->_flat(money($sale['changes']), 2*$qur-5, 'r')."\n\n";

		$res .= $this->_justify('.:: Semoga Lekas Sembuh ::.', $size);
		$res .= "\n\n\n";
		$res .= $open;
		
		fwrite($handle, $res);
		fclose($handle);

		copy($file, $conf['printer'].$sale_id);  # Lakukan cetak \\\127.0.0.1\epson\print
		unlink($file);
	}

	public function escpos($data) {
		$this->load->library('escpos', 'kasir');

		try {
			$this->escpos->text('hello');
			$this->escpos->cut();
			$this->escpos->close();
		} catch (Exception $e) {
	    echo "Couldn't print to this printer: " . $e -> getMessage() . "\n";
		}
	}

	private function _flat($char, $capacity, $arah = 'l') {
		$length = strlen($char);

		if ($length > $capacity) {
			$char   = substr($char, 0, $capacity);
			$length = $capacity;
		}

		$reduce = $capacity - $length;
		$add    = str_repeat(' ', $reduce);

		return $arah == 'l' ? $char.str_repeat(' ', $reduce) : str_repeat(' ', $reduce).$char;
	}

	private function _justify($char, $capacity) {
		$length = strlen($char);

		if ($length > $capacity) {
			$char   = substr($char, 0, $capacity);
			$length = $capacity;
		}

		$before = @intval(($capacity-$length)/2);
		return str_repeat(' ', $before).$char.str_repeat(' ', $capacity-$before-$length);
	}

	private function _n2w($number = 0) {
		$number = (float)$number;
    $ar = array('','Satu','Dua','Tiga','Empat','Lima','Enam','Tujuh','Delapan','Sembilan','Sepuluh','Sebelas');
    if ($number < 12) {
	    return $ar[$number];
    } else if ($number < 20) {
	    return $ar[$number - 10] . ' Belas';
    } else if ($number < 100) {
	    $res = (int)($number / 10);
	    $mod = $number % 10;
	    return trim(sprintf('%s Puluh %s', $ar[$res], $ar[$mod]));
    } else if ($number < 200) {
	    return sprintf('Seratus %s', $this->_n2w($number - 100));
    } else if ($number < 1000) {
	    $res = (int)($number / 100); $mod = $number % 100;
	    return trim(sprintf('%s Ratus %s', $ar[$res], $this->_n2w($mod)));
    } else if ($number < 2000) {
	    return trim(sprintf('Seribu %s', $this->_n2w($number - 1000)));
    } else if ($number < 1000000) { 
	    $res = (int)($number / 1000); $mod = $number % 1000;
	    return sprintf('%s Ribu %s', $this->_n2w($res), $this->_n2w($mod));
    } else if ($number < 1000000000) { 
	    $res = (int)($number / 1000000); $mod = $number % 1000000; 
	    return trim(sprintf('%s Juta %s', $this->_n2w($res), $this->_n2w($mod)));
    } else if ($number < 1000000000000) { 
	    $res = (int)($number / 1000000000); $mod = fmod($number, 1000000000); 
	    return trim(sprintf('%s Milyar %s', $this->_n2w($res), $this->_n2w($mod)));
    } else if ($number < 1000000000000000) { 
	    $res = $number / 1000000000000; $mod = fmod($number, 1000000000000); 
	    return trim(sprintf('%s Triliun %s', $this->_n2w($res), $this->_n2w($mod)));
    } else {
	    return 'Data Salah';
    }
	}

	private function _rate($word, $size) {
		$word = explode(' ', $word);
		$n    = 0;
		$res  = array();
		foreach ($word as $k => $v) {
			if (empty($res[$n])) $res[$n] = '';
			if (strlen($res[$n]) + strlen($v) + 1 > $size) {
				$n++;
				$res[$n] = '';
			}
			$res[$n] .= empty($res[$n]) ? $v : ' '.$v;
		}
		return $res;
	}
}