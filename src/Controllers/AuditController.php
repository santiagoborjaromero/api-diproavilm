<?PHP

require_once(__DIR__."/../Models/Model.php");
require_once(__DIR__."/../Models/Audit.php");


class AuditController extends Controller{
    static public function getAll(){
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);
        // $requestBody = $_GET;

        $au = new Audit();
        $rs = $au->getData($requestBody);

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    static public function getAuditBot(){
        Middleware::auditSecurity();

        // $requestBody = $_GET;
        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);

        $au = new Audit();
        $rs = $au->getDataBot($requestBody);

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

}