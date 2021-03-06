<?php

class Site
{
	protected $_instances = array();
	private static $_instance;

	public $Reg;
	public $db;
	public $Request;
	public $Router;
	public $Menu;
	public $Image;
	public $Admin;

	public $user;
	public $template = "start";

	public static function instance()
	{
        if (is_null(self::$_instance))
        {
            self::$_instance = new self();
        }

        return self::$_instance;
    }

	public function factory($className, $params = '')
	{
		$result = null;

		if (is_string($className))
		{
			if (isset($this->_instances[$className]))
			{
				$result = $this->_instances[$className];
			}
			else
			{
				$result = new $className($params);
				$this->_instances[$className] = $result;
			}
		}
		elseif (is_array($className))
		{
			$result = array();
			foreach($className as $name)
			{
				$result[] = $this->factory($name);
			}
		}
		return $result;
	}

	private function __construct() {}

	public function init()
	{
		$this->db = $this->factory('Database');
		$this->Request = Request::instance();
		$this->Router = $this->factory('Router', URL);
		$this->Reg = $this->factory('Reg');
		$this->Menu = $this->factory('Menu');
		$this->Image = $this->factory('Image');

		$module = null;

		$url_params = $this->parseUrl();
		//$this->Request->clearData();

		$this->Reg->add(array(
			'POST' => $_POST,
			'GET' => $_GET
		));

		/* инициализация языка по умолчанию */
		Lang::init(isset($url_params['params']['ln']) ? $url_params['params']['ln'] : '');

		/* инициализация обьекта User если есть авторизованный пользователь */
		$this->user = $this->factory('User');
		$this->user->init();

		if (!empty($url_params))
		{
			$module = $this->factory($url_params['class']);
			$module->$url_params['method']($url_params['params']);
		} else {
			Error::instance()->error404();
		}

		$this->Image->getImages($this->Reg->get('content/page/id'));


		$this->Menu->initMenus();

		//var_dump($this->template);
		$this->getTemplate($module);


		$this->Reg->add(array(
			"service" => array(
				"main_template" => $this->template
			)
		));

		/* сохраняем текущий путь */
		$this->Request->savePrevPath();

		$xp = TEMPLATES. $this->template .'.xsl';
		$x = $this->factory('xEngine');
		$x->XSLTEngine($this->Reg->getData(),$xp,0);
	}

	private function getTemplate($module)
	{
		$this->template = !empty($module->template) ? $module->template : $this->template;
	}

	public function parseUrl()
	{
		/* парсинг урла и определение нужного модуля и обработчика */
		$r = $this->Router->match($this->Request->getMethod(), $this->Request->getPathInfo());

		/* обработчик по умолчанию */
		$route_params = array();

		/* обработчик полученный из парсинга урла */
		if ($r != NULL)
		{
			list($class, $method) = explode(":", $r->getController());
			$route_params['class'] = ucfirst($class);
			$route_params['method'] = $method;
			$route_params['params'] = $r->getParameters();
		}

		return $route_params;
	}

	public function admin_init($page = 'index')
	{
		$this->db = $this->factory('Database');
		$this->Request = Request::instance();

		session_name('MAD_' . substr(md5(URL), 0, 10));
		session_start();

		header('Content-Type: text/html; charset=UTF-8', true);

		$this->admin_check_access($page);

		include_once(HOME . ADMIN_PATH . "fnc.php");

		return $this->factory('Admin');
	}

	public function admin_check_access($page)
	{
		if(isset($_POST['login']) and isset($_POST['password']))
		{
		    if($_POST['login']=='admin' and md5($_POST['password']) == '12245912b89d13a6c14a62dc04ed7a3d')
		    {
		        $_SESSION['admin']=true;
		        header('LOCATION: index.php');
		    }else{
		        print 'Не правильно!';
		    }
		}
		elseif(isset($_GET['logout']))
		{
		    unset($_SESSION['admin']);
		    print 'Вы вышли из системы!';
		    exit;
		}
		elseif($page != 'login' && !isset($_SESSION['admin']))
		{
		    header('LOCATION: login.php');
		    exit;
		}
	}

	/**
	 * Получает массив с данными о странице и записях из таблицы lang и объеденяет все
	 * в одну запись для каждой страницы с параметрами
	 * Формирует урл страницы
	 *
	 * @param $arr
	 * @param bool $one
	 *
	 * @return array|mixed
	 */
	public function prepareData($arr, $one = false)
	{
		$item = array();

		foreach ($arr as $row)
		{
			if (empty($item[$row['id']]))
			{
				$item[$row['id']] = $row;
				unset($item[$row['id']]['k'], $item[$row['id']]['val']);

				/* формирование урла страницы */
				$item[$row['id']]['link'] = (!empty($row['custom_url']) ? $row['custom_url'] : $this->Router->generate($row['alias']));
			}

			$item[$row['id']][$row['k']] = $row['val'];
		}

		if ($one)
		{
			$item = array_shift($item);
		}

		return $item;
	}
}

