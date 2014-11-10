<?php

abstract class AbstractModule
{
	public $db;
	public $Site;
	public $Reg;
	public $Request;

	public $template = 'start';

	public function __construct()
	{
		$this->Site = Site::instance();
		$this->db = $this->Site->db;
		$this->Reg = $this->Site->Reg;
		$this->Request = $this->Site->Request;
	}
}
