<?PHP

require_once(__DIR__."/../Models/Model.php");

//TODO: Clase para gestionar opciones como de autorizaacion y validacion
class AuthController extends Controller{
    
    
    static public function login(){

        $rqstBody = Middleware::request();

        //TODO: Desencripto la informaicon que viene del data
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);  
    
        $username = $requestBody["username"];
        $password = $requestBody["password"];
        $app = "";
        $application = "";
        if (isset($requestBody["app"])){
            $application = "movil";
            if ($requestBody["app"] == "movil"){
                $app = "grant_movil_access";
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
                $caducidad = $message[0]["password_expire"];

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
                    
                    if ($caducidad === null || date("Y-m-d") > date($caducidad)){
                        $message = "password expirado";
                        $status = "error";

                        $exp = new Model("password_history");
                        $exp->where("iduser", "=", $iduser);
                        $recExp = $exp->get();

                        $found = false;
                        $$chk = false;
                        
                        if ($recExp){
                            foreach ($recExp as $key => $value) {
                                $chk = password_verify($password, $value["password"]);
                                if ($chk){
                                    $found = true;
                                }
                            }
                        }
                        
                        if (!$found){
                            $exp = new Model("password_history");
                            $exppass = [
                                "iduser" => $iduser,
                                "password" => AuthController::hashed($password)
                            ];
                            $exp->insertRecord($exppass);
                        }

                        $params = [
                            "iduser" => $iduser,
                            "username" => $username, 
                            "password" => $password, 
                            "passwrord_expire" => $caducidad
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
                                "password" => $password
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
    
                            // file_put_contents("logger.log", "Aplicacion:" .  $application . "\n", FILE_APPEND);
                            //TODO: Comando anterior:   $recRolMenu = $conn->Execute("SELECT * FROM view_get_menu WHERE idrole = :idrole", ["idrole"=>$idrole]);
                            $rs= new Model("view_get_menu");
                            if ($application == "movil"){
                                $rs->where("idrole", "=", $idroleAux);
                            }else{
                                $rs->where("idrole", "=", $idrole);
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

                            $codigo = AuthController::generarCodigoUnico();
                            AuthController::sendNotification($username, $codigo);
    
                            $rs_up = new Model("user");
                            $rs_up->set("token", $token);
                            $rs_up->set("operations", $operations);
                            $rs_up->set("lastlogged", date('Y-m-d H:i:s'));
                            $rs_up->set("verification_code", $codigo );
                            $rs_up->set("verification_expire", date('Y-m-d H:i:s', (strtotime ("+5 Minute"))));
                            $rs_up->where("iduser", "=", $iduser);
                            $mensaje = $rs_up->update(false, false);

                            $params = [
                                "iduser" => $iduser,
                                "idrole" => $idrole ?? $idroleAux,
                                "username" => $username, 
                                "password" => $password,
                                "app" => $application
                            ];
                            $audit = new Audit();
                            $audit->saveAudit(json_encode($params), false, false);
    
                        }
                    }



                }
            }
        }
        
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

    static public function codigoAuth(){
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true); 

        $codigo = $requestBody["codigo"];

        $user = new Model("user");
        $user->where("verification_code", "=", $codigo);
        $rs = $user->get();

        if ($rs){
            foreach ($rs as $key => $value) {
                $expire = $value["verification_expire"];
            }

            if (date($expire) >= date("Y-m-d H:i:s")){
                $message = "Verificacion exitosa";
                $status = "ok";

                $user = new Model("user");
                $user->set("verification_code", "");
                $user->set("verification_expire", NULL);
                $user->where("verification_code", "=", $codigo);
                $rs = $user->update();
            }else{
                $message = "Codigo de verificacion ha expirado";
                $status = "error";
            }
        }else{
            $message = "Código erróneo, verifique y vuelva a intentarlo";
            $status = "error";
        }

        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

    static function solicitarCodigoAuth(){
        Middleware::auditSecurity();

        $data = Middleware::getDataToken();
        $iduser = $data["iduser"];

        $rs = new Model("user");
        $rs->where("iduser","=",$iduser);
        $rec = $rs->get();

        foreach ($rec as $key => $value) {
            $username = $value["username"];
        }

        $codigo = AuthController::generarCodigoUnico();
        AuthController::sendNotification($username, $codigo);

        $rs_up = new Model("user");
        $rs_up->set("verification_code", $codigo );
        $rs_up->set("verification_expire", date('Y-m-d H:i:s', (strtotime ("+5 Minute"))));
        $rs_up->where("iduser", "=", $iduser);
        $update = $rs_up->update(false, false);

        $status = "ok";
        $message = "Codigo generado exitosamente";
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }
    
    static function generarCodigoUnico() {
        do {
            // TODO:Generar número aleatorio de 6 dígitos
            $codigo = str_pad(random_int(111111,999999),6,"0",STR_PAD_LEFT);
    
            // TODO:Preparar la consulta
            $rs = new Model("user");
            $rs->where("verification_code", "=", $codigo);
            $rec = $rs->get();
            foreach ($rec as $key => $value) {
                $existe = $value["verification_code"];
            }
        } while ($existe > 0);
    
        return $codigo;
    }

    static public function sendNotification($username, $code){
        shell_exec("curl -d $code ntfy.sh/diproavilm_$username");
    }
    
    static public function logout(){
        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);

        $params = [];
        $params["razon"] = "Cierre de Session";
        if (isset($requestBody["app"])) $params["app"] = $requestBody["app"];

        $audit = new Audit();
        $audit->saveAudit(json_encode($params), false, true);

        $status = "ok"; 
        $message = "Session Cerrada con éxito";
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