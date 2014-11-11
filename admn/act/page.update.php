<?php
session_start();

include '../../classes/Database.php';
include '../config.php';

header('Content-Type: text/html; charset=UTF-8', true);
if(isset($_SESSION['admin']) or ($_SESSION['USER']['ID'])){
 	
}else{
    
   // header('LOCATION: ../login.php');
 //	exit;
}

//if(isset($_POST['title'],$_POST['link'],$_POST['module'])){
    
    $data['alias'] = strip_tags(trim($_POST['alias']));

    $db->query("UPDATE pages set alias= :s" ,$data['alias']);

    unset($data);
//}

    
    $data['desc'] = strip_tags(trim($_POST['desc']));
	$data['keyw'] =trim($_POST['keyw']);
    $data['text'] = trim($_POST['ckeditor']);
    $data['title']=trim($_POST['title']);
    
    //$_POST['y'].'-'.$_POST['m'].'-'.$_POST['d'];
    $s="UPDATE lang set val= :s where pid = :i and lang =:s and k = :s";
    $db->query($s ,$data['desc'], $_POST['id'],$_POST['lang'],'desc');
    //print $db->parse($s,$data['desc'], $_POST['id'],$_POST['lang'],'desc');
    $db->query("UPDATE lang set val= :s where pid = :i and lang =:s and k = :s" ,$data['keyw'], $_POST['id'],$_POST['lang'],'keyw');
    $db->query("UPDATE lang set val= :s where pid = :i and lang =:s and k = :s" ,$data['text'], $_POST['id'],$_POST['lang'],'text');
    $db->query("UPDATE lang set val= :s where pid = :i and lang =:s and k = :s" ,$data['title'], $_POST['id'],$_POST['lang'],'title');
    
    
    
header('LOCATION: /admn/sitepage.info.php?id='.$_POST['id']);

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
