# SQL-ATEME

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
