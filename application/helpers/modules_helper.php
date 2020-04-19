<?php defined('BASEPATH') OR exit('No direct script access allowed');

if(!function_exists('user_privilege'))
{
  function user_privilege($status)
  {
    $sts = array('Admin', 'Kasir');
    return ucfirst($sts[$status - 1]);
  }
}

if(!function_exists('history_additional'))
{
  function sale_additional($additional)
  {
  	return $additional ? 'Ya' : 'Tidak';
  }
}

if(!function_exists('dateclock_ind'))
{
  function dateclock_ind($date)
  {
  	return date_ind($date) . ' ' . clock_ind($date);
  }
}

if(!function_exists('price_default'))
{
  function price_default($status)
  {
    return !empty($status) ? 'Ya' : 'Tidak';
  }
}