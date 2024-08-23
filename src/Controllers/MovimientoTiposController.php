<?PHP

require_once(__DIR__."/../Models/Model.php");

class MovimientoTiposController extends Controller{

    static public function getAll(){
        Middleware::auditSecurity();
        $role = new Model("movementtype");
        $rs = $role->get(true);
        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    static public function getAllWF(){
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

    static public function save(){
        
        Middleware::auditSecurity();
        
        $requestBody = Middleware::request();

        $user = new Model("movementtype");
        $user->where("name","=",$requestBody["name"]);
        $rs = $user->get();

        if ($rs != NULL){
            $status = "error";
            $message = "Tipo de movimiento ya existe, no puede duplicar";
        } else{
            $user = new Model("movementtype");
            $d = $user->insertRecord($requestBody);
            $status = "ok";
            $message = $d;
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

    static public function update(){
        
        Middleware::auditSecurity();

        $requestBody = Middleware::request();
        $id = $_GET["id"];

        $menu = new Model("movementtype");
        $menu->where("idmovementtype","=",$id);
        $rs = $menu->get();

        if ($rs != NULL){
            $user = new Model("movementtype");
            $user->where("idmovementtype", "=", $id);
            $d = $user->updateRecord($requestBody);

            $status = "ok";
            $message = $id;
        } else{
            $status = "error";
            $message = "El tipo de movimiento que desea modificar no existe";
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

    static public function delete(){
        Middleware::auditSecurity();
        $id = $_GET["id"];
        $data = new Model("movementtype");
        $data->where("idmovementtype", "=", $id);
        $rs = $data->delete();
        $status = "ok";
        $message = $rs;
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

    static public function recuperar(){
        Middleware::auditSecurity();
        $id = $_GET["id"];
        $data = new Model("movementtype");
        $data->set("deleted_at", NULL);
        $data->where("idmovementtype", "=", $id);
        $rs = $data->update();
        $status = "ok";
        $message = $rs;
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }


}