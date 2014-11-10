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
    
   
    </style>
   
   <link href="design/style/css.css" rel="stylesheet" type="text/css" />
<link href="design/style/map.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="design/js/map.js"></script>
    
        <script type="text/javascript" src="/admin/design/js/jq.js"></script> </head>
 <body>

<script>
    $(document).ready(function(){
$('#badd').click(function(){
		$('#add').show();
	});


	  });


        function _close(){
		$('#add').hide();
	}
</script>


    <hr/><div align="center"><a href="/admin/"> На главную</a></div>

 



<hr/>
<div style="height:25px;width:100%" align="right">
<a id="badd" style="color:#fff;background-color:#FD8713;cursor:pointer;">Добавить новость</a>
 
 </div>

<div style="display:none;" id="add">

<form action="ajax/news.php" method="POST" enctype="multipart/form-data" >
<input type="hidden" name="action" value="add"/>
<ul>
<li>Дата:  <input type="text" value="0000-00-00"  name="date" maxlength="10"/></li>
<li>Заголовок: <input type="text" value="" name="title" maxlength="255"/></li>


<li>Фото<span style="color:#333;font-size:80%;"> (760 x 402 px)</span>: <input type="file"  name="file" /></li>
<li>
<input type="submit" value="Добавить"/>
</li>
</ul>


</form>


</div>
<?




$vis=Array();
$vis['0']='Показать на сайте';
$vis['1']='Скрыть';


?>



<table>
<?

     $b=Array();
$q1=$db->query("select * from articles where lang = '".LANG."'  ");
while ($r1 = $db->fetch($q1)) {

print '<tr>


<td>'.$r1['dt'].'</td>
<td>'.$r1['title'].'</td>
<td>

<a class="service vis" href="ajax/news.php?action=vis&vtype='.$r1['vis'].'&id='.$r1['id'].'"><img src="/admin/design/img/'.$r1['vis'].'.png" /></a>

</td>
<td>
<a href="/admin/details.php?id='.$r1['id'].'"><img src="/admin/design/img/edit.png" style="width:16px;" align="texttop"/></a>
<a class="service del" ><img src="/admin/design/img/del.png" align="texttop"  /></a>

</td>

</tr>';
$news=new News; 
	}
    ?>
    
    
    </table>