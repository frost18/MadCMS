<?php
session_start();


include '../../classes/Database.php';
include '../db.php';

header('Content-Type: text/html; charset=UTF-8', true);
if(!isset($_SESSION['admin'])){
 	header('LOCATION: ../login.php');
 	exit;
}

	$db->query('delete from route_map where id = '.(int)$_POST['id']);
print  'ok';

?>
