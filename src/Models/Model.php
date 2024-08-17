<?php

use ConnController;

require_once(__DIR__."/../Controllers/ConnController.php");

class Model extends ConnController{

    public  $table = "";
    public  $drive = "";
    private $whereSQL = [];
    private $setFields = [];
    private $setOrderBy = [];

    public function __construct($table = '', $drive = "mysql") {
        $this->table = $table;
        $this->drive = $drive;
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
            $stringDeletedAt = "deleted_at IS NULL ";
        }

        $sql = "SELECT * FROM " . $this->table . $stringWhere . $stringDeletedAt;

        if (count($this->whereSQL)>0){
            if ($stringDeletedAt != '') $sql .= " AND ";
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
        $conn->Connect($this->drive);
        $dataresult = $conn->Execute($sql, $params);

        return $dataresult;
    }

    public function set($field,  $value){
        $this->setFields[] = ["field" => $field, "value" => $value, "cadena" => $field . "= :" . $field ];
    }

    public function orderBy($field){
        $this->setOrderBy[] = ["field" => $field];
    }

    public function insertRecord($record = []){

        if ($this->table == "user"){
            $record["password"] = "cambiar";
        }

        $f = "";
        $d = "";
        $cont = 0;
        foreach ($record as $k => $v ) {
            $cont ++;

            $f .= "`".$k."`";
            $d .= ":" . $k;

            if ($cont < count($record) ){
                $f .= ", ";
                $d .= ",";
            }

            $params[$k] = $v;
        }

        $sql = "INSERT INTO `" . $this->table . "` ({$f}) VALUES ({$d})";

        $this->saveAudit(json_encode($params));

        $conn = new ConnController();
        $conn->Connect($this->drive);
        $conn->Execute($sql, $params);
        $sql = "SELECT LAST_INSERT_ID() as last_insert_id";
        $dataresult = $conn->Execute($sql);
        return $dataresult[0]["last_insert_id"];
    }

    public function updateRecord($record = []){

        $sql = "UPDATE " . $this->table . " SET ";  

        $f = "";
        $d = "";
        $cont = 0;
        foreach ($record as $k => $v ) {
            $cont ++;

            $sql .= "`".$k."`= :" . $k ;
            if ($cont < count($record) ){
                $sql .= ", ";
            }

            $params[$k] = $v;
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
        } else {
            return "Debe incluir por lo menos una clausula Where";
        }


        $this->saveAudit(json_encode($params));

        $conn = new ConnController();
        $conn->Connect($this->drive);
        $dataresult = $conn->Execute($sql, $params);
        return "Actualización realizada con éxito";
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
        } else {
            return "Debe incluir por lo menos una clausula Where";
        }
        
        $this->saveAudit(json_encode($params));

        $conn = new ConnController();
        $conn->Connect($this->drive);
        $dataresult = $conn->Execute($sql, $params);
        return "Actualización realizada con éxito";
    }

    public function delete($hard=false){

        if ($hard){
            $sql = "DELETE FROM " . $this->table . " ";  
        } else {
            $sql = "UPDATE " . $this->table . " SET deleted_at = '" . date('Y-m-d H:i:s') . "' ";  
            if ($this->table == "user"){
                $sql .= ' ,status = 0 ';
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
        } else {
            return "Debe incluir por lo menos una clausula Where";
        }

        $this->saveAudit(json_encode($params));

        $conn = new ConnController();
        $conn->Connect($this->drive);
        $dataresult = $conn->Execute($sql, $params);
        return "Información eliminada con exito";
    }


    public function saveAudit($json = []){

        $data = Middleware::auditSecurity(true);

        $iduser = null;
        if ($data){
            $iduser = $data["iduser"];
        }

        $action = $_SERVER["REQUEST_METHOD"];
        $route  = $_SERVER["REQUEST_URI"];
        $ipaddr = $_SERVER["HTTP_USER_AGENT"];

        $params = [
            "iduser" =>$iduser ,
            "ipaddr" =>$ipaddr ,
            "action" =>$action ,
            "route"   =>$route ,
            "json" => $json
        ];

        $sql="INSERT INTO audit (`iduser`, `ipaddr`, `action`, `route`, `json`) VALUE (:iduser, :ipaddr, :action, :route, :json)";
        $conn = new ConnController();
        $conn->Connect($this->drive);
        $conn->Execute($sql, $params);

    }



}