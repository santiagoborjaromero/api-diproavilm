<?PHP

class Alerta{

    private $drive = "mysql";

    public function getStockAlert(){
        $sql = "SELECT * FROM product WHERE stock <= stock_min AND deleted_at IS NULL  AND status = 1";
        $conn = new ConnController();
        $conn->Connect($this->drive);
        $dataresult = $conn->Execute($sql);
        return $dataresult;
    }
}