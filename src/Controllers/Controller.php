<?php

//TODO: Clase base de todo el sistema
class Controller extends ConnController {

    //TODO: Determinar una estructura comun para todas las respuestas
    static public function formatoSalida($code, $dato){
        $resp = [
            "status" => $code,
            "message" => $dato
        ];

        return json_encode($resp, JSON_PRETTY_PRINT);
    }

    //TODO: Metodo que codifica la informacion
    static public function encode($texto){
        return openssl_encrypt($texto, "AES-256-CBC", "6UG8key@Un14nd3s", 0);
    }

    //TODO: Metodo que descodifica la informacion
    static public function decode($texto){
        return openssl_decrypt($texto, "AES-256-CBC", "6UG8key@Un14nd3s", 0 );
    }



}