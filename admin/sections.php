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

</script>


    <hr/><div align="center"><a href="/admin/"> На главную</a></div>

 



<hr/>
<div style="padding: 10px 0 0 40px;">
<?

     $b=Array();
$q1=$db->query("select * from sections");
while ($r1 = $db->fetch($q1)) {	
    print '<p><a href="/admin/map.php?show=nav&id_sections='.$r1['id'].'">'.$r1['title'].'</a></p>';
	}




?></div>
</body>



   