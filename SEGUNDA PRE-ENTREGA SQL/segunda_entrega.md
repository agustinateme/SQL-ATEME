# DOCUMENTACION EN TRINITY_ECOMMERCE

___

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

## Función `calcular_total_carrito`

**Descripción:** Esta función calcula el precio total de un carrito sumando el precio de todos los productos en él.

**Parámetros:**
- `id_carrito` (INT): El identificador del carrito del que se desea calcular el total.

**Retorna:** `total` (INT): El precio total del carrito.

**Uso:**
```sql
SELECT calcular_total_carrito(id_carrito) AS total FROM CARRITO WHERE IDCARRITO = <id_del_carrito>;
```

___

### Documentacion de Procedimientos

## Procedimiento Almacenado `realizar_pedido`

**Descripción:** Este procedimiento permite realizar un pedido, creando una orden de venta y cambiando el estado del carrito a "pedido realizado".

**Parámetros:**
- `id_usuario` (INT): El ID del usuario que realiza el pedido.
- `direccion_envio` (VARCHAR(255)): La dirección de envío para el pedido.

**Uso:**
```sql
CALL realizar_pedido(<id_usuario>, '<direccion_envio>');
```

## Procedimiento Almacenado `agregar_producto_al_carrito`

**Descripción:** Este procedimiento permite agregar un producto al carrito de un usuario.

**Parámetros:**
- `id_usuario` (INT): El ID del usuario al que se le agregará el producto al carrito.
- `id_producto` (INT): El ID del producto que se agregará al carrito.
- `cantidad` (INT): La cantidad del producto que se agregará al carrito.

**Uso:**
```sql
CALL agregar_producto_al_carrito(<id_usuario>, <id_producto>, <cantidad>);
```

## Procedimiento Almacenado `registrar_usuario`

**Descripción:** Este procedimiento permite registrar un nuevo usuario en la base de datos.

**Parámetros:**
- `nombre_usuario` (VARCHAR): El nombre del nuevo usuario.
- `apellido_usuario` (VARCHAR): El apellido del nuevo usuario.
- `email_usuario` (VARCHAR): El correo electrónico del nuevo usuario.
- `direccion_usuario` (VARCHAR): La dirección del nuevo usuario.
- `telefono_usuario` (VARCHAR): El número de teléfono del nuevo usuario.
- `contrasenia_usuario` (VARCHAR): La contraseña del nuevo usuario.
- `tipo_usuario` (VARCHAR): El tipo de usuario (por ejemplo, cliente, administrador, etc.).

**Uso:**
```sql
CALL registrar_usuario('<nombre_usuario>', '<apellido_usuario>', '<email_usuario>', '<direccion_usuario>', '<telefono_usuario>', '<contrasenia_usuario>', '<tipo_usuario>');
```

___

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

___

## Documentación de Triggers

### Trigger: registro_cambios_orden_venta

#### Descripción:
Este trigger registra los cambios en el estado de las órdenes de venta en un historial.

#### Detalles:

- Tabla afectada: ORDENESDEVENTA
- Acción: UPDATE
- Información registrada: ID de la orden, Estado anterior, Estado actual, Fecha del cambio.

#### Ejemplo:

1. Se actualiza el estado de una orden de venta.
2. El trigger registra la acción en la tabla HISTORIAL_ORDENES_VENTA con los detalles correspondientes.



### Trigger: actualizar_total_carrito

#### Descripción:
Este trigger actualiza automáticamente el total del carrito cada vez que se actualiza el detalle del carrito, recalculando el precio total de los productos.

#### Detalles:

- Tabla afectada: DETALLE_CARRITO
- Acción: UPDATE
- Información registrada: Ninguna

#### Funcionalidad:

1. Cada vez que se actualiza el detalle del carrito, el trigger calcula el nuevo total del carrito multiplicando el precio de cada producto por la cantidad correspondiente y sumando todos los valores.
2. Luego, actualiza el campo `TOTAL` en la tabla `CARRITO` con el nuevo total calculado.

#### Ejemplo:

1. Se actualiza la cantidad de un producto en el detalle del carrito.
2. El trigger recalcula el total del carrito y actualiza el campo correspondiente en la tabla `CARRITO`.



### Trigger: actualizar_stock_al_agregar_producto

#### Descripción:
Este trigger se activa después de insertar un nuevo registro en la tabla DETALLE_CARRITO y actualiza automáticamente el stock del producto en la tabla PRODUCTOS.

#### Detalles:

- Tabla afectada: DETALLE_CARRITO
- Acción: INSERT
- Información registrada: Ninguna

#### Funcionalidad:

1. Después de insertar un nuevo registro en DETALLE_CARRITO, el trigger obtiene la cantidad actual de stock del producto correspondiente en la tabla PRODUCTOS.
2. Luego, actualiza el stock del producto restando la cantidad agregada al carrito del stock actual.
3. El stock se actualiza en la tabla PRODUCTOS.

#### Ejemplo:

1. Se agrega un nuevo producto al carrito.
2. El trigger reduce automáticamente la cantidad de stock del producto en la tabla PRODUCTOS.