<?php
//TODO: Clase de Provedores

//NO SE USA PERO SIRVIO PARA DARME CUENTA CUANTAS CONSULTAS SE DBEN HACER

class User
{
    //TODO: Implementar los metodos de la clase

    static public function oneUserName($username){
        $conn = new ConnController();
        $conn->Connect("mysql");
        $rec = $conn->Execute("SELECT * FROM user WHERE username=:username AND status=1 AND deleted_at IS NULL LIMIT 1", ["username"=>$username]);
        return $rec;
    }

    static public function getMenu($idrole){
        $conn = new ConnController();
        $conn->Connect("mysql");
        $rec = $conn->Execute("SELECT * FROM view_get_menu WHERE idrole=:idrole", ["idrole"=>$idrole]);
        return $rec;
    }

    static public function getRoles($idrole){
        $conn = new ConnController();
        $conn->Connect("mysql");
        $rec = $conn->Execute("SELECT * FROM role WHERE idrole=:idrole", ["idrole"=>$idrole]);
        return $rec;
    }

    static public function updateToken($iduser, $token){
        $conn = new ConnController();
        $conn->Connect("mysql");
        $sql = "UPDATE user 
                SET token = :token, lastlogged = :lastlogged
                WHERE iduser= :iduser";
        $recRol = $conn->Execute($sql, ["iduser"=>$iduser,"token"=>$token, "lastlogged" => date('Y-m-d H:i:s')]);
        return $recRol;
    }

    static public function insert($iduser, $token){
        $conn = new ConnController();
        $conn->Connect("mysql");
        $sql = "UPDATE user 
                SET token = :token, lastlogged = :lastlogged
                WHERE iduser= :iduser";
        $recRol = $conn->Execute($sql, ["iduser"=>$iduser,"token"=>$token, "lastlogged" => date('Y-m-d H:i:s')]);
        return $recRol;
    }




}   
