<?PHP

class Bot {

    private $drive = "mysql";

    public function execsql($sql){
        $conn = new ConnController();
        $conn->Connect($this->drive);
        $dataresult = $conn->Execute($sql);
        return $dataresult;
    }

}