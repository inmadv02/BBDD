--numero_hoteles <--- entrada
--num_hab_por_hotel <--- entrada

--para i desde 1 hasta numero_hoteles
	--ciudad <-- escoger ciudad aleatoria
	--nombre <-- escoger nombre aleatorio
	--INSERT INTO hotel values()
--fin para;

do $$

CREATE OR REPLACE PROCEDURE insert_data(num_hoteles int, num_habitaciones int)
AS $$
DECLARE
	ciudades TEXT[]:= '{"Barcelona/Cataluña", "Madrid/Madrid", "Baeza/Jaén", "Cartagena/Murcia"}';
	num int;
	num2 int;
	num3 int;
	nombres_hoteles TEXT[]:= '{"Barceló", "NH", "Alfonso XIII"}';
	nombres_suites TEXT[]:= '{"Suite Chanel", "Suite Greta Garco", "Suite Liam Neeson", "Suite 100-Rolling Stone", "Suite Sofia Loren"}';
	nombre_hotel text;
	nombre_hab text;
	ciudad_provincia TEXT;
	ciudad text;
	provincia text;
	
BEGIN 

--HOTEL
	FOR n IN 1..num_hoteles
	LOOP
		num:= (SELECT floor(random() * 4 + 1)::int);
		ciudad_provincia = ciudades(num);
		ciudad := (SELECT split_part(ciudad_provincia, '/', 1));
		provincia := (SELECT split_part(ciudad_provincia, '/', 2));
		num2:= (SELECT floor(random() * 3 + 1)::int);
	    nombre_hotel = nombres_hoteles(num2);
		
		INSERT INTO hotel (nombre, ciudad, provincia)
			VALUES (nombre_hotel, ciudad, provincia);
	END LOOP;
	
--HABITACIONES
	num_hab:=(SELECT floor(random() * 50 + 1)::int);
	
	IF habitacion.tipo LIKE 'Suite%' THEN
		num3:= (SELECT floor(random() * 5 + 1)::int);
	    nombre_hab = nombres_suites(num3);
		INSERT INTO habitacion (num_habitacion, nombre)
		VALUES ($2, nombre_hab);
	END IF;
	
	INSERT INTO habitacion (num_habitacion) 
		VALUES (num_hab);
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE PROCEDURE insert_data(num_hoteles int, num_habitaciones int)
AS $$
DECLARE
	ciudades TEXT[]:= '{"Barcelona/Cataluña", "Madrid/Madrid", "Baeza/Jaén", "Cartagena/Murcia"}';
	hoteles TEXT[]:= '{"Barceló", "NH", "Alfonso XIII"}';
	suites TEXT[]:= '{"Suite Chanel", "Suite Greta Garco", "Suite Liam Neeson", "Suite 100-Rolling Stone", "Suite Sofia Loren"}';
	aleatorio int;
	lugar_aleatorio text;
	ciudad text;
	provincia text;
BEGIN

	FOR i IN 1...num_hoteles LOOP
		aleatorio := (SELECT FLOOR(random()*ARRAY_LENGTH(ciudades,1) + 1)::int);
		lugar_aleatorio := ciudades[aleatorio];
		ciudad := (SELECT split_part(lugar_aleatorio, '/', 1));
		provincia := (SELECT split_part(lugar_aleatorio, '/', 2));