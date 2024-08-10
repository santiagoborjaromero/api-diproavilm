<?PHP

require_once(__DIR__."/../Models/Model.php");


class PaisController extends Controller{

    static public function getAll(){
        Middleware::auditSecurity();
        
        $role = new Model("country");
        $rs = $role->get();

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

}