USE TRINITY_ECOMMERCE;

DELIMITER //
-- Este procedimiento permite registrar un nuevo usuario en la base de datos.
CREATE PROCEDURE registrar_usuario (
    IN nombre_usuario VARCHAR(100),
    IN apellido_usuario VARCHAR(100),
    IN email_usuario VARCHAR(100),
    IN direccion_usuario VARCHAR(255),
    IN telefono_usuario VARCHAR(20),
    IN contrasenia_usuario VARCHAR(100),
    IN tipo_usuario VARCHAR(100)
)
BEGIN
    INSERT INTO USUARIOS (NOMBRE, APELLIDO, EMAIL, DIRECCION, TELEFONO, CONTRASENIA, TIPO_USUARIO, FECHA_REGISTRO, ULTIMO_ACCESO)
    VALUES (nombre_usuario, apellido_usuario, email_usuario, direccion_usuario, telefono_usuario, contrasenia_usuario, tipo_usuario, NOW(), NOW());
END;//
DELIMITER ;

DELIMITER //
-- Este procedimiento permite agregar un producto al carrito de un usuario.
CREATE PROCEDURE agregar_producto_al_carrito (
    IN id_usuario INT,
    IN id_producto INT,
    IN cantidad INT
)
BEGIN
    DECLARE id_carrito INT;
    -- Obtener ID del carrito del usuario
    SELECT IDCARRITO INTO id_carrito FROM CARRITO WHERE IDUSUARIO = id_usuario AND ESTADO = TRUE;
    -- Insertar detalle del carrito
    INSERT INTO DETALLE_CARRITO (IDCARRITO, IDPRODUCTO, CANTIDAD) VALUES (id_carrito, id_producto, cantidad);
END;//
DELIMITER ;

DELIMITER //
-- Este procedimiento permite realizar un pedido, creando una orden de venta y cambiando el estado del carrito a "pedido realizado".
CREATE PROCEDURE realizar_pedido (
    IN id_usuario INT,
    IN direccion_envio VARCHAR(255)
)
BEGIN
    DECLARE id_carrito INT;
    -- Obtener ID del carrito del usuario
    SELECT IDCARRITO INTO id_carrito FROM CARRITO WHERE IDUSUARIO = id_usuario AND ESTADO = TRUE;
    -- Crear orden de venta
    INSERT INTO ORDENESDEVENTA (IDUSUARIO, FECHA_CREACION, ESTADO, DIRECCION_ENVIO, IDCARRITO) VALUES (id_usuario, NOW(), 'Pedido realizado', direccion_envio, id_carrito);
    -- Cambiar estado del carrito
    UPDATE CARRITO SET ESTADO = FALSE WHERE IDCARRITO = id_carrito;
END;//
DELIMITER ;
