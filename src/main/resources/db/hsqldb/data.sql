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
INSERT INTO authorities(id,username,authority) VALUES (6,'ferbarbar1','owner');

--Owner de Alvsanflo
INSERT INTO users(username,password,enabled) VALUES ('alvsanflo','3333',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (7,'alvsanflo','owner');

-- One vet user, named vet1 with passwor v3t
INSERT INTO users(username,password,enabled) VALUES ('vet1','v3t',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (3,'vet1','veterinarian');

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
INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (16, 'Dobby', '2022-09-29', 2, 13);
--Mascota de Alvsanflo
INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (17, 'Tyson', '2018-08-23', 2, 14);

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

INSERT INTO cartas(id,url) VALUES (1, '/resources/static/images/cartas/cartas/carta01.png');
INSERT INTO cartas(id,url) VALUES (2, '/resources/static/images/cartas/carta02.png');
INSERT INTO cartas(id,url) VALUES (3, '/resources/static/images/cartas/carta03.png');
INSERT INTO cartas(id,url) VALUES (4, '/resources/static/images/cartas/carta04.png');
INSERT INTO cartas(id,url) VALUES (5, '/resources/static/images/cartas/carta05.png');
INSERT INTO cartas(id,url) VALUES (6, '/resources/static/images/cartas/carta06.png');
INSERT INTO cartas(id,url) VALUES (7, '/resources/static/images/cartas/carta07.png');
INSERT INTO cartas(id,url) VALUES (8, '/resources/static/images/cartas/carta08.png');
INSERT INTO cartas(id,url) VALUES (9, '/resources/static/images/cartas/carta09.png');
INSERT INTO cartas(id,url) VALUES (10, '/resources/static/images/cartas/carta10.png');
INSERT INTO cartas(id,url) VALUES (11, '/resources/static/images/cartas/carta11.png');
INSERT INTO cartas(id,url) VALUES (12, '/resources/static/images/cartas/carta12.png');
INSERT INTO cartas(id,url) VALUES (13, '/resources/static/images/cartas/carta13.png');
INSERT INTO cartas(id,url) VALUES (14, '/resources/static/images/cartas/carta14.png');
INSERT INTO cartas(id,url) VALUES (15, '/resources/static/images/cartas/carta15.png');
INSERT INTO cartas(id,url) VALUES (16, '/resources/static/images/cartas/carta16.png');
INSERT INTO cartas(id,url) VALUES (17, '/resources/static/images/cartas/carta17.png');
INSERT INTO cartas(id,url) VALUES (18, '/resources/static/images/cartas/carta18.png');
INSERT INTO cartas(id,url) VALUES (19, '/resources/static/images/cartas/carta19.png');
INSERT INTO cartas(id,url) VALUES (20, '/resources/static/images/cartas/carta20.png');
INSERT INTO cartas(id,url) VALUES (21, '/resources/static/images/cartas/carta21.png');
INSERT INTO cartas(id,url) VALUES (22, '/resources/static/images/cartas/carta22.png');
INSERT INTO cartas(id,url) VALUES (23, '/resources/static/images/cartas/carta23.png');
INSERT INTO cartas(id,url) VALUES (24, '/resources/static/images/cartas/carta24.png');
INSERT INTO cartas(id,url) VALUES (25, '/resources/static/images/cartas/carta25.png');
INSERT INTO cartas(id,url) VALUES (26, '/resources/static/images/cartas/carta26.png');
INSERT INTO cartas(id,url) VALUES (27, '/resources/static/images/cartas/carta27.png');
INSERT INTO cartas(id,url) VALUES (28, '/resources/static/images/cartas/carta28.png');
INSERT INTO cartas(id,url) VALUES (29, '/resources/static/images/cartas/carta29.png');
INSERT INTO cartas(id,url) VALUES (30, '/resources/static/images/cartas/carta30.png');
INSERT INTO cartas(id,url) VALUES (31, '/resources/static/images/cartas/carta31.png');
INSERT INTO cartas(id,url) VALUES (32, '/resources/static/images/cartas/carta32.png');
INSERT INTO cartas(id,url) VALUES (33, '/resources/static/images/cartas/carta33.png');
INSERT INTO cartas(id,url) VALUES (34, '/resources/static/images/cartas/carta34.png');
INSERT INTO cartas(id,url) VALUES (35, '/resources/static/images/cartas/carta35.png');
INSERT INTO cartas(id,url) VALUES (36, '/resources/static/images/cartas/carta36.png');
INSERT INTO cartas(id,url) VALUES (37, '/resources/static/images/cartas/carta37.png');
INSERT INTO cartas(id,url) VALUES (38, '/resources/static/images/cartas/carta38.png');
INSERT INTO cartas(id,url) VALUES (39, '/resources/static/images/cartas/carta39.png');
INSERT INTO cartas(id,url) VALUES (40, '/resources/static/images/cartas/carta40.png');
INSERT INTO cartas(id,url) VALUES (41, '/resources/static/images/cartas/carta41.png');
INSERT INTO cartas(id,url) VALUES (42, '/resources/static/images/cartas/carta42.png');
INSERT INTO cartas(id,url) VALUES (43, '/resources/static/images/cartas/carta43.png');
INSERT INTO cartas(id,url) VALUES (44, '/resources/static/images/cartas/carta44.png');
INSERT INTO cartas(id,url) VALUES (45, '/resources/static/images/cartas/carta45.png');
INSERT INTO cartas(id,url) VALUES (46, '/resources/static/images/cartas/carta46.png');
INSERT INTO cartas(id,url) VALUES (47, '/resources/static/images/cartas/carta47.png');
INSERT INTO cartas(id,url) VALUES (48, '/resources/static/images/cartas/carta48.png');
INSERT INTO cartas(id,url) VALUES (49, '/resources/static/images/cartas/carta49.png');
INSERT INTO cartas(id,url) VALUES (50, '/resources/static/images/cartas/carta50.png');
INSERT INTO cartas(id,url) VALUES (51, '/resources/static/images/cartas/carta51.png');
INSERT INTO cartas(id,url) VALUES (52, '/resources/static/images/cartas/carta52.png');
INSERT INTO cartas(id,url) VALUES (53, '/resources/static/images/cartas/carta53.png');
INSERT INTO cartas(id,url) VALUES (54, '/resources/static/images/cartas/carta54.png');
INSERT INTO cartas(id,url) VALUES (55, '/resources/static/images/cartas/carta55.png');

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (1,1,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (1,1,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (1,1,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (1,1,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (1,1,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (1,1,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (1,1,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (1,1,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (2,2,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (2,2,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (2,2,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (2,2,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (2,2,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (2,2,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (2,2,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (2,2,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (3,3,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (3,3,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (3,3,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (3,3,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (3,3,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (3,3,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (3,3,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (3,3,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (4,4,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (4,4,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (4,4,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (4,4,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (4,4,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (4,4,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (4,4,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (4,4,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (5,5,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (5,5,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (5,5,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (5,5,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (5,5,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (5,5,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (5,5,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (5,5,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (6,6,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (6,6,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (6,6,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (6,6,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (6,6,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (6,6,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (6,6,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (6,6,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (7,7,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (7,7,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (7,7,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (7,7,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (7,7,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (7,7,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (7,7,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (7,7,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (8,8,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (8,8,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (8,8,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (8,8,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (8,8,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (8,8,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (8,8,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (8,8,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (9,9,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (8,8,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (8,8,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (8,8,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (8,8,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (8,8,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (8,8,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (8,8,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (9,9,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (9,9,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (9,9,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (9,9,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (9,9,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (9,9,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (9,9,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (9,9,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (10,10,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (10,10,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (10,10,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (10,10,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (10,10,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (10,10,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (10,10,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (10,10,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (11,11,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (11,11,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (11,11,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (11,11,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (11,11,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (11,11,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (11,11,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (11,11,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (12,12,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (12,12,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (12,12,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (12,12,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (12,12,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (12,12,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (12,12,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (12,12,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (13,13,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (13,13,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (13,13,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (13,13,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (13,13,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (13,13,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (13,13,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (13,13,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (14,14,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (14,14,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (14,14,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (14,14,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (14,14,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (14,14,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (14,14,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (14,14,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (15,15,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (15,15,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (15,15,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (15,15,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (15,15,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (15,15,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (15,15,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (15,15,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (16,16,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (16,16,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (16,16,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (16,16,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (16,16,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (16,16,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (16,16,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (16,16,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (17,17,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (17,17,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (17,17,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (17,17,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (17,17,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (17,17,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (17,17,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (17,17,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (18,18,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (18,18,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (18,18,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (18,18,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (18,18,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (18,18,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (18,18,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (18,18,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (19,19,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (19,19,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (19,19,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (19,19,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (19,19,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (19,19,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (19,19,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (19,19,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (20,20,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (20,20,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (20,20,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (20,20,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (20,20,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (20,20,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (20,20,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (20,20,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (21,21,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (21,21,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (21,21,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (21,21,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (21,21,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (21,21,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (21,21,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (21,21,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (22,22,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (22,22,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (22,22,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (22,22,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (22,22,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (22,22,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (22,22,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (22,22,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (23,23,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (23,23,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (23,23,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (23,23,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (23,23,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (23,23,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (23,23,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (23,23,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (24,24,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (24,24,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (24,24,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (24,24,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (24,24,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (24,24,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (24,24,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (24,24,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (25,25,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (25,25,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (25,25,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (25,25,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (25,25,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (25,25,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (25,25,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (25,25,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (26,26,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (26,26,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (26,26,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (26,26,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (26,26,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (26,26,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (26,26,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (26,26,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (27,27,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (27,27,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (27,27,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (27,27,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (27,27,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (27,27,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (27,27,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (27,27,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (28,28,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (28,28,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (28,28,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (28,28,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (28,28,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (28,28,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (28,28,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (28,28,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (29,29,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (29,29,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (29,29,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (29,29,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (29,29,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (29,29,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (29,29,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (29,29,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (30,30,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (30,30,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (30,30,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (30,30,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (30,30,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (30,30,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (30,30,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (30,30,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (31,31,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (31,31,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (31,31,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (31,31,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (31,31,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (31,31,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (31,31,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (31,31,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (32,32,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (32,32,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (32,32,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (32,32,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (32,32,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (32,32,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (32,32,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (32,32,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (33,33,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (33,33,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (33,33,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (33,33,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (33,33,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (33,33,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (33,33,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (33,33,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (34,34,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (34,34,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (34,34,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (34,34,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (34,34,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (34,34,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (34,34,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (34,34,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (35,35,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (35,35,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (35,35,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (35,35,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (35,35,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (35,35,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (35,35,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (35,35,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (36,36,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (36,36,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (36,36,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (36,36,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (36,36,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (36,36,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (36,36,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (36,36,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (37,37,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (37,37,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (37,37,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (37,37,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (37,37,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (37,37,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (37,37,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (37,37,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (38,38,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (38,38,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (38,38,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (38,38,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (38,38,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (38,38,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (38,38,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (38,38,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (39,39,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (39,39,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (39,39,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (39,39,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (39,39,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (39,39,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (39,39,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (39,39,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (40,40,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (40,40,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (40,40,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (40,40,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (40,40,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (40,40,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (40,40,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (40,40,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (41,41,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (41,41,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (41,41,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (41,41,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (41,41,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (41,41,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (41,41,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (41,41,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (42,42,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (42,42,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (42,42,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (42,42,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (42,42,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (42,42,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (42,42,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (42,42,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (43,43,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (43,43,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (43,43,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (43,43,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (43,43,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (43,43,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (43,43,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (43,43,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (44,44,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (44,44,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (44,44,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (44,44,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (44,44,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (44,44,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (44,44,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (44,44,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (45,45,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (45,45,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (45,45,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (45,45,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (45,45,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (45,45,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (45,45,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (45,45,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (46,46,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (46,46,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (46,46,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (46,46,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (46,46,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (46,46,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (46,46,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (46,46,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (47,47,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (47,47,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (47,47,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (47,47,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (47,47,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (47,47,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (47,47,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (47,47,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (48,48,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (48,48,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (48,48,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (48,48,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (48,48,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (48,48,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (48,48,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (48,48,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (49,49,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (49,49,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (49,49,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (49,49,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (49,49,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (49,49,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (49,49,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (49,49,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (50,50,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (50,50,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (50,50,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (50,50,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (50,50,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (50,50,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (50,50,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (50,50,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (51,51,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (51,51,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (51,51,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (51,51,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (51,51,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (51,51,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (51,51,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (51,51,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (52,52,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (52,52,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (52,52,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (52,52,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (52,52,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (52,52,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (52,52,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (52,52,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (53,53,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (53,53,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (53,53,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (53,53,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (53,53,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (53,53,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (53,53,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (53,53,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (54,54,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (54,54,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (54,54,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (54,54,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (54,54,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (54,54,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (54,54,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (54,54,);

INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (55,55,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (55,55,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (55,55,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (55,55,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (55,55,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (55,55,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (55,55,);
INSERT INTO cartas_fotos(id, carta_id, foto_id) VALUES (55,55,);
