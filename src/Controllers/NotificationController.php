<?PHP

require_once(__DIR__."/../Models/Model.php");
require_once(__DIR__."/../Models/Alerta.php");

class NotificationController extends Controller{
    static public function getAlertas(){
        Middleware::auditSecurity();

        /**TODO: Notificacion para productos stock minimo */
        $noti = array();

        $prod = new Alerta();
        $rs = $prod->getStockAlert();
        foreach ($rs as $key => $value) {
            $noti[] = [
                "tipo" => "Stock",
                "razon" => "Producto ID {$value['idproduct']}, Nombre: {$value['name']}, Stock Actual {$value['stock']} 
                es menor o igual al Stock Minimo {$value['stock_min']}"
            ];
        }

        
        http_response_code(200);
        echo Controller::formatoSalida("ok",$noti);
    }
}