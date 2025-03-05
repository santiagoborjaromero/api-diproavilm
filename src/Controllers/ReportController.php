<?PHP

// require_once(__DIR__."/../Models/Model.php");
require_once(__DIR__."/../Models/Report.php");

class ReportController extends Controller{

    static public function analisisRotacion(){
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);

        $rpt = new Report();
        $rs = $rpt->analisisRotacion($requestBody);

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    static public function movimientoProductos(){
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);

        $rpt = new Report();
        $rs = $rpt->movimientoProductos($requestBody);

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    static public function movimientoGeneral(){
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);

        $rpt = new Report();
        $rs = $rpt->movimientoGeneral($requestBody);

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }
}