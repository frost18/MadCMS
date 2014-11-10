<?php
include_once("header.php");
?>
<head>
<link href="/admin/design/style/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div align="left" style="padding:10px 10px 10px 100px;">
<!--div style="color:#333333;" id="langs">
Выберите язык:
<a
<? if($_SESSION['lang']!='eng'){ print 'href="?lang=eng"';}else{print 'style="color:#000000;font-size:22px;background-color:#EFC;"';}?>>Eng</a>

<a <? if($_SESSION['lang']!='rus'){ print 'href="?lang=rus"';}else{print 'style="color:#000000;font-size:22px;background-color:#EFC;"';}?>>Rus 
</a>

<a <? if($_SESSION['lang']!='kaz'){ print 'href="?lang=kaz"';}else{print 'style="color:#000000;font-size:22px;background-color:#EFC;"';}?>>Kaz
</a>
</div-->

<ul>    
	<li><a href="map.php?show=notnav">Страницы сайта</a></li>
    <!--li><map.php?show=nava href="sections.php">Секции</a></li-->
    <li><a href="map.php?show=nav&id_sections=2">Меню сайта</a></li>
    <li><a href="map.php?show=left">Разделы магазина</a></li>
    <!--li><a href="news.php">Новости</a></li-->
	<!--li><a href="cnt.php">Контент</a></li-->
	<li><a href="/zed/!_dump.php" target="_blank">Резервное копирование и восстановление БД</a></li>
	<li><a href="https://metrika.yandex.ru/stat/dashboard/?counter_id=21928051" target="_blank">Статистика посещаемости</a></li>
</ul>

</div>
</body>
<?
include('footer.php');
?>
