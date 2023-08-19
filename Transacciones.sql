-- 1ºTransaccion

START TRANSACTION;

DELETE FROM eventos.respuesta_encuesta
WHERE ID_Invitado IN ('1', '2');

-- ROLLBACK;
COMMIT;

-- Funcion: La transaccion eliminara dos registros de puntuacion de la encuesta.

-- 2ºTransaccion

START TRANSACTION;

INSERT INTO eventos.invitado (Nombre, Apellido, DNI, Edad) VALUES ('Arancha', 'ornejo', '80390220', '26');
INSERT INTO entradas(ID_Evento, ID_Invitado, Nombre_Invitado, Apellido_Invitado, DNI_Invitado, Edad, Tipo_Entrada, Contraseña_Codigo, Precio_Entrada) VALUES ('1', '7', 'Arancha', 'ornejo', '80390220', '26', 'Invitacion en lista', NULL, NULL);
INSERT INTO eventos.invitado (Nombre, Apellido, DNI, Edad) VALUES ('Luis', 'Veiga', '84864363', '10');
INSERT INTO entradas(ID_Evento, ID_Invitado, Nombre_Invitado, Apellido_Invitado, DNI_Invitado, Edad, Tipo_Entrada, Contraseña_Codigo, Precio_Entrada) VALUES ('1', '8', 'Luis', 'Veiga', '84864363', '10', 'Invitacion en lista', NULL, NULL);
INSERT INTO eventos.invitado (Nombre, Apellido, DNI, Edad) VALUES ('Petra', 'Acosta', '71376704', '26');
INSERT INTO entradas(ID_Evento, ID_Invitado, Nombre_Invitado, Apellido_Invitado, DNI_Invitado, Edad, Tipo_Entrada, Contraseña_Codigo, Precio_Entrada) VALUES ('1', '9', 'Petra', 'Acosta', '71376704', '26', 'Invitacion en lista', NULL, NULL);
INSERT INTO eventos.invitado (Nombre, Apellido, DNI, Edad) VALUES ('Ikram', 'Acosta', '77142932', '14');
INSERT INTO entradas(ID_Evento, ID_Invitado, Nombre_Invitado, Apellido_Invitado, DNI_Invitado, Edad, Tipo_Entrada, Contraseña_Codigo, Precio_Entrada) VALUES ('1', '10', 'Ikram', 'Acosta', '77142932', '14', 'Invitacion en lista', NULL, NULL);

SAVEPOINT insercion_1;

INSERT INTO eventos.invitado (Nombre, Apellido, DNI, Edad) VALUES ('Rufino', 'Heredia', '38475155', '29');
INSERT INTO entradas(ID_Evento, ID_Invitado, Nombre_Invitado, Apellido_Invitado, DNI_Invitado, Edad, Tipo_Entrada, Contraseña_Codigo, Precio_Entrada) VALUES ('1', '11', 'Rufino', 'Heredia', '38475155', '29', 'Invitacion en lista', NULL, NULL);
INSERT INTO eventos.invitado (Nombre, Apellido, DNI, Edad) VALUES ('Aitana', 'Salas', '80019561', '45');
INSERT INTO entradas(ID_Evento, ID_Invitado, Nombre_Invitado, Apellido_Invitado, DNI_Invitado, Edad, Tipo_Entrada, Contraseña_Codigo, Precio_Entrada) VALUES ('1', '12', 'Aitana', 'Salas', '80019561', '45', 'Invitacion en lista', NULL, NULL);
INSERT INTO eventos.invitado (Nombre, Apellido, DNI, Edad) VALUES ('Noel', 'Heras', '34528826', '15');
INSERT INTO entradas(ID_Evento, ID_Invitado, Nombre_Invitado, Apellido_Invitado, DNI_Invitado, Edad, Tipo_Entrada, Contraseña_Codigo, Precio_Entrada) VALUES ('1', '13', 'Noel', 'Heras', '34528826', '15', 'Invitacion en lista', NULL, NULL);
INSERT INTO eventos.invitado (Nombre, Apellido, DNI, Edad) VALUES ('Marcial', 'Espin', '26863774', '41');
INSERT INTO entradas(ID_Evento, ID_Invitado, Nombre_Invitado, Apellido_Invitado, DNI_Invitado, Edad, Tipo_Entrada, Contraseña_Codigo, Precio_Entrada) VALUES ('1', '14', 'Marcial', 'Espin', '26863774', '41', 'Invitacion en lista', NULL, NULL);

SAVEPOINT insercion_2;

RELEASE SAVEPOINT insercion_1;

COMMIT;

/* Funcion: La transaccion realiza un insercion de datos en las tablas de eventos y entradas guarda dos savepoint
pero luego elimina el primero antes de confirmar la insercion.
*/