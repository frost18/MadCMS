<?


define('DB_SERVER', "localhost");
define('DB_USER', "root");
define('DB_PASS', "");
define('DB_DATABASE', "mebel");


$db = Database::obtain(DB_SERVER, DB_USER, DB_PASS, DB_DATABASE);

$db->connect();
$db->query( "SET NAMES 'utf8'");
$db->query( "SET character_set_client = utf8");
$db->query( "SET character_set_connection = utf8");
$db->query( "SET character_set_results = utf8");




?>