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

include_once("config.php");

include_once("../classes/Database.php");

//Site::instance()->init();


if(!($_SESSION['user'])){
  //  header("LOCATION: /admn/login.php");
    
}

$db=new Database;

	$sql = "SELECT * from catalog";

		$tmp_data = $db->getAll($sql);
?>
      
       <form action="act/category.del.php" method="post"> 
       <input type="hidden" name="group" value="1"/>
<ul>
<li>      
Наименование
<input type="text" value="" name="name"/>
</li>
<li>
Фото

</li>
</ul>   
Описание товара
<div style="">

</div>   
        <input type="button" value="Удалить" onclick="check(this.form)"/>
         </ul>
        </form>
        
        
        <?



?>


<script>
var __bbred=0;
function _ed(id)
{
	if(__bbred==0)
	{
		__bbred=id;
		document.getElementById(__bbred).contentEditable="true";
		$('#'+__bbred).removeClass('_brd');
		$('#'+__bbred).addClass('_brdred');
		$('.Window').css('display','');
	}
}

function _off(id)
{

    if(document.getElementById(id).contentEditable!="true"){
		$('#'+id).removeClass('_brd');
  
	}

}

function _on(id)
{
	if(__bbred==0)
	{
	  
		$('#'+id).addClass('_brd');
        
        
	}
}

function send(){
    var newcat=$('#newcategory').val();
    
 $.post('/admn/act/category.add.php', { newcat: newcat} , function(data) {
        alert(data);
        if(data=='ok'){
       $('#item'+id).hide(300);
       }
       });
}



function del(id){
    var temp='sdfsdfs';
    
    if(confirm("Удалить?")){
         tmpl(temp,'li-'+id);
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
._invbrd{border:1px solid white;}
._brd{border:1px dashed grey;}
._brdred{border:1px dotted red;}
.add{color:green;border-bottom:1px dashed green;}
</style>
