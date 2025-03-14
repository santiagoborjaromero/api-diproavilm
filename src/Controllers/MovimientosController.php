<?PHP

require_once(__DIR__."/../Models/Model.php");
require_once(__DIR__."/../Models/Transaction.php");
require_once(__DIR__."/../Models/Product.php");

class MovimientosController extends Controller{

    static public function getAll(){
        Middleware::auditSecurity();
        $role = new Model("view_transaction");
        $rs = $role->get();
        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }

    static public function getByFilter(){
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);

        $trans= new Transaction();
        $rs = $trans->getData($requestBody);

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }


    static public function getOne(){
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);

        $id = $_GET["id"];

        $menu = new Model("view_transaction");
        $menu->where("idtransaction","=",$id);
        $rs = $menu->get();

        $data = array();
        $data = $rs[0];
        
        if ($rs){
            
            $menu = new Model("view_movements");
            $menu->where("idtransaction","=",$id);
            $rsmov = $menu->get();

            $data["items"] = $rsmov;

            $status = "ok";
            $message = $data;
        } else{
            $status = "error";
            $message = "El comprobamte a anular no existe";
        }

        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }


    static public function save(){
        $payload = Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);

        $transaction = [];
        $transaction["iduser"] = $payload["iduser"];
        $transaction["idbeneficiary"] = $requestBody["idbeneficiary"];
        $transaction["idmovementtype"] = $requestBody["idmovementtype"];
        $transaction["date"] = $requestBody["date"];
        $transaction["numberdocument"] = $requestBody["numberdocument"];
        $transaction["subtotal"] = $requestBody["subtotal"];
        $transaction["discount"] = $requestBody["discount"];
        $transaction["total"] = $requestBody["total"];
        $transaction["reference"] = $requestBody["reference"];
        
        $tran = new Model("transaction");
        $idtransaction = $tran->insertRecord($transaction);
        
        if ($idtransaction > 0){
            
            $kardx = new Product();

            $items = $requestBody["items"];
            foreach ($items as $key => $value) {
                $newi = [];
                $newi["idtransaction"] = $idtransaction;
                $newi["idproduct"] = $value["idproduct"];
                $newi["entry"] = $value["entry"];
                $newi["qty"] = $value["qty"];
                $newi["price"] = $value["price"];
                $newi["total"] = $value["total"];

                $productmovement = new Model("productmovement");
                $productmovement->insertRecord($newi);

                $kardx->generarKardex($value["idproduct"]);
            }
        }
        
        http_response_code(200);
        echo Controller::formatoSalida("ok",$idtransaction);
    }


    static public function update(){
        $payload = Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);

        $id = $_GET["id"];

        $transaction = [];
        $transaction["iduser"] = $payload["iduser"];
        $transaction["idbeneficiary"] = $requestBody["idbeneficiary"];
        $transaction["idmovementtype"] = $requestBody["idmovementtype"];
        $transaction["date"] = $requestBody["date"];
        $transaction["numberdocument"] = $requestBody["numberdocument"];
        $transaction["subtotal"] = $requestBody["subtotal"];
        $transaction["discount"] = $requestBody["discount"];
        $transaction["total"] = $requestBody["total"];
        $transaction["reference"] = $requestBody["reference"];
        
        $tran = new Model("transaction");
        $tran->where("idtransaction", "=", $id);
        $rs = $tran->updateRecord($transaction);

        $mov = new Model("productmovement");
        $mov->where("idtransaction", "=", $id);
        $mov = $mov->delete(true);

        $items = $requestBody["items"];
        foreach ($items as $key => $value) {
            $newi = [];
            $newi["idtransaction"] = $id;
            $newi["idproduct"] = $value["idproduct"];
            $newi["entry"] = $value["entry"];
            $newi["qty"] = $value["qty"];
            $newi["price"] = $value["price"];
            $newi["total"] = $value["total"];

            $productmovement = new Model("productmovement");
            $productmovement->insertRecord($newi);

            // $kardx->generarKardex($value["idproduct"]);
        }
        
        $kardx = new Product();
        $kardx->recalcularSaldos();

        http_response_code(200);
        echo Controller::formatoSalida("ok",$id);
    }

    
    static public function anular(){
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);

        $id = $_GET["id"];

        $menu = new Model("transaction");
        $menu->where("idtransaction","=",$id);
        $rs = $menu->get();

        if ($rs){
            $data = new Model("transaction");
            $data->set("status",0);
            $data->where("idtransaction", "=", $id);
            $d = $data->update();

            $kardx = new Product();
            $kardx->recalcularSaldos();

            $status = "ok";
            $message = $id;
        } else{
            $status = "error";
            $message = "El comprobamte a anular no existe";
        }

        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }

    static public function recuperar(){
        Middleware::auditSecurity();

        $rqstBody = Middleware::request();
        $requestBody = json_decode(Controller::decode($rqstBody["data"]),true);

        $id = $_GET["id"];

        $menu = new Model("transaction");
        $menu->where("idtransaction","=",$id);
        $rs = $menu->get();

        if ($rs !== NULL){
            $data = new Model("transaction");
            $data->set("status",1);
            $data->where("idtransaction", "=", $id);
            $d = $data->update();

            $kardx = new Product();
            $kardx->recalcularSaldos();

            $status = "ok";
            $message = $id;
        } else{
            $status = "error";
            $message = "El comprobamte a recuperar no existe";
        }

        http_response_code(200);
        echo Controller::formatoSalida($status,$message);
    }




}