<?php


session_name('dm_' . substr(md5(URL), 0, 10));
session_start();
header('Content-Type: text/html; charset=UTF-8', true);
?>

<head>

 <script type="text/javascript" src="http://mebel.lan/design/js/jq.js"></script>
     <script src="ckeditor/ckfinder/ckfinder.js"></script>
   <script src="ckeditor/ckeditor.js"></script>
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

	$sql = "SELECT * from pages where lang ='rus' and id = :i";

		$v = $db->getRow($sql,$_GET['id']);
    
        
            
            

?>
<div style="width: 100%; background-color:#333;padding:10px; margin-bottom:20px;">
<a>
<a href="/admn/sitepage.php" style="color:white;">< Назад к страницам </a>
</a>
</div>

<form method="POST" action="/admn/act/page.update.php">
<input type="hidden" value="<?=$v['id']?>" name="id" />
<input type="hidden" value="rus" name="lang" />


<div class="boxShadow10">
<table width="100%" border="0" cellspadding="0" cellspacing="0">
<tr>
<td class="title_field" width="50%">Модуль</td>
<td class="title_field" width="50%">Видимость страницы</td>
</tr>
<tr>
<td>
<select class="normal" style="width: 99%;">
<option><?=$v['module']?></option>
<option></option>
<option></option>
<option></option>
</select>
</td>
<td>
<select class="normal" style="width: 99%;">
<option>Открыта</option>
<option>Скрыта</option>
</select>
</td>
</tr>
</table>

</div>
<br />





<div class="boxShadow12">
<span class="title_field">
Текст<br />
</span>
<input type="text" value="<?=gln($v['id'],'title','pages','rus')?>" name="title" class="normal"/>
</p>
<p>
<textarea  class="ckeditor" name="ckeditor" >
<?=gln($v['id'],'text','pages','rus')?>
</textarea>



    
    
    
</div>
<br />
<div style="" class="boxShadow11">
<span class="title_field">
Ссылка
</span>
<br />
<input type="text" value="<?=$v['alias']?>" name="alias"  class="normal"/>
<p>


<span class="title_field">
Keyw
</span>
<br />
<input type="text" value="<?=gln($v['id'],'keyw','pages','rus')?>" name="keyw"  class="normal"/>
</p>

<span class="title_field">
Desc
</span>
<br />
<input type="text" value="<?=gln($v['id'],'desc','pages','rus')?>" name="desc"  class="normal"/>
</p>

</div>


<div class="sbm" style=" margin:10px;">
<input type="submit" value="Сохранить" style="width: 149px; height:35px;"/>
</div>
</form>



 <script type="text/javascript">
var editor = CKEDITOR.replace( 'ckeditor' );
CKFinder.setupCKEditor( editor, '/admin/ckeditor/ckfinder/' );

    
    </script>


<style>


body{
    margin:0px; padding:0px;
    font-family:Calibri;
}

.sbm, .boxShadow10,.boxShadow11, .boxShadow12{ margin-left:1em;  width:80%; border-radius:5px;}

.boxShadow10 { padding: 1em; box-shadow: 0 2px 2px #ccc inset;
background-color:#F7E6DA; }

.boxShadow11 { padding: 1em; box-shadow: 0 2px 2px #ccc inset;
background-color:#F5F8F9; }


.boxShadow12 {   padding: 1em; box-shadow: 0 2px 2px #ccc inset;
background-color:#D5EAF1; }

.normal{ width:100%;height:30px;font-size:125%; }
.title_field{ font-size:90%; color:#333;}

._invbrd{border:1px solid white;}
._brd{border:1px dashed grey;}
._brdred{border:1px dotted red;}
.add{color:green;border-bottom:1px dashed green;}
</style>
