<?php
session_start();
header('Content-Type: text/html; charset=UTF-8', true);



if(!isset($_SESSION['admin'])){
 	header('LOCATION: login.php');
 	exit;
}
include 'fnc.php';

?>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    
    <style>
    
   ul li{ list-style:none; margin:5px 0 5px 0;}
   ul input{ width:500px; height:30px; }
    </style>
    <script src="ckeditor/ckfinder/ckfinder.js"></script>
   <script src="ckeditor/ckeditor.js"></script>
   <link href="design/style/css.css" rel="stylesheet" type="text/css" />
<link href="design/style/map.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="design/js/map.js"></script>
    
        <script type="text/javascript" src="/admin/design/js/jq.js"></script> </head>
    


 <body>



    <hr/><div align="center"><a href="/admin/"> На главную</a></div>

 



<hr/>



Данные страницы
<form enctype="multipart/form-data" action="ajax/conetnt.update.php" method="POST">
<input type="hidden" name="id" value="<?=$_GET['id']?>" />


<ul >
<?


$q2="select * from route_map where id = '".$_GET['id']."'  ";

$r2 = $db->query_first($q2);
?>
<li>
 Заголовок страницы </li>
 <li>
 <input type="text" name="title" value="<?=$r2['title']?>" />
 </li>
 <li>
 Ссылка</li>
 <li>
 <input type="text" name="link" value="<?=$r2['link']?>" />
 </li>
   
<?


$r1=$db->query_first("select * from text_content where id_route_map = '".$_GET['id']."'  ");

$date_x=explode('-',$r1['dt']);
$y=$date_x[0];
$m=$date_x[1];
$d=$date_x[2];

?>
 <li>
Модуль
</li>
<li>
<select name="module">
<?

$q3=$db->query("select * from modules");

while ($r3 = $db->fetch($q3)) {
   $buf=($r3['name']==$r2['_mod'])?'selected="true"':"";
    print '<option value="'.$r3['name'].'" '.$buf.'>'.$r3['title'].'</option>';
    
    }

?>
    </select>
    </li>
    
    <li>
Дата </li>
<li>
 <input type="text" value="<?=$y?>" name="y" maxlength="4" size="4" style="width: 60px;" /> - <input type="text" value="<?=$m?>" name="m" maxlength="2" style="width: 30px;" /> - <input type="text" style="width: 30px;" value="<?=$d?>" name="d" maxlength="2" />     
    </li>

    
    <li>
Заголовок страницы </li>
<li>
 <input type="text" value="<?=$r1['header']?>" name="header"  />    
    </li>
    
          <li>
    <h2>
Краткое описание (255 символов)
</h2>
</li>
<li>
<textarea  name="description"  style="width: 709px;" maxlength="255"><?=$r1['description']?></textarea>
  </li>
    
    <li>
    <h2>
Текст страницы
</h2>
</li>
<li>
<textarea class="ckeditor" name="ckeditor" style="width: 1179px;">
<?=$r1['content']?>
</textarea>
  </li>
  
<!--li>Фото</li>
  <li>

<?=$r1['photo']?>

  </li>
  
  <li>Файл</li>
  <li>

<?=$r1['file']?>

  </li-->
  
    <li><input type="submit" value="Сохранить" /></li>
</ul>  
  
    </table>
    <p><br/></p>
 <script type="text/javascript">
var editor = CKEDITOR.replace( 'ckeditor' );
CKFinder.setupCKEditor( editor, '/admin/ckeditor/ckfinder/' );

    
    </script>
    
    
      </form>
    </body></html>