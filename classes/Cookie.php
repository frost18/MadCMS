<?php
/*
Cookie - класс-обертка для простой работы с http сookie

Методы:
    // запись куки
    Cookie::set($key,$value)

    // запись куки с параметрами
    Cookie::set($key,$value,
            $expire = 0,   // крайняя дата действия куки (в секундах), например 30 дней = time()+60*60*24*30,  0 = на время текущей сессии (до закрытия браузера) (TODO: сделать возможные значения: 1 day / 3 week / 2 month / 1 year / 5 hours / 10 minutes )
            $path   ='/', // префикс для пути, где действуюет кука, '/' = все пути домена
            $domain = '', // домены, где действует кука
            $secure = false, // нуждается ли кука в HTTPS соединении?
            $httponly = true  // When TRUE the cookie will be made accessible only through the HTTP protocol. This means that the cookie won't be accessible by scripting languages, such as JavaScript.
    )

    // чтение куки
    Cookie::get($key)

    // удаление куки
    Cookie::del($key)

    // проверка - существует ли кука?
    Cookie::exists($key)


Примеры использования:

    <?php
    // Basic usage
    Cookie::set('testcookie', 'test');
    print(Cookie::get('testcookie'));

    // You can set 'array' cookies in two different ways:
    Cookie::set('array[one]', 'item one');
    Cookie::set(array('array' => 'two'), 'item two');

    // Likewise, you can also get 'array' cookies in two different ways:
    print(Cookie::get('array[one]'));
    print(Cookie::get(array('array' => 'one')));

    // Or you can grab the whole array at once:
    print_r(Cookie::get('array'));

    // Deleting cookies is done in the same way:
    Cookie::del('array[one]');
    Cookie::del(array('array' => 'two'));

    // Delete the entire array:
    Cookie::del('array');

    // Print contents of $_COOKIE (refresh for this)
    print '<pre>';
    print_r(Cookie::contents());
    print '<pre>';

    ?>

*/

class Cookie
{
    // Reserved session keys
    private static $_reserved = array();

    // Static class cannot be initialized
    private function __construct() {}

    // Alias for delete() function
    public static function del($key){self::delete($key);}

    // Delete a cookie
    public static function delete($key)
    {
        // Change string representation array to key/value array
        $key = self::_scrubKey($key);

        // Make sure the cookie exists
        if (self::exists($key))
        {
            // Check for key array
            if (is_array($key))
            {
                // Grab key/value pair
                list ($k, $v) = each($key);

                // Set string representation
                $key = $k . '[' . $v . ']';

                // Set expiration time to -1hr (will cause browser deletion)
                setcookie($key, false, time() - 3600);

                // Unset the cookie
                unset($_COOKIE[$k][$v]);
            }

            // Check for cookie array
            else if (is_array($_COOKIE[$key]))
            {
                foreach ($_COOKIE[$key] as $k => $v)
                {
                    // Set string representation
                    $cookie = $key . '[' . $k . ']';

                    // Set expiration time to -1hr (will cause browser deletion)
                    self::erase($key);
                    //setcookie($cookie, false, time() - 3600);

                    // Unset the cookie
                    unset($_COOKIE[$key][$k]);
                }
            }

            // Unset single cookie
            else
            {
                // Set expiration time to -1hr (will cause browser deletion)
                self::erase($key);
                //setcookie($key, false, time() - 3600);

                // Unset key
                unset($_COOKIE[$key]);
            }
        }
    }

    // кроссбраузерное удаление скалярной куки (не массив)
    static function erase($key)
    {
            if (strstr($_SERVER['HTTP_USER_AGENT'], "MSIE"))
                    // удаление куки в IE
                    setcookie($key, "", time()+20000);
            else
                    // удаление куки в других браузерах
                    setcookie($key, "", time()-20000, "/");

    }

    // See if a cookie key exists
    public static function exists($key)
    {
        // Change string representation array to key/value array
        $key = self::_scrubKey($key);

        // Check for array
        if (is_array($key))
        {
            // Grab key/value pair
            list ($k, $v) = each($key);

            // Check for key/value pair and return
            if (isset($_COOKIE[$k][$v])) return true;
        }

        // If key exists, return true
        else if (isset($_COOKIE[$key])) return true;

        // Key does not exist
        return false;
    }

    // Get cookie information
    public static function get($key)
    {
        // Change string representation array to key/value array
        $key = self::_scrubKey($key);

        // Check for array
        if (is_array($key))
        {
            // Grab key/value pair
            list ($k, $v) = each($key);

            // Check for key/value pair and return
            if (isset($_COOKIE[$k][$v])) return $_COOKIE[$k][$v];
        }

        // Return single key if it's set
        else if (isset($_COOKIE[$key])) return $_COOKIE[$key];

        // Otherwise return null
        else return null;
    }

    // Return the cookie array
    public static function contents()
    {
        return $_COOKIE;
    }

    // Set cookie information
    public static function set(
        $key, // имя куки
        $value, // значение
        $expire = 0, // срок действия куки  ( default 0 = текущая сессия, 1-1000 = кол-во дней, свыше 1000 = UNIX-timestamp в секундах )
        $path = '/',            /*  path */
        $domain = '',           /* domain */
        $secure = false,        /* Does this cookie need a secure HTTPS connection? */
        $httponly = false               /* Can non-HTTP services access this cookie (IE: javascript)? */
                )
        {

                // превращаем срок из дней в дату из секунд
                if ($expire && $expire<=1000)
                        $expire = time() + 60*60*24*$expire;

                // Make sure they aren't trying to set a reserved word
        if (!in_array($key, self::$_reserved))
        {
            // If $key is in array format, change it to string representation
            $key = self::_scrubKey($key, true);

            // Store the cookie
            setcookie($key, $value, $expire, $path, $domain, $secure
                        // ,$httponly // only for PHP5.2+
                        );
        }

        // Otherwise, throw an error
        else trigger_error("Warning: Could not set reserved COOKIE key '$key'", E_USER_NOTICE );
    }

    // Converts strings to arrays (or vice versa if toString = true)
    private static function _scrubKey($key, $toString = false)
    {
        // Converting from array to string
        if ($toString)
        {
            // If $key is in array format, change it to string representation
            if (is_array($key))
            {
                // Grab key/value pair
                list ($k, $v) = each($key);

                // Set string representation
                $key = $k . '[' . $v . ']';
            }
        }

        // Converting from string to array
        else if (!is_array($key))
        {
            // is this a string representation of an array?
            if (preg_match('/([\w\d]+)\[([\w\d]+)\]$/i', $key, $matches))
            {
                // Store as key/value pair
                $key = array($matches[1] => $matches[2]);
            }
        }

        // Return key
        return $key;
    }
}

