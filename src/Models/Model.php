<?php


//TODO: Modelo generico para tipo framework que permite con metodos publicos armar el sql de manera efectiva y facil.
use ConnController;

require_once(__DIR__."/../Controllers/ConnController.php");
require_once(__DIR__."/Audit.php");

class Model extends ConnController{

    public  $table = "";
    public  $drive = "";
    private $whereSQL = [];
    private $setFields = [];
    private $setOrderBy = [];

    //TODO: Determina la tabla con la que se deben hacer la operacion
    public function __construct($table = '', $drive = "mysql") {
        $this->table = $table;
        $this->drive = $drive;
    }

    //TODO: reune todas las condiciones WHERE con el conector AND
    public function where($field, $connector, $value){
        $this->whereSQL[] = ["field" => $field, "value" => $value, "cadena" => $field . " " . $connector . " :" . $field ];
    }

    //TODO: Ejecuta las consultas y arma el sql a partir de where y la tabla asignada
    public function get($hasDeleted = false ){
        
        //TODO: HasDelete permite determinar si la tabla debe discriminar deleted_at o no;

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

        //Varido del arreglo where
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

        if( count($this->setOrderBy)>0 ){
            foreach ($this->setOrderBy as $key => $value) {
                $sql .= " ORDER BY `{$value['field']}` {$value['order']}";
            }
        }

        $conn = new ConnController();
        $conn->Connect($this->drive);
        $dataresult = $conn->Execute($sql, $params);

        return $dataresult;
    }

    //TODO: metodo para determinar los campos a modificar en un update
    public function set($field,  $value){
        $this->setFields[] = ["field" => $field, "value" => $value, "cadena" => $field . "= :" . $field ];
    }

    //TODO: metodo para determinar el orden 
    public function orderBy($field, $order){
        $this->setOrderBy[] = ["field" => $field, "order" => $order];
    }

    //TODO: inserta registros en bloque sin importar los campos que venga
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

        $audit = new Audit();
        $audit->saveAudit(json_encode($params));

        $conn = new ConnController();
        $conn->Connect($this->drive);
        $conn->Execute($sql, $params);
        $sql = "SELECT LAST_INSERT_ID() as last_insert_id";
        $dataresult = $conn->Execute($sql);
        return $dataresult[0]["last_insert_id"];
    }

    //TODO: actualiza los registros sen bloque
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

        //TODO: Guarda ejecucion en el auditor
        $audit = new Audit();
        $audit->saveAudit(json_encode($params));;

        $conn = new ConnController();
        $conn->Connect($this->drive);
        $dataresult = $conn->Execute($sql, $params);
        return "Actualización realizada con éxito";
    }

    //TODO: Metodo que actualiza un registro previo debe especificar con el metodo set
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
        
        //TODO: Guarda ejecucion en el auditor
        $audit = new Audit();
        $audit->saveAudit(json_encode($params));

        $conn = new ConnController();
        $conn->Connect($this->drive);
        $dataresult = $conn->Execute($sql, $params);
        return "Actualización realizada con éxito";
    }

    //TODO: metodo generico publico para eliminar registros
    //TODO: $hard = true -> elimina fisicamente
    //TODO: $hard = false -> elimina logicamente (softdelete)

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

        //TODO: Guarda ejecucion en el auditor
        $audit = new Audit();
        $audit->saveAudit(json_encode($params));

        $conn = new ConnController();
        $conn->Connect($this->drive);
        $dataresult = $conn->Execute($sql, $params);
        return "Información eliminada con exito";
    }

    //TODO: Metodo que guarda las acciones necesarias en la tabla audit
    
}