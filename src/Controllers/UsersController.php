<?PHP

// use Controller;
// use Models\User;

class UsersController extends Controller{
        
    static public function login(){

        $requestBody = json_decode(file_get_contents('php://input'), true);

        if (!$requestBody){
            $requestBody = [
                "username" => $_POST['username'],
                "password" => $_POST['password']
            ];
        }

        // User::where("username","=",$requestBody["username"]);

        $conn = new ConnController();
        $conn->Connect("mysql");
        $rec = $conn->Execute("SELECT * FROM user WHERE username=:username AND password=:password AND status=1 AND deleted_at IS NULL LIMIT 1", $requestBody);

        $status = "ok";
        $message = $rec ;
        $recRol = [];
        $recRolMenu = [];
        $iduser = null;

        if (!$rec){
            $status = "error";
            $message = "Usuario invalido o inactivo";
        } else {
            unset($message[0]["password"]); // No se puede enviar esta informacion es sencible

            $iduser = $message[0]["iduser"];

            $idrole = $message[0]["idrole"];
            $recRolMenu = $conn->Execute("SELECT * FROM view_get_menu WHERE idrole = :idrole", ["idrole"=>$idrole]);

            $idrole = $message[0]["idrole"];
            $recRol = $conn->Execute("SELECT * FROM role WHERE idrole = :idrole", ["idrole"=>$idrole]);
            
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
                $sql = "UPDATE user 
                        SET token = :token, lastlogged = :lastlogged
                        WHERE iduser= :iduser";
                $recRol = $conn->Execute($sql, ["iduser"=>$iduser,"token"=>$token, "lastlogged" => date('Y-m-d H:i:s')]);
            }
        }

        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

    static public function getAll(){

        $payload = Middleware::auditSecurity();

        $conn = new ConnController();
        $conn->Connect("mysql");
        $rec = $conn->Execute("select * from view_users");
        http_response_code(200);
        echo Controller::formatoSalida("ok",$rec);
    }

    static public function setToken($user){
        // date_default_timezone_set("America/Guayaquil");
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
        // date_default_timezone_set("America/Guayaquil");

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

   
}