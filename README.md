<center>
<img src="./EcomDB_Cover.jpg" style="width: 100% ; aspect-ratio:16/9">
</center>


# <center>Entrega de proyecto final SQL</center>
Alumno: Agustina Teme
Comisión: 53175


---

## Tematica del proyecto
Este proyecto se centra en el desarrollo de un sistema integral de gestión para un comercio
electrónico llamado "EcomDB". La temática abarca todos los aspectos relacionados 
con la operación de una plataforma de ventas en línea, desde la gestión de productos y usuarios 
hasta la administración de pedidos y envíos. El sistema está diseñado para proporcionar una 
experiencia fluida tanto para los clientes como para los administradores del comercio electrónico.

## Modelo de negocio
1. **Gestión de Clientes y Empleados**:La base de datos permite registrar la información de los clientes que realizan compras, así como de los empleados involucrados en el proceso de ventas, como los encargados de almacén o atención al cliente.

2. **Gestión de Productos y Categorías**: Es importante clasificar los productos según su tipo, categoría o marca para organizar mejor la oferta y facilitar la búsqueda de los clientes. Esto incluye mantener un registro actualizado de los productos disponibles, su descripción, precio y cantidad en stock.

3. **Gestión de Carrito de Compras**: La base de datos permite a los clientes agregar productos a su carrito de compras mientras navegan por la plataforma. Esto requiere un sistema que registre los productos seleccionados, su cantidad y su asociación con el usuario que realiza la compra.

4. **Registro de Órdenes de Venta**: Al realizar una compra, se genera una orden de venta que registra los detalles de la transacción, incluyendo el cliente que realiza la compra, la fecha y hora de la compra, los productos adquiridos, la dirección de envío y el estado del pedido.

5. **Gestión de Transacciones**: Es necesario registrar todas las transacciones realizadas, incluyendo la fecha, los productos involucrados, la cantidad y las tiendas de origen y destino, si corresponde.

6. **Gestión de Empleados y Tiendas**: Se requiere gestionar la información de los empleados de las tiendas, incluyendo su puesto, sueldo y fecha de contratación, así como la información de las tiendas, como su nombre, dirección y contacto.


## Diagrama entidad relacion (DER)
<center>
<img src="./Der.png" style="width: 100% ;>
</center>

## Listado de tablas y descripcion

## Estructura e ingesta de datos

## Objetos de la base de datos

## Roles y permisos

## Back up de la base de datos

## Herramientas y tecnologias usadas

## Como levantar el proyecto en CodeSpaces GitHub
* env: Archivo con contraseñas y data secretas
* Makefile: Abstracción de creacción del proyecto
* docker-compose.yml: Permite generar las bases de datos en forma de contenedores

#### Pasos para arrancar el proyecto



































## Tabla `USUARIOS`

- **Descripción**: Esta tabla almacena información sobre los usuarios del sistema.

- **Atributos**: 
  - `IDUSUARIO`: INT (Clave primaria, autoincremental)
  - `NOMBRE`: VARCHAR(100) (Por defecto 'CLIENTE')
  - `APELLIDO`: VARCHAR(100) (Por defecto 'GENERICO')
  - `EMAIL`: VARCHAR(100) (No puede ser nulo)
  - `DIRECCION`: VARCHAR(255)
  - `TELEFONO`: VARCHAR(20)
  - `CONTRASENIA`: VARCHAR(100)
  - `TIPO_USUARIO`: VARCHAR(100)
  - `FECHA_REGISTRO`: DATETIME
  - `ULTIMO_ACCESO`: DATETIME

---

## Tabla `PRODUCTOS`

- **Descripción**: Esta tabla almacena información sobre los productos disponibles en el sistema.

- **Atributos**: 
  - `IDPRODUCTO`: INT (Clave primaria, autoincremental)
  - `NOMBRE`: VARCHAR(100)
  - `PRECIO`: INT
  - `IDCATEGORIA`: INT (Clave foránea que hace referencia a la tabla CATEGORIAS)
  - `IDSUBCATEGORIA`: INT (Clave foránea que hace referencia a la tabla SUBCATEGORIAS)
  - `IDTIENDA`: INT (Clave foránea que hace referencia a la tabla TIENDAS)
  - `DETALLE`: VARCHAR(100)
  - `CANTIDAD`: INT
  - `STOCK`: BOOLEAN
  - `FECHA_AGREGADO`: DATETIME
  - `IMAGENES`: VARCHAR(100)

---

## Tabla `CARRITO`

- **Descripción**: Esta tabla almacena información sobre los carritos de compras de los usuarios.

- **Atributos**: 
  - `IDCARRITO`: INT (Clave primaria, autoincremental)
  - `IDUSUARIO`: INT (Clave foránea que hace referencia a la tabla USUARIOS)
  - `FECHA_CREACION`: DATETIME
  - `ESTADO`: BOOLEAN

---

## Tabla `EMPLEADOS`

- **Descripción**: Esta tabla almacena información sobre los empleados de la tienda.

- **Atributos**: 
  - `IDEMPLEADO`: INT (Clave primaria, autoincremental)
  - `NOMBRE`: VARCHAR(100)
  - `APELLIDO`: VARCHAR(100)
  - `IDTIENDA`: INT (Clave foránea que hace referencia a la tabla TIENDAS)
  - `PUESTO`: VARCHAR(100)
  - `SUELDO`: INT
  - `EMAIL`: VARCHAR(100) (Único, no puede ser nulo)
  - `TELEFONO`: VARCHAR(100) (No puede ser nulo)
  - `FECHA_CONTRATACION`: DATETIME

---

## Tabla `TIENDAS`

- **Descripción**: Esta tabla almacena información sobre las tiendas en el sistema.

- **Atributos**: 
  - `IDTIENDA`: INT (Clave primaria, autoincremental)
  - `NOMBRE`: VARCHAR(100)
  - `DIRECCION`: VARCHAR(255)
  - `EMAIL`: VARCHAR(100) (Único, no puede ser nulo)
  - `TELEFONO`: VARCHAR(100) (No puede ser nulo)

---

## Tabla `TRN`

- **Descripción**: Esta tabla almacena información sobre los traspasos de productos entre tiendas.

- **Atributos**: 
  - `IDTRN`: INT (Clave primaria, autoincremental)
  - `IDPRODUCTO`: INT
  - `IDTIENDA_ORIGEN`: INT
  - `IDTIENDA_DESTINO`: INT
  - `CANTIDAD`: INT
  - `FECHA_TRN`: DATETIME
  - `OBSERVACIONES`: VARCHAR(100)

---

## Tabla `CATEGORIAS`

- **Descripción**: Esta tabla almacena información sobre las categorías de productos.

- **Atributos**: 
  - `IDCATEGORIA`: INT (Clave primaria, autoincremental)
  - `NOMBRE`: VARCHAR(100)

---

## Tabla `SUBCATEGORIAS`

- **Descripción**: Esta tabla almacena información sobre las subcategorías de productos, relacionadas con las categorías.

- **Atributos**: 
  - `IDSUBCATEGORIA`: INT (Clave primaria, autoincremental)
  - `NOMBRE`: VARCHAR(100)
  - `IDCATEGORIA`: INT (Clave foránea que hace referencia a la tabla CATEGORIAS)

---

## Tabla `ORDENESDEVENTA`

- **Descripción**: Esta tabla almacena información sobre las órdenes de venta realizadas por los usuarios.

- **Atributos**: 
  - `IDORDEN`: INT (Clave primaria, autoincremental)
  - `IDUSUARIO`: INT (Clave foránea que hace referencia a la tabla USUARIOS)
  - `FECHA_CREACION`: DATETIME
  - `ESTADO`: VARCHAR(100)
  - `DIRECCION_ENVIO`: VARCHAR(255)
  - `IDCARRITO`: INT (Clave foránea que hace referencia a la tabla CARRITO)
