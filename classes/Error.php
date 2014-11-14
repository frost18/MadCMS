<?php

class Error
{
	public $template = 'error';
	public $Site;

	protected static $_instance;

	public static function instance()
	{
        if (is_null(self::$_instance))
        {
            self::$_instance = new self();
        }

		return self::$_instance;
    }

	private function __clone(){}

	private function __construct()
	{
		$this->Reg = Site::instance()->factory('Reg');
	}

	public function error404()
	{
		$this->Reg->add(array(
			"content" => array(
				"page" => array(
					"title" => "Error 404",
					"text" => "Такой страницы нет."
				)
			)
		));
	}
}
