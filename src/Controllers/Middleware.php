<?PHP

class Middleware{

    static public function auditSecurity($devolver = false){

        $authorization = getallheaders()["Authorization"];
        $token_to_evaluate = explode(" ", $authorization);
        if ($token_to_evaluate[0] == "Bearer"){
            $payload = json_decode(Controller::decode(base64_decode($token_to_evaluate[1])), true);

            if ($devolver){
                return $payload;
            } 

            $valid = false;
            $valid_c = 0;
            $razon = "";

            /** 
             * Chequeo de estructura de token
             */

            $dic = ["iduser", "idrole", "expire_at"];
            foreach($dic as $d){
                if (array_key_exists($d, $payload)){
                    $valid_c ++;
                }
            }

            if ($valid_c == count($dic)){
                $valid = true;
                $razon = "ok1";
            } else {
                $valid = false;
                // echo Controller::formatoSalida("error", "Token inválido");
                $razon = "Token, estructura inválida";
            }


            /** 
             * Chequeo de fecha de expiracion
             */
            if ($valid){
                if ( $payload["expire_at"] >= date("Y-m-d H:i:s")){
                    $valid = true;
                    $razon = "ok2";
                }else{
                    $valid = false;
                    // echo Controller::formatoSalida("error", "Token ha expirado");
                    $razon = "Token ha expirado";
                }
            }

            // return $valid;
        } else{
            $valid = false;
            $razon = "El token se encuentra mal formado, el formato correcto es Bearer";
        }

        // return ["status"=>$valid, "razon"=>$razon];
        if (!$valid){
            echo Controller::formatoSalida("error", $razon);
            exit();
        }
        return $payload;

    }

    static function request(){
        $data = json_decode(file_get_contents('php://input'), true);
        $ddata = fopen("php://input", "r");

        if ($data){
            //TODO: Es para raw desde POSTMAN
            return $data;
        } else if ($ddata){
            //TODO: se utiliza cuando el metodo es PUT
            try{
                $requestBody = array();
                $dd = fread($ddata, 1024);
                $dd = str_replace("+", " ", $dd);
                $dd = str_replace("%40", "@", $dd);

                if (strpos($dd,"&")){
                    $ndata = explode('&', $dd);
                    foreach ($ndata as $key) {
                        $a = explode("=", $key);
                        $requestBody[$a[0]] = $a[1];
                    }
                } else{
                    $requestBody = $dd;
                }
            }catch(Exception $e){
                $requestBody = null;
            }
            return $requestBody;
        } else if ($_POST){
            //TODO: Cuando las variables vienen en POST
            return $_POST;
        } else if ($_REQUEST){
            //TODO: Cuando las variables vienen no vienen en POS, vienen en REQUEST
            return $_REQUEST;
        } else if ($_GET){
            return $_GET;
            //TODO: ** Aun falta ver cuando en POSTMAN se pone en form-data que no captura la informacion que se envia
        }
    }
}