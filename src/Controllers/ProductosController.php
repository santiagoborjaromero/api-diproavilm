<?PHP

require_once(__DIR__."/../Models/Model.php");


class ProductosController extends Controller{

    static public function getAll(){
        Middleware::auditSecurity();
        $role = new Model("view_products");
        $rs = $role->get();
        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    static public function save(){
        
        Middleware::auditSecurity();

        $requestBody = Middleware::request();

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

        $requestBody = Middleware::request();
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

    static public function recuperar(){
        
        Middleware::auditSecurity();

        $requestBody = Middleware::request();
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




}