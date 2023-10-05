DROP DATABASE IF EXISTS veterinaria;
CREATE DATABASE veterinaria;
USE veterinaria;

CREATE TABLE clientes
(
    idcliente INT PRIMARY KEY AUTO_INCREMENT,    
    apellidos VARCHAR(50) NOT NULL,
    nombres 	VARCHAR(50) NOT NULL,
    dni 	CHAR(8) NOT NULL,
    claveacceso VARCHAR(100) NOT NULL
)
ENGINE = INNODB;

INSERT INTO clientes (apellidos, nombres, dni, claveacceso) VALUES
	('marcos','juan',  '98121211', '12345'),
	('quispe','jesus',  '12345678', '12345');

CREATE TABLE animales
(
	idanimal	INT AUTO_INCREMENT PRIMARY KEY,
	nombreanimal		VARCHAR(50) NOT NULL
)
ENGINE = INNODB;

INSERT INTO animales (nombreanimal) VALUES
		    ('Perro');
	
CREATE TABLE razas 
(
	idraza	INT AUTO_INCREMENT PRIMARY KEY,
	idanimal INT NOT NULL,
	nombreraza	VARCHAR(50),
	CONSTRAINT fk_ida_ra FOREIGN KEY (idanimal) REFERENCES animales (idanimal)
)
ENGINE = INNODB;

INSERT INTO razas (idanimal ,nombreraza) VALUES
		    (1, 'pitbul'),
		    (1, 'pequeñes');

CREATE TABLE mascotas
(
	idmascota INT AUTO_INCREMENT PRIMARY KEY,
	idcliente INT NOT NULL,
	idraza 	  INT NOT NULL,
	nombre	VARCHAR(50) NOT NULL,
	fotografia	VARCHAR(200) NULL,
	color	VARCHAR(30) NOT NULL,
	genero	VARCHAR(30) NOT NULL,
	CONSTRAINT fk_idcliente_ma FOREIGN KEY (idcliente) REFERENCES clientes(idcliente),
	CONSTRAINT fk_idraza_ma FOREIGN KEY (idraza) REFERENCES razas (idraza)

)
ENGINE = INNODB;

INSERT INTO mascotas(idcliente, idraza, nombre, fotografia, color, genero) VALUES 
	(1, 1, 'perro', 'png', 'negro', 'macho');
                    
								
-- PROCEDURE LOGIN

DELIMITER $$ 
CREATE PROCEDURE spu_login
( 
IN _dni CHAR(8)
)
BEGIN 
	SELECT *
	FROM clientes
	WHERE dni = _dni;

END $$ 


-- PROCEDURE REGISTRAR CLIENTE

DELIMITER $$
CREATE PROCEDURE spu_clientes_registrar(
     IN _apellidos VARCHAR(50),
     IN _nombres VARCHAR(50),
     IN _dni CHAR(8),
     IN _claveacceso VARCHAR(100)
) BEGIN
INSERT INTO clientes (nombres, apellidos, dni, claveacceso) VALUES
	(_nombres, _apellidos, _dni, _claveacceso);
END $$


-- PROCEDURE REGISTRAR MASCOTA

DELIMITER $$
CREATE PROCEDURE spu_mascota_registrar(
     IN _idcliente INT, 
     IN _idraza INT, 
     IN _nombre VARCHAR(50), 
     IN _fotografia VARCHAR(200),
     IN _color VARCHAR(30), 
     IN _genero VARCHAR(30)
) BEGIN
INSERT INTO mascotas (idcliente, idraza, nombre, fotografia, color, genero) VALUES
	(_idcliente, _idraza, _nombre, _fotografia, _color, _genero);
END $$



-- PROCEDURE BUSCAR CLIENTE

DELIMITER $$
CREATE PROCEDURE spu_buscar_cliente(IN _dni CHAR(8))
BEGIN 

	SELECT 
          clientes.nombres,
          clientes.apellidos,
	  razas.nombreraza, 
          mascotas.nombre, 
          mascotas.color, 
          mascotas.genero

     FROM clientes 
	INNER JOIN mascotas ON mascotas.idcliente = clientes.idcliente
     INNER JOIN razas  ON razas.idraza = mascotas.idraza
     WHERE clientes.dni = _dni;

END $$


-- PROCEDURE LISTAR MASCOTA

DELIMITER $$
CREATE PROCEDURE spu_listar_mascota()
BEGIN 

	SELECT 
          CONCAT(clientes.nombres , ' ' , clientes.apellidos) AS cliente ,
	     razas.nombreraza, 
          mascotas.nombre,
          mascotas.color, 
          mascotas.genero
	FROM clientes 
	INNER JOIN mascotas  ON mascotas.idcliente = clientes.idcliente
    INNER JOIN razas  ON razas.idraza = mascotas.idraza;

END $$

CALL spu_listar_mascota()
-- PROCEDURE LISTAR RAZAS

DELIMITER $$
CREATE PROCEDURE spu_listar_raza()
BEGIN 

	SELECT 
          idraza, 
          nombreraza

	FROM razas; 

END $$

CALL spu_listar_raza();





