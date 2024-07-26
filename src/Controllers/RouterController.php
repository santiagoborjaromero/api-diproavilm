<?PHP

use Controller;

class RouterController {

    private $metodo;
    private $path;
    private $rutas;

    public function __construct() {
        $this->metodo = $_SERVER["REQUEST_METHOD"];
        // $this->path = $_SERVER["REQUEST_URI"];
        // if ($this->metodo == "POST"){
        //     echo Controller::formatoSalida("ok",$_POST['data']);
        // }
        $this->path  = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
        $proc_rutas = str_replace("/apidiproavilm/","",$this->path);
        $this->rutas = explode("/",$proc_rutas);
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

        if ($this->rutas[0] != ""){
            foreach($routerList as $k => &$r){
                if (!$found && $k == $this->metodo . "|" . $this->rutas[0]){
                    $found = true;
                    $event = $r;
                }
            }
        }

        if ($event == ""){
            $this->noRoute();
            exit();
        }
        eval($event . ";");
    }




}