![7AG8](logo7UG8.jpg)
#### 7AG8 (Septimo Semestre Grupo 8)
# API RESTFUL

**UNIVERSIDAD REGIONAL AUTÓNOMA DE LOS ANDES 
“UNIANDES”** <br>
>FACULTAD DE SISTEMAS MERCANTILES <br>
CARRERA DE INGENIERÍA DE SOFTWARE <br>
SEXTO SEMESTRE <br>
MODALIDAD: ON LINE

## Integrantes
>Hugo Alfredo Herrera Villalva <br>
Jaime Santiago Borja Romero <br>
Jorge Luis López Romo <br>

## Recursos utilizados
![](https://img.shields.io/badge/MySQL-8.0.30-blue) 
![](https://img.shields.io/badge/PHP-8.1.10-blue) 
![](https://img.shields.io/badge/Servidor_Apache-2.4.54-blue) 


## Configuracion

1. `anything.papajhons`, determina los accesos a las bases de datos transaccional y dwh
```json
{
    "mysql": {
        "driver": "mysql",
        "host": "localhost",
        "port": 3306,
        "user": "admin",
        "pass": "admin",
        "database": "diproavilm"
    },
    "sqlserver":{
        "driver": "MS MSSQL",
        "host": "",
        "port": 0,
        "user": "",
        "pass": "",
        "database": "diproavilm"
    }
}
```
2. `routes.json` ahi se definen las rutas, segun la siguiente estructura o formato: <br>
`<metodo>|<ruta> : <controller>:<metodo_ de la _clase>` <br>
Cada controlador debe estar creado en src/Controllers y el metodo definido para que pueda ser instanciado.
```json
{
    "GET|healthy" : "RouterController::healthy()",
    "POST|login":  "UsersController::login()",
    "GET|users" : "UsersController::getAll()"
}
```

Para obtener log de git en formato para llenar a NOtion
```
git log --pretty=format:"%cs|%H|%s" > logs.txt     
```