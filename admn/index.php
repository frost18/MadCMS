<?php
include_once("config.php");

session_name('dm_' . substr(md5(URL), 0, 10));
session_start();
header('Content-Type: text/html; charset=UTF-8', true);

//Site::instance()->init();


if(!($_SESSION['user'])){
  //  header("LOCATION: /admn/login.php");
    
}
