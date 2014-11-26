<?php

class Page extends AbstractModule
{

	public $template = 'page';

	public function show($params = array())
	{
		$alias = trim($params['alias'], "/");
		if (empty($alias))
		{
			$alias = '/';
		}

		$data = $this->getOnePage($alias);

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
		SELECT p.*, l.k, l.val, f.path, f.date, f.id as photo_id, f.parent_id, f.module
			FROM pages AS p
			LEFT JOIN lang AS l
				ON l.parent_id = p.id
			LEFT JOIN photos AS f
				ON f.parent_id = p.id
			WHERE p.alias = :s AND p.status = :s AND l.ln = :s
		";

		$tmp_data = $this->db->getAll($sql, $alias, 'active', Lang::$ln, 'deb');

		$page = $this->Site->prepareData($tmp_data, true);

		switch ($page['module'])
		{
			case 'articles':
				$page['childs'] = $this->getChilds($page['id']);
				$this->template = 'articles';
			break;

			case 'article':
				$this->template = 'article';
			break;

			case 'newsall':
			case 'news':
			case 'gallery':
				break;

			default:
				break;
		}


		return $page;
	}

	public function getChilds($ids)
	{
		if (is_array($ids))
		{
			$ids = implode(",", $ids);
		}

		$sql = "SELECT p.*, l.k, l.val
 				FROM pages as p LEFT JOIN lang as l ON p.id = l.parent_id
				WHERE p.parent_id IN (:s) AND p.status = :s AND l.k != :s";

		$data = $this->db->getAll($sql, $ids, 'active', 'text');

		$items = $this->Site->prepareData($data);

		return $items;
	}

}
