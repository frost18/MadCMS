<?php
session_start();


include '../../classes/Database.php';
include '../db.php';
require_once('../../classes/Page.php');


header('Content-Type: text/html; charset=UTF-8', true);
if(isset($_SESSION['admin']) or ($_SESSION['USER']['ID'])){
 	
}else{
    
    header('LOCATION: ../login.php');
 	exit;
}

if(isset($_GET['id'])){
    
    
     $data['vis']=($_GET['vtype'])?0:1;
   
    $db->update('text_content', $data, "id_route_map='".(int)$_GET['id']."'");
    $db->update('route_map', $data, "id='".(int)$_GET['id']."'");
    
    }
    

    
    
    


    
    header('LOCATION: '.$_SERVER['HTTP_REFERER']);
    
    

//print_r($_POST);


?>
