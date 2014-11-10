<?php include 'header.php';?>

<link xmlns="" href="css/splash.css" rel="stylesheet" type="text/css"/>
<script xmlns="" type="text/javascript" src="js/splash.js"></script>

<table xmlns="" width="350" border="1" id="splash" style="display:none;height:150px">
	<tr style="height:20px" >
		<td bgcolor="#ffcc00" id="dragLine">
			<input type="button" value="Закрыть" onclick="closeSplash()"/>
		</td>
	</tr>
	<tr>
		<td id="SpIn" bgcolor="#fff"></td>
	</tr>
	<tr style="height:20px">
		<td bgcolor="#ffcc00"></td>
	</tr>
</table>
<link xmlns="" href="css/map.css" rel="stylesheet" type="text/css"/>
<script xmlns="" type="text/javascript" src="js/map.js"></script>
<script xmlns="">
	function removeItem(id) {
		if (confirm("Удалить")) {
			$.ajax({
				type: 'POST',
				url: '/admin/ajax/map.remove.php',
				data: 'id=' + id,
				success: function (data) {
					if (data == 'ok') {
						$('#item' + id).hide('slow');
//   				 $('#item'+id).remove();
					} else {
						alert('Произошла ошибка! Попробуйте обновить страницу!');
					}
				}
			});
		}
	}
	$(document).ready(function () {
		$('#badd').click(function () {
			$('#add').show();
		});
	});


	function _close() {
		$('#add').hide();
	}
</script>
<hr xmlns=""/>
<div xmlns="" align="center">
	<a href="/admin/"> На главную</a>
</div>
<hr xmlns=""/>
<h3 xmlns="" style="margin-bottom:0;">Основной блок меню</h3>
<a xmlns="" href="/admin/sections.php" style="font-size:80%;">- назад к выбору меню</a>
<br xmlns=""/>
<br xmlns=""/>
<div xmlns="" style="height:25px;width:100%" align="left">
	<a id="badd" style="border-bottom:1px dashed blue;color:blue;cursor:pointer; font-size:90%;">Добавить страницу</a>
	<br/>
</div>
<br xmlns=""/>
<div xmlns="" style="display:none;" id="add">
	<h3>Добавление нового раздела</h3>

	<form action="ajax/map.add.php" method="post">
		<ul>
			<li>
				<label>Название раздела: <input name="title" type="text" value=""/></label></li>
			<li>
				<label>Модуль:
				<select size="1" name="module">
					<option value="start">Главная стр.</option>
					<option value="text_content" selected="selected">Текстовый</option>
					<option value="admin_map">Карта админа</option>
					<option value="404">404</option>
					<option value="#">---</option>
					<option value="login">Логин</option>
					<option value="articles">Статьи</option>
					<option value="gallery">Галлерея</option>
					<option value="profile">Профайл</option>
					<option value="photos">фото</option>
					<option value="magazine">Магазин</option>
					<option value="items">товары</option>
					<option value="item">Товар</option>
					<option value="cart">Корзина</option>
					<option value="order">Заказ</option>
					<option value="registration">Регистрация</option>
					<option value="pagemag">Стартовая магазина</option>
					<option value="passremind">passremind</option>
					<option value="artsearch">artsearch</option>
					<option value="events">events</option>
					<option value="evtxt">evtxt</option>
					<option value="evphotos">evphotos</option>
					<option value="evgallery">evgallery</option>
					<option value="kigallery">kigallery</option>
					<option value="kiphotos">kiphotos</option>
					<option value="port">port</option>
					<option value="fabrics">fabrics</option>
				</select></label></li>
			<li>
				<label>Ссылка: <input name="link" type="text" value=""/></label></li>
			<li>
				<label>Привязываем текстовое поле к странице? <input name="cnt" type="checkbox" value="ON" checked="true"/></label>
			</li>
			<li> <label>Свой номер <input name="cntnum" type="text" value="-"/></label></li>
			<li> <label>Видимость страницы <select size="1" name="status">
				<option value="0" selected="selected">Скрыт</option>
				<option value="1">Включен</option>
			</select></label></li>
			<li> <input type="hidden" name="id_navi" value="1"/><input type="hidden" name="id_sections"
			                                                                    value="2"/></li>
			<li>
				<label>Родительский раздел

				<select size="1" name="parent">
					<option value="0">---</option>
					<option value="389">Каталог мебели</option>
					<option value="728"> - item</option>
					<option value="735"> - Гостинные</option>
					<option value="737"> - Мягкая мебель</option>
					<option value="739"> - Спальни</option>
					<option value="741"> - Детская мебель</option>
					<option value="743"> - Кухни</option>
					<option value="745"> - Свет и аксессуары</option>
					<option value="747"> - Мебель для ванной</option>
					<option value="750"> - Мебель по фабрикам</option>
					<option value="405">Контакты</option>
					<option value="408">О Компании</option>
					<option value="703">Дизайн студия</option>
				</select></label></li>
			<li><input type="submit" value="Добавить"/><input type="button" value="Закрыть" onClick="_close()"/></li>
		</ul>
	</form>
</div>
<ul xmlns="">
	<li id="item389"><img src="img/ar.png"/> Каталог мебели<a style="color:green;font-size:12px;"
	                                                                        href="/admin/ajax/map.cnt.remove.php?id_route=389">

			(730)


		</a><span></span><a class="icons_link" target="_balnk" href="/catalog"><img
				src="img/for.png"/></a><span></span><a href="/admin/details.php?id=389"><img
				src="img/edit.png" style="width:16px;" align="texttop"/></a><span></span><a
			style="cursor:pointer;" href="/admin/ajax/showhide.php?id=389&amp;vtype=1"><img
				src="img/1.png"/></a><span></span><a class="icons_link" onclick="removeItem(389)"><img
				src="img/del.png"/></a>
		<ul style="margin-top:15px;">
			<li id="item728"><img src="img/artop.png"/> item<a style="color:green;font-size:12px;"
			                                                                 class="icons_link"
			                                                                 href="/admin/ajax/map.cnt.remove.php?id_route=728">
					(1048)</a><span></span><a class="icons_link" target="_balnk" href="/catalog/item"><img
						src="img/for.png"/></a><span></span><a href="/admin/details.php?id=728"><img
						src="img/edit.png" style="width:16px;" align="texttop"/></a><span></span><a
					style="cursor:pointer;" href="/admin/ajax/showhide.php?id=728&amp;vtype=1"><img
						src="img/1.png"/></a><span></span><a style="color:red;font-size:12px;"
			                                                         class="icons_link" onclick="removeItem(728)"><img
						src="img/del.png"/></a>
				<ul style="margin-top:15px;"></ul>
			</li>
			<li id="item735"><img src="img/artop.png"/> Гостинные<a style="color:green;font-size:12px;"
			                                                                      class="icons_link"
			                                                                      href="/admin/ajax/map.cnt.remove.php?id_route=735">
					(1054)</a><span></span><a class="icons_link" target="_balnk" href="/catalog/halls"><img
						src="img/for.png"/></a><span></span><a href="/admin/details.php?id=735"><img
						src="img/edit.png" style="width:16px;" align="texttop"/></a><span></span><a
					style="cursor:pointer;" href="/admin/ajax/showhide.php?id=735&amp;vtype=1"><img
						src="img/1.png"/></a><span></span><a style="color:red;font-size:12px;"
			                                                         class="icons_link" onclick="removeItem(735)"><img
						src="img/del.png"/></a>
				<ul style="margin-top:15px;"></ul>
			</li>
			<li id="item737"><img src="img/artop.png"/> Мягкая мебель<a
					style="color:green;font-size:12px;" class="icons_link"
					href="/admin/ajax/map.cnt.remove.php?id_route=737">
					(1055)</a><span></span><a class="icons_link" target="_balnk" href="/catalog/sofas"><img
						src="img/for.png"/></a><span></span><a href="/admin/details.php?id=737"><img
						src="img/edit.png" style="width:16px;" align="texttop"/></a><span></span><a
					style="cursor:pointer;" href="/admin/ajax/showhide.php?id=737&amp;vtype=1"><img
						src="img/1.png"/></a><span></span><a style="color:red;font-size:12px;"
			                                                         class="icons_link" onclick="removeItem(737)"><img
						src="img/del.png"/></a>
				<ul style="margin-top:15px;"></ul>
			</li>
			<li id="item739"><img src="img/artop.png"/> Спальни<a style="color:green;font-size:12px;"
			                                                                    class="icons_link"
			                                                                    href="/admin/ajax/map.cnt.remove.php?id_route=739">
					(1056)</a><span></span><a class="icons_link" target="_balnk" href="/catalog/bedrooms"><img
						src="img/for.png"/></a><span></span><a href="/admin/details.php?id=739"><img
						src="img/edit.png" style="width:16px;" align="texttop"/></a><span></span><a
					style="cursor:pointer;" href="/admin/ajax/showhide.php?id=739&amp;vtype=1"><img
						src="img/1.png"/></a><span></span><a style="color:red;font-size:12px;"
			                                                         class="icons_link" onclick="removeItem(739)"><img
						src="img/del.png"/></a>
				<ul style="margin-top:15px;"></ul>
			</li>
			<li id="item741"><img src="img/artop.png"/> Детская мебель<a
					style="color:green;font-size:12px;" class="icons_link"
					href="/admin/ajax/map.cnt.remove.php?id_route=741">
					(1057)</a><span></span><a class="icons_link" target="_balnk" href="/catalog/kids"><img
						src="img/for.png"/></a><span></span><a href="/admin/details.php?id=741"><img
						src="img/edit.png" style="width:16px;" align="texttop"/></a><span></span><a
					style="cursor:pointer;" href="/admin/ajax/showhide.php?id=741&amp;vtype=1"><img
						src="img/1.png"/></a><span></span><a style="color:red;font-size:12px;"
			                                                         class="icons_link" onclick="removeItem(741)"><img
						src="img/del.png"/></a>
				<ul style="margin-top:15px;"></ul>
			</li>
			<li id="item743"><img src="img/artop.png"/> Кухни<a style="color:green;font-size:12px;"
			                                                                  class="icons_link"
			                                                                  href="/admin/ajax/map.cnt.remove.php?id_route=743">
					(1058)</a><span></span><a class="icons_link" target="_balnk" href="/catalog/kitchens"><img
						src="img/for.png"/></a><span></span><a href="/admin/details.php?id=743"><img
						src="img/edit.png" style="width:16px;" align="texttop"/></a><span></span><a
					style="cursor:pointer;" href="/admin/ajax/showhide.php?id=743&amp;vtype=1"><img
						src="img/1.png"/></a><span></span><a style="color:red;font-size:12px;"
			                                                         class="icons_link" onclick="removeItem(743)"><img
						src="img/del.png"/></a>
				<ul style="margin-top:15px;"></ul>
			</li>
			<li id="item745"><img src="img/artop.png"/> Свет и аксессуары<a
					style="color:green;font-size:12px;" class="icons_link"
					href="/admin/ajax/map.cnt.remove.php?id_route=745">
					(1059)</a><span></span><a class="icons_link" target="_balnk" href="/catalog/lightsandacces"><img
						src="img/for.png"/></a><span></span><a href="/admin/details.php?id=745"><img
						src="img/edit.png" style="width:16px;" align="texttop"/></a><span></span><a
					style="cursor:pointer;" href="/admin/ajax/showhide.php?id=745&amp;vtype=1"><img
						src="img/1.png"/></a><span></span><a style="color:red;font-size:12px;"
			                                                         class="icons_link" onclick="removeItem(745)"><img
						src="img/del.png"/></a>
				<ul style="margin-top:15px;"></ul>
			</li>
			<li id="item747"><img src="img/artop.png"/> Мебель для ванной<a
					style="color:green;font-size:12px;" class="icons_link"
					href="/admin/ajax/map.cnt.remove.php?id_route=747">
					(1060)</a><span></span><a class="icons_link" target="_balnk" href="/catalog/bath"><img
						src="img/for.png"/></a><span></span><a href="/admin/details.php?id=747"><img
						src="img/edit.png" style="width:16px;" align="texttop"/></a><span></span><a
					style="cursor:pointer;" href="/admin/ajax/showhide.php?id=747&amp;vtype=1"><img
						src="img/1.png"/></a><span></span><a style="color:red;font-size:12px;"
			                                                         class="icons_link" onclick="removeItem(747)"><img
						src="img/del.png"/></a>
				<ul style="margin-top:15px;"></ul>
			</li>
			<li id="item750"><img src="img/artop.png"/> Мебель по фабрикам<a
					style="color:green;font-size:12px;" class="icons_link"
					href="/admin/ajax/map.cnt.remove.php?id_route=750">
					(1062)</a><span></span><a class="icons_link" target="_balnk" href="/catalog/fabrics"><img
						src="img/for.png"/></a><span></span><a href="/admin/details.php?id=750"><img
						src="img/edit.png" style="width:16px;" align="texttop"/></a><span></span><a
					style="cursor:pointer;" href="/admin/ajax/showhide.php?id=750&amp;vtype=1"><img
						src="img/1.png"/></a><span></span><a style="color:red;font-size:12px;"
			                                                         class="icons_link" onclick="removeItem(750)"><img
						src="img/del.png"/></a>
				<ul style="margin-top:15px;"></ul>
			</li>
		</ul>
	</li>
	<li id="item405"><img src="img/ar.png"/> Контакты<a style="color:green;font-size:12px;"
	                                                                  href="/admin/ajax/map.cnt.remove.php?id_route=405">

			(746)


		</a><span></span><a class="icons_link" target="_balnk" href="/contacts"><img
				src="img/for.png"/></a><span></span><a href="/admin/details.php?id=405"><img
				src="img/edit.png" style="width:16px;" align="texttop"/></a><span></span><a
			style="cursor:pointer;" href="/admin/ajax/showhide.php?id=405&amp;vtype=1"><img
				src="img/1.png"/></a><span></span><a class="icons_link" onclick="removeItem(405)"><img
				src="img/del.png"/></a></li>
	<li id="item408"><img src="img/ar.png"/> О Компании<a style="color:green;font-size:12px;"
	                                                                    href="/admin/ajax/map.cnt.remove.php?id_route=408">

			(749)


		</a><span></span><a class="icons_link" target="_balnk" href="/about"><img
				src="img/for.png"/></a><span></span><a href="/admin/details.php?id=408"><img
				src="img/edit.png" style="width:16px;" align="texttop"/></a><span></span><a
			style="cursor:pointer;" href="/admin/ajax/showhide.php?id=408&amp;vtype=1"><img
				src="img/1.png"/></a><span></span><a class="icons_link" onclick="removeItem(408)"><img
				src="img/del.png"/></a></li>
	<li id="item703"><img src="img/ar.png"/> Дизайн студия<a style="color:green;font-size:12px;"
	                                                                       href="/admin/ajax/map.cnt.remove.php?id_route=703">

			(1034)


		</a><span></span><a class="icons_link" target="_balnk" href="/design_studio"><img
				src="img/for.png"/></a><span></span><a href="/admin/details.php?id=703"><img
				src="img/edit.png" style="width:16px;" align="texttop"/></a><span></span><a
			style="cursor:pointer;" href="/admin/ajax/showhide.php?id=703&amp;vtype=1"><img
				src="img/1.png"/></a><span></span><a class="icons_link" onclick="removeItem(703)"><img
				src="img/del.png"/></a></li>
</ul>
<p xmlns="">
	<br/>
</p>
<p xmlns="">
	<br/>
</p>

<?php include "footer.php";?>



















<?
/*
$res=StartXML();
$xml=$res[0];
$site=$res[1];
$navi=($_GET['show']=='nav')?1:0;
unset($res);

     $b=Array();
$q1=$db->query("select * from text_content where lang = '".LANG."' and id_route_map > 0 ");
while ($r1 = $db->fetch($q1)) {
	$b[$r1['id_route_map']]=$r1['id'];
	}


$sec=0;
$id_sec=0;
if(isset($_GET['id_sections'])){
    
    $sec=($_GET['id_sections']==2)?'Основной блок меню':'Верхний блок';
    $id_sec=(int)$_GET['id_sections'];
}



      $service=$xml->createElement('service');
      $service->setAttribute('navi',$navi);       
            $service->setAttribute('sec',$sec);
             if($_GET['show']=='left'){
                $service->setAttribute('left',1);
                }
            $service->setAttribute('id_sec',$id_sec);      
      $site->appendChild($service);
  
        

      $show=(isset($_GET['show']))?($_GET['show']=='nav')?'and routetype = "nav" and id_sections = '.(int)$_GET['id_sections']:'and routetype != "nav"':'';
      if($_GET['show']=='left'){
        
        $show="and routetype='left' or mag='www'";
      }
      $xshow=$xml->createElement('xshow',(isset($_GET['show']))?$_GET['show']:'none');
      $site->appendChild($xshow);

$li=0;
$map=$xml->createElement('map');
$q=$db->query("select * from route_map where lang = '".LANG."' ".$show."");

while ($r = $db->fetch($q)) {    
$title=$r['title'];

if($_GET['show']!='nav'){
    
    $r1=$db->query_first("select header from text_content where id_route_map = '".$r['id']."'  ");
    if($r1['header']!=''){
        $title=$r1['header'];
    }
}
    
$a=(isset($b[$r['id']]))?$b[$r['id']]:0;
       $item=$xml->createElement('item');
       $item->setAttribute('id',$r['id']);
          $item->setAttribute('vis',$r['vis']);
                   $item->setAttribute('mag',$r['mag']);
       $item->setAttribute('idcnt',$a);
       $item->setAttribute('parent',$r['parent']);
       $item->setAttribute('lang',$r['lang']);
       $item->setAttribute('text_content',$r['text_content']);
       $item->appendChild($xml->createElement('title', $title));
       $item->appendChild($xml->createElement('link', $r['link']));
		$map->appendChild($item);
	}
$site->appendChild($map);


$mods=$xml->createElement('mods');
$q=$db->query("select * from modules");
while ($r = $db->fetch($q)) {
       $item=$xml->createElement('item');
 		$item->appendChild($xml->createElement('title', $r['title']));
       $item->appendChild($xml->createElement('name', $r['name']));
		$mods->appendChild($item);
	}
$site->appendChild($mods);



//print $xml->saveXML();

print Engine('design/xsl/map.xsl',$xml)

*/




