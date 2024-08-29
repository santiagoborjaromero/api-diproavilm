<?PHP

//TODO: Metodo Para gestionar y estandarizar errores
class ErrorHandler{

    public static function handleException(Throwable $exception): void {
        echo json_encode([
            "status" => "error",
            "message" => [
                "code" => $exception->getCode(),
                "message" => $exception->getMessage(),
                "file" => $exception->getFile(),
                "line" => $exception->getLine()
            ]
        ]);
    }

}