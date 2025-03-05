<?PHP

require_once(__DIR__."/../Models/Model.php");

class ProductLineController extends Controller{

    static public function getAll(){
        Middleware::auditSecurity();
        $role = new Model("productline");
        $rs = $role->get();
        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    static public function save(){
        
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);

        $menu = new Model("productline");
        $menu->where("description","=",$requestBody["n"]);
        $rs = $menu->get(true);

        if ($rs != NULL){
            $status = "error";
            $message = "La linea del producto ya existe";
        } else{
            $user = new Model("productline");
            $d = $user->insertRecord($requestBody);
            $status = "ok";
            $message = $d;
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }


    static public function update(){
        
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);
        $id = $_GET["id"];


        $menu = new Model("productline");
        $menu->where("idproductline","=",$id);
        $rs = $menu->get(true);

        if ($rs != NULL){
            $user = new Model("productline");
            $user->where("idproductline", "=", $id);
            $d = $user->updateRecord($requestBody);

            $status = "ok";
            $message = $id;
        } else{
            $status = "error";
            $message = "La linea no existe";
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

    static public function recuperar(){
        
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);
        $id = $_GET["id"];

        $menu = new Model("productline");
        $menu->where("idproductline","=",$id);
        $rs = $menu->get();

        if ($rs != NULL){
            $user = new Model("productline");
            $user->set("deleted_at", NULL);
            $user->where("idproductline", "=", $id);
            $d = $user->update();

            $status = "ok";
            $message = $id;
        } else{
            $status = "error";
            $message = "La linea no existe";
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }



    static public function delete(){
        
        Middleware::auditSecurity();

        $id = $_GET["id"];

        $menu = new Model("productline");
        $menu->where("idproductline","=",$id);
        $rs = $menu->get(true);

        if ($rs != NULL){
            $user = new Model("productline");
            $user->where("idproductline", "=", $id);
            $d = $user->delete();

            $status = "ok";
            $message = $id;
        } else{
            $status = "error";
            $message = "La linea a eliminar no existe";
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

}