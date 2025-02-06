<?PHP

require_once(__DIR__."/../Models/Model.php");

//TODO: Clase para gestionar opciones como de autorizaacion y validacion
class AuthController extends Controller{
    
    

    static public function login(){

        $requestBody = Middleware::request();

        $username = $requestBody["username"];
        $password = $requestBody["password"];
        $app = "";
        if (isset($requestBody["app"])){
            if ($requestBody["app"] == "movil"){
                $app = "grant_movil_access";
            } else {
                $app = $requestBody["app"];
            }
        }

        $user = new Model("user");
        $user->where("username", "=", $username);
        $user->where("status", "=", 1);
        if ($app != ''){
            $user->where($app, "=", 1);
        }
        $rs = $user->get(true);

        if (!$rs){
            $status = "error";
            $message = "Usuario invalido, inactivo o sin permisos de acceso";
            $params = [
                "username" => $username, 
                "password" => $password, 
                "error" => $message
            ];
            $audit = new Audit();
            $audit->saveAudit(json_encode($params), false, false);
        } else{
            
            $status = "ok";
            $message = $rs ;
            $recRol = [];
            $recRolMenu = [];
    
            $pass = "";
            $operations = 0;
            foreach ($rs as $key => $value) {
                $pass = $value["password"];
                $operations = intval($value["operations"]) + 1 ;
            }

            if ($pass == "" || $pass == "cambiar"){
                $message = "establecer clave";
                $status = "error";
            } else {
                $iduser = $message[0]["iduser"];
                $idrole = $message[0]["idrole"];

                if (!AuthController::verifyPass($pass, $password)){
                    $message = "Contraseña incorrecta";
                    $status = "error";
                    $params = [
                        "iduser" => $iduser,
                        "username" => $username, 
                        "password" => $password, 
                        "error" => $message
                    ];
                    $audit = new Audit();
                    $audit->saveAudit(json_encode($params), false, false);
                } else { 
                    unset($message[0]["password"]); // No se puede enviar esta informacion es sencible

                    //TODO: Que pasaría si el rol esta desactivado o status = 0??? Se debe enviar un mensaje y no permitir ingreso
                    $rs = new Model("role");
                    $rs->where("idrole", "=", $idrole);
                    $rs->where("status", "=", 1);
                    $recRol = $rs->get(true);

                    if ($recRol == NULL){
                        $status = "error";
                        $message = "El Rol del usuario se encuentra inhabilitado para acceder al sistema. Contactese con el administrador.";
                        $params = [
                            "iduser" => $iduser,
                            "idrole" => $idrole,
                            "username" => $username, 
                            "password" => $password, 
                        ];
                        $audit = new Audit();
                        $audit->saveAudit(json_encode($params), false, false);
                    } else {
                        $idroleAux = 0;
                        if ($app == "grant_movil_access"){
                            foreach ($recRol as $key => $value) {
                                $nameRole = "app" . $value["name"];
                            }

                            $rs = new Model("role");
                            $rs->where("name", "=", $nameRole);
                            $rs->where("status", "=", 1);
                            $recRol2 = $rs->get(true);
                            foreach ($recRol2 as $key => $value) {
                                $idroleAux = $value["idrole"];
                            }

                        }


    
                        //TODO: Comando anterior:   $recRolMenu = $conn->Execute("SELECT * FROM view_get_menu WHERE idrole = :idrole", ["idrole"=>$idrole]);
                        $rs= new Model("view_get_menu");
                        if ($idroleAux==0){
                            $rs->where("idrole", "=", $idrole);
                        }else{
                            $rs->where("idrole", "=", $idroleAux);
                        }
                        $recRolMenu = $rs->get(true);
                        
                        //TODO: $recRol = $conn->Execute("SELECT * FROM role WHERE idrole = :idrole", ["idrole"=>$idrole]);
                        
                        $message[0]["menu"] = $recRolMenu;
                        $message[0]["role"] = $recRol;
                        $message[0]["operations"] = $operations;
                        
                        if ($message[0]["token"]===null){
                            $token = AuthController::setToken( $message[0] );
                            $message[0]["token"] = $token;
                        } else{
                            $token = $message[0]["token"];
                        }
                        
                        $verificacion = AuthController::validToken($token, $message[0]);
                        if($verificacion != 'ok'){
                            $token = AuthController::setToken( $message[0] );
                            $message[0]["token"] = $token;
                        }

                        $rs_up = new Model("user");
                        $rs_up->set("token", $token);
                        $rs_up->set("operations", $operations);
                        $rs_up->set("lastlogged", date('Y-m-d H:i:s'));
                        $rs_up->where("iduser", "=", $iduser);
                        $mensaje = $rs_up->update();
                        // TODO: Antes SQL UPDATE
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
    
    //TODO: arma el token en su estructura básica
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

    //TODO: Valida el token 
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
            //TODO: Guardar auditoria posible ataque
            $model = new Audit();
            $model->saveAudit(json_encode([]), true);
        }
        return $auth;
    }

    //TODO: Metodo para codificar 
    static function hashed($pass){
        $opciones = [
            'cost' => 12
        ];
        return  password_hash($pass, PASSWORD_BCRYPT, $opciones);
    }

    //TODO: Verificar si la clave en hash es igual a la ingresada
    static function verifyPass($pass_db, $pass_old){
        if (password_verify($pass_old, $pass_db)){
            return true;
        }
        return false;
    }


}