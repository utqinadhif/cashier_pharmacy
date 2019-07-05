<?php defined('BASEPATH') OR exit('No direct script access allowed');

if(!function_exists('add_css'))
{
	/*
	type 1 direct write
	type 2 return
	type 3 on show
	*/
	function add_css($css, $type = 1)
	{
		$ci      = & get_instance();
		if(empty($ci->beo)) $ci->beo = new stdClass();
		$css_url = '';

		if(is_url($css))
		{
			$css_url = $css;
		}else
		{
			foreach (array(
				'themes/' . $ci->template->get_theme() . '/css/' . $css,
				'themes/default/css/' . $css,
				'themes/default/' . $css,
				) AS $fcss)
			{
				if(file_exists(dirname(APPPATH) . DIRECTORY_SEPARATOR . $fcss))
				{
					$css_url = base_url($fcss);
					break;
				}
			}
		}

		if(!empty($css_url) && empty($ci->beo->css[$css_url]))
		{
			switch ($type) {
				case 3:
					$ci->beo->css[$css_url] = $css_url;
					break;
				case 2:
					return '<link href="'.$css_url.'" rel="stylesheet" type="text/css" />';
					break;
				case 1:
				default:
					echo '<link href="'.$css_url.'" rel="stylesheet" type="text/css" />';
					break;
			}
		}else{
			switch ($type) {
				case 3:
					break;
				case 2:
					return '';
					break;
				case 1:
				default:
					echo '';
					break;
			}
		}
	}
}
if(!function_exists('show_css'))
{
	function show_css()
	{
		$ci =& get_instance();
		if(empty($ci->beo)) $ci->beo = new stdClass();
		
		$out = '';
		if(!empty($ci->beo->css))
		{
			foreach ($ci->beo->css as $css)
			{
				$out .= '<link href="'.$css.'" rel="stylesheet" type="text/css" />';
			}
		}
		return $out;
	}
}
if(!function_exists('add_js'))
{
	function add_js($js)
	{
		$ci     = & get_instance();
		if(empty($ci->beo)) $ci->beo = new stdClass();
		$js_url = '';

		if(is_url($js))
		{
			$js_url = $js;
		}else
		{
			foreach (array(
				'themes/' . $ci->template->get_theme() . '/js/' . $js,
				'themes/default/js/' . $js,
				'themes/default/' . $js,
				) AS $fjs)
			{
				if(file_exists(dirname(APPPATH) . DIRECTORY_SEPARATOR . $fjs))
				{
					$js_url = base_url($fjs);
					break;
				}
			}
		}

		if(!empty($js_url) && empty($ci->beo->js[$js_url]))
		{
			$ci->beo->js[$js_url] = $js_url;
		}
	}
}
if(!function_exists('show_js'))
{
	function show_js()
	{
		$ci =& get_instance();
		if(empty($ci->beo)) $ci->beo = new stdClass();
		
		$out = '';
		if(!empty($ci->beo->js))
		{
			foreach ($ci->beo->js as $js)
			{
				$out .= '<script src="'.$js.'" type="text/javascript"></script>';
			}
		}
		return $out;
	}
}