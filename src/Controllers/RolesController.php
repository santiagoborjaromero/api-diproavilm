<?PHP

require_once(__DIR__."/../Models/Model.php");

class RolesController extends Controller{

    static public function getAll(){
        Middleware::auditSecurity();
        $rs = new Model("role");
        $rec = $rs->get();
        http_response_code(200);
        echo Controller::formatoSalida("ok",$rec);
    }
}