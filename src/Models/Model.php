<?php

use ConnController;

require_once(__DIR__."/../Controllers/ConnController.php");

class Model extends ConnController{

    public  $table = "";
    private $whereSQL = [];
    private $setFields = [];

    public function __construct($table = '') {
        $this->table = $table;
    }

    public function where($field, $connector, $value){
        $this->whereSQL[] = ["field" => $field, "value" => $value, "cadena" => $field . " " . $connector . " :" . $field ];
    }

    public function get($hasDeleted = false, ){
        
        $stringWhere = "";
        if (count($this->whereSQL)>0){
            $stringWhere = " WHERE ";
        }

        $stringDeletedAt = "";
        if ($hasDeleted) {
            if ($stringWhere == '') $stringWhere = " WHERE ";
            $stringDeletedAt = "deleted_at IS NULL AND ";
        }

        $sql = "SELECT * FROM " . $this->table . $stringWhere . $stringDeletedAt;

        if (count($this->whereSQL)>0){
            $cont = 0;
            foreach ($this->whereSQL as $w  ) {
                $cont ++;
                
                $sql .= $w["cadena"];
                $params[$w["field"]] = $w["value"];
    
                if ($cont < count($this->whereSQL) ){
                    $sql .= " AND ";
                }
            }
        }

        $conn = new ConnController();
        $conn->Connect("mysql");
        $dataresult = $conn->Execute($sql, $params);

        return $dataresult;
    }

    public function set($field,  $value){
        $this->setFields[] = ["field" => $field, "value" => $value, "cadena" => $field . "= :" . $field ];
    }

    public function update($hasDeleted = false, ){

        $sql = "UPDATE " . $this->table . " SET ";

        $cont = 0;
        foreach ($this->setFields as $f  ) {
            $cont ++;
            
            $sql .= $f["cadena"];
            $params[$f["field"]] = $f["value"];

            if ($cont < count($this->setFields) ){
                $sql .= ", ";
            }
        }

        if (count($this->whereSQL)>0){
            $sql .= " WHERE ";
            $cont = 0;
            foreach ($this->whereSQL as $w  ) {
                $cont ++;
                
                $sql .= $w["cadena"];
                $params[$w["field"]] = $w["value"];
    
                if ($cont < count($this->whereSQL) ){
                    $sql .= " AND ";
                }
            }
        }
        
        $conn = new ConnController();
        $conn->Connect("mysql");
        $dataresult = $conn->Execute($sql, $params);
    }

}