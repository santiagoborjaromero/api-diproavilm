<?PHP

require_once(__DIR__."/../Models/Model.php");

class UsersController extends Controller{
        
    static public function login(){

        // $requestBody = json_decode(file_get_contents('php://input'), true);

        // if (!$requestBody){
        //     $requestBody = [
        //         "username" => $_POST['username'],
        //         "password" => $_POST['password']
        //     ];
        // }

        $requestBody = Middleware::request();

        $username = $requestBody["username"];
        $password = $requestBody["password"];

        $user = new Model("user");
        $user->where("username", "=", $username);
        $user->where("status", "=", 1);
        $rs = $user->get(true);

        if (!$rs){
            $status = "error";
            $message = "Usuario invalido o inactivo";
        } else{
            
            $status = "ok";
            $message = $rs ;
            $recRol = [];
            $recRolMenu = [];
    
            $pass = "";
            $operations = 0;
            foreach ($rs as $key => $value) {
                $pass = $value["password"];
                $operations = $value["operations"] + 1 ;
            }
    
            if ($pass == "" || $pass == "cambiar"){
                $message = "establecer clave";
                $status = "error";
            } else {
                if (!UsersController::verifyPass($pass, $password)){
                    $message = "Contraseña incorrecta";
                    $status = "error";
                } else { 
                    unset($message[0]["password"]); // No se puede enviar esta informacion es sencible
        
                    $iduser = $message[0]["iduser"];
        
                    $idrole = $message[0]["idrole"];
                    // $recRolMenu = $conn->Execute("SELECT * FROM view_get_menu WHERE idrole = :idrole", ["idrole"=>$idrole]);
                    $rs= new Model("view_get_menu");
                    $rs->where("idrole", "=", $idrole);
                    $recRolMenu = $rs->get();
    
                    $rs = new Model("role");
                    $rs->where("idrole", "=", $idrole);
                    $recRol = $rs->get();
                    
                    // $recRol = $conn->Execute("SELECT * FROM role WHERE idrole = :idrole", ["idrole"=>$idrole]);
                    
                    $message[0]["menu"] = $recRolMenu;
                    $message[0]["role"] = $recRol;
                    
                    // print($message[0]["token"]);
            
                    if ($message[0]["token"]===null){
                        $token = UsersController::setToken( $message[0] );
                        // print($token);
                        $message[0]["token"] = $token;
                    } else{
                        $token = $message[0]["token"];
                    }
                    
                    $verificacion = UsersController::validToken($token, $message[0]);
                    if($verificacion != 'ok'){
                        // $status = "error";
                        // $message = $verificacion;
                        $token = UsersController::setToken( $message[0] );
                        $message[0]["token"] = $token;
                    } else {
                        $rs_up = new Model("user");
                        $rs_up->set("token", $token);
                        $rs_up->set("operations", $operations);
                        $rs_up->set("lastlogged", date('Y-m-d H:i:s'));
                        $rs_up->where("iduser", "=", $iduser);
                        $mensaje = $rs_up->update();
                        
                        // $sql = "UPDATE user 
                        //         SET token = :token, lastlogged = :lastlogged
                        //         WHERE iduser= :iduser";
                        // $recRol = $conn->Execute($sql, ["iduser"=>$iduser,"token"=>$token, "lastlogged" => date('Y-m-d H:i:s')]);
                    }
                }
            }
        }


        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

    static public function getAll(){
        Middleware::auditSecurity();
        
        $rs = new Model("view_users");
        $rec = $rs->get();

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rec);
    }

    static public function saveUser(){
        
        Middleware::auditSecurity();

        $requestBody = Middleware::request();
        
        $user = new Model("user");
        $user->where("username","=",$requestBody["username"]);
        $rs = $user->get();

        if ($rs != NULL){
            $status = "error";
            $message = "Usuario ya existe, no puede duplicar";
        } else{
            $user = new Model("user");
            $d = $user->insertRecord($requestBody);
            $status = "ok";
            $message = $d;
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

    static public function updateUser(){
        
        Middleware::auditSecurity();
        
        $requestBody = Middleware::request();
        $id = $_GET["id"];

        $user = new Model("user");
        $user->where("iduser","=",$id);
        $rs = $user->get();

        if ($rs != NULL){
            $user = new Model("user");
            $user->where("iduser","=",$id);
            $d = $user->updateRecord($requestBody);
            $status = "ok";
            $message = $d;
        } else{
            $status = "error";
            $message = "Usuario no existe";
        }

        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

    static public function deleteUser(){
        Middleware::auditSecurity();
        $id = $_GET["id"];
        $user = new Model("user");
        $user->where("iduser", "=", $id);
        $rs = $user->delete();
        $status = "ok";
        $message = $rs;
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

    static public function setToken($user){
        $payload = [
            "iduser" => $user["iduser"],
            "idrole" => $user["idrole"],
            "expire_at" => date('Y-m-d H:i:s', strtotime(date('Y-m-d H:i:s') . ' +1 day'))
        ];

        $encryptedString = Controller::encode(json_encode($payload));
        $fase = base64_encode($encryptedString);

        return $fase;
    }

    static public function validToken($token, $user){
        $payload = json_decode(Controller::decode(base64_decode($token)), true);
        $auth = "";
        if ($user["iduser"] == $payload["iduser"]){
            $auth = "ok";

            if ( $payload["expire_at"] >= date("Y-m-d H:i:s")){
                $auth = "ok";
            }else{
                $auth = "Token ha expirado";
            }
        }else{
            $auth = "Token no valido, se guardara su IP para auditoria";
            //GUARDAR AUDITORIA
        }
        return $auth;
    }

    static public function cambioclave(){
        $requestBody = json_decode(file_get_contents('php://input'), true);

        if (!$requestBody){
            $requestBody = [
                "username" => $_POST['username'],
                "password_old" => $_POST['password_old'],
                "password_new" => $_POST['password_new'],
            ];
        }
        
        $change = new Model("user");
        $change->where("username", "=", $requestBody["username"]) ;
        $rs = $change->get(true);

        $error = "";
        $message = "";
        $iduser = -1;
        if ($rs){
            foreach ($rs as $key => $value) {
                $pass = $value["password"];
                $iduser = $value["iduser"];
            }

            if (UsersController::verifyPass($pass, $requestBody["password_old"])){

                $up = new Model("user");
                $up->set("password", UsersController::hashed($requestBody["password_new"]));
                $up->where("iduser", "=", $iduser);
                $rs = $up->update();

                $error = "ok";
                $message = "Cambio de contraseña realizado con exito";
            } else {
                $error = "error";
                $message = "La contraseña anterior con la almacenada no coincide";
            }
        } else{
            $error = "error";
            $message = "Usuario no valido";
        }

        http_response_code(200);
        echo Controller::formatoSalida($error,$message);
    }

    static function verifyPass($pass_db, $pass_old){
        if (password_verify($pass_old, $pass_db)){
            return true;
        }
        return false;
    }

    static function hashed($pass){
        $opciones = [
            'cost' => 12
        ];
        return  password_hash($pass, PASSWORD_BCRYPT, $opciones);
    }

    static function establecerclave(){

        $requestBody = Middleware::request();

        $change = new Model("user");
        $change->where("username", "=", $requestBody["username"]) ;
        $rs = $change->get(true);

        $error = "";
        $message = "";
        $iduser = -1;
        if ($rs){
            foreach ($rs as $key => $value) {
                $pass = $value["password"];
                $iduser = $value["iduser"];
            }

            $up = new Model("user");
            $up->set("password", UsersController::hashed($requestBody["password_new"]));
            $up->where("iduser", "=", $iduser);
            $rs = $up->update();

            $error = "ok";
            $message = "Establecimiento de contraseña realizado con exito";
        } else{
            $error = "error";
            $message = "Usuario no valido";
        }

        http_response_code(200);
        echo Controller::formatoSalida($error,$message);
    }


    static function resetearClaveUsuario(){
        Middleware::auditSecurity();
        $id = $_GET["id"];
        $user = new Model("user");
        $user->set("password", "cambiar");
        $user->where("iduser", "=", $id);
        $rs = $user->update();
        $status = "ok";
        $message = $rs;
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

    static function recuperarUsuario(){
        Middleware::auditSecurity();
        $id = $_GET["id"];
        $user = new Model("user");
        $user->set("deleted_at", NULL);
        $user->where("iduser", "=", $id);
        $rs = $user->update();
        $status = "ok";
        $message = $rs;
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

   
}