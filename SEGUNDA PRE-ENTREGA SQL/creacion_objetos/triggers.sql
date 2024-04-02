USE TRINITY_ECOMMERCE;

DELIMITER //
--  Este trigger actualiza el stock de un producto cuando se agrega al carrito.
CREATE TRIGGER actualizar_stock_al_agregar_producto
AFTER INSERT ON DETALLE_CARRITO
FOR EACH ROW
BEGIN
    DECLARE cantidad_stock INT;
    -- Obtener la cantidad actual de stock del producto
    SELECT CANTIDAD INTO cantidad_stock FROM PRODUCTOS WHERE IDPRODUCTO = NEW.IDPRODUCTO;
    -- Actualizar el stock del producto
    UPDATE PRODUCTOS SET CANTIDAD = cantidad_stock - NEW.CANTIDAD WHERE IDPRODUCTO = NEW.IDPRODUCTO;
END;
DELIMITER ;

DELIMITER //
-- Este trigger actualiza el total del carrito cuando se modifica la cantidad de un producto en el carrito.
CREATE TRIGGER actualizar_total_carrito
AFTER UPDATE ON DETALLE_CARRITO
FOR EACH ROW
BEGIN
    DECLARE nuevo_total INT;
    -- Calcular el nuevo total del carrito
    SELECT SUM(PRECIO * NEW.CANTIDAD) INTO nuevo_total FROM PRODUCTOS WHERE IDPRODUCTO = NEW.IDPRODUCTO;
    -- Actualizar el total del carrito
    UPDATE CARRITO SET TOTAL = nuevo_total WHERE IDCARRITO = NEW.IDCARRITO;
END;

DELIMITER ;

DELIMITER //
-- Este trigger registra los cambios en el estado de las órdenes de venta en un historial.
CREATE TRIGGER registro_cambios_orden_venta
AFTER UPDATE ON ORDENESDEVENTA
FOR EACH ROW
BEGIN
    INSERT INTO HISTORIAL_ORDENES_VENTA (IDORDEN, ESTADO_ANTERIOR, ESTADO_ACTUAL, FECHA_CAMBIO)
    VALUES (NEW.IDORDEN, OLD.ESTADO, NEW.ESTADO, NOW());
END;

DELIMITER ;
