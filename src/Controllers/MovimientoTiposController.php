<?PHP

require_once(__DIR__."/../Models/Model.php");

class MovimientoTiposController extends Controller{

    static public function getAll(){
        Middleware::auditSecurity();
        $role = new Model("movementtype");
        $rs = $role->get();
        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    static public function getOne(){
        Middleware::auditSecurity();
        $id = $_GET["id"];
        $role = new Model("movementtype");
        $role->where("idmovementtype", "=", $id);
        $rs = $role->get();
        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }


}