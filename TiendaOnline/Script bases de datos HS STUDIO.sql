
CREATE DATABASE IF NOT EXISTS abc;

USE abc;


CREATE TABLE Vendedor_logistico (
  Id_vendedor INT PRIMARY KEY,
  Nombre VARCHAR(30),
  correo VARCHAR(20),
  telefono INT
);

CREATE TABLE carrito_compras (
  Id_carrito INT PRIMARY KEY,
  Numero_productos INT,
  precio_total FLOAT
);


CREATE TABLE Administrador (
  Id_administrador INT PRIMARY KEY, 
  contraseña VARCHAR(20),
  Nombre_usuario VARCHAR(30)
 
  
);


CREATE TABLE cliente (
  Id_Cliente INT PRIMARY KEY,
  Nombre VARCHAR(20),
  Direccion VARCHAR(30),
  Telefono INT,
  metodoPago VARCHAR(30)
);


CREATE TABLE Producto (
    Id_Producto INT PRIMARY KEY,
    nombre VARCHAR(20),
    Descripcion VARCHAR(70),
    imagen VARBINARY(8000),
    precio FLOAT,
    talla INT,
    color VARCHAR(10),
    ID_cliente2 INT,
    ID_inventario INT
);




CREATE TABLE Inventario (
  Id_inventario1 INT PRIMARY KEY,
  Cantidad FLOAT,
  Stock INT,
  Cantidad_minima_requerida INT,
  Id_producto5 INT,
  Id_administrador1 INT,
  CONSTRAINT fk_inventario_producto 
    FOREIGN KEY(Id_producto5)
    REFERENCES Producto(Id_Producto),
  CONSTRAINT fk_inventario_admin
    FOREIGN KEY (Id_administrador1) 
    REFERENCES Administrador(Id_administrador)
);

CREATE TABLE pedido (
  N_pedido INT PRIMARY KEY,
  Direccion_envio VARCHAR(40),
  Estado_pedido VARCHAR(10),
  Fecha_pedido DATE,
  Numero_guia INT,
  Id_carrito INT,
  Id_vendedor1 INT,
  CONSTRAINT fk_pedido_carrito
    FOREIGN KEY (Id_carrito)
    REFERENCES carrito_compras(Id_carrito),
  CONSTRAINT fk_pedido_vendedor   
    FOREIGN KEY (Id_vendedor1)
    REFERENCES Vendedor_logistico(Id_vendedor)
);


CREATE TABLE devolucion_cambio (
  N_solicitud INT PRIMARY KEY,
  Fecha_solicitud DATE,
  Estado_solicitud VARCHAR(10),
  Motivo_solicitud VARCHAR(70),
  Producto_relacionado VARCHAR(50),
  Mensaje_recivido_cliente VARCHAR(70),
  Id_vendedor3 INT,
  CONSTRAINT fk_devolucion_vendedor
    FOREIGN KEY (Id_vendedor3)
    REFERENCES Vendedor_logistico(Id_vendedor)  
);

ALTER TABLE administrador
ADD COLUMN Id_inventario7 INT,
ADD CONSTRAINT fk_admin_inventario
  FOREIGN KEY (Id_inventario7)
  REFERENCES inventario(Id_inventario1);

SHOW COLUMNS FROM Inventario;

ALTER TABLE Producto
ADD CONSTRAINT fk_producto_cliente
FOREIGN KEY (ID_cliente2)
REFERENCES cliente(Id_Cliente);

ALTER TABLE Producto
ADD CONSTRAINT fk_producto_inventario
FOREIGN KEY (ID_inventario)
REFERENCES Inventario(Id_inventario1);

ALTER TABLE carrito_compras
ADD COLUMN ID_cliente INT,  
ADD CONSTRAINT fk_carrito_cliente
FOREIGN KEY (ID_cliente)
REFERENCES cliente (Id_Cliente);


SELECT d.N_solicitud, v.Nombre AS nombre_vendedor
FROM devolucion_cambio d
INNER JOIN Vendedor_logistico v ON d.Id_vendedor3 = v.Id_vendedor;

SELECT * FROM producto;

INSERT INTO Inventario (Id_inventario1) 
VALUES (456);


-- Insertar registros en la tabla Cliente
INSERT INTO Cliente (Id_Cliente, nombre)
VALUES (123, 'Juan'),
       (124, 'María'),
       (125, 'Pedro');

-- Insertar registros en la tabla Inventario
INSERT INTO Inventario (Id_inventario1, Cantidad, Stock)
VALUES (456, 10.5, 100),
       (457, 20.3, 150),
       (458, 15.7, 200);

-- Insertar registros en la tabla Producto con los mismos IDs para las claves foráneas
INSERT INTO Producto (Id_Producto, nombre, Descripcion, imagen, precio, talla, color, ID_cliente2, ID_inventario)
VALUES (1, 'Camisa', 'Camisa de algodón para hombre', NULL, 25.99, 2, 'Azul', 123, 456),
       (2, 'Pantalón', 'Pantalón vaquero para mujer', NULL, 39.99, 5, 'Negro', 124, 457),
       (3, 'Zapatos', 'Zapatos de cuero para hombre', NULL, 59.99, 42, 'Marrón', 125, 458);

       SHOW GRANTS FOR 'root'@'localhost';
       
ALTER USER 'root'@'localhost' IDENTIFIED BY '';

ALTER TABLE Producto MODIFY COLUMN Id_Producto INT AUTO_INCREMENT;

ALTER TABLE Producto MODIFY COLUMN imagen VARBINARY(52000);

ALTER TABLE Producto
ADD COLUMN genero VARCHAR(10);

ALTER TABLE inventario ADD CONSTRAINT fk_inventario_producto 

FOREIGN KEY (Id_producto5) REFERENCES Producto(Id_Producto);

ALTER TABLE Inventario MODIFY Id_inventario1 INT AUTO_INCREMENT;


ALTER TABLE Administrador 
ADD CONSTRAINT fk_admin_inventario 
FOREIGN KEY (Id_inventario7) REFERENCES Inventario(Id_inventario1);


ALTER TABLE Inventario MODIFY Id_inventario1 INT AUTO_INCREMENT;

ALTER TABLE Producto 
ADD CONSTRAINT fk_producto_inventario 
FOREIGN KEY (ID_inventario) REFERENCES Inventario(Id_inventario1);


CREATE TABLE Banner (
   Id_publicidad INT PRIMARY KEY,
   imagen1 BLOB,
   imagen2 BLOB,
   imagen3 BLOB,
   Id_administrador2 INT,
   CONSTRAINT fk_publicidad_admin  
     FOREIGN KEY (Id_administrador2)
     REFERENCES Administrador(Id_administrador)
);

ALTER TABLE Producto 
DROP FOREIGN KEY fk_producto_inventario;

ALTER TABLE Producto 
ADD CONSTRAINT fk_producto_inventario 
FOREIGN KEY (ID_inventario) 
REFERENCES Inventario(Id_inventario1) 
ON DELETE CASCADE;



INSERT INTO Vendedor_logistico (Id_vendedor, Nombre, correo, telefono)
VALUES (1, 'Eduardo', 'eduardo@example.com', 123456789),
       (2, 'Ana', 'ana@example.com', 987654321),
       (3, 'Carlos', 'carlos@example.com', 555444333);

-- Insertar registros en la tabla carrito_compras
INSERT INTO carrito_compras (Id_carrito, Numero_productos, precio_total)
VALUES (1, 5, 100.00),
       (2, 3, 50.00),
       (3, 7, 150.00);

-- Insertar registros en la tabla Administrador
INSERT INTO Administrador (Id_administrador, contraseña, Nombre_usuario)
VALUES (1, 'contraseña1', 'admin1'),
       (2, 'contraseña2', 'admin2'),
       (3, 'contraseña3', 'admin3');

-- Insertar registros en la tabla cliente
INSERT INTO cliente (Id_Cliente, Nombre, Direccion, Telefono, metodoPago)
VALUES (1, 'María', 'Calle 123', 123456789, 'Tarjeta'),
       (2, 'Juan', 'Carrera 456', 987654321, 'Efectivo'),
       (3, 'Laura', 'Avenida 789', 555444333, 'Transferencia');



INSERT INTO pedido (N_pedido, Direccion_envio, Estado_pedido, Fecha_pedido, Numero_guia, Id_carrito, Id_vendedor1)
VALUES (1, 'Calle 123', 'En proceso', '2024-04-25', 12345, 1, 1),
       (2, 'Carrera 456', 'En camino', '2024-04-26', 67890, 2, 2),
       (3, 'Avenida 789', 'Entregado', '2024-04-27', 13579, 3, 3);



ALTER TABLE devolucion_cambio
MODIFY COLUMN Estado_solicitud VARCHAR(30);

-- Insertar registros en la tabla devolucion_cambio
INSERT INTO devolucion_cambio (N_solicitud, Fecha_solicitud, Estado_solicitud, Motivo_solicitud, Producto_relacionado, Mensaje_recivido_cliente, Id_vendedor3)
VALUES (1, '2024-04-25', 'En revisión', 'Talla incorrecta', 'Pantalón', 'Quiero cambiar la talla del pantalón', 1),
       (2, '2024-04-26', 'Aprobada', 'Producto defectuoso', 'Camisa', 'La camisa tiene un agujero', 2),
       (3, '2024-04-27', 'Rechazada', 'Color incorrecto', 'Zapatos', 'Pedí zapatos marrones y me enviaron negros', 3);

-- Insertar registros en la tabla Banner
INSERT INTO Banner (Id_publicidad, imagen1, imagen2, imagen3, Id_administrador2)
VALUES (1, NULL, NULL, NULL, 1),
       (2, NULL, NULL, NULL, 2),
       (3, NULL, NULL, NULL, 3vendedor_logistico);
       
	
       
 DROP TABLE Vendedor_logistico;
       
       
       ALTER TABLE pedido
DROP FOREIGN KEY fk_pedido_vendedor;

ALTER TABLE devolucion_cambio
DROP FOREIGN KEY fk_devolucion_vendedor;


ALTER TABLE pedido 
ADD COLUMN Id_administrador INT,
ADD CONSTRAINT fk_pedido_admin  
  FOREIGN KEY (Id_administrador)
  REFERENCES Administrador(Id_administrador);
  
  ALTER TABLE devolucion_cambio
ADD COLUMN Id_administrador INT,
ADD CONSTRAINT fk_devolucion_admin
  FOREIGN KEY (Id_administrador)
  REFERENCES Administrador(Id_administrador);

ALTER TABLE devolucion_cambio
DROP COLUMN Id_vendedor3;

ALTER TABLE pedido
DROP COLUMN Id_vendedor1;

ALTER TABLE Banner MODIFY imagen1 MEDIUMBLOB;
ALTER TABLE Banner MODIFY imagen2 MEDIUMBLOB;
ALTER TABLE Banner MODIFY imagen3 MEDIUMBLOB;

ALTER TABLE Banner MODIFY COLUMN Id_publicidad INT AUTO_INCREMENT;
       
       ALTER TABLE devolucion_cambio
MODIFY COLUMN N_solicitud INT AUTO_INCREMENT;


CREATE TABLE Destacados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT,
    FOREIGN KEY (producto_id) REFERENCES Producto(Id_Producto)
);


CREATE TABLE Promociones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT,
    descuento DECIMAL(5, 2),
    FOREIGN KEY (producto_id) REFERENCES Producto(Id_Producto)
);


ALTER TABLE carrito_compras
ADD COLUMN session_id VARCHAR(255);

SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'carrito_compras' AND COLUMN_NAME = 'Id_carrito';


ALTER TABLE carrito_compras
DROP PRIMARY KEY;


SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'pedido' AND COLUMN_NAME = 'Id_carrito';

SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'cliente' AND COLUMN_NAME = 'Id_carrito';

ALTER TABLE pedido
DROP FOREIGN KEY fk_pedido_carrito;


ALTER TABLE carrito_compras
DROP PRIMARY KEY;

ALTER TABLE carrito_compras
MODIFY COLUMN Id_carrito INT AUTO_INCREMENT;

ALTER TABLE carrito_compras
ADD PRIMARY KEY (Id_carrito);

ALTER TABLE carrito_compras
DROP PRIMARY KEY,
ADD COLUMN Id_carrito INT AUTO_INCREMENT PRIMARY KEY;


ALTER TABLE carrito_compras
MODIFY COLUMN Id_carrito INT;


ALTER TABLE carrito_compras
DROP PRIMARY KEY;

ALTER TABLE carrito_compras
MODIFY COLUMN Id_carrito INT AUTO_INCREMENT;

ALTER TABLE carrito_compras
MODIFY COLUMN Id_carrito INT;

ALTER TABLE carrito_compras
DROP PRIMARY KEY;

ALTER TABLE carrito_compras
ADD INDEX idx_Id_carrito (Id_carrito);

ALTER TABLE pedidocarrito_producto
ADD CONSTRAINT fk_pedido_carrito
FOREIGN KEY (Id_carrito)
REFERENCES carrito_compras(Id_carrito);



CREATE TABLE Transaccion (
    ID_transaccion INT PRIMARY KEY AUTO_INCREMENT,
    ID_pedido INT,
    Monto_total FLOAT,
    Metodo_pago VARCHAR(50),
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_pedido) REFERENCES Pedido(N_pedido)
);


ALTER TABLE Pedido
DROP COLUMN Estado_pedido,
DROP COLUMN Numero_guia;


ALTER TABLE Producto
DROP FOREIGN KEY fk_producto_cliente;

ALTER TABLE Producto
DROP COLUMN ID_cliente2;

ALTER TABLE cliente CHANGE Direccion Correo VARCHAR(30);


ALTER TABLE devolucion_cambio
ADD Tipo_solicitud VARCHAR(30);

ALTER TABLE devolucion_cambio
ADD Correo_Cliente VARCHAR(40);

ALTER TABLE devolucion_cambio
ADD Estado_solicitud_bool BOOLEAN;

SET SQL_SAFE_UPDATES = 0;

UPDATE devolucion_cambio
SET Estado_solicitud_bool = CASE
    WHEN Estado_solicitud = 'Pendiente' THEN 0
    WHEN Estado_solicitud = 'Atendido' THEN 1
END;

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE devolucion_cambio
DROP COLUMN Estado_solicitud;


ALTER TABLE carrito_compras DROP FOREIGN KEY fk_carrito_cliente;

ALTER TABLE cliente DROP PRIMARY KEY;

ALTER TABLE cliente MODIFY id_cliente VARCHAR(100);

ALTER TABLE cliente ADD PRIMARY KEY (id_cliente);

ALTER TABLE carrito_compras ADD CONSTRAINT fk_carrito_cliente FOREIGN KEY (ID_cliente) REFERENCES cliente(Id_Cliente);

ALTER TABLE carrito_compras DROP COLUMN ID_cliente;


ALTER TABLE carrito_compras DROP FOREIGN KEY fk_carrito_cliente;


ALTER TABLE cliente MODIFY id_cliente VARCHAR(255);


	ALTER TABLE pedido
ADD departamento VARCHAR(40),
ADD ciudad VARCHAR(40);


ALTER TABLE Transaccion DROP FOREIGN KEY transaccion_ibfk_1;

ALTER TABLE pedido MODIFY COLUMN N_pedido INT AUTO_INCREMENT;

ALTER TABLE transaccion ADD CONSTRAINT transaccion_ibfk_1 FOREIGN KEY (ID_pedido) REFERENCES pedido(N_pedido);

ALTER TABLE transaccion ADD COLUMN estado VARCHAR(50);

ALTER TABLE administrador
DROP FOREIGN KEY fk_admin_inventario;

ALTER TABLE administrador
DROP COLUMN Id_inventario7;

ALTER TABLE inventario
ADD CONSTRAINT fk_inventario_admin
  FOREIGN KEY (Id_administrador1)
  REFERENCES administrador(Id_administrador);
  

ALTER TABLE administrador DROP COLUMN Id_inventario2;

DROP TABLE crearproductorequest;

ALTER TABLE Producto MODIFY imagen MEDIUMBLOB;


INSERT INTO administrador (Id_administrador, Nombre_usuario, contraseña)
VALUES ( 4, 'diegoSoto@gmail.com', 'admin123');

ALTER TABLE producto
ADD COLUMN tipo_zapato VARCHAR(50);

SELECT * FROM Producto WHERE genero = 'masculino' AND tipo_zapato = 'deportivos';

ALTER TABLE devolucion_cambio
ADD COLUMN nombreCliente VARCHAR(40),
ADD COLUMN numeroContactoCliente VARCHAR(30);

ALTER TABLE pedido
ADD Estado_solicitud_bool BOOLEAN;

SET SQL_SAFE_UPDATES = 0;

UPDATE pedido
SET Estado_solicitud_bool = CASE
    WHEN Estado_solicitud_bool IS NULL THEN 0
    ELSE Estado_solicitud_bool
END;

UPDATE pedido
SET Estado_solicitud_bool = CASE
    WHEN Estado_solicitud_bool = 0 THEN 0
    WHEN Estado_solicitud_bool = 1 THEN 1
END;

SET SQL_SAFE_UPDATES = 1;


SELECT 
    kcu.table_name AS foreign_table,
    kcu.column_name AS foreign_column,
    kcu.constraint_name,
    kcu.referenced_table_name AS primary_table,
    kcu.referenced_column_name AS primary_column
FROM 
    information_schema.key_column_usage kcu
WHERE 
    kcu.referenced_table_name = 'producto'
    AND kcu.table_schema = 'abc';


SELECT 
    kcu.table_name AS primary_table,
    kcu.column_name AS primary_column,
    kcu.constraint_name,
    kcu.referenced_table_name AS foreign_table,
    kcu.referenced_column_name AS foreign_column
FROM 
    information_schema.key_column_usage kcu
WHERE 
    kcu.table_name = 'producto'
    AND kcu.table_schema = 'abc';


ALTER TABLE carrito_compras 
DROP FOREIGN KEY fk_carrito_cliente;

ALTER TABLE carrito_compras
ADD CONSTRAINT fk_carrito_cliente
FOREIGN KEY (session_id) REFERENCES cliente(id_cliente)
ON DELETE CASCADE;



SELECT 
    kcu.table_name AS foreign_table,
    kcu.column_name AS foreign_column,
    kcu.constraint_name,
    kcu.referenced_table_name AS primary_table,
    kcu.referenced_column_name AS primary_column
FROM 
    information_schema.key_column_usage kcu
WHERE 
    kcu.referenced_table_name = 'carrito_compras'
    AND kcu.table_schema = 'abc';



ALTER TABLE destacados
DROP FOREIGN KEY destacados_ibfk_1;

ALTER TABLE destacados
ADD CONSTRAINT destacados_ibfk_1
FOREIGN KEY (producto_id) REFERENCES producto(Id_Producto)
ON DELETE CASCADE;

ALTER TABLE Promociones ADD COLUMN precio_con_descuento DECIMAL(10, 2);

ALTER TABLE productos MODIFY COLUMN nombre VARCHAR(50);

ALTER TABLE producto MODIFY COLUMN descripcion VARCHAR(270);


desc administrador;
select * from  cliente;
select * from inventario;
desc producto;
SHOW CREATE TABLE inventario;

select * from producto;
select * from carrito_compras;
desc pedido;

desc carrito_compras;
select * from devolucion_cambio;
desc producto;
desc carrito_producto;
desc producto;
desc  cliente;
desc carrito_compras;


desc carrito_producto;
desc devolucion_cambio;
DESC producto;
DESC CLIENTE;

DESC carrito_compras;
DESC administrador;
DESC pedido;
