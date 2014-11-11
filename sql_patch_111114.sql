ALTER TABLE `pages`
	CHANGE COLUMN `visible` `status` ENUM('active','inactive') NULL DEFAULT NULL AFTER `module`;
ALTER TABLE `pages`
	CHANGE COLUMN `lang` `ln` ENUM('en','ru') NULL DEFAULT 'ru' AFTER `edit_date`;
ALTER TABLE `pages`
	ADD COLUMN `readonly` INT NULL DEFAULT '0' AFTER `ln`,
	ADD COLUMN `order` INT NULL DEFAULT '0' AFTER `readonly`,
	ADD COLUMN `nofollow` INT NULL DEFAULT '0' AFTER `order`,
	ADD COLUMN `new_window` INT NULL DEFAULT '0' AFTER `nofollow`,
	ADD COLUMN `custom_url` VARCHAR(255) NULL AFTER `new_window`;
DROP TABLE IF EXISTS `menu`;
ALTER TABLE `menus`
	CHANGE COLUMN `pages` `page_id` INT(11) NOT NULL AFTER `position`;
ALTER TABLE `menus`
	CHANGE COLUMN `page_id` `page_id` INT(11) NOT NULL DEFAULT '0' AFTER `position`;
ALTER TABLE `menus`
	DROP COLUMN `status`;
ALTER TABLE `menus`
	ADD COLUMN `parent_id` INT(11) NOT NULL DEFAULT '0' AFTER `page_id`;
ALTER TABLE `pages`
	CHANGE COLUMN `pid` `parent_id` INT(11) NULL DEFAULT NULL AFTER `id`;
ALTER TABLE `lang`
	CHANGE COLUMN `k` `key` VARCHAR(255) NULL DEFAULT NULL AFTER `id`,
	CHANGE COLUMN `pid` `parent_id` INT(11) NULL DEFAULT NULL AFTER `val`,
	CHANGE COLUMN `lang` `ln` VARCHAR(3) NULL DEFAULT 'rus' AFTER `module`;
ALTER TABLE `lang`
	CHANGE COLUMN `ln` `ln` VARCHAR(3) NULL DEFAULT 'ru' AFTER `module`;
DROP TABLE IF EXISTS `photo`;
