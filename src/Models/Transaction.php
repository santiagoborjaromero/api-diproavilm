<?PHP

class Transaction{

    private $drive = "mysql";

    public  function getData($requestBody){
        $sql = "SELECT * FROM view_transaction WHERE DATE(`date`) BETWEEN '" . $requestBody["fecha_ini"] .
            " ' AND '" . $requestBody["fecha_fin"] . "'";
        $conn = new ConnController();
        $conn->Connect($this->drive);
        $dataresult = $conn->Execute($sql);
        return $dataresult;
    }
}