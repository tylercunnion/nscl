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
		$loc = $base_loc . 'events/';
		switch($tab)
		{
			case "tab_1":
				switch($page)
				{
					case "2-SCL_Events":
						$loc .= "scl_events";
						break;
					case "3-Convention_Chairs";
						$loc .= "chairs";
						break;
					case "1-About_Convention":
					default:
						$loc .= "convention";
						break;
				}
				break;
			case "tab_2":
			default:
				unset($loc);
				$code = "410 Gone";
				break;
		}
		break;
	case "productions":
		$loc = $base_loc . "publications/";
		switch ($tab)
		{
			case "tab_1":
				switch ($page)
				{
					case "2-Letter_of_the_League":
						$loc .= "letter";
						break;
					case "1-The_Convention_Ear":
					default:
						$loc .= "convention_ear";
						break;
				}
				break;
			case "tab_2":
			  unset($loc);
				$code = "410 Gone";
				break;
		}
		break;
	case "business":
		$loc = $base_loc . "business/";
		switch($tab)
		{
			case "tab_1":
				$loc = $loc . "officers/";
				switch ($page)
				{
					case "2-Vice-President":
						$loc = $loc . "vice-president";
						break;
					case "3-Secretary":
						$loc = $loc . "secretary";
						break;
					case "4-Treasurer":
						$loc = $loc . "treasurer";
						break;
					case "5-Parliamentarian":
						$loc = $loc . "parliamentarian";
						break;
					case "6-Historian":
						$loc = $loc . "historian";
						break;
					case "7-Editor":
						$loc = $loc . "editor";
						break;
					case "8-Advisor":
						$loc = $loc . "advisor";
						break;
					case "1-President":
					default:
						$loc = $loc . "president";
						break;
				}
				break;
			case "tab_2":
				$loc = $loc . "documents/";
				switch ($page)
				{
					case "2-Song":
						$loc = $loc . "song";
						break;
					case "3-Constitution":
						$loc = $loc . "constitution";
						break;
					case "1-Creed":
					default:
						$loc = $loc . "creed";
						break;
				}
				break;
		}
		break;
	case "members":
		$loc = $base_loc . "members/";
		switch($tab)
		{
			case "tab_1":
				$loc .= "scholarships/";
				switch($page)
				{
					case "2-NSCL_Scholarship":
						$loc .= "nscl_scholarship";
						break;
					case "3-Mark_Schapler_Award":
						$loc .= "mark_schapler";
						break;
					case "1-Hal_Rather_Award":
					default:
						$loc .= "hal_rather";
						break;						
				}
				break;
			case "tab_2":
				$loc .= "services";
				break;
		}
		break;
	case "games":
		$code = "410 Gone";
		break;
	case "links":
		$loc = $base_loc . "states";
		break;
	case "welcome":
	case NULL:
		$loc = $base_loc;
		switch($tab)
		{
			case "tab_2":
				unset($loc);
				$code = "410 Gone";
				break;
			case "tab_1":
			default:
				switch($page)
				{
					case "2-Joining_the_SCL":
						$loc .= "join";
						break;
					case "3-About_the_Website":
						$loc .= "website";
						break;			
				}
		}
		break;
}

header("HTTP/1.1 " . $code);
if (isset($loc))
{
	header("Location: " . $loc);
}


?>
