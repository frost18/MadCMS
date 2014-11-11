<?
session_start();
header('Content-Type: text/html; charset=UTF-8', true);

include_once("../config.php");

include_once("../../classes/Database.php");
$db=new Database;

if(isset($_POST['id'])){


$sql  = "DELETE FROM category WHERE id = :i ";
$db->query($sql,$_POST['id']);    
print 'ok';
    
}

if(isset($_POST['group'],$_POST['x'])){
    
    foreach($_POST['x'] as $k=>$v){
        if((int)$v){
            
            $sql  = "DELETE FROM category WHERE id = :i ";
            $db->query($sql,$v);  
            
        }
        
    }
    header("LOCATION: /admn/category.php");
}


        
    
    
?>