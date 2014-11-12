<?php

class User extends AbstractModule
{
    private $id;
    private $username;
    private $user_id;

	public $user = array();
	public $is_authorized = false;
	public $template = 'user';

    public function init()
    {
	    if ($this->is_authorized = self::isAuthorized())
	    {
		    $this->user = $this->getUser($_SESSION['user_id']);
	    }

	    $this->Reg->add(array(
            "user" => $this->user,
		    'service' => array(
                'is_auth' => $this->is_authorized
            )
        ));
    }

    public static function isAuthorized()
    {
        if (!empty($_SESSION["user_id"])) {
            return (bool) $_SESSION["user_id"];
        }
        return false;
    }

    public function passwordHash($password, $salt = null, $iterations = 10)
    {
        $salt || $salt = uniqid();
        $hash = md5($password . $salt);

        return array('hash' => $hash, 'salt' => $salt);
    }

    public function getSalt($username) {
        $query = "SELECT `salt` FROM users WHERE `email` = :s LIMIT 1";
	    $row = $this->db->getOne($query, $username);
        if (!$row) {
            return false;
        }
        return $row;
    }

    public function authorize($username, $password, $remember=false)
    {
	    $salt = $this->getSalt($username);

        if (!$salt) {
            return false;
        }

        $hashes = $this->passwordHash($password, $salt);

	    $query = "SELECT `id`, `email` FROM users
				WHERE `email` = :s AND `pass` = :s LIMIT 1";

        $user = $this->db->getRow($query, $username, $hashes['hash']);
        
        if (!$user) {
            $this->is_authorized = false;
        } else {
            $this->is_authorized = true;
            $this->user_id = $user['id'];
            $this->saveSession($remember);
        }

        return $this->is_authorized;
    }

    public function clearSession()
    {        if (!empty($_SESSION["user_id"]))

        {
            unset($_SESSION["user_id"]);
        }

	    Cookie::set("sid", "");
    }

    public function saveSession($remember = false, $http_only = true, $days = 7)
    {
        $_SESSION["user_id"] = $this->user_id;

        if ($remember) {
            // Save session id in cookies
            $sid = session_id();

            Cookie::set("sid", $sid);
        }
    }

    public function create($user) {
        $user_exists = $this->getSalt($user['username']);

        if ($user_exists) {
            throw new \Exception("User exists: " . $user['username'], 1);
        }

        $hashes = $this->passwordHash($user['password']);

	    $query = "INSERT INTO users (`email`, `pass`, `salt`, `fio`)
	                VALUES (:s, :s, :s, :s)";
	    $result = $this->db->query($query, $user['username'], $hashes['hash'], $hashes['salt'], $user['fio']);

        if (!$result) {
            print("Database error");
            die();
        } 

        return $result;
    }

	public function login()
    {
	    $this->template = 'login';

        if ($this->Request->isPost())
        {
		    Cookie::set("sid", "");

	        $username = $_POST["username"];
	        $password = $_POST["password"];
	        $remember = !!$_POST["remember-me"];

	        if (empty($username)) {
		        print("Enter the username");
	            return;
	        }

	        if (empty($password)) {
		        print("Enter the password");
	            return;
	        }

	        $auth_result = $this->authorize($username, $password, $remember);

	        if (!$auth_result) {
		        print("Invalid username or password!!!");
	            return;
	        }

	        Utils::go2();
		}
    }

    public function logout()
    {
        $this->clearSession();
	    Utils::go2('/');
    }

    public function register()
    {
	    $this->template = 'register';

	    if ($this->Request->isPost()) {

		    Cookie::set("sid", "");

		    $user['username'] = filter_input(INPUT_POST, 'username', FILTER_VALIDATE_EMAIL);
		    $user['fio'] = filter_input(INPUT_POST, 'fio', FILTER_SANITIZE_STRING);

		    $user['password'] = $_POST["password"];
		    $user['password2'] = $_POST["password2"];

		    if (!$user['username']) {
			    print("Username is wrong");
			    return;
		    }

		    if (!$user['fio']) {
			    print("FIO is wrong");
			    return;
		    }

		    if (empty($user['password'])) {
			    print("Enter the password");
			    return;
		    }

		    if (empty($user['password2'])) {
			    print("Confirm the password");
			    return;
		    }

		    if ($user['password'] !== $user['password2']) {
			    print("Confirm password is not match");
			    return;
		    }

		    try {
			    $new_user_id = $this->create($user);
		    } catch (\Exception $e) {
			    print($e->getMessage());
			    return;
		    }

		    $auth_result = $this->authorize($user['username'], $user['password']);

		    if (!$auth_result) {
                $this->Reg->add(array(
	                "messages" => array(
				        "error" => array(
					        "Invalid username or password."
				        )
	                )
                ));

                return;
            }

            Utils::go2();
	    }
    }

	public function getUser($id)
	{
		$sql = "SELECT * FROM users WHERE `Id` = :i";

		$user = $this->db->getRow($sql, $id);

		return $user;
	}
}
