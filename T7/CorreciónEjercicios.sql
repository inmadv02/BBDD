SET SCHEMA 'vuelosv2';

--EC02

--1.

CREATE OR REPLACE FUNCTION vuelosv2.num_reservas(integer)
--SE PUEDE PONER DE OTRA FORMA PONIENDO EN SET SCHEMA EL ESQUEMA DONDE VA A IR LA FUNCIÓN
RETURNS INT
AS $$

	SELECT COUNT(*)::INT
	FROM VUELO JOIN RESERVA USING (ID_VUELO)
	WHERE ID_VUELO = $1;
$$ LANGUAGE SQL;


--3.

CREATE OR REPLACE FUNCTION vuelosv2.info_vuelos(date, text)
RETURNS TABLE(aeropuerto_salida text, ciudad_salida text, fecha_salida timestamp, 
			  aeropuerto_llegada text, ciudad_llegada text, fecha_llegada timestamp, 
			  max_pasajeros integer, numero_reservas integer)
AS $$
	SELECT ae1.nombre, ae1.ciudad, salida, ae2.nombre, ae2.ciudad, llegada,
		   max_pasajeros, (SELECT (num_reservas(id_vuelo))) --O num_reservas(id_vuelo) a secas
	FROM VUELO JOIN AEROPUERTO ae1 ON (ae1.id_aeropuerto = desde)
			JOIN AEROPUERTO ae2 ON (ae2.id_aeropuerto = hasta)
			JOIN AVION USING (id_avion)
	WHERE (ae1.ciudad = $2 OR ae1.nombre = $2 OR ae2.ciudad = $2 OR ae2.nombre = $2)
	AND (salida::date = $1 OR llegada::date = $1);
	
$$ LANGUAGE SQL;

--ECO

SELECT nombre generate_series(nombre, num_etiquetas)
FROM cliente JOIN generate_series(1, (select max(num_etiquetas) FROM cliente)) as s(a)
		ON(s.a <= cliente.num_etiquetas)
ORDER BY nombre;

SELECT 32, s.a, 32*s.a FROM generate_series(1,10) as s(a)


do $$
DECLARE
	mensaje text := 'Hola Mundo';
BEGIN
	RAISE NOTICE 'Mensaje %', mensaje;
END;
$$ LANGUAGE plpgsql;


DECLARE
 ciudades TEXT[]:= '{"Ubeda/Jaén, Olvera/Cádiz", "Sevilla"}';
 numero int;
 ciudad_provincia TEXT;
 ciudad text;
 provincia text;
BEGIN 
	numero:= (SELECT floor(random() * 3 + 1)::int);
	ciudad_provincia = ciudades(numero);
	ciudad := (SELECT split_part(ciudad_provincia, '/', 1));
	provincia := (SELECT split_part(ciudad_provincia, '/', 1))
END;
$$ LANGUAGE plpgsql;