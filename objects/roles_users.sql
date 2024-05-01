USE mysql;

-- CREATE USER IF NOT EXISTS
CREATE USER IF NOT EXISTS 'admin_super'@'%' IDENTIFIED BY 'password';

-- GRANT ALL PRIVILEGES ON coderhouse_generico.* TO 'admin_super'@'%'
GRANT ALL PRIVILEGES ON ECOMDB.* TO 'admin_super'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;

USE ECOMDB;

-- CREACIÓN DE ROLES
CREATE ROLE role_select_vistas;
CREATE ROLE role_crud_tiendas;
CREATE ROLE role_creacion_usuarios;

-- ASIGNACIÓN DE PRIVILEGIOS AL ROL role_select_vistas
GRANT SELECT ON USUARIO TO role_select_vistas;
GRANT SELECT ON EMPLEADO TO role_select_vistas;
GRANT SELECT ON TIENDAS TO role_select_vistas;
GRANT SELECT ON PRODUCTO TO role_select_vistas;
GRANT SELECT ON ORDENDEVENTA TO role_select_vistas;

-- ASIGNACIÓN DE PRIVILEGIOS AL ROL role_crud_restaurantes
GRANT ALL PRIVILEGES ON TIENDA TO role_crud_tiendas;
GRANT ALL PRIVILEGES ON PRODUCTO TO role_crud_tiendas;
GRANT ALL PRIVILEGES ON ORDENDEVENTA TO role_crud_tiendas;
GRANT ALL PRIVILEGES ON DETALLECARRITO TO role_crud_tiendas;



-- CREACIÓN DE USUARIOS Y ASIGNACIÓN A ROLES
CREATE USER 'usuario_select'@'%' IDENTIFIED BY 'password_select';
GRANT role_select_vistas TO 'usuario_select'@'%';

CREATE USER 'usuario_crud'@'%' IDENTIFIED BY 'password_crud';
GRANT role_crud_tiendas TO 'usuario_crud'@'%';

FLUSH PRIVILEGES;