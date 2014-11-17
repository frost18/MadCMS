<?php

Class Menu extends AbstractModule
{
	public function initMenus()
	{
		$data = $this->getMenus();
		$menu = array();

		if (!empty($data))
		{
			foreach ($data as $key => $menu)
			{
				$menu[]=Array(
					'__attr' => Array(
						Array('__k'=>'id','__v'=>$menu['id']),
						Array('__k'=>'parent','__v'=>$menu['parent']),
				        Array('__k'=>'position','__v'=>$menu['position']),
				        Array('__k'=>'page_id','__v'=>$menu['page_id'])
					),
					'title'=>$menu['name'],
					'link'=>(!empty($menu['custom_url']) ? $menu['custom_url'] : $this->Router->generate($menu['alias']))
				);
			}
		}

		$this->Reg->add(array(
			'content' => array(
				'menus' => $menu
			)
		));
		var_dump($menu);
	}

	public function getMenus()
	{
		$sql = "SELECT * FROM `menus` as m LEFT JOIN `pages` as p ON p.`id` = m.`page_id`
				WHERE p.`status` = :s AND m.`ln` = :s";

		$data = $this->db->getAll($sql, 'active', Lang::$ln);

		return $data;
	}


}
