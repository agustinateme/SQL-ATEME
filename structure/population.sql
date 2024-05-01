USE TRINITY_ECOMMERCE;
-- mysql -u username -p --local-infile=1

SET GLOBAL local_infile = true;

-- Insertar usuarios
INSERT INTO USUARIOS (NOMBRE, APELLIDO, EMAIL, DIRECCION, TELEFONO, CONTRASENIA, TIPO_USUARIO, FECHA_REGISTRO, ULTIMO_ACCESO)
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
INSERT INTO CATEGORIAS (NOMBRE)
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
INSERT INTO SUBCATEGORIAS (NOMBRE, IDCATEGORIA)
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
INSERT INTO TIENDAS (NOMBRE, DIRECCION, EMAIL, TELEFONO)
VALUES 
('Tienda A', 'Calle Principal 123', 'tiendaA@example.com', '123456789'),
('Tienda B', 'Avenida Central 456', 'tiendaB@example.com', '987654321'),
('Tienda C', 'Carrera Norte 789', 'tiendaC@example.com', '456789012'),
('Tienda D', 'Avenida Sur 101', 'tiendaD@example.com', '890123456'),
('Tienda E', 'Calle Este 202', 'tiendaE@example.com', '567890123');

-- Insertar productos
INSERT INTO PRODUCTOS (NOMBRE, PRECIO, IDCATEGORIA, IDSUBCATEGORIA, IDTIENDA, DETALLE, CANTIDAD, STOCK, FECHA_AGREGADO, IMAGENES)
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
('Coche deportivo', 50000, 10, 10, 4, 'Color rojo', 2, TRUE, NOW(), 'coche1.jpg');

-- Insertar empleados
INSERT INTO EMPLEADOS (NOMBRE, APELLIDO, IDTIENDA, PUESTO, SUELDO, EMAIL, TELEFONO, FECHA_CONTRATACION)
VALUES 
('Pablo', 'González', 1, 'Vendedor', 2000, 'pablo@example.com', '111222333', NOW()),
('Carmen', 'Sánchez', 2, 'Cajero', 1800, 'carmen@example.com', '444555666', NOW()),
('Javier', 'Díaz', 3, 'Gerente', 3000, 'javier@example.com', '777888999', NOW()),
('Lucía', 'Fernández', 4, 'Vendedor', 2000, 'lucia@example.com', '000111222', NOW()),
('Andrés', 'Martínez', 5, 'Cajero', 1800, 'andres@example.com', '333444555', NOW());

-- Insertar órdenes de venta
INSERT INTO ORDENESDEVENTA (IDUSUARIO, FECHA_CREACION, ESTADO, DIRECCION_ENVIO, IDCARRITO)
VALUES 
(1, NOW(), 'Pendiente', 'Calle Principal', 1),
(2, NOW(), 'Entregado', 'Avenida Central', 2),
(3, NOW(), 'Pendiente', 'Carrera Norte', 3),
(4, NOW(), 'Entregado', 'Avenida Sur', 4),
(5, NOW(), 'Pendiente', 'Calle Este', 5),
(6, NOW(), 'Pendiente', 'Calle Secundaria', 6),
(7, NOW(), 'Pendiente', 'Avenida Norte', 7),
(8, NOW(), 'Pendiente', 'Calle 456', 8),
(9, NOW(), 'Pendiente', 'Calle 789', 9),
(10, NOW(), 'Pendiente', 'Avenida Este', 10);

LOAD DATA LOCAL INFILE './SEGUNDA PRE-ENTREGA SQL/data_csv/ordenesDeVentas.csv'
INTO TABLE ORDENESDEVENTA
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(IDUSUARIO, FECHA_CREACION, ESTADO, DIRECCION_ENVIO, IDCARRITO);
