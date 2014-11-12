<?php

class Error extends AbstractModule
{
	public $template = 'error';

	function error404()
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
