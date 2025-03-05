<?PHP

require_once(__DIR__."/../Models/Model.php");
require_once(__DIR__."/../Models/Product.php");


class ProductosController extends Controller{

    static public function getAll(){
        Middleware::auditSecurity();
        $role = new Model("view_products");
        $role->orderBy("name","asc");
        $rs = $role->get();
        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    static public function save(){
        
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);

        $menu = new Model("product");
        $menu->where("productcode","=",$requestBody["productcode"]);
        $rs = $menu->get(true);

        if ($rs != NULL){
            $status = "error";
            $message = "El código del producto ya existe";
        } else{
            $menu = new Model("product");
            $menu->where("barcode","=",$requestBody["barcode"]);
            $rs = $menu->get(true);

            if ($rs != NULL){
                $status = "error";
                $message = "El código de barras del producto ya existe";
            } else{
                $user = new Model("product");
                $d = $user->insertRecord($requestBody);
                $status = "ok";
                $message = $d;
            }
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }


    static public function update(){
        
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);
        $id = $_GET["id"];


        $menu = new Model("product");
        $menu->where("idproduct","=",$id);
        $rs = $menu->get(true);

        if ($rs != NULL){
            $user = new Model("product");
            $user->where("idproduct", "=", $id);
            $d = $user->updateRecord($requestBody);

            $status = "ok";
            $message = $id;
        } else{
            $status = "error";
            $message = "La producto no existe";
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

    static public function saveStockMinMax(){
        
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);

        foreach ($requestBody["data"] as $key => $value) {
            $user = new Model("product");
            $user->set("stock_min",$value["stock_min"]);
            $user->set("stock_max",$value["stock_max"]);
            $user->where("idproduct", "=", $value["idproduct"]);
            $user->update();
        }
        http_response_code(200);
        echo Controller::formatoSalida("ok","Los stocks mínimo y máximo se encuentran actualizados.");
    }

    static public function recuperar(){
        
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);
        $id = $_GET["id"];


        $menu = new Model("product");
        $menu->where("idproduct","=",$id);
        $rs = $menu->get();

        if ($rs != NULL){
            $user = new Model("product");
            $user->set("deleted_at", NULL);
            $user->where("idproduct", "=", $id);
            $d = $user->update();

            $status = "ok";
            $message = $id;
        } else{
            $status = "error";
            $message = "La producto no existe";
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }



    static public function delete(){
        
        Middleware::auditSecurity();

        $id = $_GET["id"];

        $menu = new Model("product");
        $menu->where("idproduct","=",$id);
        $rs = $menu->get(true);

        if ($rs != NULL){
            $user = new Model("product");
            $user->where("idproduct", "=", $id);
            $d = $user->delete();

            $status = "ok";
            $message = $id;
        } else{
            $status = "error";
            $message = "El producto que desea eliminar no existe";
        }
        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }


    static public function kardex(){
        
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);
        $id = $_GET["id"];

        $kardx = new Product();
        $rs = $kardx->generarKardex($id);

        $status = "ok";
        $message = $rs;

        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }




}