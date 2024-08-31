<?PHP

class Audit{

    private $drive = "mysql";

    public  function getData($requestBody){
        $sql = "SELECT * FROM view_audit WHERE DATE(`date`) BETWEEN '" . $requestBody["fecha_ini"] . " ' AND '" . $requestBody["fecha_fin"] . "'";
        $conn = new ConnController();
        $conn->Connect($this->drive);
        $dataresult = $conn->Execute($sql);
        return $dataresult;
    }


    public  function getDataBot($requestBody){
        $sql = "SELECT * FROM view_audit_bot WHERE DATE(`created_at`) BETWEEN '" . $requestBody["fecha_ini"] . " ' AND '" . $requestBody["fecha_fin"] . "' ORDER BY created_at desc";
        $conn = new ConnController();
        $conn->Connect($this->drive);
        $dataresult = $conn->Execute($sql);
        return $dataresult;
    }

    public function saveAudit($json = [], $atake = false){

        if (!$atake){
            $data = Middleware::getDataToken();
    
            $iduser = null;
            if ($data){
                $iduser = $data["iduser"];
            }
    
            $action = $_SERVER["REQUEST_METHOD"];
            $route  = $_SERVER["REQUEST_URI"];
            $ipaddr = $_SERVER["HTTP_USER_AGENT"];
    
            $params = [
                "iduser" =>$iduser ,
                "ipaddr" =>$ipaddr ,
                "action" =>$action ,
                "route"   =>$route ,
                "json" => $json
            ];
            $sql="INSERT INTO audit (`iduser`, `ipaddr`, `action`, `route`, `json`) VALUE (:iduser, :ipaddr, :action, :route, :json)";
        } else {
            $params = [
                "ipaddr" => $this->get_client_ip() ,
                "useragent" =>$_SERVER["HTTP_USER_AGENT"] ,
            ];
            $sql="INSERT INTO atak (`ipaddr`, `useragent`) VALUE (:ipaddr, :useragent)";
        }
        $conn = new ConnController();
        $conn->Connect($this->drive);
        $conn->Execute($sql, $params);
    }

    public function get_client_ip() {
        $ipaddress = '';
        if (isset($_SERVER['HTTP_CLIENT_IP']))
            $ipaddress = $_SERVER['HTTP_CLIENT_IP'];
        else if(isset($_SERVER['HTTP_X_FORWARDED_FOR']))
            $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
        else if(isset($_SERVER['HTTP_X_FORWARDED']))
            $ipaddress = $_SERVER['HTTP_X_FORWARDED'];
        else if(isset($_SERVER['HTTP_FORWARDED_FOR']))
            $ipaddress = $_SERVER['HTTP_FORWARDED_FOR'];
        else if(isset($_SERVER['HTTP_FORWARDED']))
            $ipaddress = $_SERVER['HTTP_FORWARDED'];
        else if(isset($_SERVER['REMOTE_ADDR']))
            $ipaddress = $_SERVER['REMOTE_ADDR'];
        else
            $ipaddress = 'UNKNOWN';
        return $ipaddress;
    }
}