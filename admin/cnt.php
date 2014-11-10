<?php
session_start();

header('Content-Type: text/html; charset=UTF-8', true);
if(!isset($_SESSION['admin'])){
 	header('LOCATION: login.php');
 	exit;
}
include 'fnc.php';

$res=StartXML();
$xml=$res[0];
$site=$res[1];
unset($res);

$cnt=$xml->createElement('cnt');
$q=$db->query("select * from text_content where lang = '".LANG."' order by id desc ");
while ($r = $db->fetch($q)) {       $item=$xml->createElement('item');
       $item->setAttribute('id',$r['id']);
       $item->setAttribute('id_route_map',$r['id_route_map']);
       $item->appendChild($xml->createElement('title', $r['header']));
       $item->appendChild($xml->createElement('desription', $r['desription']));
		$cnt->appendChild($item);
	}

$site->appendChild($cnt);





//print $xml->saveXML();

print Engine('design/xsl/cnt.xsl',$xml)








    ?>