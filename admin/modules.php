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


/////////////
if(isset($_POST['action']))
{	if($_POST['action']=='add')
	{       $data['name']=$_POST['name'];
       $data['classname']=$_POST['classname'];
       $data['xsl']=$_POST['xsl'];
       $primary_id = $db->insert("modules", $data);	}}

if(isset($_GET['action']))
{
	if($_GET['action']=='del')
	{

	}
}
///////////



$map=$xml->createElement('modules');
$q=$db->query("select * from modules");
while ($r = $db->fetch($q)) {       $item=$xml->createElement('item');
       $item->setAttribute('id',$r['id']);
       $item->appendChild($xml->createElement('name',$r['name']));
       $item->appendChild($xml->createElement('xsl',$r['xsl']));
       $item->appendChild($xml->createElement('classname',$r['classname']));
		$map->appendChild($item);	}
$site->appendChild($map);


//print $xml->saveXML();

print Engine('design/xsl/modules.xsl',$xml)








    ?>