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
    
    static public function save(){
        
        Middleware::auditSecurity(); //valida el token

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true); //recoge los datos

        $config = new Model("config");
        $config->where("variable","=",$requestBody["variable"]);
        $rs = $config->get();

        if ($rs){
            $status = "error";
            $message = "La configuracion ya existe, no se puede duplicar";
        } else{
            $config = new Model("config");
            $d = $config->insertRecord($requestBody);
            $status = "ok";
            $message = $d;
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

    static public function update(){
        
        Middleware::auditSecurity();
        

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true); //recoge los datos
        $id= $_GET["id"];
        $config = new Model("config");
        $config->where("variable","=",$requestBody["variable"]);
        $rs = $config->get();

        if ($rs == NULL){
            $status = "error";
            $message = "La configuracion no existe";
        } else{
            $config = new Model("config");
            $config->where("idconfig","=",$id);
            $d = $config->updateRecord($requestBody);
            $status = "ok";
            $message = $d;
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }
}