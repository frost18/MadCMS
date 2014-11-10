<?php
session_start();


include '../../classes/Database.php';
include '../db.php';

if(isset($_SESSION['admin']) or ($_SESSION['USER']['ID'])){
 	
}else{
    
    header('LOCATION: ../login.php');
 	exit;
}
	$data['header'] = $_POST['title'];
	$data['description'] =  $_POST['desc'];
	$data['lang'] = 'rus';



	$primary_id=$db->insert('text_content', $data);


   header('LOCATION: /admin/cnt.php');

?>
