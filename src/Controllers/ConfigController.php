<?PHP

require_once(__DIR__."/../Models/Model.php");

class ConfigController extends Controller{

    static public function getAll(){
        $au = new Model("config");
        $au->orderBy("order", "asc");
        $rs = $au->get();

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }
}