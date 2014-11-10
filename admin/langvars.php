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


if(isset($_GET['action']))
{
	if($_GET['action']=='del')
	{

	}
}
///////////
$bf=Array(0=>'Глобальные');
$q=$db->query("select id, title from modules");
while ($r = $db->fetch($q))
{	$bf[$r['id']]=$r['title'];}
$zt=(isset($_GET['idmod']))?$_GET['idmod']:0;
$map=$xml->createElement('langvars');
foreach($bf as $k=>$v){	$zt=(!$zt)?$k:$zt;
$mod=$xml->createElement('mod');
$mod->setAttribute('id',$k);
if($k==$zt){$mod->setAttribute('selected','');}
//$mod->setAttribute('name',$v);
$mod->setAttribute('title',$v);
$q=$db->query("select * from langvars where idmodules = ".$k." and lang = '".$_SESSION['lang']."' order by id");
while ($r = $db->fetch($q)) {       $item=$xml->createElement('item');
       $item->setAttribute('id',$r['id']);
       $item->setAttribute('lang',$r['lang']);
       $item->appendChild($xml->createElement('link',$r['link']));
       $el=$xml->createElement('val');
       $text = $xml->createCDATASection($r['val']);
       $el->appendChild($text);
       $item->appendChild($el);
		$mod->appendChild($item);	}
		$map->appendChild($mod);
}
$site->appendChild($map);


//print $xml->saveXML();

print Engine('design/xsl/langvars.xsl',$xml)








    ?>