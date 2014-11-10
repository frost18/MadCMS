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

	$data['title'] = $_POST['title'];
	$data['parent'] =  $_POST['parent'];
	$data['link'] =  $_POST['link'];
	$data['vis'] =  $_POST['status'];
    $data['status'] =  '1';
	$data['_mod'] =  $_POST['module'];
	$data['id_navi'] =  $_POST['id_navi'];
	$data['routetype']=($_POST['id_navi'])?'nav':'';
	$data['lang'] = $_SESSION['lang'];
    $data['id_sections'] = $_POST['id_sections'];
    if(isset($_POST['left'])){
        if($_POST['parent']=='0'){
            $data['parent']=389;
            $data['mag']="www";
            $data['routetype']='nav';
        }else{            
            $data['routetype']='left';
           
        }
    }

    //print_r($data);
//exit;

//print_r($data);exit;
	$primary_id=$db->insert('route_map', $data);

    if($_POST['cnt']=='ON' and $primary_id and !((int)$_POST['cntnum'])){
		$data2['header']=$data['title'];
		$data2['lang']=$data['lang'];
		$data2['id_route_map']=$primary_id;

		$db->insert('text_content', $data2);
	}
    if((int)$_POST['cntnum']){
    	$data3['id_route_map']=$primary_id;
    	$db->update('text_content', $data3, "id='".(int)$_POST['cntnum']."'");
    }
    
    
     if($_POST['module']=='items'){
                
                check($primary_id);
                
                
            }
    
    function check($primary_id){
        global $db; 
        
        $q="select id from route_map where parent=".$primary_id." and _mod = 'item'";
        
         $row = $db->query_first($q);
    
    // if user exists
    if(empty($row['id'])){
        $data5['title'] = $_POST['item'];
		$data5['link'] =  'item';
        $data5['lang'] =  'rus';
        $data5['status'] =  '1';
	
    
	$data5['_mod'] =  "item";
	$data5['vis'] = $_POST['1'];
		$data5['parent']=$primary_id;

		$db->insert('route_map', $data5);
    }
        
    }
    

   header('LOCATION: '.$_SERVER['HTTP_REFERER']);

?>
