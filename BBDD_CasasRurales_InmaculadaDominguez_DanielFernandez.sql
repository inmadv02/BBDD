SET SCHEMA 'casa';

/*cliente (id_cliente, nombre, apellidos, dni, telefono, id_reserva, email)
casa (id_casa, nombre, localizacion, precio, superficie, tipo_actividad)
empleado (id_empleado, nombre, apellidos, dni, telefono, email)
actividades (id_actividad, nombre, duracion, coste, descuento,id_casa)
operacion (id_operacion, id_cliente, fecha_operacion, precio)
reserva (id_reserva, id_cliente, id_casa, fecha_entrada, fecha_salida, numPersonas)
localizacion (id_localizacion, nombre)
actividades_contratadas(id,id_actividad,id_casa)*/

CREATE TABLE cliente (

	id_cliente 			SERIAL, 
	nombre				varchar(100) 	 NOT NULL,
	apellidos			varchar(200) 	 NOT NULL,
	dni					varchar(10)	 NOT NULL,
	telefono			varchar(10)	 NOT NULL,
	email				varchar(250)     NOT NULL,
	
	CONSTRAINT pk_cliente PRIMARY KEY (id_cliente),
	CONSTRAINT ck_cliente_email_formato CHECK (email LIKE '%@%')
);


CREATE TABLE propietario (

	id_propietario 			SERIAL,
	nombre					varchar(100)    NOT NULL,
	apellidos				varchar(200)    NOT NULL,
	dni						varchar(10)  	NOT NULL,
	telefono				varchar(10) 	NOT NULL,
	email					varchar(250)	NOT NULL,
	
	CONSTRAINT pk_propietario PRIMARY KEY (id_propietario),
	CONSTRAINT ck_propietario_email_formato CHECK (email LIKE '%@%')
);

CREATE TABLE reserva (

	id_reserva 				SERIAL, 
	id_casa					integer,
	id_cliente				integer,
	fecha_operacion 		date    NOT NULL,
	fecha_entrada			date	NOT NULL, 
	fecha_salida			date	NOT NULL,
	numPersona				integer,
	
	CONSTRAINT pk_reserva PRIMARY KEY (id_reserva),
	CONSTRAINT ck_numPersonas_positivo CHECK (numPersona > 0)
);

CREATE TABLE casa (

	id_casa 				SERIAL,
	nombre 					text 	      NOT NULL,
	localizacion 			text,
	superficie 				numeric(10,2) NOT NULL, 
	propietario				integer,
	
	CONSTRAINT pk_id_casa PRIMARY KEY (id_casa),
	CONSTRAINT ck_superficie_positiva CHECK (superficie > 0)
);

CREATE TABLE actividades (
	
	id_actividad 			SERIAL,
	nombre 					text 	     NOT NULL,
	duracion 				timestamp, 
	coste_persona 			numeric(6,2) NOT NULL,
	descuento 				numeric,
	
	CONSTRAINT pk_id_actividad PRIMARY KEY (id_actividad),
	CONSTRAINT ck_coste_positivo CHECK (coste_persona > 0),
	CONSTRAINT ck_descuento_positivo CHECK (descuento > 0 AND descuento <= 1)
);

CREATE TABLE actividad_reservada(

	id_reserva 			integer,
	id_actividad 		integer,
	
	CONSTRAINT pk_actividad_reservada PRIMARY KEY (id_reserva,id_actividad)
);

CREATE TABLE precio_temporada (

	id_temporada 			integer,
	id_casa 				integer,
	precio					numeric(6,2) NOT NULL,
	
	CONSTRAINT pk_precio_por_temporada PRIMARY KEY (id_temporada,id_casa),
	CONSTRAINT ck_precio_positivo CHECK (precio > 0)
);

CREATE TABLE temporada (

    id_temporada        	SERIAL,
    nombre            		varchar(30)	NOT NULL,
    fecha_inicio        	date 		NOT NULL,
    fecha_fin           	date 		NOT NULL,
	
    CONSTRAINT pk_temporada PRIMARY KEY (id_temporada)
);

ALTER TABLE precio_temporada 
ADD CONSTRAINT fk_id_temporada FOREIGN KEY (id_temporada) REFERENCES temporada ON DELETE SET NULL;
ALTER TABLE precio_temporada
ADD CONSTRAINT fk_precio_temporada_casa FOREIGN KEY (id_casa) REFERENCES casa ON DELETE SET NULL;
ALTER TABLE actividad_reservada
ADD CONSTRAINT fk_act_reservada_reserva FOREIGN KEY (id_reserva) REFERENCES reserva ON DELETE CASCADE;
ALTER TABLE actividad_reservada
ADD CONSTRAINT fk_act_reservada_actividad FOREIGN KEY (id_actividad) REFERENCES actividades ON DELETE SET NULL;
ALTER TABLE reserva
ADD CONSTRAINT fk_reserva_cliente FOREIGN KEY (id_cliente) REFERENCES cliente ON DELETE NO ACTION;
ALTER TABLE reserva
ADD CONSTRAINT fk_reserva_casa FOREIGN KEY (id_casa) REFERENCES casa ON DELETE NO ACTION;
ALTER TABLE casa
ADD CONSTRAINT fk_casa_propietario FOREIGN KEY (propietario) REFERENCES propietario (id_propietario) ON DELETE RESTRICT;


--Clientes
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (1, 'Lizzie', 'Buckle', '28652451-G', '6599745323', 'lbuckle0@unesco.org');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (2, 'Franky', 'Crimmins', '04474656-Q', '4551754282', 'fcrimmins1@wikia.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (3, 'Rock', 'Cordery', '71346983-Z', '3282646740', 'rcordery2@booking.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (4, 'Nappie', 'Wallhead', '44758512-X', '7766540620', 'nwallhead3@uol.com.br');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (5, 'Tobit', 'Creaney', '18106549-K', '5234449647', 'tcreaney4@mapquest.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (6, 'Derrek', 'Millar', '25612484-S', '5183834924', 'dmillar5@huffingtonpost.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (7, 'Muhammad', 'Izacenko', '51789431-K', '5703573245', 'mizacenko6@howstuffworks.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (8, 'Elwood', 'Pedden', '92862271-Q', '9175024729', 'epedden7@soundcloud.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (9, 'Ambrosius', 'Colquhoun', '70975330-M', '5373556838', 'acolquhoun8@comsenz.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (10, 'Chad', 'Van Daalen', '39997350-L', '2818459538', 'cvandaalen9@theglobeandmail.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (11, 'Wilt', 'Thunnercliff', '26515159-A', '2087699647', 'wthunnercliffa@forbes.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (12, 'Arel', 'Bleue', '73814623-O', '1064505029', 'ableueb@flickr.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (13, 'Melvyn', 'Mosedale', '80160249-D', '9681943112', 'mmosedalec@studiopress.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (14, 'Gilberta', 'Dedrick', '82993998-X', '3466665635', 'gdedrickd@addthis.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (15, 'Garrek', 'Reisen', '43464015-D', '2685399769', 'greisene@dot.gov');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (16, 'Hollyanne', 'Caizley', '98154791-V', '4509087671', 'hcaizleyf@goo.ne.jp');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (17, 'Tessy', 'Gandar', '89499152-B', '8729430850', 'tgandarg@vinaora.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (18, 'Augustine', 'Liverock', '94330131-Y', '2626144606', 'aliverockh@skype.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (19, 'Kikelia', 'Bohman', '45963960-P', '7212413095', 'kbohmani@miibeian.gov.cn');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (20, 'Clarinda', 'Higgonet', '44695781-N', '9426240515', 'chiggonetj@state.gov');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (21, 'Tanitansy', 'Dollimore', '70712985-H', '5381564526', 'tdollimorek@usa.gov');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (22, 'Normand', 'Thrustle', '80181410-R', '1593301268', 'nthrustlel@un.org');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (23, 'Kristos', 'Stelli', '16041459-T', '1364140582', 'kstellim@hexun.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (24, 'Page', 'Geraudel', '28191468-G', '8897269384', 'pgeraudeln@wp.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (25, 'Sylvia', 'Aymeric', '56761904-T', '1437524280', 'saymerico@ftc.gov');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (26, 'Nikolas', 'Corsor', '80026150-F', '6707164638', 'ncorsorp@nymag.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (27, 'Ignaz', 'Feldhuhn', '96404868-C', '5024140489', 'ifeldhuhnq@com.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (28, 'Cori', 'Pinck', '07348918-K', '1511287987', 'cpinckr@imageshack.us');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (29, 'Dino', 'Bloodworth', '64321900-Y', '1992010505', 'dbloodworths@japanpost.jp');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (30, 'Charyl', 'McKeand', '30236701-F', '3445186085', 'cmckeandt@fc2.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (31, 'Jeanne', 'Tabram', '08782130-P', '9496366997', 'jtabramu@bing.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (32, 'Janie', 'Lovick', '15848303-T', '4906014536', 'jlovickv@cornell.edu');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (33, 'Donaugh', 'Shrigley', '10046351-A', '6021948128', 'dshrigleyw@dell.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (34, 'Arte', 'Curteis', '19993331-W', '1048310895', 'acurteisx@google.ca');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (35, 'Olivette', 'Newlove', '09286169-W', '2046044716', 'onewlovey@paginegialle.it');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (36, 'Murry', 'Dodell', '38921092-O', '9408299959', 'mdodellz@omniture.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (37, 'Billy', 'Meigh', '07452750-K', '1298220773', 'bmeigh10@seattletimes.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (38, 'Audrye', 'Leivesley', '12392084-V', '5745126633', 'aleivesley11@google.com.br');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (39, 'Ola', 'O''Bradane', '93390917-N', '2953456835', 'oobradane12@ustream.tv');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (40, 'Tabitha', 'Courtois', '72125638-Q', '2229627565', 'tcourtois13@timesonline.co.uk');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (41, 'Uri', 'Baldwin', '78656024-R', '3216794065', 'ubaldwin14@feedburner.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (42, 'Ambur', 'Henrichsen', '28961967-I', '3447409011', 'ahenrichsen15@freewebs.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (43, 'Ingaborg', 'Cerie', '60517666-B', '7856171801', 'icerie16@comcast.net');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (44, 'Chalmers', 'Towers', '26660542-Z', '7199093262', 'ctowers17@odnoklassniki.ru');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (45, 'Aurie', 'Llewelyn', '67069101-G', '6722895125', 'allewelyn18@w3.org');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (46, 'Glenn', 'Longridge', '69000802-E', '1278188190', 'glongridge19@auda.org.au');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (47, 'Oralle', 'Tomasino', '51030656-B', '5941419428', 'otomasino1a@nyu.edu');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (48, 'Marja', 'Erdely', '50958692-J', '6699949306', 'merdely1b@princeton.edu');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (49, 'Lisabeth', 'Colquite', '07184236-M', '3846732532', 'lcolquite1c@wikispaces.com');
insert into cliente (id_cliente, nombre, apellidos, dni, telefono, email) values (50, 'Dita', 'Trewartha', '94100512-A', '2278844844', 'dtrewartha1d@archive.org');

--Temporadas
INSERT INTO temporada VALUES (1,'Temporada alta 1',TO_DATE('01/11','DD/MM'),TO_DATE('31/03','DD/MM'));
INSERT INTO temporada VALUES (2,'Temporada alta 2',TO_DATE('22/06','DD/MM'),TO_DATE('31/08','DD/MM'));
INSERT INTO temporada VALUES (3,'Temporada baja 1',TO_DATE('01/04','DD/MM'),TO_DATE('21/06','DD/MM'));
INSERT INTO temporada VALUES (4,'Temporada baja 2',TO_DATE('01/09','DD/MM'),TO_DATE('30/10','DD/MM'));


--Precio_temporada

INSERT INTO precio_temporada