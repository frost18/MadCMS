<?php

//$Request = Request::instance();

define("DS", DIRECTORY_SEPARATOR);
define("US", "/");
define("HOME", dirname(__FILE__) . DS);
//define("URL", $Request->getHTTPHost() . US);
define("ADMIN_PATH", 'admin' . DS);

define("TEMPLATES", HOME . 'design' . DS . '!xsl' . DS);


///данные для базы данных
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'vine');

$db=new Database;



function gln($id,$key,$module, $lang){
    global $db;
    $sql='SELECT val FROM lang WHERE pid = :i and k =:s and module = :s and  lang = :s';
    //print $db->parse($sql,$id,$key, $module, $lang);    
    $v = $db->getOne($sql,$id,$key, $module, $lang);
    
  //  print $v.'-----';
    return $v;
}

/*
function fmaker($id,$key,$module, $lang){
    
    $res=gln($id,$key,$module, $lang);
    
    print "name = '".$key."' value='".$res."' ";
}





function __autoload($class_name)
{
    
    $path =  dirname(__FILE__) . DIRECTORY_SEPARATOR . 'classes'. DIRECTORY_SEPARATOR .$class_name;
    require_once $path.".php";
}


*/