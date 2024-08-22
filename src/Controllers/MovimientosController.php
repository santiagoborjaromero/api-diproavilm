<?PHP

require_once(__DIR__."/../Models/Model.php");
require_once(__DIR__."/../Models/Transaction.php");

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

        $requestBody = Middleware::request();

        $trans= new Transaction();
        $rs = $trans->getData($requestBody);

        // $role = new Model("view_transaction");

        // if ($requestBody){
        //     foreach ($requestBody as $key => $value) {
        //         if ($key == "date") {
        //             $role->where($key, "BETWEEN", $value);
        //         } else{
        //             $role->where($key, "=", $value);
        //         }
        //     }
        // }
        // $rs = $role->get();

        http_response_code(200);
        echo Controller::formatoSalida("ok",$rs);
    }


    static public function save(){
        $payload = Middleware::auditSecurity();

        $requestBody = Middleware::request();
        // $id = $_GET["id"];

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
            }
        }
        
        http_response_code(200);
        echo Controller::formatoSalida("ok",$idtransaction);
    }





}