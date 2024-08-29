<?PHP

require_once(__DIR__."/Audit.php");

class MenuRole {
    private $drive = "mysql";

    public  function saveBlockRoleMenu($requestBody, $idrole){

        //TODO: Eliminar todos los registros del rol
        $sql = "DELETE FROM `rolemenu` WHERE `idrole` = :idrole";
        $params = [":idrole" => $idrole];
        $conn = new ConnController();
        $conn->Connect($this->drive);
        $dataresult = $conn->Execute($sql, $params);

        //TODO: Crear los items de menu para el rol 

        if ($requestBody){
            $sql = "INSERT INTO `rolemenu` (`idrole`, `idmenu`) VALUES ";
    
            $count = 0;
    
            foreach ($requestBody as $row) {
                $count++;
                $sql .= "( {$idrole}, {$row["idmenu"]} )";
                if ($count < count($requestBody)){
                    $sql .= ", ";
                }
            }

            $requestBody["idrole"] = $idrole;
            $audit = new Audit();
            $audit->saveAudit(json_encode($requestBody));

            $conn = new ConnController();
            $conn->Connect($this->drive);
            $dataresult = $conn->Execute($sql);
            $dataresult = "Grabacion de rol exitosa" ;
        } else {
            $dataresult = "no datos" ;
        }
        
        return $dataresult;
    }


}