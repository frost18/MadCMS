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
include_once("../classes/Database.php");
include_once("config.php");



//Site::instance()->init();


if(!($_SESSION['user'])){
  //  header("LOCATION: /admn/login.php");
    
}

fopen()
