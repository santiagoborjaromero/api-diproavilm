<?PHP


//TODO: CLase para gestionar todas las peticiones que hace el bot
class Bot {

    private $drive = "mysql";

    public function execsql($sql){
        $conn = new ConnController();
        $conn->Connect($this->drive);
        $dataresult = $conn->Execute($sql);
        return $dataresult;
    }

}