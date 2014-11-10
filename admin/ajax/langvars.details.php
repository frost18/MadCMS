<?
header('Content-Type: text/html; charset=UTF-8', true);
//header('Content-type: application/json; charset=utf-8');
header('Cache-Control: no-cache');

include '../../classes/Database.php';
include '../db.php';

    $jar=Array();
$q=$db->query("select * from langvars where link = '".$_GET['link']."' and idmodules = ".$_GET['mod']);
while ($r = $db->fetch($q)) {
		$jar[]=Array('id'=>$r['id'],'lang'=>$r['lang'],'val'=>$r['val'],'link'=>$r['link'],'idmodules'=>$r['idmodules']);
	}

print json_encode($jar);

?>