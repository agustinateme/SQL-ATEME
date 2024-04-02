# DOCUMENTACION EN TRINITY_ECOMMERCE



### Documentacion de Funciones

## Función `calcular_precio_descuento`

**Descripción:** Esta función calcula el precio final de un producto después de aplicarle un descuento.

**Parámetros:**
- `precio_base`: El precio base del producto antes de aplicar el descuento.
- `descuento`: El porcentaje de descuento a aplicar al precio base.

**Retorna:** `precio_final`: El precio final del producto después de aplicar el descuento.

**Uso:**
```sql
SELECT calcular_precio_descuento(precio_base, descuento) AS precio_final;
```

# Función `calcular_total_carrito`

**Descripción:** Esta función calcula el precio total de un carrito sumando el precio de todos los productos en él.

**Parámetros:**
- `id_carrito` (INT): El identificador del carrito del que se desea calcular el total.

**Retorna:** `total` (INT): El precio total del carrito.

**Uso:**
```sql
SELECT calcular_total_carrito(id_carrito) AS total FROM CARRITO WHERE IDCARRITO = <id_del_carrito>;
```



### Documentacion de Vistas

Este archivo proporciona documentación detallada sobre las vistas creadas en el script `vistas_kpi.sql`.

## Vista vista_productos_agotados
**Descripción:** Esta vista muestra todos los productos que están actualmente agotados en la tienda.

## Vista: vista_ventas_mensuales
**Descripción:** Muestra el monto total de ventas por mes, basado en los productos comprados en cada orden.

## Vista: vista_productos_por_categoria
**Descripción:** Proporciona una lista de productos junto con sus categorías y subcategorías correspondientes.

## Vista: vista_ventas_por_producto
**Descripción:** Muestra el número total de ventas y los ingresos generados por cada producto.

## Vista: vista_empleados_por_tienda
**Descripción:** Presenta una lista de todos los empleados agrupados por tienda.
