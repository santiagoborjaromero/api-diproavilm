# Changelog

## 2024-07-25
- Se adiciono estas lineas de codigo porque no funciona igual un cliente restful y la aplicacion cuando se envia por ajax
    ```php
        if (!$requestBody){
            $requestBody = [
                "username" => $_POST['username'],
                "password" => $_POST['password']
            ];
        }
    ```

## 2024-07-24
### API
- Creacion de estructura basica.
- Creacion de Controller de rutas y errores.
- Creacion de Controladores. 
- **Modelo sin usar** aun no se ha visto como utilizar dentro del php sin framework. 
- Operacion con base de datos mysql sin problemas.
- Creacion de archivo routes.json con la estructura basica para implementar con facilidad mas rutas.
    ```json
    Formato:
    <metodo>|<ruta>: "<ClaseController>::<metodo de la clase>"

    Ejemplo:
    {
        "GET|healthy" : "RouterController::healthy()",
        "POST|login":  "UsersController::login()",
        "GET|users" : "UsersController::getAll()"
    }
    ```
- Creacion de rutas base login que entrega token y users.
### BASE
Aumento de campo para registrar el token, de esta forma no se actualiza todo el tiempo, solamente cuando expire.
```sql
ALTER TABLE `diproavilm`.`user` 
ADD COLUMN `token` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NULL AFTER `lastlogged`
```
#### Pendientes
- Middleware
- Validacion de rutas con token 
- Guardar auditoria en forma generica, si es posible en el middleware, todos los metodos excepto GET.
- Usar MODELS como se debe, este debe hacer las operaciones CRUD, como si fuese un framework. Contemplar con y sin SQL.
- 