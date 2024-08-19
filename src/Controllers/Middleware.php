<?PHP

class Middleware{

    static public function noAuditSecurity($devolver = false){
        return true;
    }
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
            if ($authorization){
                $valid = false;
                $razon = "El token se encuentra mal formado, el formato correcto es Bearer";
            } else {
                return null;
            }
        }

        // return ["status"=>$valid, "razon"=>$razon];
        if (!$valid){
            echo Controller::formatoSalida("error", $razon);
            exit();
        }
        return $payload;

    }

    static function request(){
        $requestBody = array();
        
        $data = json_decode(file_get_contents('php://input'), true);

        $appContent = @$_SERVER["CONTENT_TYPE"]; ///puede ser NULL

        //TODO: OPCION 1 Libre sin post PUT ni nada mas que GET
        if ($data){
            $requestBody = $data;
        }

        //TODO: Para form-data
        if(!$requestBody){
            $data = fopen('php://input', 'r');
            $str = fread($data, 8192);
            
            if ($appContent){
                if ($appContent == "application/json"){
                    parse_str($str, $requestBody);
                } else{
                    $cnt = explode(";",$appContent);
                    if ($cnt[0] == "multipart/form-data"){
                        $vd = explode("=",$cnt[1])[1];
                        $str = str_replace($vd, "", $str);
                        $str = str_replace("-", "", $str);
                        $str = str_replace("ContentDisposition: formdata;", "", $str);
                        $str = str_replace(" ", "", $str);
                        $str = str_replace('"', "", $str);
                        $str = str_replace(chr(13), "", $str);
                        $str = str_replace(chr(27), "", $str);
                        $strArr = explode("\n", $str);
                        // die();
    
                        $arReq = [];
                        $old = "";
    
                        for ($i = 0 ; $i < count($strArr); $i++){
                            $v = $strArr[$i];
                            $pos = strpos($v, "name=");
                            if ($pos!=""){
                                $c = str_replace('name=', "", $v);
                                $arReq[$c] = "";
                                $old = $c;
                            } else{
                                if (ord($v) != 13 && ord($v) != 27 &&  ord($v) != 0){
                                    if ($old != ""){
                                        $arReq[$old] = $v;
                                        $old = "";
                                    }
                                }
                            }
                        }
                        $requestBody = $arReq;
                    } else if ($appContent == "application/x-www-form-urlencoded" || $cnt[0] == "application/x-www-form-urlencoded"){
                        //TODO: PAra x-www-form-urlencoded o PUT en formularios
                        parse_str($str, $requestBody);
                        // if (strpos($str,"&")){
                        //     $nd = explode('&', $str);
                        //     foreach ($nd as $key) {
                        //         $a = explode("=", $key);
                        //         $requestBody[$a[0]] = $a[1];
                        //     }
                        // }
                    } 
                }
            }
        }

        if(!$requestBody){
            $requestBody = $_POST;
        }

        if(!$requestBody){
            $requestBody = $_REQUEST;
        }
        
        

        return $requestBody;
    }
}