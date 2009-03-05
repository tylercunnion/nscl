<?php

//Thanks Fu and co.!
function retrieveGet($var_name){
	if(array_key_exists($var_name, $_GET)){
		// strip any HTML or PHP tags from the form variable
		return strip_tags($_GET[$var_name]);
	}else{
		return null;
	}
}


$section = retrieveGet("section");
$tab = retrieveGet("tab");
$page = retrieveGet("page");

$code = "301 Moved Permanently";

$base_loc = "http://".$_SERVER['HTTP_HOST'].'/';

switch ($section)
{
	case "events":
		switch($tab)
		{
			case "tab_1":
				switch($page)
				{
					case "1-About_Convention":
					default:
						$loc = $base_loc."convention";
						break;
				}
		}
}

//header("HTTP/1.0 " . $code);
if isset($loc)
{
	header("Location: " . $loc);
}


?>