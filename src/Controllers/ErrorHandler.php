<?PHP

require_once(__DIR__."/../Models/Model.php");
//TODO: Metodo Para gestionar y estandarizar errores

class ErrorHandler{

    public static function handleException(Throwable $exception): void {
        $dataerror = [
            "code" => $exception->getCode(),
            "message" => $exception->getMessage(),
            "file" => $exception->getFile(),
            "line" => $exception->getLine(),
            "trace" => json_encode($exception->getTrace()),
        ];

        $errs = new Model("errorslog");
        $errs->insertRecord($dataerror);

        echo json_encode([
            "status" => "error",
            "message" => Controller::encode(json_encode($dataerror))
        ]);
    }

}