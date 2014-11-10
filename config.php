<?php

$Request = Request::instance();

define("DS", DIRECTORY_SEPARATOR);
define("US", "/");
define("HOME", dirname(__FILE__) . DS);
define("URL", $Request->getHTTPHost() . US);
define("ADMIN_PATH", 'admin' . DS);

define("TEMPLATES", HOME . 'design' . DS . '!xsl' . DS);


///данные для базы данных
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'vine');


///типы пользователй
$usertypes = Array(
    'guest',
    'user',
   	'admin',
   	'developer'
);
///

$blocktypes = array(
	'top',
	'bottom',
	'left',
	'right',
);

function __autoload($class_name)
{
    $path =  dirname(__FILE__) . DIRECTORY_SEPARATOR . 'classes'. DIRECTORY_SEPARATOR .$class_name;
    require_once $path.".php";
}
