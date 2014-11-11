-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.5.35-log - MySQL Community Server (GPL)
-- ОС Сервера:                   Win32
-- HeidiSQL Версия:              8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры для таблица vine.catalog
CREATE TABLE IF NOT EXISTS `catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `pid` (`page_id`),
  KEY `date` (`date`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "catalog"
#

/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` VALUES (1,0,'0000-00-00 00:00:00','sdfsdf','active'),(2,0,'0000-00-00 00:00:00','sdfsdfas','active'),(3,0,'0000-00-00 00:00:00','dfsdfgsdfg','active'),(4,0,'0000-00-00 00:00:00','sdfgsdfgsdf','active');
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;

#
# Structure for table "category"
#

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `module` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(50) NOT NULL,
  `use_editor` tinyint(1) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `length` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `module` (`module`),
  KEY `date` (`date`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Дамп данных таблицы vine.fields: 0 rows
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;


#
# Structure for table "goods"
#

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_id` int(11) DEFAULT NULL,
  `marker` enum('hot,','bestprice') DEFAULT NULL,
  `marker_color` enum('yellow','orange') DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `old_price` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "goods"
#

/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,NULL,NULL,NULL,123,NULL,'dfgd','1'),(2,NULL,NULL,NULL,1231,NULL,'dfgsdfg','1'),(3,NULL,NULL,NULL,123,NULL,'sdfg','2');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

#
# Structure for table "lang"
#

DROP TABLE IF EXISTS `lang`;
CREATE TABLE `lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  `pid` int(11) DEFAULT NULL,
  `module` varchar(255) DEFAULT 'site',
  `ln` varchar(3) DEFAULT 'ru',
  PRIMARY KEY (`Id`),
  KEY `key` (`key`),
  KEY `pid` (`pid`),
  KEY `module` (`module`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы vine.lang: 4 rows
/*!40000 ALTER TABLE `lang` DISABLE KEYS */;
REPLACE INTO `lang` (`Id`, `key`, `value`, `pid`, `module`, `ln`) VALUES
	(1, 'title', 'О компании', 1, 'pages', 'ru'),
	(2, 'text', 'Есть несколько подводных камней, которых следует остерегаться. До версии PHP 5.1.0, instanceof вызывал __autoload() если имя класса не существовало. Вдобавок, если класс не был загружен, происходила фатальная ошибка. Это можно было обойти с помощью динамической ссылки на класс или использования строковой переменной с именем класса:', 1, 'pages', 'ru'),
	(3, 'title', 'About', 1, 'pages', 'en'),
	(4, 'text', 'There are some pitfalls to watch out for. Prior to version PHP 5.1.0, instanceof caused __autoload () if the class name does not exist. In addition, if the class was not loaded, a fatal error occurs. This can be circumvented by using a dynamic reference to a class or using a string variable with the name of the class:', 1, 'pages', 'en');
/*!40000 ALTER TABLE `lang` ENABLE KEYS */;


-- Дамп структуры для таблица vine.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `position` varchar(50) NOT NULL,
  `pages` text NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `position` (`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Дамп данных таблицы vine.menus: 0 rows
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;


-- Дамп структуры для таблица vine.pages
#

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `alias` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL,
  `edit_date` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `alias` (`alias`),
  KEY `pid` (`pid`),
  KEY `visible` (`status`),
  KEY `date` (`date`),
  KEY `edit_date` (`edit_date`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы vine.pages: 1 rows
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
REPLACE INTO `pages` (`Id`, `pid`, `module`, `status`, `alias`, `date`, `edit_date`) VALUES
	(1, 0, 'page', 'active', 'about', '2014-09-04 15:35:00', '2014-09-04 17:31:00');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;


-- Дамп структуры для таблица vine.photos
CREATE TABLE IF NOT EXISTS `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(250) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `module` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `module` (`module`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Дамп данных таблицы vine.photos: 0 rows
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;

DROP TABLE IF EXISTS `properties`;
CREATE TABLE `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `module` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(50) NOT NULL,
  `use_editor` tinyint(1) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `length` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `module` (`module`),
  KEY `date` (`date`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Дамп структуры для таблица vine.users
CREATE TABLE IF NOT EXISTS `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `fio` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `salt` (`salt`),
  KEY `email` (`email`),
  KEY `role` (`role`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы vine.users: 1 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`Id`, `email`, `fio`, `pass`, `salt`, `role`) VALUES
	(5, 'user2@user.ru', 'Сергей', '60a6a7d2c719c0048eba39be2f161cc6', '54212f3e64abd', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
