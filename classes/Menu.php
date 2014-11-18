<?php

Class Menu extends AbstractModule
{
	public function initMenus()
	{
		$data = $this->getMenus();
		$menu = array();

		if (!empty($data))
		{
			foreach ($data as $key => $m)
			{
				$menu[$m['id']]=Array(
					'__attr' => Array(
						Array('__k'=>'id','__v'=>$m['id']),
						Array('__k'=>'parent','__v'=>$m['parent']),
				        Array('__k'=>'position','__v'=>$m['position']),
				        Array('__k'=>'page_id','__v'=>$m['page_id']),
				        Array('__k'=>'order','__v'=>$m['order'])
					),
					'title'=>$m['name'],
					'link'=>(!empty($m['custom_url']) ? $m['custom_url'] : $this->Router->generate($m['alias']))
				);
			}
		}

		$this->Reg->add(array(
			'content' => array(
				'menus' => $menu
			)
		));
		echo "<pre><!--";
		var_dump($this->Reg->getData());
		echo "--></pre>";
	}

	public function getMenus()
	{
		$sql = "SELECT * FROM `menus` as m LEFT JOIN `pages` as p ON p.`id` = m.`page_id`
				WHERE p.`status` = :s AND m.`ln` = :s ORDER BY m.`order` ASC";

		$data = $this->db->getAll($sql, 'active', Lang::$ln);

		return $data;
	}


}
