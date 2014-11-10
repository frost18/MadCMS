<?php


/*include '../classes/Database.php';
include 'db.php';*/

if(!isset($_SESSION['lang'])){
 	$_SESSION['lang']='rus';
}
if(isset($_GET['lang'])){
	  $_SESSION['lang']=$_GET['lang'];
}

define('LANG', $_SESSION['lang']);


function StartXml(){
	$xml = new DOMDocument('1.0', 'UTF-8');
	$site = $xml->createElement('site');
	$xml->appendChild($site);
	return Array($xml,$site);
}


function engine($fXsl,$xml){
// Объект исходного XML-документа
// Объект стиля

$xml->saveXML();

$xsl = new DOMDocument('1.0', 'UTF-8');
$xsl->load($fXsl);  // test.xsl создан в windows-1251

// Создание парсера
$proc = new XSLTProcessor();
// Подключение стиля к парсеру
$proc->importStylesheet($xsl);
// Обработка парсером исходного XML-документа
$parsed = $proc->transformToXml($xml);
// Вывод результирующего кода
return $parsed;
}

?>
