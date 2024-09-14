<?PHP

require_once(__DIR__."/../Models/Model.php");
require_once(__DIR__."/../Models/Bot.php");

class BotController extends Controller{

    static public function capasGetAll(){
        Middleware::auditSecurity();

        $bot = new Model("bot_spelling");
        $rs = $bot->get(true);

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    static public function capasSave(){
        Middleware::auditSecurity();

        $requestBody = Middleware::request();

        $menu = new Model("bot_spelling");
        $menu->where("wordfind","=",$requestBody["wordfind"]);
        $menu->where("menurun","=",$requestBody["menurun"]);
        $rs = $menu->get();

        if ($rs != NULL){
            $status = "error";
            $message = "La capa ya existe, no se puede duplicar";
        } else{
            $user = new Model("bot_spelling");
            $d = $user->insertRecord($requestBody);
            $status = "ok";
            $message = $d;
        }

        http_response_code(200);
        echo Controller::formatoSalida("ok",$message);
    }

    static public function capasUpdate(){
        Middleware::auditSecurity();

        $requestBody = Middleware::request();
        $id = $_GET["id"];

        $menu = new Model("bot_spelling");
        $menu->where("idbotspelling","=",$id);
        $rs = $menu->get();

        if ($rs == NULL){
            $status = "error";
            $message = "La capa no existe";
        } else{
            $menu = new Model("bot_spelling");
            $menu->where("idbotspelling","=",$id);
            $d = $menu->updateRecord($requestBody);
            $status = "ok";
            $message = $d;
        }

        http_response_code(200);
        echo Controller::formatoSalida("ok",$message);
    }

    static public function capasDelete(){
        Middleware::auditSecurity();

        $id = $_GET["id"];

        $menu = new Model("bot_spelling");
        $menu->where("idbotspelling","=",$id);
        $rs = $menu->get();

        if ($rs != NULL){
            $user = new Model("bot_spelling");
            $user->where("idbotspelling", "=", $id);
            $d = $user->delete();

            $status = "ok";
            $message = $id;
        } else{
            $status = "error";
            $message = "La capa que desea eliminar no existe";
        }

        http_response_code(200);
        echo Controller::formatoSalida("ok",$message);
    }

    static public function getDictionary(){
        Middleware::auditSecurity();

        $bot = new Model("bot_dictionary");
        $bot->orderBy("menu");
        $rs = $bot->get();

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    static public function execSql(){
        $sql = $_GET["sql"];
        // $args = $_GET["args"];
        $bot = new Bot();
        $rs = $bot->execSql($sql);
        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
        // echo json_encode($rs);
    }
}