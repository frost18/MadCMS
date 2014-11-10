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
$navi=($_GET['show']=='nav')?1:0;
unset($res);

     $b=Array();
$q1=$db->query("select * from text_content where lang = '".LANG."' and id_route_map > 0 ");
while ($r1 = $db->fetch($q1)) {
	$b[$r1['id_route_map']]=$r1['id'];
	}


      $service=$xml->createElement('service');
      $service->setAttribute('navi',$navi);        
      $site->appendChild($service);
  
        

      $show=(isset($_GET['show']))?($_GET['show']=='nav')?'and routetype = "nav"':'and routetype != "nav"':'';
      $xshow=$xml->createElement('xshow',(isset($_GET['show']))?$_GET['show']:'none');
      $site->appendChild($xshow);


$map=$xml->createElement('map');
$q=$db->query("select * from route_map where lang = '".LANG."' ".$show."");
while ($r = $db->fetch($q)) {
$a=(isset($b[$r['id']]))?$b[$r['id']]:0;
       $item=$xml->createElement('item');
       $item->setAttribute('id',$r['id']);
       $item->setAttribute('idcnt',$a);
       $item->setAttribute('parent',$r['parent']);
       $item->setAttribute('lang',$r['lang']);
       $item->setAttribute('text_content',$r['text_content']);
       $item->appendChild($xml->createElement('title', $r['title']));
       $item->appendChild($xml->createElement('link', $r['link']));
		$map->appendChild($item);
	}
$site->appendChild($map);


$mods=$xml->createElement('mods');
$q=$db->query("select * from modules");
while ($r = $db->fetch($q)) {
       $item=$xml->createElement('item');
 		$item->appendChild($xml->createElement('title', $r['title']));
       $item->appendChild($xml->createElement('name', $r['name']));
		$mods->appendChild($item);
	}
$site->appendChild($mods);



//print $xml->saveXML();

print Engine('design/xsl/map.xsl',$xml)








    ?>