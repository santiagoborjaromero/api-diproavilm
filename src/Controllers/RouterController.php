<?PHP

use Controller;

class RouterController {

    private $metodo;
    private $ruta;

    public function __construct() {
        $this->metodo = $_SERVER["REQUEST_METHOD"];
        $this->ruta = $_GET["ruta"];
        if (!$this->ruta){
            $this->noRoute();
            exit();
        }
        $this->routes();
    }

    function healthy(){
        echo Controller::formatoSalida("ok","healthy");
    }

    function noRoute(){
        echo Controller::formatoSalida("error","La ruta y metodo no existe");
    }
    
    function routes(){
        $file_routes = __DIR__ . "/../../routes.json";
        if (!file_exists($file_routes)){
            $structure = '{
    "GET|healthy" : "RouterController::healthy()",
}';
            file_put_contents($file_routes, $structure);
            die("Error en la configuracion de las rutas: routes.json");
        }
        
        $routerList = json_decode(file_get_contents($file_routes), true);
        $found = false;
        $event = "";
        $ruta_a_buscar = $this->metodo . "|" . $this->ruta;

        foreach($routerList as $ruta => &$controller){
            if (!$found && $ruta == $ruta_a_buscar){
                $found = true;
                $event = $controller;
            }
        }

        if (!$found){
            $this->noRoute();
            exit();
        }

        eval($event . ";");
    }




}