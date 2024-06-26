<center>
<img src="./EcomDB_Cover.jpg" style="width: 100% ; aspect-ratio:16/9">
</center>


# <center>Entrega de proyecto final SQL</center>
@Alumna: Agustina Teme
@Comisión: 53175


---

## Tematica del proyecto
Este proyecto se centra en el desarrollo de un sistema integral de gestión para un comercio
electrónico llamado "EcomDB". La temática abarca todos los aspectos relacionados 
con la operación de una plataforma de ventas en línea, desde la gestión de productos y usuarios 
hasta la administración de pedidos y envíos. El sistema está diseñado para proporcionar una 
experiencia fluida tanto para los clientes como para los administradores del comercio electrónico.

## Modelo de negocio
1. **Gestión de Clientes y Empleados**: La base de datos permite registrar la información de los clientes que realizan compras, así como de los empleados involucrados en el proceso de ventas, como los encargados de almacén o atención al cliente.

2. **Gestión de Productos y Categorías**: Es importante clasificar los productos según su tipo, categoría o marca para organizar mejor la oferta y facilitar la búsqueda de los clientes. Esto incluye mantener un registro actualizado de los productos disponibles, su descripción, precio y cantidad en stock.

3. **Gestión de Carrito de Compras**: La base de datos permite a los clientes agregar productos a su carrito de compras mientras navegan por la plataforma. Esto requiere un sistema que registre los productos seleccionados, su cantidad y su asociación con el usuario que realiza la compra.

4. **Registro de Órdenes de Venta**: Al realizar una compra, se genera una orden de venta que registra los detalles de la transacción, incluyendo el cliente que realiza la compra, la fecha y hora de la compra, los productos adquiridos, la dirección de envío y el estado del pedido.

5. **Gestión de Transacciones**: Es necesario registrar todas las transacciones realizadas, incluyendo la fecha, los productos involucrados, la cantidad y las tiendas de origen y destino, si corresponde.

6. **Gestión de Empleados y Tiendas**: Se requiere gestionar la información de los empleados de las tiendas, incluyendo su puesto, sueldo y fecha de contratación, así como la información de las tiendas, como su nombre, dirección y contacto.


## Diagrama entidad relacion (DER)
<center>
<img src="./Der.png" style="width: 100%">
</center>

## Listado de tablas y descripcion
| Tabla         | Columna            | Tipo de Datos                         |
| ------------- | ------------------ |                                  ---: |
| USUARIO       | IDUSUARIO          | INT                                   |
|               | NOMBRE             | VARCHAR(100) DEFAULT 'CLIENTE'        |
|               | APELLIDO           | VARCHAR(100) DEFAULT 'GENERICO'       |
|               | EMAIL              | VARCHAR(100) UNIQUE NOT NULL          |
|               | DIRECCION          | VARCHAR(255)                          |
|               | TELEFONO           | VARCHAR(100) NOT NULL                 |
|               | CONTRASEÑA         | VARCHAR(100)                          |
|               | TIPO_USUARIO       | VARCHAR(100)                          |
|               | FECHA_REGISTRO     | DATETIME                              |
|               | ULTIMO_ACCESO      | DATETIME                              |


| Tabla         | Columna            | Tipo de Datos                         |
| ------------- | ------------------ |                                  ---: |
| PRODUCTO      | IDPRODUCTO         | INT                                   |
|               | NOMBRE             | VARCHAR(100)                          |
|               | PRECIO             | INT                                   |
|               | IDCATEGORIA        | INT                                   |
|               | IDSUBCATEGORIA     | INT                                   |
|               | IDTIENDA           | INT                                   |
|               | DETALLE            | VARCHAR(100)                          |
|               | CANTIDAD           | INT                                   |
|               | STOCK              | BOOLEAN                               |
|               | FECHA_AGREGADO     | DATETIME                              |
|               | IMAGENES           | VARCHAR(100)                          |


| Tabla         | Columna            | Tipo de Datos                         |
| ------------- | ------------------ |                                  ---: |
| CARRITO       | IDCARRITO          | INT                                   |
|               | IDUSUARIO          | INT                                   |
|               | FECHA_CREACION     | DATETIME                              |
|               | ESTADO             | BOOLEAN                               |
|               | TOTAL              | INT                                   |


| Tabla           | Columna            | Tipo de Datos                         |
| --------------- | ------------------ |                                  ---: |
| DETALLE_CARRITO | IDCARRITO          | INT                                   |
|                 | IDPRODUCTO         | INT                                   |
|                 | CANTIDAD           | INT                                   |


| Tabla         | Columna            | Tipo de Datos                         |
| ------------- | ------------------ |                                  ---: |
| EMPLEADO      | IDEMPLEADO         | INT                                   |
|               | NOMBRE             | VARCHAR(100)                          |
|               | APELLIDO           | VARCHAR(100)                          |
|               | IDTIENDA           | INT                                   |
|               | PUESTO             | VARCHAR(100)                          |
|               | SUELDO             | INT                                   |
|               | EMAIL              | VARCHAR(100) UNIQUE NOT NULL          |
|               | TELEFONO           | VARCHAR(100) NOT NULL                 |
|               | FECHA_CONTRATACION | DATETIME                              |


| Tabla         | Columna            | Tipo de Datos                         |
| ------------- | ------------------ |                                  ---: |
| TIENDA        | IDTIENDA           | INT                                   |
|               | NOMBRE             | VARCHAR(100)                          |
|               | DIRECCION          | VARCHAR(255)                          |
|               | EMAIL              | VARCHAR(100) UNIQUE NOT NULL          |
|               | TELEFONO           | VARCHAR(100) NOT NULL                 |


| Tabla         | Columna            | Tipo de Datos                         |
| ------------- | ------------------ |                                  ---: |
| TRN           | IDTRN              | INT                                   |
|               | IDPRODUCTO         | INT                                   |
|               | IDTIENDA_ORIGEN    | INT                                   |
|               | IDTIENDA_DESTINO   | INT                                   |
|               | CANTIDAD           | INT                                   |
|               | FECHA_TRN          | DATETIME                              |
|               | OBSERVACIONES      | VARCHAR(100)                          |


| Tabla         | Columna            | Tipo de Datos                         |
| ------------- | ------------------ |                                  ---: |
| CATEGORIA     | IDCATEGORIA | INT |
|               | NOMBRE | VARCHAR(100)    |


| Tabla         | Columna            | Tipo de Datos                         |
| ------------- | ------------------ |                                  ---: |
| SUBCATEGORIA  | IDSUBCATEGORIA     | INT                                   |
|               | NOMBRE             | VARCHAR(100)                          |
|               | IDCATEGORIA        | INT                                   |


| Tabla          | Columna            | Tipo de Datos                         |
| -------------- | ------------------ |                                  ---: |
| ORDENDEVENTA   | IDORDEN            | INT                                   |
|                | IDUSUARIO          | INT                                   |
|                | FECHA_CREACION     | DATETIME                              |
|                | ESTADO             | BOOLEAN                               |
|                | DIRECCION_ENVIO    | VARCHAR(255)                          |
|                | IDCARRITO          | INT                                   |


## Estructura e ingesta de datos
* Se realiza principalmente por medio del archivo population.sql
* La carga de la tabla orden de venta se realiza por medio de un csv colocado en el directorio ./structure/data-csv

## Objetos de la base de datos


### Documentacion de Vistas
### Vista: vista_productos_agotados

**Descripción:** Esta vista muestra todos los productos que están actualmente agotados en la tienda

**Columnas:**
* **IDPRODUCTO:** Identificador único de producto 
* **NOMBRE:** Nombre del producto
* **STOCK:** false porque está agotado

**Ejemplo de consulta:**

```sql
SELECT * FROM vista_productos_agotados;
```

### Vista: vista_ventas_mensuales

**Descripción:** Esta vista muestra el monto total de ventas por mes basado en los productos comprados en cada orden. 

**Columnas:**
* **MES:** Representa el mes en el que se realizaron las ventas.
* **VENTAS:** Representa el monto total de ventas en cada mes.

**Ejemplo de consulta:**

```sql
SELECT MES, VENTAS
FROM vista_ventas_mensuales;
```

### Vista: vista_empleados_por_tienda

**Descripción:** Esta vista muestra una lista de todos los empleados agrupados por tienda.
**Columnas:**
* **TIENDA:** Nombre de la tienda a la que pertenece el empleado.
* **NOMBRE:** Nombre del empleado.
* **APELLIDO:** Apellido del empleado.
* **PUESTO:** Puesto que ocupa el empleado en la tienda.

**Ejemplo de consulta:**

```sql
SELECT * FROM vista_empleados_por_tienda;
```

### Vista: vista_transacciones_pendientes

**Descripción:** Esta vista proporciona información sobre las órdenes de venta pendientes en el sistema, incluyendo el ID de la orden, el correo electrónico del usuario que realizó la orden, la fecha en que se creó la orden y el estado de la orden, donde "pendiente" indica que la orden aún no ha sido completada.
**Columnas:*** 
* **ID_ORDEN:** El ID único de la orden de venta.
* **USUARIO:** El correo electrónico del usuario que realizó la orden.
* **FECHA_ORDEN:** La fecha en que se creó la orden.
* **ESTADO:** El estado de la orden, donde "pendiente" indica que la orden aún no ha sido completada.

```sql
SELECT * FROM vista_transacciones_pendientes;
```

### Vista: vista_stock_por_tienda

**Descripción:** Esta vista proporciona información sobre la cantidad de productos disponibles en cada tienda.
**Columnas:*** 
* **TIENDA:** El nombre de la tienda.
* **CANTIDAD_PRODUCTOS:** La cantidad de productos disponibles en la tienda.

```sql
SELECT * FROM vista_transacciones_pendientes;
```

## Documentación de Funciones

### Función: calcular_precio_descuento

**Descripción:** Esta función calcula el precio de un producto después de aplicar un descuento.

**Parámetros:**

* **precio_base:** El precio original del producto.
* **descuento:** El descuento a aplicar al precio base, en porcentaje.

**Retorno:**

* **Entero:** El precio final del producto después de aplicar el descuento.

**Ejemplo de uso:**

```sql
SELECT calcular_precio_descuento(100, 20);
```

### Función: calcular_total_carrito

**Descripción:** Esta función calcula el precio total de un carrito sumando el precio de todos los productos en él.

**Parámetros:**

* **id_carrito:** El ID del carrito del que se desea calcular el precio total.

**Retorno:**

* **Entero:** El precio total del carrito.

**Ejemplo de uso:**

```sql
SELECT calcular_total_carrito(1001);
```

### Función: cantidad_orden_de_venta_usuario

**Descripción:** Esta función cuenta el número de órdenes de venta realizadas por un cliente dentro de un período de tiempo específico.

**Parámetros:**

* **usuario_id:**  El ID del cliente del que se desean contar las órdenes de venta.
* **fecha_inicio:**  La fecha de inicio del período de tiempo para el conteo de órdenes de venta.
* **fecha_fin:** La fecha de fin del período de tiempo para el conteo de órdenes de venta.

**Retorno:**

* **Entero:** El número total de órdenes de venta realizadas por el cliente dentro del período de tiempo especificado.

**Ejemplo de uso:**

```sql
SELECT cantidad_orden_de_venta_usuario(12345, '2024-01-01', '2024-03-31');
```

## Documentación de Triggers

### Trigger: usuario_email_unico

**Descripción:** Este trigger verifica si el correo electrónico de un usuario es único al insertar un nuevo usuario

**Detalles:**

* **Tabla afectada:** USUARIO
* **Acción:** INSERT 

**Ejemplo:** 
* Se intenta insertar un nuevo usuario con un correo electrónico que ya está en uso.
* El trigger genera error y la inserción no se realiza.

### Trigger: registro_cambios_orden_venta

**Descripción:** Este trigger registra los cambios en el estado de las órdenes de venta en un historial.

**Detalles:**

* **Tabla afectada:** HISTORIAL_ORDEN_VENTA
* **Acción:** INSERT 

**Ejemplo:** 
* Se cambia el estado de una orden de venta de false a true, efectuando que se realizó una compra
* Con el trigger se ingresa esta orden de venta que cambió de estado en el historial de ordendes de venta
 
### Trigger: after_insert_detalle_carrito

**Descripción:** Trigger para actualizar el total de un carrito, después de una inserción en la tabla DETALLE_CARRITO

**Detalles:**

* **Tabla afectada:** CARRITO
* **Acción:** UPDATE
**Ejemplo:** 
* Se incerta un producto al carrito, esto se registra en detalle_carrito y se actualiza el total en carrito

### Trigger: after_delete_detalle_carrito

**Descripción:** Trigger para actualizar el total de un carrito, después de una eliminación en la tabla DETALLE_CARRITO

**Detalles:**

* **Tabla afectada:** CARRITO
* **Acción:** UPDATE
**Ejemplo:** 
* Se elimina un registro de detalle carrito (Esto elimina totalmente un producto del carrito), y se actualiza el total en carrito


### Trigger: after_update_detalle_carrito

**Descripción:** Trigger para actualizar el total de un carrito, después de una actualización en la tabla DETALLE_CARRITO

**Detalles:**

* **Tabla afectada:** CARRITO
* **Acción:** UPDATE
**Ejemplo:** 
* Se actualiza un registro de detalle carrito, y se actualiza el total en carrito


## Documentación de Procedimientos Almacenados

### Procedimiento: registrar_usuario

**Descripción:** Este procedimiento permite registrar un nuevo usuario en la base de datos.

**Parámetros:**
* **nombre_usuario:** El nombre del usuario a registrar.
* **apellido_usuario:** El apellido del usuario a registrar.
* **email_usuario:** El correo electrónico del usuario a registrar.
* **direccion_usuario:** La dirección del usuario a registrar.
* **telefono_usuario:** El número de teléfono del usuario a registrar.
* **contrasenia_usuario:** La contraseña del usuario a registrar.
* **tipo_usuario:** El tipo de usuario 

**Retorno:** No tiene retorno explícito.

**Ejemplo de uso:**

```sql
CALL registrar_usuario('John', 'Doe', 'john@example.com', '123 Main St', '5551234', 'password123', 'cliente');
```

### Procedimiento: agregar_producto_al_carrito

**Descripción:**  Este procedimiento permite agregar un producto al carrito de un usuario.

**Parámetros:**
* **id_usuario:** El ID del usuario al que se le agregará el producto al carrito.
* **id_producto:** El ID del producto que se agregará al carrito.
* **cantidad:** La cantidad del producto que se agregará al carrito.

**Retorno:** No tiene retorno explícito.

**Ejemplo de uso:**

```sql
CALL agregar_producto_al_carrito(1, 101, 2);
```

### Procedimiento: realizar_pedido

**Descripción:**  Este procedimiento permite realizar un pedido, creando una orden de venta y cambiando el estado del carrito a true.

**Parámetros:**
* **id_usuario:** El ID del usuario que realiza el pedido.
* **direccion_envio:** La dirección de envío para el pedido.

**Retorno:** No tiene retorno explícito.

**Ejemplo de uso:**

```sql
CALL realizar_pedido(1, '456 Oak St');
```

## Roles y permisos
`./objects/roles_users.sql`

Se genera tres roles:

1. `role_select_vistas`: Este rol tiene permisos solo para SELECT en las vistas.
2. `role_crud_tiendas`: Este rol tiene permisos para generar CRUD en las tablas relacionadas con tiendas.
3. `role_creacion_usuarios`: Este rol tiene permisos para crear y eliminar usuarios.


## Back up de la base de datos

Se puede generar un comando en el archivo `make backup` que me permite ejecutar un backup de manera manual.

## Herramientas y tecnologias usadas
* Makefile (para generar una interfaz sencilla de procesos)
* Docker (para generar un container)
* MySQL (Motor de bases de datos `version: latest`)
* MySQL Workbench (Interfaz grafica)
* Mockaroo (para otorgar datos ficticios)

## Como levantar el proyecto en CodeSpaces GitHub
* env: Archivo con contraseñas y data secretas
* Makefile: Abstracción de creacción del proyecto
* docker-compose.yml: Permite generar las bases de datos en forma de contenedores

#### Pasos para arrancar el proyecto

* En la terminal de linux escribir :
    - `make` _si te da un error de que no conexion al socket, volver al correr el comando `make`_
    - `make clean-db` limpiar la base de datos
    - `make test-db` para mirar los datos de cada tabla
    - `make backup-db` para realizar un backup de mi base de datos
    - `make access-db` para acceder a la base de datos