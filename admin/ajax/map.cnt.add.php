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

    $sql="SELECT title, lang FROM route_map WHERE id = ".$_GET['id_route'];
    $row = $db->query_first($sql);

		$data2['id_route_map']=$_GET['id_route'];
		$data2['header']=$row['title'];
		$data2['lang']=$row['lang'];

		$primary_id =$db->insert('text_content', $data2);
   header('LOCATION: /admin/map.php');

?>
