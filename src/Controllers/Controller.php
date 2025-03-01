<?php

//TODO: Clase base de todo el sistema
class Controller extends ConnController {

    static $key     = "7PToGGTJ71knRd86WF39wfj619qewnbZ";
    static $iv      = "q24nxK63oYShfXwU";
    static $cifrado = "AES-256-CBC";

    //TODO: Determinar una estructura comun para todas las respuestas
    static public function formatoSalida($code, $dato){
        $resp = [
            "status" => $code,
            "message" => Controller::encode(json_encode($dato))
        ];
        // file_put_contents("logger.log", json_encode($resp, JSON_PRETTY_PRINT) , "\,", FILE_APPEND);
        return json_encode($resp, JSON_PRETTY_PRINT);
    }

    //TODO: Metodo que codifica la informacion
    static public function encode($texto){
        return base64_encode(openssl_encrypt($texto, Controller::$cifrado, Controller::$key, 0, Controller::$iv));
    }

    //TODO: Metodo que descodifica la informacion
    static public function decode($texto){
        $decrypted = openssl_decrypt(base64_decode($texto), Controller::$cifrado ,Controller::$key, 0, Controller::$iv);
        return $decrypted;
    }
}