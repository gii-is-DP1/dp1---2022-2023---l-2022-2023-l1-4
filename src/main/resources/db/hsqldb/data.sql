-- One admin user, named admin1 with passwor 4dm1n and authority admin
INSERT INTO users(username,password,enabled) VALUES ('admin1','4dm1n',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (1,'admin1','admin');

-- One owner user, named owner1 with passwor 0wn3r
INSERT INTO users(username,password,enabled) VALUES ('owner1','0wn3r',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (2,'owner1','owner');

-- Owner de carnucbol
INSERT INTO users(username,password,enabled) VALUES ('carnucbol','1234',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (4,'carnucbol','owner');

-- Owner de margargar81
INSERT INTO users(username,password,enabled) VALUES ('margargar81','1234',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (5,'margargar81','owner');

-- Owner de ferbarbar1
INSERT INTO users(username,password,enabled) VALUES ('ferbarbar1','1234',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (6,'ferbarbar1','player');

--Owner de Alvsanflo
INSERT INTO users(username,password,enabled) VALUES ('alvsanflo','3333',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (7,'alvsanflo','owner');

-- Owner de pabpinmat1
INSERT INTO users(username,password,enabled) VALUES ('pabpinmat','1234',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (8,'pabpinmat','owner');

-- Owner de gonsanmar2
INSERT INTO users(username,password,enabled) VALUES ('gonsanmar2','1234',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (9,'gonsanmar2','owner');

-- One vet user, named vet1 with passwor v3t
INSERT INTO users(username,password,enabled) VALUES ('vet1','v3t',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (10,'vet1','veterinarian');

-- Player de carnucbol
INSERT INTO users(username,password,enabled) VALUES ('carnucbol1','1234',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (11,'carnucbol1','player');

-- Player de pablopino
INSERT INTO users(username,password,enabled) VALUES ('pablop','1234',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (12,'pablop','player');



INSERT INTO vets(id, first_name,last_name) VALUES (1, 'James', 'Carter');
INSERT INTO vets(id, first_name,last_name) VALUES (2, 'Helen', 'Leary');
INSERT INTO vets(id, first_name,last_name) VALUES (3, 'Linda', 'Douglas');
INSERT INTO vets(id, first_name,last_name) VALUES (4, 'Rafael', 'Ortega');
INSERT INTO vets(id, first_name,last_name) VALUES (5, 'Henry', 'Stevens');
INSERT INTO vets(id, first_name,last_name) VALUES (6, 'Sharon', 'Jenkins');

INSERT INTO specialties VALUES (1, 'radiology');
INSERT INTO specialties VALUES (2, 'surgery');
INSERT INTO specialties VALUES (3, 'dentistry');

INSERT INTO vet_specialties VALUES (2, 1);
INSERT INTO vet_specialties VALUES (3, 2);
INSERT INTO vet_specialties VALUES (3, 3);
INSERT INTO vet_specialties VALUES (4, 2);
INSERT INTO vet_specialties VALUES (5, 1);

INSERT INTO types VALUES (1, 'cat');
INSERT INTO types VALUES (2, 'dog');
INSERT INTO types VALUES (3, 'lizard');
INSERT INTO types VALUES (4, 'snake');
INSERT INTO types VALUES (5, 'bird');
INSERT INTO types VALUES (6, 'hamster');
INSERT INTO types VALUES (7, 'turtle');

INSERT INTO owners VALUES (1, 'George', 'Franklin', '110 W. Liberty St.', 'Madison', '6085551023', 'owner1');
INSERT INTO owners VALUES (2, 'Betty', 'Davis', '638 Cardinal Ave.', 'Sun Prairie', '6085551749', 'owner1');
INSERT INTO owners VALUES (3, 'Eduardo', 'Rodriquez', '2693 Commerce St.', 'McFarland', '6085558763', 'owner1');
INSERT INTO owners VALUES (4, 'Harold', 'Davis', '563 Friendly St.', 'Windsor', '6085553198', 'owner1');
INSERT INTO owners VALUES (5, 'Peter', 'McTavish', '2387 S. Fair Way', 'Madison', '6085552765', 'owner1');
INSERT INTO owners VALUES (6, 'Jean', 'Coleman', '105 N. Lake St.', 'Monona', '6085552654', 'owner1');
INSERT INTO owners VALUES (7, 'Jeff', 'Black', '1450 Oak Blvd.', 'Monona', '6085555387', 'owner1');
INSERT INTO owners VALUES (8, 'Maria', 'Escobito', '345 Maple St.', 'Madison', '6085557683', 'owner1');
INSERT INTO owners VALUES (9, 'David', 'Schroeder', '2749 Blackhawk Trail', 'Madison', '6085559435', 'owner1');
INSERT INTO owners VALUES (10, 'Carlos', 'Estaban', '2335 Independence La.', 'Waunakee', '6085555487', 'owner1');

-- Me asigno como propietario carnucbol
INSERT INTO owners VALUES (11, 'Carlos', 'Nuchera', '1234 Guadalajara', 'Sevilla', '669081623', 'carnucbol');
-- Me asigno como propietario margargar81
INSERT INTO owners VALUES (12, 'MCarmen', 'Garcia', '1234 Reina', 'Sevilla', '669081624', 'margargar81');
-- Me asigno como propietario ferbarbar1
INSERT INTO owners VALUES (13, 'Fernando', 'Barroso', '17 Fuente de Cantos', 'Badajoz', '603665811', 'ferbarbar1');
-- Me asigno como propietario alvsanflo
INSERT INTO owners VALUES (14, 'Alvaro', 'Sanchez', '3333 Av Reina Mercedes', 'Sevilla', '687529931', 'alvsanflo');
-- Me asigno como propietario pabpinmat
INSERT INTO owners VALUES (15, 'Pablo', 'Pino', '3333 Av Reina Mercedes', 'Sevilla', '603869720', 'pabpinmat');
-- Me asigno como propietario gonsanmar2
INSERT INTO owners VALUES (16, 'Gonzalo', 'Santiago', '3333 Av Reina Mercedes', 'Sevilla', '657741253', 'gonsanmar2');
INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (1, 'Leo', '2010-09-07', 1, 1);
INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (2, 'Basil', '2012-08-06', 6, 2);
INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (3, 'Rosy', '2011-04-17', 2, 3);
INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (4, 'Jewel', '2010-03-07', 2, 3);
INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (5, 'Iggy', '2010-11-30', 3, 4);
INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (6, 'George', '2010-01-20', 4, 5);
INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (7, 'Samantha', '2012-09-04', 1, 6);
INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (8, 'Max', '2012-09-04', 1, 6);
INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (9, 'Lucky', '2011-08-06', 5, 7);
INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (10, 'Mulligan', '2007-02-24', 2, 8);
INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (11, 'Freddy', '2010-03-09', 5, 9);
INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (12, 'Lucky', '2010-06-24', 2, 10);
INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (13, 'Sly', '2012-06-08', 1, 10);
-- Me asigno una mascota como carnucbol
INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (14, 'Hochiming', '2022-09-29', 4, 11);
INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (15, 'Pluto', '2022-09-29', 3, 12);
-- Asignación de una mascota a ferbabar1
INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (16, 'Dobby', '2022-09-29', 2, 13);
--Mascota de Alvsanflo
INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (17, 'Tyson', '2018-08-23', 2, 14);
--Mascota de pabpinmat (es recien nacido)
INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (18, 'comomedelagana', '2006-09-04', 3, 15);
INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (19, 'chemita', '2006-08-18', 2, 16);



INSERT INTO visits(id,pet_id,visit_date,description) VALUES (1, 7, '2013-01-01', 'rabies shot');
INSERT INTO visits(id,pet_id,visit_date,description) VALUES (2, 8, '2013-01-02', 'rabies shot');
INSERT INTO visits(id,pet_id,visit_date,description) VALUES (3, 8, '2013-01-03', 'neutered');
INSERT INTO visits(id,pet_id,visit_date,description) VALUES (4, 7, '2013-01-04', 'spayed');

INSERT INTO fotos(id,name) VALUES (1,'Prohibido');
INSERT INTO fotos(id,name) VALUES (2,'Objetivo');
INSERT INTO fotos(id,name) VALUES (3,'Rayo');
INSERT INTO fotos(id,name) VALUES (4,'Payaso');
INSERT INTO fotos(id,name) VALUES (5,'Gafas de Sol');
INSERT INTO fotos(id,name) VALUES (6,'Araña');
INSERT INTO fotos(id,name) VALUES (7,'Ancla');
INSERT INTO fotos(id,name) VALUES (8,'Arbol');
INSERT INTO fotos(id,name) VALUES (9,'Telaraña');
INSERT INTO fotos(id,name) VALUES (10,'Gato');
INSERT INTO fotos(id,name) VALUES (11,'Bomba');
INSERT INTO fotos(id,name) VALUES (12,'Candado');
INSERT INTO fotos(id,name) VALUES (13,'Dobble');
INSERT INTO fotos(id,name) VALUES (14,'Manzana');
INSERT INTO fotos(id,name) VALUES (15,'Fantasma');
INSERT INTO fotos(id,name) VALUES (16,'Hombre');
INSERT INTO fotos(id,name) VALUES (17,'Coche');
INSERT INTO fotos(id,name) VALUES (18,'Luna');
INSERT INTO fotos(id,name) VALUES (19,'Ojo');
INSERT INTO fotos(id,name) VALUES (20,'Reloj');
INSERT INTO fotos(id,name) VALUES (21,'Tijeras');
INSERT INTO fotos(id,name) VALUES (22,'Dinosaurio');
INSERT INTO fotos(id,name) VALUES (23,'Mancha');
INSERT INTO fotos(id,name) VALUES (24,'Llave');
INSERT INTO fotos(id,name) VALUES (25,'Perro');
INSERT INTO fotos(id,name) VALUES (26,'Lapiz');
INSERT INTO fotos(id,name) VALUES (27,'Exclamacion');
INSERT INTO fotos(id,name) VALUES (28,'Caballo');
INSERT INTO fotos(id,name) VALUES (29,'Cactus');
INSERT INTO fotos(id,name) VALUES (30,'Delfin');
INSERT INTO fotos(id,name) VALUES (31,'Vela');
INSERT INTO fotos(id,name) VALUES (32,'Cebra');
INSERT INTO fotos(id,name) VALUES (33,'Gota');
INSERT INTO fotos(id,name) VALUES (34,'Hoja');
INSERT INTO fotos(id,name) VALUES (35,'Fuego');
INSERT INTO fotos(id,name) VALUES (36,'Tortuga');
INSERT INTO fotos(id,name) VALUES (37,'Calavera');
INSERT INTO fotos(id,name) VALUES (38,'Labios');
INSERT INTO fotos(id,name) VALUES (39,'Corazon');
INSERT INTO fotos(id,name) VALUES (40,'Interrogacion');
INSERT INTO fotos(id,name) VALUES (41,'Queso');
INSERT INTO fotos(id,name) VALUES (42,'Sol');
INSERT INTO fotos(id,name) VALUES (43,'Mariquita');
INSERT INTO fotos(id,name) VALUES (44,'Copo de nieve');
INSERT INTO fotos(id,name) VALUES (45,'Nota musical');
INSERT INTO fotos(id,name) VALUES (46,'Hielo');
INSERT INTO fotos(id,name) VALUES (47,'Iglu');
INSERT INTO fotos(id,name) VALUES (48,'Zanahoria');
INSERT INTO fotos(id,name) VALUES (49,'Bombilla');
INSERT INTO fotos(id,name) VALUES (50,'Pajaro');
INSERT INTO fotos(id,name) VALUES (51,'Trebol');
INSERT INTO fotos(id,name) VALUES (52,'Flor');
INSERT INTO fotos(id,name) VALUES (53,'Biberon');
INSERT INTO fotos(id,name) VALUES (54,'YinYang');
INSERT INTO fotos(id,name) VALUES (55,'Martillo');
INSERT INTO fotos(id,name) VALUES (56,'Dragon');
INSERT INTO fotos(id,name) VALUES (57,'Muñeco de nieve');

INSERT INTO cartas(id,url) VALUES (1, '/resources/images/cartas/carta01.png');
INSERT INTO cartas(id,url) VALUES (2, '/resources/images/cartas/carta02.png');
INSERT INTO cartas(id,url) VALUES (3, '/resources/images/cartas/carta03.png');
INSERT INTO cartas(id,url) VALUES (4, '/resources/images/cartas/carta04.png');
INSERT INTO cartas(id,url) VALUES (5, '/resources/images/cartas/carta05.png');
INSERT INTO cartas(id,url) VALUES (6, '/resources/images/cartas/carta06.png');
INSERT INTO cartas(id,url) VALUES (7, '/resources/images/cartas/carta07.png');
INSERT INTO cartas(id,url) VALUES (8, '/resources/images/cartas/carta08.png');
INSERT INTO cartas(id,url) VALUES (9, '/resources/images/cartas/carta09.png');
INSERT INTO cartas(id,url) VALUES (10, '/resources/images/cartas/carta10.png');
INSERT INTO cartas(id,url) VALUES (11, '/resources/images/cartas/carta11.png');
INSERT INTO cartas(id,url) VALUES (12, '/resources/images/cartas/carta12.png');
INSERT INTO cartas(id,url) VALUES (13, '/resources/images/cartas/carta13.png');
INSERT INTO cartas(id,url) VALUES (14, '/resources/images/cartas/carta14.png');
INSERT INTO cartas(id,url) VALUES (15, '/resources/images/cartas/carta15.png');
INSERT INTO cartas(id,url) VALUES (16, '/resources/images/cartas/carta16.png');
INSERT INTO cartas(id,url) VALUES (17, '/resources/images/cartas/carta17.png');
INSERT INTO cartas(id,url) VALUES (18, '/resources/images/cartas/carta18.png');
INSERT INTO cartas(id,url) VALUES (19, '/resources/images/cartas/carta19.png');
INSERT INTO cartas(id,url) VALUES (20, '/resources/images/cartas/carta20.png');
INSERT INTO cartas(id,url) VALUES (21, '/resources/images/cartas/carta21.png');
INSERT INTO cartas(id,url) VALUES (22, '/resources/images/cartas/carta22.png');
INSERT INTO cartas(id,url) VALUES (23, '/resources/images/cartas/carta23.png');
INSERT INTO cartas(id,url) VALUES (24, '/resources/images/cartas/carta24.png');
INSERT INTO cartas(id,url) VALUES (25, '/resources/images/cartas/carta25.png');
INSERT INTO cartas(id,url) VALUES (26, '/resources/images/cartas/carta26.png');
INSERT INTO cartas(id,url) VALUES (27, '/resources/images/cartas/carta27.png');
INSERT INTO cartas(id,url) VALUES (28, '/resources/images/cartas/carta28.png');
INSERT INTO cartas(id,url) VALUES (29, '/resources/images/cartas/carta29.png');
INSERT INTO cartas(id,url) VALUES (30, '/resources/images/cartas/carta30.png');
INSERT INTO cartas(id,url) VALUES (31, '/resources/images/cartas/carta31.png');
INSERT INTO cartas(id,url) VALUES (32, '/resources/images/cartas/carta32.png');
INSERT INTO cartas(id,url) VALUES (33, '/resources/images/cartas/carta33.png');
INSERT INTO cartas(id,url) VALUES (34, '/resources/images/cartas/carta34.png');
INSERT INTO cartas(id,url) VALUES (35, '/resources/images/cartas/carta35.png');
INSERT INTO cartas(id,url) VALUES (36, '/resources/images/cartas/carta36.png');
INSERT INTO cartas(id,url) VALUES (37, '/resources/images/cartas/carta37.png');
INSERT INTO cartas(id,url) VALUES (38, '/resources/images/cartas/carta38.png');
INSERT INTO cartas(id,url) VALUES (39, '/resources/images/cartas/carta39.png');
INSERT INTO cartas(id,url) VALUES (40, '/resources/images/cartas/carta40.png');
INSERT INTO cartas(id,url) VALUES (41, '/resources/images/cartas/carta41.png');
INSERT INTO cartas(id,url) VALUES (42, '/resources/images/cartas/carta42.png');
INSERT INTO cartas(id,url) VALUES (43, '/resources/images/cartas/carta43.png');
INSERT INTO cartas(id,url) VALUES (44, '/resources/images/cartas/carta44.png');
INSERT INTO cartas(id,url) VALUES (45, '/resources/images/cartas/carta45.png');
INSERT INTO cartas(id,url) VALUES (46, '/resources/images/cartas/carta46.png');
INSERT INTO cartas(id,url) VALUES (47, '/resources/images/cartas/carta47.png');
INSERT INTO cartas(id,url) VALUES (48, '/resources/images/cartas/carta48.png');
INSERT INTO cartas(id,url) VALUES (49, '/resources/images/cartas/carta49.png');
INSERT INTO cartas(id,url) VALUES (50, '/resources/images/cartas/carta50.png');
INSERT INTO cartas(id,url) VALUES (51, '/resources/images/cartas/carta51.png');
INSERT INTO cartas(id,url) VALUES (52, '/resources/images/cartas/carta52.png');
INSERT INTO cartas(id,url) VALUES (53, '/resources/images/cartas/carta53.png');
INSERT INTO cartas(id,url) VALUES (54, '/resources/images/cartas/carta54.png');
INSERT INTO cartas(id,url) VALUES (55, '/resources/images/cartas/carta55.png');

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (1,19);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (1,15);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (1,17);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (1,8);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (1,1);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (1,20);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (1,18);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (1,16);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (2,26);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (2,1);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (2,24);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (2,25);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (2,23);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (2,9);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (2,22);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (2,21);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (3,27);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (3,29);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (3,28);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (3,1);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (3,32);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (3,31);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (3,10);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (3,30);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (4,37);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (4,33);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (4,38);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (4,11);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (4,1);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (4,36);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (4,35);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (4,34);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (5,40);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (5,39);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (5,1);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (5,42);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (5,12);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (5,43);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (5,41);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (5,44);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (6,13);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (6,50);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (6,1);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (6,45);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (6,49);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (6,47);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (6,46);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (6,48);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (7,1);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (7,14);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (7,53);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (7,54);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (7,55);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (7,56);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (7,52);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (7,51);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (8,27);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (8,26);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (8,36);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (8,2);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (8,8);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (8,47);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (8,51);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (8,41);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (9,2);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (9,15);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (9,32);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (9,9);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (9,42);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (9,47);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (9,37);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (9,52);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (10,38);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (10,53);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (10,43);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (10,2);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (10,48);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (10,21);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (10,16);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (10,10);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (11,17);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (11,28);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (11,2);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (11,49);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (11,44);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (11,22);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (11,11);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (11,54);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (12,2);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (12,50);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (12,29);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (12,33);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (12,12);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (12,55);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (12,18);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (12,23);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (13,2);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (13,13);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (13,39);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (13,24);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (13,56);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (13,34);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (13,19);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (13,30);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (14,40);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (14,2);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (14,25);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (14,14);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (14,45);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (14,31);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (14,20);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (14,35);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (15,8);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (15,32);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (15,45);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (15,3);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (15,43);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (15,34);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (15,54);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (15,23);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (16,40);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (16,9);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (16,38);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (16,49);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (16,51);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (16,3);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (16,18);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (16,30);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (17,15);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (17,24);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (17,55);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (17,44);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (17,47);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (17,3);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (17,35);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (17,10);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (18,50);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (18,31);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (18,11);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (18,3);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (18,21);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (18,41);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (18,52);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (18,19);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (19,25);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (19,12);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (19,28);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (19,47);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (19,56);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (19,36);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (19,3);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (19,16);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (20,27);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (20,33);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (20,42);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (20,20);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (20,13);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (20,53);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (20,22);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (20,3);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (21,39);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (21,17);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (21,29);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (21,3);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (21,26);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (21,14);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (21,48);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (21,37);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (22,4);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (22,8);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (22,38);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (22,39);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (22,31);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (22,22);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (22,47);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (22,55);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (23,19);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (23,4);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (23,29);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (23,45);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (23,44);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (23,9);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (23,53);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (23,36);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (24,4);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (24,17);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (24,50);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (24,25);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (24,51);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (24,42);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (24,34);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (24,10);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (25,23);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (25,40);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (25,27);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (25,4);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (25,11);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (25,15);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (25,56);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (25,48);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (26,4);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (26,12);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (26,20);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (26,54);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (26,37);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (26,47);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (26,30);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (26,21);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (27,26);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (27,4);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (27,13);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (27,28);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (27,43);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (27,35);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (27,18);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (27,52);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (28,4);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (28,33);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (28,24);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (28,49);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (28,32);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (28,14);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (28,16);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (28,41);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (29,52);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (29,30);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (29,5);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (29,25);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (29,8);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (29,33);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (29,44);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (29,48);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (30,16);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (30,27);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (30,5);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (30,54);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (30,50);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (30,39);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (30,9);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (30,35);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (31,5);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (31,41);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (31,22);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (31,56);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (31,18);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (31,10);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (31,45);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (31,37);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (32,5);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (32,20);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (32,47);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (32,51);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (32,24);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (32,29);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (32,43);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (32,11);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (33,34);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (33,12);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (33,5);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (33,15);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (33,49);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (33,31);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (33,53);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (33,26);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (34,13);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (34,21);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (34,27);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (34,17);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (34,5);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (34,32);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (34,36);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (34,55);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (35,5);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (35,46);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (35,38);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (35,42);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (35,28);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (35,14);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (35,23);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (35,19);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (36,28);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (36,40);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (36,37);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (36,53);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (36,50);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (36,6);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (36,8);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (36,24);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (37,6);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (37,31);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (37,17);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (37,46);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (37,9);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (37,56);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (37,33);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (37,43);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (38,6);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (38,52);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (38,20);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (38,10);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (38,49);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (38,39);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (38,36);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (38,23);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (39,16);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (39,6);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (39,11);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (39,55);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (39,42);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (39,26);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (39,45);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (39,30);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (40,6);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (40,12);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (40,35);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (40,48);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (40,51);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (40,32);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (40,19);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (40,22);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (41,6);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (41,25);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (41,13);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (41,15);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (41,38);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (41,54);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (41,41);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (41,29);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (42,6);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (42,18);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (42,27);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (42,34);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (42,44);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (42,47);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (42,14);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (42,21);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (43,21);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (43,8);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (43,29);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (43,42);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (43,7);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (43,56);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (43,49);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (43,35);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (44,7);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (44,41);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (44,48);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (44,28);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (44,20);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (44,34);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (44,55);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (44,9);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (45,7);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (45,10);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (45,33);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (45,26);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (45,40);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (45,47);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (45,19);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (45,54);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (46,7);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (46,10);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (46,25);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (46,32);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (46,11);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (46,18);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (46,39);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (46,53);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (47,7);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (47,17);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (47,38);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (47,24);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (47,12);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (47,45);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (47,52);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (47,27);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (48,7);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (48,37);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (48,44);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (48,51);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (48,31);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (48,23);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (48,13);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (48,16);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (49,36);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (49,7);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (49,50);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (49,14);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (49,15);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (49,22);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (49,30);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (49,43);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (50,6);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (50,4);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (50,5);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (50,2);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (50,1);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (50,3);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (50,57);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (50,7);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (51,57);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (51,38);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (51,20);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (51,50);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (51,56);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (51,26);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (51,44);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (51,32);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (52,57);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (52,9);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (52,10);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (52,8);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (52,12);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (52,11);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (52,14);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (52,13);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (53,57);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (53,18);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (53,24);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (53,54);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (53,48);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (53,36);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (53,31);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (53,42);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (54,57);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (54,28);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (54,39);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (54,15);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (54,51);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (54,45);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (54,33);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (54,21);

INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (55,57);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (55,41);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (55,30);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (55,23);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (55,47);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (55,35);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (55,53);
INSERT INTO cartas_fotos(carta_id, foto_id) VALUES (55,17);

INSERT INTO tipos_minijuegos(id,name) VALUES (1, 'La torre infernal');
INSERT INTO tipos_minijuegos(id,name) VALUES (2, 'El foso');
INSERT INTO tipos_minijuegos(id,name) VALUES (3, 'La patata caliente');
INSERT INTO tipos_minijuegos(id,name) VALUES (4, 'El duelo');

--Me asigno los datos del jugador:
INSERT INTO players VALUES (1, 'Carlos', 'Nuchera', 'carlosnuchera98@gmail.com', '669081623', 'carnucbol1');
INSERT INTO players VALUES (2, 'Pablo', 'Pino', 'pablop@gmail.com', '696969696', 'pablop');
INSERT INTO players VALUES (3, 'Fernando', 'Barroso', 'fbarroso2001@gmail.com', '696869696', 'ferbarbar1');

INSERT INTO Logro(id, name, nivel) VALUES
(1, 'Bienvenida', 0),
(2, 'ere un maquina', 100);


INSERT INTO games(id,accessible,name,num_players) VALUES(1,TRUE,'caca',2);
INSERT INTO games(id,accessible,name,num_players) VALUES(2,FALSE,'prueba',5);

INSERT INTO games_players_list(game_id, players_list_id) VALUES(1,3)