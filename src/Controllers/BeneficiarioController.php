<?PHP

require_once(__DIR__."/../Models/Model.php");


class BeneficiarioController extends Controller{

    static public function getAll(){
        Middleware::auditSecurity();
        
        $role = new Model("view_beneficiary");
        $rs = $role->get();

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    static public function getOne(){
        Middleware::auditSecurity();

        $id = $_GET["id"];
        
        $role = new Model("view_beneficiary");
        $role->where("idbeneficiary","=",$id);
        $rs = $role->get();

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    static public function getByType(){
        Middleware::auditSecurity();

        $tipo = $_GET["tipo"];
        
        $role = new Model("view_beneficiary");
        $role->where("type", "=", $tipo);
        $role->orderBy("nombre", "asc");
        $rs = $role->get();

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    static public function saveBeneficiario(){
        
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);

        $menu = new Model("beneficiary");
        $menu->where("identificationnumber","=",$requestBody["identificationnumber"]);
        $rs = $menu->get(true);

        if ($rs){
            $status = "error";
            $message = "El beneficiario ya existe";
        } else{
            $user = new Model("beneficiary");
            $d = $user->insertRecord($requestBody);
            $status = "ok";
            $message = $d;
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }


    static public function updateBeneficiario(){
        
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);

        $id = $_GET["id"];

        
        $menu = new Model("beneficiary");
        $menu->where("identificationnumber","=",$requestBody["identificationnumber"]);
        $rs = $menu->get(true);

        $status = "error";
        $message = $rs;

        if ($rs){
            $user = new Model("beneficiary");
            $user->where("idbeneficiary", "=", $id);
            $d = $user->updateRecord($requestBody);

            $status = "ok";
            $message = $id;
        } else{
            $status = "error";
            $message = "El beneficiario que desea modificar no existe";
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }



    static public function deleteBeneficiario(){
        
        Middleware::auditSecurity();

        $id = $_GET["id"];

        $menu = new Model("beneficiary");
        $menu->where("idbeneficiary","=",$id);
        $rs = $menu->get();

        if ($rs){
            $user = new Model("beneficiary");
            $user->where("idbeneficiary", "=", $id);
            $d = $user->delete();

            $status = "ok";
            $message = $id;
        } else{
            $status = "error";
            $message = "El beneficiario que desea eliminar no existe";
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

}