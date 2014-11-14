<?php

class Page extends AbstractModule
{

	public $template = 'page';

	public function show($params)
	{
		if (!empty($params['alias']))
		{
			$data = $this->getOnePage($params['alias']);
		}

		if (!empty($data))
		{
			$this->Reg->add(array(
				"content" => array(
					"page" => $data
				)
			));
		} else {
			Error::instance()->error404();
		}
	}

	public function exists($alias)
	{
		$sql = "SELECT 1 FROM pages WHERE alias = :s";
		$res = $this->db->query($sql, $alias);

		return (bool) $this->db->numRows($res);
	}

	public function add()
	{

	}

	public function del()
	{

	}

	public function getOnePage($alias)
	{
		$sql = "
		SELECT p.id as page_id, p.alias, p.parent_id, p.date, p.edit_date, l.key, l.val
			FROM pages AS p
			LEFT JOIN lang AS l
				ON l.parent_id = p.id
			WHERE p.alias = :s AND p.status = :s AND l.ln = :s
		";

		$tmp_data = $this->db->getAll($sql, $alias, 'active', Lang::$ln);

		$page = $tmp_data[0];
		unset($page['key'], $page['val']);

		foreach ($tmp_data as $row)
		{
			$page[$row['key']] = $row['val'];
		}
		return $page;
	}
}
