<?php

class Image extends AbstractModule
{
	public $template = 'page';

	public function getImages($id)
	{
		$sql = "SELECT * FROM photos as f WHERE f.parent_id = :i";

		$images = $this->db->getAll($sql, $id);

		$this->Reg->add(array(
			"content" => array(
				"page" => array(
					"images" => $this->prepareImages($images)
				)
			)
		));
	}

	public function prepareImages($images)
	{
		foreach ($images as $key => $image)
		{
			$images[$key]['link'] = $this->Router->generate($image['path'], 'empty');
		}
		return $images;
	}
}
