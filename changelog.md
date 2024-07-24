# Changelog



## 2024-07-24
### API
- Creacion de estructura basica
- Creacion de rutas
- Creacion de Controladores 
- **Modelo sin usar** aun no se ha visto como utilizar dentro del php sin framework 
- Operacion con base de datos mysql sin problemas
### BASE
```sql
ALTER TABLE `diproavilm`.`user` 
ADD COLUMN `token` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NULL AFTER `lastlogged`
```