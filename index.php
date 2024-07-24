<?PHP
/**
  * @author 6UG8
  * @copyright 2024-07-23
  * @license version Alfa
  */

error_reporting(E_ERROR);

date_default_timezone_set ("America/Guayaquil");

spl_autoload_register(function ($class){
    require __DIR__ . "/src/Controllers/$class.php";
});

set_exception_handler("ErrorHandler::handleException");

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST, GET, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");
header("Content-Type: application/json");

$app = new RouterController();

?>