USE ECOMDB;
-- mysql -u username -p --local-infile=1

SET GLOBAL local_infile = true;

-- Insertar usuarios
INSERT INTO USUARIO (NOMBRE, APELLIDO, EMAIL, DIRECCION, TELEFONO, CONTRASENIA, TIPO_USUARIO, FECHA_REGISTRO, ULTIMO_ACCESO)
VALUES 
('Juan', 'Perez', 'juan@example.com', 'Calle 123', '123456789', 'contrasenia123', 'cliente', NOW(), NOW()),
('Maria', 'Gomez', 'maria@example.com', 'Avenida 456', '987654321', 'contrasenia456', 'cliente', NOW(), NOW()),
('Carlos', 'López', 'carlos@example.com', 'Avenida Central', '567890123', 'contrasenia789', 'empleado', NOW(), NOW()),
('Laura', 'García', 'laura@example.com', 'Carrera 789', '234567890', 'contraseniaabc', 'cliente', NOW(), NOW()),
('Pedro', 'Martínez', 'pedro@example.com', 'Calle Principal', '901234567', 'contraseniadef', 'empleado', NOW(), NOW()),
('Ana', 'Rodríguez', 'ana@example.com', 'Calle Secundaria', '345678901', 'contraseniazxc', 'cliente', NOW(), NOW()),
('Sara', 'Fernández', 'sara@example.com', 'Avenida Norte', '678901234', 'contraseniaqwe', 'cliente', NOW(), NOW()),
('Diego', 'López', 'diego@example.com', 'Calle 456', '123456789', 'contraseniarst', 'empleado', NOW(), NOW()),
('Elena', 'Martínez', 'elena@example.com', 'Calle 789', '890123456', 'contraseniazxc', 'cliente', NOW(), NOW()),
('Miguel', 'Gómez', 'miguel@example.com', 'Avenida Este', '567890123', 'contraseniahjk', 'cliente', NOW(), NOW());

-- Insertar categorías
INSERT INTO CATEGORIA (NOMBRE)
VALUES 
('Electrónica'),
('Ropa'),
('Hogar'),
('Deportes'),
('Alimentación'),
('Juguetes'),
('Belleza'),
('Libros'),
('Música'),
('Automóviles');

-- Insertar subcategorías
INSERT INTO SUBCATEGORIA (NOMBRE, IDCATEGORIA)
VALUES 
('Televisores', 1),
('Camisetas', 2),
('Sofás', 3),
('Fútbol', 4),
('Frutas', 5),
('Muñecas', 6),
('Maquillaje', 7),
('Novelas', 8),
('CDs', 9),
('Coches', 10);

-- Insertar tiendas
INSERT INTO TIENDA (NOMBRE, DIRECCION, EMAIL, TELEFONO)
VALUES 
('Tienda A', 'Calle Principal 123', 'tiendaA@example.com', '123456789'),
('Tienda B', 'Avenida Central 456', 'tiendaB@example.com', '987654321'),
('Tienda C', 'Carrera Norte 789', 'tiendaC@example.com', '456789012'),
('Tienda D', 'Avenida Sur 101', 'tiendaD@example.com', '890123456'),
('Tienda E', 'Calle Este 202', 'tiendaE@example.com', '567890123');

-- Insertar productos
INSERT INTO PRODUCTO (NOMBRE, PRECIO, IDCATEGORIA, IDSUBCATEGORIA, IDTIENDA, DETALLE, CANTIDAD, STOCK, FECHA_AGREGADO, IMAGENES)
VALUES 
('Televisor LED 50 pulgadas', 500, 1, 1, 1, 'Resolución Full HD', 10, TRUE, NOW(), 'tv1.jpg'),
('Camiseta blanca', 20, 2, 2, 2, 'Talla M', 50, TRUE, NOW(), 'camiseta1.jpg'),
('Sofá de cuero', 800, 3, 3, 1, 'Color negro', 5, TRUE, NOW(), 'sofa1.jpg'),
('Balón de fútbol', 30, 4, 4, 2, 'Talla 5', 20, TRUE, NOW(), 'balon1.jpg'),
('Manzanas', 2, 5, 5, 3, 'Origen nacional', 100, TRUE, NOW(), 'manzanas1.jpg'),
('Muñeca Barbie', 25, 6, 6, 4, 'Incluye accesorios', 15, TRUE, NOW(), 'barbie1.jpg'),
('Base de maquillaje', 15, 7, 7, 1, 'Tono natural', 30, TRUE, NOW(), 'maquillaje1.jpg'),
('El señor de los anillos', 12, 8, 8, 2, 'Edición de bolsillo', 40, TRUE, NOW(), 'lotr1.jpg'),
('Álbum de música', 10, 9, 9, 3, 'Artista variado', 50, TRUE, NOW(), 'album1.jpg'),
('Coche deportivo', 50000, 10, 10, 4, 'Color rojo', 2, TRUE, NOW(), 'coche1.jpg'),
('Championes', 2000, 2, 2, 4, 'Color rojo', 0, FALSE, NOW(), 'champion1.jpg');

-- Insertar empleados
INSERT INTO EMPLEADO (NOMBRE, APELLIDO, IDTIENDA, PUESTO, SUELDO, EMAIL, TELEFONO, FECHA_CONTRATACION)
VALUES 
('Pablo', 'González', 1, 'Vendedor', 2000, 'pablo@example.com', '111222333', NOW()),
('Carmen', 'Sánchez', 2, 'Cajero', 1800, 'carmen@example.com', '444555666', NOW()),
('Javier', 'Díaz', 3, 'Gerente', 3000, 'javier@example.com', '777888999', NOW()),
('Lucía', 'Fernández', 4, 'Vendedor', 2000, 'lucia@example.com', '000111222', NOW()),
('Andrés', 'Martínez', 5, 'Cajero', 1800, 'andres@example.com', '333444555', NOW());

-- Insertar carritos
INSERT INTO CARRITO (IDUSUARIO, FECHA_CREACION, ESTADO, TOTAL)
VALUES 
(1, NOW(), true, 0),
(2, NOW(), true, 0),
(3, NOW(), false, 0),
(4, NOW(), false, 0),
(5, NOW(), true, 0),
(6, NOW(), false, 0),
(7, NOW(), true, 0),
(8, NOW(), true, 0),
(9, NOW(), true, 0),
(10, NOW(), true, 0);


-- Insertar órdenes de venta
INSERT INTO ORDENDEVENTA (IDUSUARIO, FECHA_CREACION, ESTADO, DIRECCION_ENVIO, IDCARRITO)
VALUES 
(1, NOW(), true, 'Calle Principal', 1),
(2, NOW(), true, 'Avenida Central', 2),
(3, NOW(), false, 'Carrera Norte', 3),
(4, NOW(), false, 'Avenida Sur', 4),
(5, NOW(), true, 'Calle Este', 5),
(6, NOW(), false, 'Calle Secundaria', 6),
(7, NOW(), true, 'Avenida Norte', 7),
(8, NOW(), true, 'Calle 456', 8),
(9, NOW(), true, 'Calle 789', 9),
(10, NOW(), true, 'Avenida Este', 10);

LOAD DATA LOCAL INFILE './structure/data_csv/ordenDeVenta.csv'
INTO TABLE ORDENDEVENTA
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(IDUSUARIO, FECHA_CREACION, ESTADO, DIRECCION_ENVIO, IDCARRITO);
