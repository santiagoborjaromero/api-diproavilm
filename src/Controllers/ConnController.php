<?PHP
class ConnController{
	private PDO $db;

    public function Connect($connType) {
        $json_config = json_decode(file_get_contents(__DIR__ . "/../../config.json"), true);
        $connData = $json_config[$connType];
        $dsn = $connData["driver"].":host=".$connData["host"].";port=".$connData["port"].";dbname=".$connData["database"].";charset=utf8";
        
		$conn = $this->db = new PDO(
            $dsn,
            $connData["user"],
            $connData["pass"],
            array( 
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8mb4"
            )
        );
        return $conn;
	}

	public function Execute($sql, $args = []){
        $conn = $this->db->prepare($sql);
        $conn->execute($args);
        $result = $conn->fetchAll(PDO::FETCH_ASSOC);
        $conn->closeCursor();
        if (count($result)>0){
            return $result;	
        }
	}
}