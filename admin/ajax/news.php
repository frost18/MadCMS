<?php
session_start();
header('Content-Type: text/html; charset=UTF-8', true); 

include '../../classes/Database.php';
include '../db.php';
require_once('../../classes/Page.php');



if(isset($_SESSION['admin']) or ($_SESSION['USER']['ID'])){
 	
}else{
    
    header('LOCATION: ../login.php');
 	exit;
}
  
if(isset($_GET['action'])){
  
    switch($_GET['action']){
    case 'vis': $data['vis']=($_GET['vtype'])?0:1;
    $db->update('articles', $data, "id='".(int)$_GET['id']."'");
    break;
    case 'delete':
    

    /////////
    

$db->query('delete from text_content where id_route_map = '.(int)$_GET['id']);
    $db->query('delete from route_map where id = '.(int)$_GET['id']);

    
  	$q="select id from gallery where id_route = ".$_GET['id'];
      
       
	$res= $db->query($q);
        
	while ($r = $db->fetch($res)) {

       if(file_exists("../../photo/".$r['id'].".jpg")){
	      unlink("../../photo/".$r['id'].".jpg");
        }  
	        if(file_exists("../../photo/small_".$r['id'].".jpg")){
	      unlink("../../photo/small_".$r['id'].".jpg");
        }  
       
       
	
   $db->query('delete from gallery where id_route = '.$_GET['id']);
    
    if(file_exists('../../photo/news/'.$_GET['id'].'.jpg')){
        unlink('../../photo/news/'.$_GET['id'].'.jpg');
    }
    
    $db->query('delete from route_map where id = '.(int)$_GET['id']);  
    if(file_exists('../../photo/news/'.$_GET['id'].'.jpg')){
        unlink('../../photo/news/'.$_GET['id'].'.jpg');
    }
    

}    
    
    
    ////////
    
    
    
    
      	
    header('LOCATION: '.$_GET['cururl']);
    break;
         
    
    
    }
    

    
    
    
}


if(isset($_POST['action'])){
    
    if($_POST['action']=='add'){
        
        include 'resize_crop.php';
        
          
    $page=new Page;
    $page->title='Заголовок';
    $page->idr=$_POST['idroute'];
    //$page->module='text_content';
    $page->module='photos';
    $page->parent=$_POST['idroute'];
    $page->lang=$_POST['curlang'];;
    $page->link=(rand(10000,999999));
    
    
    $id=$page->add();
    $page->tp='news';
    $page->description='Краткое описание';
    $page->date=$_POST['y'].'-'.$_POST['m'].'-'.$_POST['d'];
    $page->contentAdd($id);
       
    include '../../act/resize_crop.php';
    
    if($_FILES["file"]["tmp_name"]!='' )
	{
	       
        
        $p=$_FILES["file"]["name"];
        
        $cat='../../photo/news/';
		$uploadfile=$_FILES["file"]["tmp_name"];
		$i= $cat.''.$id.'.jpg';
	

		if(!file_exists($uploadfile))
		{
			continue;
		}

		list($w, $h) = getimagesize($uploadfile); // получаем размеры

		$x = $y = 0;
		if ($w > $h)
		{ // если ширина больше длины
			$x = ($w - $h) / 2; // вычисляем начало
			$w = $h + $x; // и конец координат
		}
		else
		{ // иначе
			$y = ($h - $w) / 2; // делаем тоже самое
			$h = $w + $y; // для высоты
		}
        
        if($w>$h){
            
            resize($uploadfile,$i,0,300); // запускаем функцию масштабирования 
        }else{
           resize($uploadfile,$i,340,0); // запускаем функцию масштабирования
          }
          
          crop($i,$i,array(0,0,340,216));
		 // запускаем функцию обрезки с массивом координат
		

	


	//	$db->query('update tb_base set PHOTO = (PHOTO+'.(int)$buf2.') where  id_base="'.$_POST['action'].'" ');
}
    
        
    }
    
    header('LOCATION: '.$_POST['cururl']);
    
    }

//print_r($_POST);


?>
