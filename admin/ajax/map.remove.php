<?php
session_start();


include '../../classes/Database.php';
include '../db.php';

header('Content-Type: text/html; charset=UTF-8', true);
if(isset($_SESSION['admin']) or ($_SESSION['USER']['ID'])){
 	
}else{
    
    header('LOCATION: ../login.php');
 	exit;
}

	$db->query('delete from route_map where id = '.(int)$_POST['id']);
	$db->query('delete from text_content where id_route_map = '.(int)$_POST['id']);
print  'ok';

?>
