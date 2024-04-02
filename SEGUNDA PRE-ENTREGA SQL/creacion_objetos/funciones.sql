USE TRINITY_ECOMMERCE;

DELIMITER //
-- Calcula el precio de un producto luego de aplicarle el descuento
CREATE FUNCTION calcular_precio_descuento(precio_base INT, descuento INT) RETURNS INT
BEGIN
    DECLARE precio_final INT;
    SET precio_final = precio_base - (precio_base * descuento / 100);
    RETURN precio_final;
END;
DELIMITER ;

DELIMITER //
-- Calcula el precio total de un carrito
CREATE FUNCTION calcular_total_carrito(id_carrito INT) RETURNS INT
BEGIN
    DECLARE total INT;
    SELECT SUM(p.PRECIO * dc.CANTIDAD)
    INTO total
    FROM DETALLE_CARRITO dc
    JOIN PRODUCTOS p ON dc.IDPRODUCTO = p.IDPRODUCTO
    WHERE dc.IDCARRITO = id_carrito;
    RETURN total;
END;
DELIMITER ;

