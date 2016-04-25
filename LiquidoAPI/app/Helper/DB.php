<?php

namespace Helper;

use \PDO;

require_once "config.php";

class DB {
	private static $_instance;
	private $_pdo;

	public function __construct() {
		$this->_pdo = new PDO(DB_DSN, DB_USERNAME, DB_PASSWORD);
	}

	public function ins() {
		if(!self::$_instance) {
			self::$_instance = new DB;
		}
		return self::$_instance;
	}

	function select_fetch($query, $where=null, $order=null) { //order= "id, DESC"
		$query = explode('/', $query);
		$query = "SELECT $query[1] FROM $query[0]";

		if(isset($where)) {
			$where = explode(', ', $where);
			$where = implode('\' AND ', $where);
			$where = explode('=', $where);
			$where = implode('=\'', $where);
			$where .= "'";
			$query .= " WHERE $where";	
		}
		

		if(isset($order)) {
			$order = explode(', ', $order);
			$query .= " ORDER BY $order[0] $order[1]";
		}


		$query = $this->_pdo->query($query);
		$query = $query->fetchAll(PDO::FETCH_OBJ);

		return $query;
	}

	function select_rowCount($query, $where=null) {
		$query = explode('/', $query);
		$query = "SELECT $query[1] FROM $query[0]";

		if(isset($where)) {
			$where = explode(', ', $where);
			$where = implode('\' AND ', $where);
			$where = explode('=', $where);
			$where = implode('=\'', $where);
			$where .= "'";
			$query .= " WHERE $where";	
		}

		$query = $this->_pdo->query($query);
		$query = $query->rowCount();
		return $query;
	}

	function delete($query, $where=null) {
		$query = "
			DELETE
			FROM $query
		";
		if(isset($where)) {
			$where = explode(', ', $where);
			$where = implode('\' AND ', $where);
			$where = explode('=', $where);
			$where = implode('=\'', $where);
			$where .= "'";
			$query .= " WHERE $where";	
		}
		$query = $this->_pdo->query($query);
	}

	//"todo/text, user_id, done, date_created/vitug, 10, 0: NOW()"

	public function innerJoin($table, $field, $join, $sort=null, $where=null) {
		$table = explode("/", $table);

		$field = explode("/", $field);

		$field1 = explode(", ", $field[0]);
		$field2 = explode(", ", $field[1]);

		$query = "SELECT ";

		$query1 = "";
		$query2 = "";

		foreach($field1 as $fields){
		$query1 = $query1."{$table[0]}.{$fields} AS {$table[0]}_{$fields}, ";
		}
		$query1 = rtrim($query1, ", ");

		foreach($field2 as $fields){
		$query2 = $query2."{$table[1]}.{$fields} AS {$table[1]}_{$fields}, ";
		}
		$query2 = rtrim($query2, ", ");

		$query = $query.$query1.", ".$query2;

		$join = explode("=", $join);
		$join1 = explode("/", $join[0]);
		$join2 = explode("/", $join[1]);

		if(sizeof($join2)==1) {

		$query = $query." FROM {$table[0]} ";
		$query = $query."INNER JOIN {$table[1]} ON {$join1[0]}.{$join1[1]} = {$join2[0]}";
		} else {

		$query = $query." FROM {$table[0]} ";
		$query = $query."INNER JOIN {$table[1]} ON {$join1[0]}.{$join1[1]} = {$join2[0]}.{$join2[1]}";
		}

		if(isset($where)) {
			$where = explode("=", $where);

			$query .= " WHERE $where[0] = $where[1]";
		}

		if(isset($sort)) {

		$sort = explode("/", $sort);

		$query .= " ORDER BY $sort[0] $sort[1]";
		}

		$query = $this->_pdo->query($query);
		return $query = $query->fetchAll(PDO::FETCH_OBJ);

	}

	function getLicenseId($query) {
	
		return $this->_pdo->query($query)->fetchAll(PDO::FETCH_OBJ);
	}

	function insert($query) {
		if(isset($date)) {$date = ", $date";}
		$query = explode('/', $query);
		$query[2] = explode(', ', $query[2]);
		$query[2] = implode('\', \'', $query[2]);
		$query = "INSERT INTO $query[0] ($query[1]) VALUES ('$query[2]')";
		$this->_pdo->query($query);
	}
	
	function insert_with_date($query) {
		$query = explode('/', $query);
		$query[2] = explode(', ', $query[2]);
		$query[2] = implode('\', \'', $query[2]);
		$query = "INSERT INTO $query[0] ($query[1]) VALUES ('$query[2])";
		$query = explode(':', $query);
		$query = implode('\', ', $query);

		$this->_pdo->query($query);
	}

	function update($query, $where=null) { //UPDATE todo SET text = '1234', done = '1' WHERE id = '44';
		//update("todo/text=1234, done=1", "id=44");
		$query = explode('/', $query);
		$query[1] = explode(', ', $query[1]);
		$query[1] = implode('\', ', $query[1]);
		$query[1] = explode('=', $query[1]);
		$query[1] = implode('=\'', $query[1]);
		$query[1] .= "'";
		$query = "UPDATE $query[0] SET $query[1]";

		if(isset($where)) {
			$where = explode(', ', $where);
			$where = implode('\' AND ', $where);
			$where = explode('=', $where);
			$where = implode('=\'', $where);
			$where .= "'";
			$query .= " WHERE $where";	
		}
		echo $query;
		$query = $this->_pdo->query($query);
	}

	function query_query($query) {
		$query = $this->_pdo->query($query);

		return $query = $query->fetchAll(PDO::FETCH_OBJ);


	}

	function select_innerjoin() {
		$query ="SELECT 
		posts.id AS post_id,
		categories.id AS category_id,
		title, contents, date_created,
		categories.name AS category_name
		FROM posts
		INNER JOIN categories ON
		categories.id = posts.user_id
		ORDER BY post_id DESC";

		$query = $this->_pdo->query($query);
		$query = $query->fetchAll(PDO::FETCH_OBJ);
		return $query;
	}

	function exist($query, $where=null) {
		$query = explode('/', $query);
		$query = 
			"
			SELECT {$query[1]} FROM {$query[0]}
			";

		if(isset($where)) {
			$where = explode(', ', $where);
			$where = implode('\' AND ', $where);
			$where = explode('=', $where);
			$where = implode('=\'', $where);
			$where .= "'";
			$query .= " WHERE $where";	
		}

		$query = $this->_pdo->query($query);
		$query = $query->rowCount();

		if(($query==1)) {return true;}
		return false;
	}

	function getuser_id($username) {
		$query = "
			SELECT id FROM users WHERE username = '$username'
		";
		$query = $this->_pdo->query($query);
		$query = $query->fetchAll(PDO::FETCH_OBJ);
		foreach ($query as $query_key) {
			return $query_key['id'];
		}
	}

	function get($query, $where=null) {  //SELECT * FROM users WHERE id = '22' 
		$query = explode('/', $query);
		$col_name = $query[2];
		$query = "SELECT $query[1] FROM $query[0]";

		if(isset($where)) {
			$where = explode(', ', $where);
			$where = implode('\' AND ', $where);
			$where = explode('=', $where);
			$where = implode('=\'', $where);
			$where .= "'";
			$query .= " WHERE $where";	
		}
		

		$query = $this->_pdo->query($query);
		$query = $query->fetchAll(PDO::FETCH_OBJ);

		foreach ($query as $query_key) {
			return $query_key[$col_name];
		}
	}

	function lastInsertedId() {
		$id = $this->_pdo->lastInsertId();
		return $id;
	}
}

?>