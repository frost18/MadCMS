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
		SELECT p.id as page_id, p.alias, p.pid, p.date, p.edit_date, l.key, l.value
			FROM pages AS p
			LEFT JOIN lang AS l
				ON l.pid = p.id
			WHERE p.alias = :s AND p.visible = :s AND l.ln = :s
		";

		$tmp_data = $this->db->getAll($sql, $alias, 1, Lang::$ln);

		$page = $tmp_data[0];
		unset($page['key'], $page['value']);

		foreach ($tmp_data as $row)
		{
			$page[$row['key']] = $row['value'];
		}

		return $page;
	}
}
