<?
session_start();
header('Content-Type: text/html; charset=UTF-8', true);

include_once("../config.php");

include_once("../../classes/Database.php");
$db=new Database;

$nl_char="\n";
$arr=explode($nl_char,$_POST['newcat']); 
$it=Array();
foreach($arr as $line_num => $line){
    $i=strip_tags(trim($line));
    $it[]=$i;
    $sql  = "INSERT INTO category SET name = :s";
    $db->query($sql,$i);
}

header("LOCATION: /admn/category.php");
    
    
?>