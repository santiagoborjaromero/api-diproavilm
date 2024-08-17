<?PHP

require_once(__DIR__."/../Models/Model.php");

class MovimientosController extends Controller{

    static public function getAll(){
        Middleware::auditSecurity();
        $role = new Model("view_transaction");
        $rs = $role->get();
        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }


}