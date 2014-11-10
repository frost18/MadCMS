<?php

/**
 * Class Registry
 *
 * класс для работы с хранилищем данных для XML обработчика.
 *
 */
final class Reg
{
	/* массив с данными для XML обработчика */
    private $data = array();

	/**
	 * возвращает елемент массива из хранилища данных
	 *
	 * @param $str string строка-путь вида "level1/level2/level3"
	 * @return string|array|bool
	 */
	public function get($str)
	{
		$path = explode("/", $str);

		if (!empty($path))
		{
			$current_key = $this->data;
			foreach(array_keys($path) as $key)
			{
			    $current_key = $current_key[$path[$key]];
			}
			return $current_key;
		}
		return false;
	}

	/**
	 * Добавление/изменение данных в хранилище
	 *
	 * @param $arr array массив для добавления в хранилище
	 * @return bool
	 */
	public function add($arr)
	{
		$data = array();

		if (is_array($arr) && !empty($arr))
		{
			$data = array_replace_recursive($this->data, $arr);
			if ($data != NULL)
			{
				$this->data = $data;
				return true;
			}
		}
		return false;
	}

	/**
	 * Возвращает массив с данными из хранилища
	 *
	 * @return array
	 */
	public function getData()
	{
		return $this->data;
	}
}
