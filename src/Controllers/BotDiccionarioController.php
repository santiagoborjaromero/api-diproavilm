<?PHP

require_once(__DIR__."/../Models/Model.php");
require_once(__DIR__."/../Models/Bot.php");

class BotDiccionarioController extends Controller{

    static public function getAll(){
        Middleware::auditSecurity();
        $dic = new Model("bot_dictionary");
        $rs = $dic->get();
        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    
    static public function saveMenu(){
        
        Middleware::auditSecurity();
        
        $requestBody = Middleware::request();  

        $dic = new Model("bot_dictionary");
        $dic->where("menu","=",$requestBody["menu"]);
        $rs = $dic->get();

        if ($rs != NULL){
            $status = "error";
            $message = "El diccionario ya existe, no se puede duplicar";
        } else{
            $dic = new Model("bot_dictionary");
            $d = $dic->insertRecord($requestBody);
            $status = "ok";
            $message = $d;
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }


    static public function updateMenu(){
        
        Middleware::auditSecurity();

        $requestBody = Middleware::request();
        $id = $_GET["id"];

        $dic = new Model("bot_dictionary");
        $dic->where("idbotdic","=",$id);
        $rs = $dic->get();

        if ($rs != NULL){
            $dic = new Model("bot_dictionary");
            $dic->where("idbotdic", "=", $id);
            $d = $dic->updateRecord($requestBody);

            $status = "ok";
            $message = $id;
        } else{
            $status = "error";
            $message = "La ruta del menu que desea modificar no existe";
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }


    static public function deleteMenu(){
        
        Middleware::auditSecurity();

        $id = $_GET["id"];

        $dic = new Model("bot_dictionary");
        $dic->where("idbotdic","=",$id);
        $rs = $dic->get();

        if ($rs != NULL){
            $dic = new Model("bot_dictionary");
            $dic->where("idbotdic", "=", $id);
            $d = $dic->delete();

            $status = "ok";
            $message = $id;
        } else{
            $status = "error";
            $message = "La ruta del menu que desea eliminar no existe";
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

    static public function recuperar(){
        
        Middleware::auditSecurity();

        $id = $_GET["id"];

        $dic = new Model("bot_dictionary");
        $dic->where("idbotdic","=",$id);
        $rs = $dic->get();

        if ($rs != NULL){
            $dic = new Model("bot_dictionary");
            $dic->set("deleted_at", NULL);
            $dic->where("idbotdic", "=", $id);
            $d = $dic->update();

            $status = "ok";
            $message = $id;
        } else{
            $status = "error";
            $message = "El menu no existe";
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

}