<?PHP

require_once(__DIR__."/../Models/Model.php");

class RolesController extends Controller{

    static public function getAll(){
        Middleware::auditSecurity();
        $role = new Model("view_roles_by_nusers");
        $rs = $role->get();
        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    static public function getAllAvailables(){
        Middleware::auditSecurity();
        $role = new Model("view_roles_by_nusers");
        $role->where("status" , "=", 1);
        $rs = $role->get(true);
        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }


    static public function saveRole(){
        
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);
        

        $user = new Model("role");
        $user->where("name","=",$requestBody["name"]);
        $rs = $user->get();

        if ($rs){
            $status = "error";
            $message = "Rol ya existe, no se puede duplicar";
        } else{
            $user = new Model("role");
            $d = $user->insertRecord($requestBody);
            $status = "ok";
            $message = $d;
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

    static public function updateRole(){
        
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);
        $id = $_GET["id"];


        $status = "ok";
        $message = $requestBody;

        if (isset($id) && $id<=0){
            $status = "error";
            $message = "Id erroneo";
        }

        if ($status!="error"){
   
            $user = new Model("role");
            $user->where("idrole","=",$id);
            $rs = $user->get();
    
            if ($rs){
                $user = new Model("role");
                $user->where("idrole","=",$id);
                $d = $user->updateRecord($requestBody);
                $status = "ok";
                $message = $d;
            } else{
                $status = "error";
                $message = "Rol no existe";
            }
        }

        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

    static public function deleteRole(){
        Middleware::auditSecurity();
        $idrole = $_GET["id"];

        $user = new Model("role");
        $user->where("idrole", "=", $idrole);
        $rs = $user->delete();

        $user = new Model("rolemenu");
        $user->where("idrole", "=", $idrole);
        $rs = $user->delete(true);
        
        $status = "ok";
        $message = $rs;
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

    static public function recuperar(){
        
        Middleware::auditSecurity();

        $id = $_GET["id"];

        $menu = new Model("role");
        $menu->where("idrole","=",$id);
        $rs = $menu->get();

        if ($rs){
            $user = new Model("role");
            $user->set("deleted_at", NULL);
            $user->where("idrole", "=", $id);
            $d = $user->update();

            $status = "ok";
            $message = $id;
        } else{
            $status = "error";
            $message = "El rol no existe";
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

    



}