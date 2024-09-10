<?PHP

class Product{

    private $drive = "mysql";

    public  function generarKardex($requestBody){
        $sql = "CALL sp_kardex({$requestBody},1)";
        $conn = new ConnController();
        $conn->Connect($this->drive);
        $dataresult = $conn->Execute($sql);
        return $dataresult;
    }

    public  function recalcularSaldos(){
        $sql = "CALL sp_recalculo()";
        $conn = new ConnController();
        $conn->Connect($this->drive);
        $dataresult = $conn->Execute($sql);
        return $dataresult;
    }
}