<?php
/*
 * маршруты приложения
 * array("имя маршрута", "паттерн", "класс:метод", "метод маршрута[GET|POST]")
 * в паттернах поддерживается следующие предустановленные правила
 * num - числовое значение
 * str - буквенное значение + символы(.-_%)
 * any - числовое и/или буквенное + символы(.-_%)
 */
return array(
	array('main', '/', 'page:show', 'GET'),
	array('main_ln', '/(ln:str2)', 'page:show', 'GET'),
	array('page', '/(ln:str2)/page/(alias:any)', 'page:show', 'GET|POST'),
	array('pages', '/pages', 'page:show', 'GET|POST'),
	array('users', '/users', 'users:all', 'GET|POST'),
	array('user_pages', '/users/page(page:num)', 'users:all', 'GET|POST'),
	array('user', '/user/(id:num)', 'user:view', 'GET|POST'),
	array('user_edit', '/user/edit/(id:num)', 'users:edit', 'GET|POST'),
	array('user_del', '/user/del/(id:num)', 'users:del', 'GET|POST'),
	array('login', '/(ln:str2)/login', 'user:login', 'POST|GET'),
	array('logout', '/logout', 'user:logout', 'GET'),
	array('registration', '/(ln:str2)/register', 'user:register', 'GET|POST'),
);
