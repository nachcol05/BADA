-- Tabla CLIENTES
CREATE TABLE Clientes (
codigo_cliente INT PRIMARY KEY,
nombre VARCHAR(30) ,
domicilio VARCHAR(30),
provincia VARCHAR(50)
);

-- Tabla PRODUCTOS
CREATE TABLE PRODUCTOS (
    codigo_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL
);

-- Tabla VENTAS
CREATE TABLE VENTAS (
    numero_factura INT PRIMARY KEY,
    codigo_cliente INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (codigo_cliente) REFERENCES CLIENTES(codigo_cliente)
);

-- Tabla ITEM_VENTAS
CREATE TABLE ITEM_VENTAS (
    numero_factura INT NOT NULL,
    codigo_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (numero_factura, codigo_producto),
    FOREIGN KEY (numero_factura) REFERENCES VENTAS(numero_factura),
    FOREIGN KEY (codigo_producto) REFERENCES PRODUCTOS(codigo_producto)
);

INSERT INTO Clientes (codigo_cliente, nombre, domicilio, provincia) VALUES
(1, 'Ana Pérez', 'Calle Falsa 123', 'Buenos Aires'),
(2, 'Carlos López', 'Avenida Siempreviva 742', 'Córdoba'),
(3, 'Laura Gómez', 'Pasaje de la Rosa 45', 'Santa Fe'),
(4, 'Martín Rodríguez', 'Boulevard del Sol 1001', 'Mendoza'),
(5, 'Sofía Fernández', 'Ruta Nacional 9 km 500', 'Tucumán'),
(6, 'Juan Díaz', 'Barrio Jardín Manzana B Lote 15', 'Salta'),
(7, 'Valentina Vargas', 'Diagonal Alvear 222', 'Entre Ríos'),
(8, 'Pedro Castro', 'San Martín 3456', 'Neuquén'),
(9, 'Lucía Jiménez', 'Independencia 876', 'Chubut'),
(10, 'Gabriel Ruiz', 'Avenida Pellegrini 1234', 'Santa Cruz'),
(11, 'Agustina Torres', 'Urquiza 567', 'Corrientes'),
(12, 'Federico Soto', 'Mitre 987', 'Santiago del Estero'),
(13, 'Camila Silva', 'Belgrano 1122', 'San Juan'),
(14, 'Damián Núñez', 'Rivadavia 3344', 'La Pampa'),
(15, 'Julieta Romero', 'Alberdi 5566', 'Jujuy'),
(16, 'Sebastián Molina', 'Sarmiento 7788', 'Río Negro'),
(17, 'Florencia Herrera', 'Vélez Sarsfield 9900', 'Formosa'),
(18, 'Nicolás Chávez', 'España 1212', 'San Luis'),
(19, 'Antonella Acosta', 'Italia 3434', 'Misiones'),
(20, 'Leonardo Flores', 'Francia 5656', 'Catamarca'),
(21, 'Daniel Giménez', 'Brasil 7878', 'La Rioja'),
(22, 'Mariana Benítez', 'Estados Unidos 9090', 'Chaco'),
(23, 'Joaquín Pereyra', 'Bolivia 123', 'Tierra del Fuego'),
(24, 'Constanza Medina', 'Paraguay 456', 'Santa Fe'),
(25, 'Ignacio Gutiérrez', 'Uruguay 789', 'Buenos Aires'),
(26, 'Renata Vargas', 'Chile 901', 'Córdoba'),
(27, 'Emilio Castro', 'Perú 234', 'Mendoza'),
(28, 'Abril Jiménez', 'Colombia 567', 'Tucumán'),
(29, 'Mateo Ruiz', 'Venezuela 890', 'Salta'),
(30, 'Martina Torres', 'Ecuador 1234', 'Entre Ríos');

INSERT INTO PRODUCTOS (codigo_producto, nombre_producto) VALUES
(1, 'Laptop Dell XPS 15'),
(2, 'Smartphone Samsung Galaxy S23 Ultra'),
(3, 'Tablet Apple iPad Pro 12.9-inch'),
(4, 'Smartwatch Garmin Fenix 7'),
(5, 'Auriculares Sony WH-1000XM5'),
(6, 'Televisor LG OLED C3 55-inch'),
(7, 'Impresora HP LaserJet Pro M404dn'),
(8, 'Monitor Dell UltraSharp U2723QE'),
(9, 'Altavoz Bluetooth JBL Flip 6'),
(10, 'Cámara Sony Alpha 7 IV'),
(11, 'Disco Duro Externo Seagate Expansion 2TB'),
(12, 'Memoria RAM Corsair Vengeance LPX 16GB'),
(13, 'Tarjeta Gráfica NVIDIA GeForce RTX 4080'),
(14, 'Procesador Intel Core i9-13900K'),
(15, 'Placa Base ASUS ROG Strix Z790-E Gaming WiFi'),
(16, 'Fuente de Alimentación Corsair RM850x'),
(17, 'Caja de PC NZXT H5 Flow'),
(18, 'Ratón Logitech MX Master 3S'),
(19, 'Teclado Mecánico Corsair K70 RGB PRO'),
(20, 'Unidad SSD Samsung 990 PRO 2TB'),
(21, 'Router Wi-Fi 6 Netgear Nighthawk AX8'),
(22, 'Adaptador USB-C a HDMI Anker'),
(23, 'Cable HDMI 2.1 Belkin Ultra HD'),
(24, 'Soporte para Laptop AmazonBasics'),
(25, 'Limpiador de Pantallas Whoosh!'),
(26, 'Batería Externa Anker PowerCore III Elite'),
(27, 'Webcam Logitech Brio Ultra HD'),
(28, 'Micrófono Blue Yeti USB'),
(29, 'Silla de Oficina Herman Miller Aeron'),
(30, 'Escritorio Ergonómico Standing Desk FlexiSpot');

INSERT INTO VENTAS (numero_factura, codigo_cliente, fecha) VALUES
(1001, 1, '2024-01-15'),
(1002, 3, '2024-01-20'),
(1003, 15, '2024-02-01'),
(1004, 7, '2024-02-10'),
(1005, 22, '2024-02-25'),
(1006, 5, '2024-03-05'),
(1007, 18, '2024-03-12'),
(1008, 11, '2024-03-28'),
(1009, 29, '2024-04-03'),
(1010, 9, '2024-04-18'),
(1011, 25, '2024-04-29'),
(1012, 2, '2024-05-07'),
(1013, 17, '2024-05-14'),
(1014, 30, '2024-05-22'),
(1015, 6, '2024-06-01'),
(1016, 20, '2024-06-09'),
(1017, 13, '2024-06-21'),
(1018, 27, '2024-07-02'),
(1019, 4, '2024-07-15'),
(1020, 23, '2024-07-29'),
(1021, 8, '2024-08-06'),
(1022, 26, '2024-08-19'),
(1023, 19, '2024-08-30'),
(1024, 12, '2024-09-11'),
(1025, 28, '2024-09-25'),
(1026, 16, '2024-10-05'),
(1027, 30, '2024-10-17'),
(1028, 7, '2024-10-30'),
(1029, 21, '2024-11-08'),
(1030, 10, '2024-11-22');

INSERT INTO VENTAS (numero_factura, codigo_cliente, fecha) VALUES
(1031, 9, '2024-05-15'),
(1032, 2, '2024-02-27'),
(1033, 24, '2024-11-05'),
(1034, 30, '2024-07-10');

INSERT INTO ITEM_VENTAS (numero_factura, codigo_producto, cantidad, precio) VALUES
(1001, 1, 1, 1200.50),
(1001, 5, 2, 250.75),
(1002, 2, 1, 950.99),
(1002, 9, 3, 85.20),
(1003, 15, 1, 180.00),
(1003, 18, 1, 75.50),
(1004, 7, 1, 350.25),
(1004, 22, 2, 15.99),
(1005, 5, 1, 260.00),
(1005, 12, 2, 60.50),
(1006, 3, 1, 1100.00),
(1006, 19, 1, 115.75),
(1007, 10, 1, 1550.50),
(1007, 25, 3, 5.25),
(1008, 8, 1, 450.99),
(1008, 16, 1, 130.00),
(1009, 17, 1, 90.50),
(1009, 28, 1, 195.20),
(1010, 4, 1, 600.75),
(1010, 21, 2, 165.00),
(1011, 11, 1, 80.25),
(1011, 29, 1, 380.99),
(1012, 6, 1, 1800.00),
(1012, 24, 2, 22.50),
(1013, 14, 1, 520.50),
(1013, 30, 1, 410.75),
(1014, 1, 1, 1250.00),
(1014, 20, 1, 310.20),
(1015, 9, 2, 90.00),
(1015, 26, 3, 12.75),
(1016, 3, 1, 1150.99),
(1016, 13, 1, 780.50),
(1017, 8, 1, 475.00),
(1017, 23, 2, 35.99),
(1018, 5, 1, 270.25),
(1018, 15, 2, 190.00),
(1019, 2, 1, 980.00),
(1019, 17, 1, 95.50),
(1020, 10, 1, 1600.75),
(1020, 27, 1, 210.20),
(1021, 7, 1, 365.00),
(1021, 11, 2, 85.75),
(1022, 4, 1, 620.99),
(1022, 19, 1, 120.00),
(1023, 1, 1, 1220.50),
(1023, 16, 1, 135.25),
(1024, 6, 1, 1850.00),
(1024, 25, 4, 5.50),
(1025, 3, 1, 1120.75),
(1025, 18, 1, 80.00),
(1026, 9, 3, 88.50),
(1026, 22, 1, 16.50),
(1027, 2, 1, 965.99),
(1027, 29, 1, 395.00),
(1028, 5, 2, 255.00),
(1028, 12, 1, 62.75),
(1029, 8, 1, 460.20),
(1029, 30, 1, 425.50),
(1030, 4, 1, 610.00),
(1030, 21, 3, 170.25);

INSERT INTO ITEM_VENTAS (numero_factura, codigo_producto, cantidad, precio) VALUES
(1031,4,50,320.00),
(1032,2,90,220.00),
(1033,15,43,430.50),
(1034,23,102,842.20);
-- Punto 1
SELECT cantidad
FROM item_ventas
ORDER BY cantidad desc

-- Punto 2 está cortado el punto del pdf
SELECT cantidad
FROM item_ventas

-- Punto 3
SELECT iv.cantidad, p.nombre_producto
FROM item_ventas iv, productos p
WHERE iv.codigo_producto = p.codigo_producto
ORDER BY iv.cantidad desc
-- Punto 4
SELECT iv.cantidad, p.nombre_producto
FROM item_ventas iv, productos p
WHERE iv.cantidad > 30
AND iv.codigo_producto = p.codigo_producto
ORDER BY p.nombre_producto

-- Punto 5
SELECT iv.numero_factura, c.codigo_cliente, c.nombre
FROM item_ventas iv, clientes c, ventas v
WHERE v.numero_factura = iv.numero_factura
AND v.codigo_cliente = c.codigo_cliente
ORDER BY iv.numero_factura desc

-- Punto 6
SELECT iv.codigo_producto, AVG(iv.cantidad) AS promedio_unidades_vendidas
FROM item_ventas iv, clientes c
WHERE c.codigo_cliente = 1
GROUP BY
    iv.codigo_producto;


SELECT *
FROM clientes



