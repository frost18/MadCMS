<?php
include_once("../config.php");
$Admin = Site::instance()->admin_init('login');
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>MADCms: <?=$Admin->title?></title>
		<link type="text/css" rel="stylesheet" href="css/css.css" />
	</head>

	<body>
		<div>Шапка <?=$Admin->pagename?> страницы</div>
		<div>
