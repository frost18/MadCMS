<?php

class Lang
{
	static public $ln = "ru";

	static public function init($ln = null)
	{
		if (!empty($ln))
		{
			self::setLn($ln);
		}
	}

	static public function __()
	{
		global $db;

		$sql ="";


	}

	static private function setLn($ln)
	{
		self::$ln = $ln;
	}

	static public function getLang()
	{

	}

	static public function get($key = 'all', $module = 'site')
	{
		global $db;

		if ($key = 'all')
		{
			$sql = "SELECT `key`, `value` FROM `lang` WHERE `module` = ?s AND ln = ?s";
			$arr = $db->getIndCol($sql, $module, self::$ln);

			return $arr;
		} else {
			return $key;
		}
	}
}
