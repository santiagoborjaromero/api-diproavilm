<?PHP

require_once(__DIR__."/../Models/Model.php");

class BotUsersController extends Controller{

    static public function getAll(){
        Middleware::auditSecurity();
        
        $rs = new Model("view_users_bot");
        $rec = $rs->get();

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rec);
    }

    static public function saveUser(){
        
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);
        
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
        
        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);
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

            if (AuthController::verifyPass($pass, $requestBody["password_old"])){

                $up = new Model("user");
                $up->set("password", AuthController::hashed($requestBody["password_new"]));
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


    static function establecerclave(){

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);

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
            $up->set("password", AuthController::hashed($requestBody["password_new"]));
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