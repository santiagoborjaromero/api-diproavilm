<?PHP

require_once(__DIR__."/../Models/Model.php");
require_once(__DIR__."/../Models/MenuRole.php");

class RoleMenuController extends Controller{

    static public function getAll(){
        Middleware::auditSecurity();
        $role = new Model("view_roles_by_nusers");
        $rs = $role->get(true);
        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    static public function getByRol(){
        Middleware::auditSecurity();

        $requestBody = Middleware::request();

        if (!$requestBody){
            $requestBody = ["idrole" => $_GET["idrole"]];
        }

        $idrole = $requestBody["idrole"];
        $role = new Model("rolemenu");
        $role->where("idrole", "=", $idrole);
        $rs = $role->get();

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    static public function saveRolMenu(){
        Middleware::auditSecurity();
        
        $requestBody = $_POST;
        if (!$requestBody) $requestBody = Middleware::request();

        $idrole = $_GET["id"];

        $role = new MenuRole();
        $rs = $role->saveBlockRoleMenu($requestBody["data"], $idrole);

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

}