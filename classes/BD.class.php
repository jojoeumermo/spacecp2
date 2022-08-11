<?php
	define('HOST', 'localhost');
	define('DB', 'banco');
	define('USER', 'root');
	define('PASS', '');

class BD{
	private static $conn;

	public function __construct(){}

	public static function conn(){
		if(is_null(self::$conn)){
			self::$conn = new PDO('mysql:host='.HOST.';dbname='.DB.'', ''.USER.'', ''.PASS.'');
		}

        return self::$conn;
	}
}
?>