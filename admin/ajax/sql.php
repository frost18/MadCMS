<?
header('Content-Type: text/html; charset=UTF-8', true);
//header('Content-type: application/json; charset=utf-8');
header('Cache-Control: no-cache');

include '../../classes/Database.php';
include '../db.php';


?>


  <form name="" action="" method="post">
  <input name="action" type="hidden" value="12312">
  <textarea name="t1" ><? if(isset($_POST['t1'])){print $_POST['t1'];}?></textarea>

  <textarea name="t2" ><? if(isset($_POST['t2'])){print $_POST['t2'];}?></textarea>
  <input type="submit" value="Send"/>

</form>

<?
if(isset($_POST['action'])){


$s='select';
$t='tb_base';

$q=$db->query($s." ".$_POST['t1']." from ".$t." ".$_POST['t2']);
while ($r = $db->fetch($q)) {
print '<p>';var_dump($r);print '</p>';
	}

}

?>