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

if(isset($_POST['title'],$_POST['link'],$_POST['module'])){
    
    $data['title'] = strip_tags(trim($_POST['title']));
	$data['link'] = strip_tags(trim($_POST['link']));
    $data['_mod'] = strip_tags(trim($_POST['module']));

    $db->update('route_map', $data,'id= '.$_POST['id']);
    unset($data);
}

    
    $data['header'] = strip_tags(trim($_POST['header']));
	$data['description'] =trim($_POST['description']);
    $data['content'] = trim($_POST['ckeditor']);
    $data['dt']=$_POST['y'].'-'.$_POST['m'].'-'.$_POST['d'];

    $db->update('text_content', $data,'id_route_map= '.$_POST['id']);
header('LOCATION: /admin/details.php?id='.$_POST['id']);

/*
$err=0;
if(isset($_POST['name'],$_POST['mail']))
{
	$data['name'] = strip_tags(trim($_POST['name']));
	$data['email'] = strip_tags(trim($_POST['mail']));

	if($_POST['password']!='' and $_POST['repassword']!='')
	{
		$data['password'] = ($_POST['password']==$_POST['repassword'])?strip_tags(trim(md5($_POST['password']))):$err=1;
    }else{
        $err=1;
    }
  	 if($err )
    {
     	print 'repass';
    	exit;
    }
    
    if($data['email']=='admin'){
        print 'no';
        exit;
    }

	$db->update('users', $data,'id= '.$_SESSION['USER']['ID']);
	print 'ok';

}

*/


?>
