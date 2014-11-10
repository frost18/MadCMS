<? session_start();

header('Content-Type: text/html; charset=UTF-8', true);
header('Cache-Control: no-cache');

include '../../classes/Database.php';
include '../db.php';


/////////////

if(isset($_GET['action']))
{
	if(isset($_GET['id']))
	{
		$db->query("delete from langvars where  id= '".$_GET['id']."' ");
		header('LOCATION: ../langvars.php');
	}
}
if(isset($_POST['action']))
{
	if($_POST['action']=='add')
	{

       foreach($_POST['lang'] as $k=>$v){

	       $data['link']=$_POST['link'];
    	   $data['val']=$_POST['val'][$k];
    	   	$data['lang']=$_POST['lang'][$k];
	       	$data['idmodules']=$_POST['idmodules'];
	       	if($data['val']=='' and $data['lang']==''){

           	$db->query('delete from langvars where id = "'.$_POST['ids'][$k].'" ');

           continue;
           }

           $q=$db->query("select id from langvars where link = '".$_POST['link']."' and lang= '".$_POST['lang'][$k]."' and idmodules = '".$_POST['idmodules']."' ");
	         $r = $db->fetch($q);
	         if(((int)$r['id'])==0)
	         {
       	 $primary_id = $db->insert("langvars", $data);
       	 }
       	 else
       	 {


       		 $primary_id = $db->update("langvars", $data,'id='.$r['id']);
       	 }
       	 unset($data);
       }


	}
	header('LOCATION: ../langvars.php?idmod='.(int)$_POST['idmodules']);

}

?>