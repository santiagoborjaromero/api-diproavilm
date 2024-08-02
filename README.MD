![6UG8](logo6UG8.jpg)
#### 6UG8 (Sexto Semestre Grupo 8)
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
Joel Darío Brito Parra <br>
Ricardo Josué Vaca Miño <br>


## Recursos utilizados

### Base de datos
Transaccional <br>
![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white)  <br>

Data Warehouse <br>
![MicrosoftSQLServer](https://img.shields.io/badge/Microsoft%20SQL%20Server-CC2927?style=for-the-badge&logo=microsoft%20sql%20server&logoColor=white)


### Backend
#### Api restful
Lenguaje de programacion  <br>
![PHP](https://img.shields.io/badge/php-%23777BB4.svg?style=for-the-badge&logo=php&logoColor=white) 

## Configuracion

1. `config.json`, determina los accesos a las bases de datos transaccional y dwh
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


