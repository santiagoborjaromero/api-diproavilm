<?PHP

class Report{

    private $drive = "mysql";

    public  function analisisRotacion($requestBody){

        $fecha_ini = $requestBody["fecha_ini"];
        $fecha_fin = $requestBody["fecha_fin"];
        // $diff = date_diff($fecha_ini, $fecha_fin);
        
        $sql = "CALL sp_analisis_rotacion('$fecha_ini','$fecha_fin')";
        $conn = new ConnController();
        $conn->Connect($this->drive);
        $dataresult = $conn->Execute($sql);
        return $dataresult;
    }

    public  function movimientoProductos($requestBody){

        $fecha_ini = $requestBody["fecha_ini"];
        $fecha_fin = $requestBody["fecha_fin"];

        $sql = "CALL sp_movimiento_productos('{$fecha_ini}','{$fecha_fin}',1)";
        $conn = new ConnController();
        $conn->Connect($this->drive);
        $dataresult = $conn->Execute($sql);
        return $dataresult;
    }
}