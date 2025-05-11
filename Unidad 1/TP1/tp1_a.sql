-- Crear tabla de Documentos
CREATE TABLE Documentos (
    cod_documento VARCHAR (25) PRIMARY KEY,
    descripcion VARCHAR(100)
);

-- Crear tabla de Oficinas
CREATE TABLE Oficinas (
    cod_oficina VARCHAR (25) PRIMARY KEY,
    codigo_director VARCHAR (25),
    descripcion VARCHAR(100)
);

-- Crear tabla de Empleados
CREATE TABLE Empleados (
    cod_empleado VARCHAR (25) PRIMARY KEY,
    apellido VARCHAR(50),
    nombre VARCHAR(50),
    fecha_nacimiento DATE,
    num_doc VARCHAR(20),
    cod_jefe VARCHAR (25),
    cod_oficina VARCHAR (25),
    cod_documento VARCHAR (25),
    FOREIGN KEY (cod_jefe) REFERENCES Empleados(cod_empleado),
    FOREIGN KEY (cod_oficina) REFERENCES Oficinas(cod_oficina),
    FOREIGN KEY (cod_documento) REFERENCES Documentos(cod_documento)
);

-- Crear tabla de Datos_contratos
CREATE TABLE Datos_contratos (
    cod_empleado VARCHAR (25) PRIMARY KEY,
    fecha_contrato DATE,
    cuota DECIMAL(10,2),
    ventas DECIMAL(10,2),
    FOREIGN KEY (cod_empleado) REFERENCES Empleados(cod_empleado)
);

-- Crear tabla de Fabricantes
CREATE TABLE Fabricantes (
    cod_fabricante VARCHAR (25) PRIMARY KEY,
    razon_social VARCHAR(100)
);

-- Crear tabla de Listas
CREATE TABLE Listas (
    cod_lista VARCHAR (25) PRIMARY KEY,
    descripcion VARCHAR(100),
    ganancia DECIMAL(5,2)
);

-- Crear tabla de Productos
CREATE TABLE Productos (
    cod_producto VARCHAR (25) PRIMARY KEY,
    descripcion VARCHAR(100),
    precio DECIMAL(10,2),
    cantidad_stock INT,
    punto_reposicion INT,
    cod_fabricante VARCHAR (25),
    FOREIGN KEY (cod_fabricante) REFERENCES Fabricantes(cod_fabricante)
);

-- Crear tabla de Precios
CREATE TABLE Precios (
    cod_producto VARCHAR (25),
    cod_lista VARCHAR (25),
    precio DECIMAL(10,2),
    PRIMARY KEY (cod_producto, cod_lista),
    FOREIGN KEY (cod_producto) REFERENCES Productos(cod_producto),
    FOREIGN KEY (cod_lista) REFERENCES Listas(cod_lista)
);

-- Crear tabla de Clientes
CREATE TABLE Clientes (
    cod_cliente VARCHAR (25) PRIMARY KEY,
    cod_lista VARCHAR (25),
    razon_social VARCHAR(100),
    FOREIGN KEY (cod_lista) REFERENCES Listas(cod_lista)
);

-- Crear tabla de Pedidos
CREATE TABLE Pedidos (
    cod_pedido VARCHAR (25) PRIMARY KEY,
    fecha_pedido DATE,
    cod_empleado VARCHAR (25),
    cod_cliente VARCHAR (25),
    FOREIGN KEY (cod_empleado) REFERENCES Empleados(cod_empleado),
    FOREIGN KEY (cod_cliente) REFERENCES Clientes(cod_cliente)
);

-- Crear tabla de Detalle_pedidos
CREATE TABLE Detalle_pedidos (
    cod_pedido VARCHAR (25),
    numero_linea INT,
    cod_producto VARCHAR (25),
    cantidad INT,
    PRIMARY KEY (cod_pedido, numero_linea),
    FOREIGN KEY (cod_pedido) REFERENCES Pedidos(cod_pedido),
    FOREIGN KEY (cod_producto) REFERENCES Productos(cod_producto)
);

-- INSERT datos
-- tabla documentos
INSERT INTO Documentos (cod_documento, descripcion) VALUES
(1, 'DNI'),
(2, 'Pasaporte'),
(3, 'Licencia de Conducir'),
(4, 'Cédula'),
(5, 'Carnet de Extranjería');

-- Tabla: Oficina
INSERT INTO Oficinas (cod_oficina, codigo_director, descripcion) VALUES
(101, NULL, 'Oficina Central'),
(102, 1, 'Sucursal Norte'),
(103, 2, 'Sucursal Sur'),
(104, 3, 'Sucursal Este'),
(105, 4, 'Sucursal Oeste');

INSERT INTO empleados(cod_empleado, apellido, nombre, fecha_nacimiento,
num_doc, cod_jefe, cod_oficina, cod_documento) VALUES 
('EMP001', 'Fernandez','Thiago','2005-05-15','12345678A',NULL,'103','1');
INSERT INTO Empleados (cod_empleado, apellido, nombre, fecha_nacimiento, num_doc, 
cod_jefe, cod_oficina, cod_documento)
VALUES ('EMP002', 'González', 'María', '1988-10-20', '98765432B', null, '105', '3');
INSERT INTO Empleados (cod_empleado, apellido, nombre, fecha_nacimiento, num_doc, cod_jefe, cod_oficina, cod_documento)
VALUES ('EMP003', 'Rodríguez', 'Carlos', '1995-01-30', '11223344C', 'EMP001', '102', '2');

INSERT INTO Empleados (cod_empleado, apellido, nombre, fecha_nacimiento, num_doc, cod_jefe, cod_oficina, cod_documento) VALUES
('EMP004', 'Pérez', 'Juan', '1985-03-15', '20123456', NULL, '102', '1'),
('EMP005', 'Gómez', 'María', '1990-07-20', '25654321', 'EMP001', '103', '3'),
('EMP006', 'Rodríguez', 'Carlos', '1988-11-05', '18987654', 'EMP001', '102', '4'),
('EMP007', 'López', 'Ana', '1992-01-28', '30456789', 'EMP003', '102', '5'),
('EMP008', 'Fernández', 'Pedro', '1987-05-10', '22876543', 'EMP001', '105', '2'),
('EMP009', 'Martínez', 'Laura', '1995-09-01', '35123789', 'EMP003', '102', '1'),
('EMP010', 'Sánchez', 'Diego', '1991-04-12', '28987123', 'EMP002', '101', '5');

-- Llenar datos de Datos_contratos
INSERT INTO Datos_contratos (cod_empleado, fecha_contrato, cuota, ventas) VALUES
('EMP001', '2024-01-15', 1500.00, 2800.50),
('EMP002', '2023-11-20', 1200.50, 1950.75),
('EMP003', '2025-03-01', 1800.75, 3500.00),
('EMP004', '2024-06-10', 950.25, 1400.00),
('EMP005', '2022-12-05', 2100.00, 4100.25),
('EMP006', '2025-02-28', 1350.80, 2500.90),
('EMP007', '2023-09-18', 1650.50, 3100.60),
('EMP008', '2024-04-01', 1100.00, 1750.40),
('EMP009', '2022-07-22', 1950.20, 3800.15),
('EMP010', '2025-05-05', 1400.90, 2650.85);
-- Llenar datos de Listas
INSERT INTO Listas (cod_lista, descripcion, ganancia) VALUES
('LST001', 'Lista de precios minorista estándar', 15.50),
('LST002', 'Lista de precios mayorista para distribuidores', 12.75),
('LST003', 'Lista de precios especial para clientes VIP', 20.00),
('LST004', 'Lista de precios promocional de verano', 10.20),
('LST005', 'Lista de precios para productos importados', 18.90),
('LST006', 'Lista de precios con descuento por volumen', 14.30),
('LST007', 'Lista de precios para la línea económica', 8.50),
('LST008', 'Lista de precios para servicios de consultoría', 25.00),
('LST009', 'Lista de precios para repuestos automotrices', 16.80),
('LST010', 'Lista de precios para equipos electrónicos', 19.25),
('LST011', 'Lista de precios para la temporada navideña', 17.60),
('LST012', 'Lista de precios para miembros del club', 22.10),
('LST013', 'Lista de precios para productos orgánicos', 13.90),
('LST014', 'Lista de precios para software empresarial', 28.50),
('LST015', 'Lista de precios para artículos de ferretería', 11.40),
('LST016', 'Lista de precios para mobiliario de oficina', 15.00),
('LST017', 'Lista de precios para calzado deportivo', 17.85),
('LST018', 'Lista de precios para joyería de plata', 21.30),
('LST019', 'Lista de precios para herramientas de jardín', 12.15),
('LST020', 'Lista de precios para alimentos congelados', 9.95);

INSERT INTO Clientes (cod_cliente, cod_lista, razon_social) VALUES
('CLI001', 'LST001', 'Supermercado La Esquina S.A.'),
('CLI002', 'LST002', 'Distribuidora Mayorista del Centro'),
('CLI003', 'LST003', 'Cliente Preferencial SRL'),
('CLI004', 'LST004', 'Bazar El Sol'),
('CLI005', 'LST005', 'Importadora Sudamericana'),
('CLI006', 'LST006', 'Ferretería El Tornillo Grande'),
('CLI007', 'LST007', 'Tienda de Descuentos Express'),
('CLI008', 'LST008', 'Consultores Asociados'),
('CLI009', 'LST009', 'Repuestos del Automóvil S.R.L.'),
('CLI010', 'LST010', 'Electrónica Global S.A.'),
('CLI011', 'LST011', 'Regalos y Novedades Navidad Feliz'),
('CLI012', 'LST012', 'Club de Compras Exclusivo'),
('CLI013', 'LST013', 'Almacén de Productos Naturales'),
('CLI014', 'LST014', 'Soluciones Informáticas Integrales'),
('CLI015', 'LST015', 'Materiales de Construcción Roca Fuerte'),
('CLI016', 'LST016', 'Muebles Modernos S.A.'),
('CLI017', 'LST017', 'Deportes Extremos SRL'),
('CLI018', 'LST018', 'Joyería Fina La Perla'),
('CLI019', 'LST019', 'Vivero El Jardín Secreto'),
('CLI020', 'LST020', 'Congelados del Sur S.A.');

INSERT INTO Pedidos (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) VALUES
('PED001', '2025-05-01', 'EMP001', 'CLI001'),
('PED002', '2025-05-02', 'EMP003', 'CLI005'),
('PED003', '2025-05-02', 'EMP002', 'CLI002'),
('PED004', '2025-05-03', 'EMP005', 'CLI010'),
('PED005', '2025-05-03', 'EMP001', 'CLI003'),
('PED006', '2025-05-04', 'EMP007', 'CLI015'),
('PED007', '2025-05-04', 'EMP004', 'CLI007'),
('PED008', '2025-05-05', 'EMP009', 'CLI018'),
('PED009', '2025-05-05', 'EMP006', 'CLI012'),
('PED010', '2025-05-06', 'EMP002', 'CLI004'),
('PED011', '2025-05-06', 'EMP008', 'CLI016'),
('PED012', '2025-05-07', 'EMP010', 'CLI020'),
('PED013', '2025-05-07', 'EMP003', 'CLI006'),
('PED014', '2025-05-08', 'EMP005', 'CLI011'),
('PED015', '2025-05-08', 'EMP001', 'CLI009'),
('PED016', '2025-05-09', 'EMP007', 'CLI014'),
('PED017', '2025-05-09', 'EMP004', 'CLI017'),
('PED018', '2025-05-10', 'EMP009', 'CLI008'),
('PED019', '2025-05-10', 'EMP006', 'CLI013'),
('PED020', '2025-05-10', 'EMP002', 'CLI019');

INSERT INTO Detalle_pedidos (cod_pedido, numero_linea, cod_producto, cantidad) VALUES
('PED001', 1, 'PEP001', 2),
('PED001', 2, 'PEP002', 1),
('PED002', 1, 'MCD001', 5),
('PED002', 2, 'PEP004', 3),
('PED003', 1, 'PEP003', 10),
('PED003', 2, 'PEP005', 2),
('PED004', 1, 'MCD005', 1),
('PED004', 2, 'PEP004', 4),
('PED005', 1, 'MCD004', 2),
('PED005', 2, 'MCD005', 6),
('PED006', 1, 'MCD003', 3),
('PED006', 2, 'MCD003', 1),
('PED007', 1, 'PEP005', 7),
('PED007', 2, 'MCD002', 2),
('PED008', 1, 'MCD004', 4),
('PED008', 2, 'MCD005', 1),
('PED009', 1, 'PEP005', 5),
('PED009', 2, 'PEP001', 3),
('PED010', 1, 'MCD004', 2),
('PED010', 2, 'PEP003', 1);


-- Pepsi
INSERT INTO fabricantes
VALUES ('FB001', 'Pepsico Iberia Servicios Centrales')
-- McDonald's
INSERT INTO fabricantes 
VALUES ('FB002','Arcos Dorados')

INSERT INTO productos (cod_producto, descripcion, precio, cantidad_stock, punto_reposicion, cod_fabricante)
VALUES ('PEP001', 'Pepsi Lata 355ml', 1.50, 100, 20, 'FB001'),
('PEP002', 'Pepsi Botella 600ml', 2.00, 80, 15, 'FB001'),
('MCD001', 'Big Mac', 5.99, 50, 10, 'FB002'),
('MCD002', 'Papas Fritas Medianas', 2.50, 120, 30, 'FB002'),
('PEP003', 'Pepsi Max Lata 355ml', 1.60, 90, 18, 'FB001'),
('MCD003', 'Cuarto de Libra con Queso', 6.50, 40, 8, 'FB002'),
('PEP004', 'Seven Up Lata 355ml', 1.40, 70, 12, 'FB001'),
('MCD004', 'McNuggets x6', 4.00, 60, 15, 'FB002'),
('PEP005', 'Mirinda Naranja Lata 355ml', 1.30, 50, 10, 'FB001'),
('MCD005', 'Sundae', 3.00, 30, 5, 'FB002');


INSERT INTO Precios (cod_producto, cod_lista, precio) VALUES
('PEP001', 'LST001', 25.99),
('PEP001', 'LST002', 22.50),
('PEP002', 'LST001', 12.50),
('PEP002', 'LST003', 15.00),
('MCD001', 'LST001', 45.75),
('MCD001', 'LST002', 40.00),
('MCD002', 'LST004', 8.99),
('MCD002', 'LST001', 10.50),
('PEP003', 'LST005', 75.00),
('PEP003', 'LST001', 82.00),
('MCD003', 'LST006', 19.99),
('MCD003', 'LST001', 21.50),
('PEP004', 'LST007', 5.99),
('PEP004', 'LST001', 7.25),
('MCD004', 'LST008', 120.00),
('MCD004', 'LST003', 140.00),
('PEP005', 'LST009', 35.50),
('PEP005', 'LST001', 38.00),
('MCD005', 'LST010', 150.00),
('MCD005', 'LST003', 175.00);

INSERT INTO clientes VALUE
('CLI021' ,'LST001', 'Libreria Don Mario')

INSERT INTO pedidos VALUE
('PED021' ,'2025-04-15','EMP009', 'CLI004')

INSERT INTO pedidos VALUE
('PED022' ,'2025-03-25','EMP009', 'CLI007')
INSERT INTO Empleados VALUE
('EMP011', 'Colatto', 'Ignacio', '2005-11-15', 47085311,'EMP001',102,2) 
INSERT INTO datos_contratos VALUE
('EMP011','2038-03-05', 1800.00, 3450.00)
INSERT INTO productos VALUE
('MCD006', 'Papas Fritas Cheddar', 3.00, 2, 50, 'FB002');

-- punto 1
SELECT descripcion "Nombre de Oficina"
FROM oficinas
-- punto 2
SELECT descripcion, precio,
precio * 0.21 + precio AS Costo_iva
FROM productos
-- punto 3
SELECT apellido, nombre, fecha_nacimiento,
YEAR (CURDATE())-YEAR(fecha_nacimiento)AS EDAD
FROM empleados
-- punto 4
SELECT *
FROM empleados E
WHERE E.cod_jefe IS NOT null

-- punto 5
SELECT E.*
FROM empleados E
WHERE e.nombre = "maria"
ORDER BY e.apellido desc

-- punto 6
SELECT *
FROM Clientes
WHERE razon_social LIKE 'L%'
ORDER BY cod_cliente;

-- punto 7
SELECT *
FROM pedidos p
WHERE MONTH (p.fecha_pedido) = 3
ORDER BY fecha_pedido;

-- punto 8
SELECT *
FROM oficinas
WHERE codigo_director is NULL

-- punto 9
SELECT *
FROM productos
ORDER BY precio
LIMIT 4;

-- punto 10
SELECT *
FROM datos_contratos
ORDER BY cuota desc
LIMIT 3;

-- Consulta MultiTablas
-- punto 1
SELECT pr.descripcion,f.razon_social, pr.cantidad_stock
FROM productos pr, fabricantes f
ORDER BY f.razon_social AND pr.descripcion;

-- punto 2 
SELECT
    p.cod_pedido, p.fecha_pedido,e.apellido AS apellido_empleado,
	 f.razon_social AS razon_social_cliente
FROM
    pedidos p, empleados e, fabricantes f
    
-- punto 3
SELECT e.apellido, dc.cuota, e.cod_oficina AS Oficina
FROM empleados e, datos_contratos dc
ORDER BY dc.cuota desc
-- punto 4
SELECT DISTINCT (c.razon_social)
FROM clientes c, pedidos p
WHERE MONTH (p.fecha_pedido) = 4

-- punto 5
SELECT DISTINCT pr.descripcion
FROM productos pr, pedidos p
WHERE MONTH (p.fecha_pedido) = 3
-- punto 6 
SELECT e.cod_empleado, dc.fecha_contrato
FROM empleados e, datos_contratos dc
WHERE YEAR (dc.fecha_contrato) > 2035
ORDER BY dc.fecha_contrato DESC

-- punto 7 nose si se refiere a mayorista por la cantidad o por la razón social que diga mayorista
SELECT c.cod_cliente , dp.cantidad, c.razon_social
FROM clientes c, detalle_pedidos dp
WHERE dp.cantidad > 3
ORDER BY c.razon_social
-- punto 8
SELECT DISTINCT c.cod_cliente, pr.descripcion AS Producto
FROM clientes c, productos pr
ORDER BY c.razon_social AND pr.descripcion
-- punto 9
SELECT pr.descripcion, pr.cantidad_stock, pr.punto_reposicion, fr.razon_social
FROM productos pr, fabricantes fr
WHERE pr.cantidad_stock < pr.punto_reposicion
ORDER BY fr.razon_social AND pr.descripcion
-- punto10
SELECT e.cod_empleado, dc.cuota
FROM empleados e, datos_contratos dc
WHERE dc.cuota < 5000 OR dc.cuota > 100000



-- Select Tablas
SELECT *
FROM documentos

SELECT *
FROM Oficinas

SELECT *
FROM Empleados

SELECT *
FROM Datos_contratos

SELECT *
FROM Fabricantes

SELECT *
FROM Listas

SELECT *
FROM Productos

SELECT *
FROM Precios

SELECT *
FROM Clientes

SELECT *
FROM pedidos

SELECT *
FROM Detalle_pedidos
