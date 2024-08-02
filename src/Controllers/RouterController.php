<?PHP

use Controller;

class RouterController {

    private $metodo;
    private $ruta;

    public function __construct() {
        $this->metodo = $_SERVER["REQUEST_METHOD"];
        // print($this->metodo);
        $this->ruta = $_GET["ruta"];
        if (!$this->ruta){
            $this->noRoute();
            exit();
        }
        // $this->path  = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
        // $proc_rutas = str_replace("/api6ug8/","",$this->path);
        // $this->rutas = explode("/",$proc_rutas);
        $this->routes();
    }

    function healthy(){
        echo Controller::formatoSalida("ok","healthy");
    }

    function noRoute(){
        echo Controller::formatoSalida("error","La ruta y metodo no existe");
    }
    
    function routes(){
        $routerList = json_decode(file_get_contents(__DIR__ . "/../../routes.json"), true);

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