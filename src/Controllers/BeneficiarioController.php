<?PHP

require_once(__DIR__."/../Models/Model.php");


class BeneficiarioController extends Controller{

    static public function getAll(){
        Middleware::auditSecurity();
        
        $bene = new Model("view_beneficiary");
        $rs = $bene->get();

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    static public function getOne(){
        Middleware::auditSecurity();

        $id = $_GET["id"];
        
        $bene = new Model("view_beneficiary");
        $bene->where("idbeneficiary","=",$id);
        $rs = $bene->get();

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    static public function getByType(){
        Middleware::auditSecurity();

        $tipo = $_GET["tipo"];
        
        $bene = new Model("view_beneficiary");
        $bene->where("type", "=", $tipo);
        $bene->orderBy("nombre", "asc");
        $rs = $bene->get();

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    static public function saveBeneficiario(){
        
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);

        $bene = new Model("beneficiary");
        $bene->where("identificationnumber","=",$requestBody["identificationnumber"]);
        $rs = $bene->get(true);

        if ($rs){
            $status = "error";
            $message = "El beneficiario ya existe";
        } else{
            $bene = new Model("beneficiary");
            $d = $bene->insertRecord($requestBody);
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

        $bene = new Model("beneficiary");
        $bene->where("identificationnumber","=",$requestBody["identificationnumber"]);
        $rs = $bene->get(true);

        if ($rs){
            $bene = new Model("beneficiary");
            $bene->where("idbeneficiary", "=", $id);
            $d = $bene->updateRecord($requestBody);

            $status = "ok";
            $message = $id;
        } else{
            $status = "error";
            $message = "El beneficiario que desea modificar no existe";
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }



    static public function recuperaBeneficiario(){
        
        Middleware::auditSecurity();

        $id = $_GET["id"];

        if ($id === null){
            $status = "error";
            $message = "El ID beneficiario se encuentra vacio";
        }else{
            $bene = new Model("beneficiary");
            $bene->where("idbeneficiary","=",$id);
            $rs = $bene->get();
    
            if ($rs){
                $bene = new Model("beneficiary");
                $bene->set("deleted_at", NULL);
                $bene->where("idbeneficiary", "=", $id);
                $d = $bene->update();
                $status = "ok";
                $message = "Beneficiario recuperado con éxito";
            } else{
                $status = "error";
                $message = "El beneficiario que desea eliminar no existe";
            }
        }

        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }


}