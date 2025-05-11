/* Relación tipo 1:1 */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    edad INT
);

INSERT INTO usuarios (nombre, apellido, email, edad) VALUES
('Juan', 'Gomez', 'juan.gomez@example.com', 28), --Con uno sobra
-- PASO 2
-- Tu código aquí
CREATE TABLE roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL
);
INSERT INTO roles (nombre_rol) VALUES
('Bronce'),
('Plata'),
('Oro'),
('Platino');


-- PASO 3
-- Tu código aquí
ALTER TABLE usuarios ADD COLUMN id_rol INT;

UPDATE usuarios SET id_rol = 1 WHERE id_usuario IN (1,5,9,13,17);
UPDATE usuarios SET id_rol = 2 WHERE id_usuario IN (2, 6, 10, 14, 18);
UPDATE usuarios SET id_rol = 3 WHERE id_usuario IN (3, 7, 11, 15, 19);
UPDATE usuarios SET id_rol = 4 WHERE id_usuario IN (4, 8, 12, 16, 20);

ALTER TABLE usuarios
ADD CONTRASINT fk_usuarios_roles
FOREIGN KEY (id_rol) REFERENCES roles(id_rol);
-- PASO 4
-- Tu código aquí
SELECT u.id_usuario, u.nombre, u,apellido, u.email, u.edad, r.nombre_rol
FROM usuarios u
JOIN roles r ON u.id_rol = r.id_rol;


/* Relación tipo 1:N */
-- PASO 1
-- Tu código aquí
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL
);

INSERT INTO categorias (nombre_categoria) VALUES
('Electrónicos'),

-- PASO 2
-- Tu código aquí
ALTER TABLE usuarios ADD COLUMN id_categoria INT;

-- PASO 3
-- Tu código aquí
UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (1, 5, 9, 13, 17);

-- PASO 4
-- Tu código aquí
SELECT u.id_usuario, u.nombre, u.apellido, u.email, u.edad, r.nombre_rol, c.nombre_categoria
FROM usuarios u
JOIN roles r ON u.id_rol = r.id_rol
JOIN categorias c ON u.id_categoria = c.id_categoria;
/* Relación tipo N:M */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios_categorias (
    id_usuario_categoria INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_categoria INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- PASO 2
-- Tu código aquí
INSERT INTO usuarios_categorias (id_usuario, id_categoria) VALUES
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 6), (3, 7),
(4, 8), (4, 9), (4, 10);

-- PASO 3
-- Tu código aquí
SELECT u.id_usuario, u.nombre, u.apellido, u.email, u.edad, r.nombre_rol, c.nombre_categoria
FROM usuarios u
JOIN roles r ON u.id_rol = r.id_rol
JOIN usuarios_categorias uc ON u.id_usuario = uc.id_usuario
JOIN categorias c ON uc.id_categoria = c.id_categoria;