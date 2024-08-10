<?PHP

require_once(__DIR__."/../Models/Model.php");


class menuController extends Controller{

    static public function getAll(){
        Middleware::auditSecurity();
        $role = new Model("menu");
        $rs = $role->get(true);
        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    static public function saveMenu(){
        
        Middleware::auditSecurity();

        $requestBody = Middleware::request();

        $menu = new Model("menu");
        $menu->where("route","=",$requestBody["route"]);
        $rs = $menu->get();

        if ($rs != NULL){
            $status = "error";
            $message = "La ruta del menu ya existe, no se puede duplicar";
        } else{
            $user = new Model("menu");
            $d = $user->insertRecord($requestBody);
            $status = "ok";
            $message = $d;
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }


    static public function updateMenu(){
        
        Middleware::auditSecurity();

        $requestBody = Middleware::request();
        $id = $_GET["id"];

        $menu = new Model("menu");
        $menu->where("idmenu","=",$id);
        $rs = $menu->get();

        if ($rs != NULL){
            $user = new Model("menu");
            $user->where("idmenu", "=", $id);
            $d = $user->updateRecord($requestBody);

            $status = "ok";
            $message = $id;
        } else{
            $status = "error";
            $message = "La ruta del menu que desea modificar no existe";
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }



    static public function deleteMenu(){
        
        Middleware::auditSecurity();

        $id = $_GET["id"];

        $menu = new Model("menu");
        $menu->where("idmenu","=",$id);
        $rs = $menu->get();

        if ($rs != NULL){
            $user = new Model("menu");
            $user->where("idmenu", "=", $id);
            $d = $user->delete();

            $status = "ok";
            $message = $id;
        } else{
            $status = "error";
            $message = "La ruta del menu que desea eliminar no existe";
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

}