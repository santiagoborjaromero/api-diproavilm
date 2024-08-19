<?PHP

require_once(__DIR__."/../Models/Model.php");
require_once(__DIR__."/../Models/Bot.php");



class BotController extends Controller{

    static public function getAll(){
        Middleware::auditSecurity();

        $requestBody = $_GET;

        $au = new Audit();
        $rs = $au->getData($requestBody);

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