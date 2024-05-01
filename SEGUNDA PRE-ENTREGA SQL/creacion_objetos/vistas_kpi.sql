-- Vista para KPIs de Ordenes de venta:
-- Esta vista muestra todos los productos que están actualmente agotados en la tienda
CREATE VIEW 
	vista_productos_agotados AS
SELECT * FROM PRODUCTOS WHERE STOCK = FALSE;

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
    
-- Esta vista proporciona una lista de productos junto con sus categorías y subcategorías correspondientes.
CREATE VIEW vista_productos_por_categoria AS
SELECT 
    C.NOMBRE AS CATEGORIA,
    SC.NOMBRE AS SUBCATEGORIA,
    P.*
FROM 
    PRODUCTO P
JOIN 
    CATEGORIA C ON P.IDCATEGORIA = C.IDCATEGORIA
JOIN 
    SUBCATEGORIA SC ON P.IDSUBCATEGORIA = SC.IDSUBCATEGORIA;

    
-- Esta vista muestra una lista de todos los empleados agrupados por tienda.
CREATE VIEW vista_empleados_por_tienda AS
SELECT 
    T.NOMBRE AS TIENDA,
    E.NOMBRE,
    E.APELLIDO,
    E.PUESTO,
    E.SUELDO,
    E.EMAIL,
    E.TELEFONO,
    E.FECHA_CONTRATACION
FROM 
    EMPLEADO E
JOIN 
    TIENDA T ON E.IDTIENDA = T.IDTIENDA;