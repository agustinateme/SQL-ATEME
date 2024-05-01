USE ECOMDB;

DROP FUNCTION IF EXISTS calcular_precio_descuento;
DROP FUNCTION IF EXISTS calcular_total_carrito;
DROP FUNCTION IF EXISTS cantidad_orden_de_venta_usuario;

DELIMITER //
-- Calcula el precio de un producto luego de aplicarle el descuento
CREATE FUNCTION calcular_precio_descuento(precio_base INT, descuento INT) RETURNS INT
BEGIN
    DECLARE precio_final INT;
    SET precio_final = precio_base - (precio_base * descuento / 100);
    RETURN precio_final;
END;//
DELIMITER ;

DELIMITER //
-- Calcula el precio total de un carrito
CREATE FUNCTION calcular_total_carrito(id_carrito INT) RETURNS INT
BEGIN
    DECLARE total INT;
    SELECT SUM(p.PRECIO * dc.CANTIDAD) INTO total
    FROM DETALLE_CARRITO dc
    JOIN PRODUCTO p ON dc.IDPRODUCTO = p.IDPRODUCTO
    WHERE dc.IDCARRITO = id_carrito;
    RETURN total;
END;//
DELIMITER ;

-- Funcion para contar las ordenes de venta de un cliente en determinado tiempo
DELIMITER //
CREATE FUNCTION cantidad_orden_de_venta_usuario (usuario_id INT, fecha_inicio DATETIME, fecha_fin DATETIME) RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE orden_count INT;
    
    SELECT COUNT(*) INTO orden_count
    FROM ORDENDEVENTA
    WHERE IDUSUARIO = usuario_id
    AND FECHA_CREACION >= fecha_inicio
    AND FECHA_CREACION <= fecha_fin;

	RETURN orden_count;
END //
DELIMITER ;