<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once dirname(__FILE__) . '/escpos/autoload.php';

use Mike42\Escpos\Printer;
use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;

class Escpos extends Printer {
  function __construct($name) {
  	$this->connector = new WindowsPrintConnector($name);
  	parent::__construct($this->connector);
  }
}