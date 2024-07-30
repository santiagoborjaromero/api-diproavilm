<?PHP

class Middleware{

    static public function auditSecurity(){

        $authorization = getallheaders()["Authorization"];
        $token_to_evaluate = explode(" ", $authorization);
        if ($token_to_evaluate[0] == "Bearer"){
            $payload = json_decode(Controller::decode(base64_decode($token_to_evaluate[1])), true);

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
}