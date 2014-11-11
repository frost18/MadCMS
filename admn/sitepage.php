<?php
session_name('dm_' . substr(md5(URL), 0, 10));
session_start();
header('Content-Type: text/html; charset=UTF-8', true);
?>

<head>

 <script type="text/javascript" src="http://mebel.lan/design/js/jq.js"></script>
</head>
<body>
<?
include_once("../classes/Database.php");
include_once("config.php");



//Site::instance()->init();


if(!($_SESSION['user'])){
  //  header("LOCATION: /admn/login.php");
    
}

//$db=new Database;
?>
<div style="width: 100%; background-color:#333;padding:10px; margin-bottom:20px;">
<a>
<a href="/admn/sitepage.php" style="color:white;">< Назад к страницам </a>
</a>
</div>
<?
	$sql = "SELECT * from pages where lang ='rus' ";

		$tmp_data = $db->getAll($sql);
       ?>
       
       
        <a class="add">Добавить</a>
        <div style="background-color:#ccc;border:1px solid #999;padding:10px;">
        <form action="act/category.add.php" method="POST">
       
       
       <input type="text" placeholder="Заголовок" name="title" />
       
       
        
         
       <input type="text" placeholder="Ссылка" name="title" />
       
        </div>
        
        <select size="1">
	<option>текстовый</option>
	<option>новости</option>
</select>
<input type="submit" />
         </div>
         
         </form>
       <form action="act/category.del.php" method="post"> 
       <input type="hidden" name="group" value="1">
       <ul>
       
       
   <?
       
       
       
?>
<div style="margin: 5px 20px;">
<table>
<tr>
<td>
Показать
<select>
<option>Все модули</option>
</select>
</td>
<td>
<select onchange="window.location.href='?visible'+this.value" >
<option value="all">Все страницы</option>
<option value="publish" >Опубликованные</option>
<option value="hidden">НеОпубликованные</option>
</select>


</td>

</tr>

</table>

<table width="90%" border="0" bordercolor="#777" style="border-collapse: collapse;" cellpadding="5"  class="tbl" >
<tr height="30" style="background:#B8E1F1; box-shadow: 0 0 1px 2px #D7EEF7 inset;">
<td></td>
<td>Заголовок</td>
<td>Модуль</td>
<td>Действия</td>
</tr>
<?
       
       
       
        foreach($tmp_data as $k=>$v){
             
            print '<tr id="tr-'.$v['id'].'"><td   > 
            <input type="checkbox" name="x[]" value="'.$v['id'].'" />
          </td><td>
           
            <a  href="/admn/sitepage.info.php?id='.$v['id'].'">
            '.gln($v['id'],'title','pages','rus').'
            </a> 
            </td>
            <td>
            '.$v['module'].'
            </td>
            <td>
             <a class="ico" ><img src="/admn/img/for.png"/></a>
            <a class="ico" ><img src="/admn/img/'.$v['visible'].'.png"/></a>           
           
            <a class="ico" onclick="del('.$v['id'].')"><img src="/admn/img/del.png"/></a>
            </td>
             </tr> ';
            
        }
        print '</table>
        <input type="button" value="Удалить" onclick="check(this.form)"         
        </form>';



?>


</div>

<script>

function del(id){
    var temp='sdfsdfs';
    
    if(confirm("Удалить?")){
         tmpl(temp,'tr-'+id);
 $.post('/admn/act/category.del.php', { id: id} , function(data) {
       
       if(data=='ok'){
          $('#li-'+id).hide(300);
       }else{
            tmpd(temp);
       }
       });
       }
}

function tmpl(temp_id,ins_id){
  $('#'+ins_id).append('<img src="/design/img/smallloading.gif" id="'+temp_id+'"/>');  
}
function tmpd(temp_id){
   $('#'+temp_id).hide(300); 
}

function check(frm){
    
    if(confirm("Вы уверены?")){
        
        frm.submit();
        
    }
    
}
   
   
</script>

<style>

body{
    margin:0px; padding:0px;
    font-family:Calibri;
}


._invbrd{border:1px solid white;}
._brd{border:1px dashed grey;}
._brdred{border:1px dotted red;}
.add{color:green;border-bottom:1px dashed green;}
.ico{margin-left:5px;}
.ico img{border:0px; width:16px;}

.tbl tr td{ border-bottom:1px solid #999;}

</style>
