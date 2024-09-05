<?PHP

// require_once(__DIR__."/../Models/Model.php");
require_once(__DIR__."/../Models/Report.php");

class ReportController extends Controller{

    static public function analisisRotacion(){
        Middleware::auditSecurity();

        $requestBody = Middleware::request();

        $rpt = new Report();
        $rs = $rpt->analisisRotacion($requestBody);

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    static public function movimientoProductos(){
        Middleware::auditSecurity();

        $requestBody = Middleware::request();

        $rpt = new Report();
        $rs = $rpt->movimientoProductos($requestBody);

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }
}