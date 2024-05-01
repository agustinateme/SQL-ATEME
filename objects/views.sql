USE ECOMDB;

-- Esta vista muestra todos los productos que están actualmente agotados en la tienda
CREATE VIEW 
	vista_productos_agotados AS
SELECT 
	IDPRODUCTO, NOMBRE, STOCK
FROM 
	PRODUCTO
WHERE 
	STOCK = FALSE;

-- Esta vista muestra el monto total de ventas por mes basado en los productos comprados en cada orden. 
CREATE VIEW vista_ventas_mensuales AS
SELECT 
    MONTH(OV.FECHA_CREACION) AS MES, 
    SUM(DC.CANTIDAD * P.PRECIO) AS VENTAS
FROM 
    ORDENDEVENTA OV
JOIN 
    DETALLE_CARRITO DC ON OV.IDCARRITO = DC.IDCARRITO
JOIN 
    PRODUCTO P ON DC.IDPRODUCTO = P.IDPRODUCTO
GROUP BY 
    MONTH(OV.FECHA_CREACION);
        
-- Esta vista muestra una lista de todos los empleados agrupados por tienda.
CREATE VIEW vista_empleados_por_tienda AS
SELECT 
    T.NOMBRE AS TIENDA,
    E.NOMBRE,
    E.APELLIDO,
    E.PUESTO
FROM 
    EMPLEADO E
JOIN 
    TIENDA T ON E.IDTIENDA = T.IDTIENDA;
 
-- Esta vista proporciona información sobre las órdenes de venta pendientes en el sistema y el estado de la orden.
CREATE VIEW vista_transacciones_pendientes AS
SELECT 
    OV.IDORDEN AS ID_ORDEN,
    U.EMAIL AS USUARIO,
    OV.FECHA_CREACION AS FECHA_ORDEN,
    CASE 
        WHEN OV.ESTADO = TRUE THEN 'completado' 
        ELSE 'pendiente' 
    END AS ESTADO
FROM 
    ORDENDEVENTA OV
JOIN 
    USUARIO U ON OV.IDUSUARIO = U.IDUSUARIO
WHERE 
    OV.ESTADO = FALSE;
    
-- Esta vista proporciona información sobre la cantidad de productos disponibles en cada tienda.
CREATE VIEW vista_stock_por_tienda AS
SELECT 
    T.NOMBRE AS TIENDA,
    COUNT(P.IDPRODUCTO) AS CANTIDAD_PRODUCTOS
FROM 
    TIENDA T
LEFT JOIN 
    PRODUCTO P ON T.IDTIENDA = P.IDTIENDA
WHERE 
    P.STOCK = TRUE
GROUP BY 
    T.IDTIENDA;