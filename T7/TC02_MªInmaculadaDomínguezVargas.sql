SET SCHEMA 'vuelosv2';

--1. 

CREATE OR REPLACE FUNCTION GASTO_POR_CLIENTE_FECHA (fecha1 date, fecha2 date)
RETURNS TABLE (id int, nombre varchar, apellido1 varchar, apellido2 varchar, suma bigint) AS
$$

	SELECT id_cliente, cliente.nombre, cliente.apellido1, cliente.apellido2, SUM(precio)
	FROM cliente JOIN reserva USING (id_cliente)
		 JOIN vuelo USING (id_vuelo)
	WHERE salida BETWEEN fecha1 AND fecha2
	AND llegada BETWEEN fecha1 AND fecha2
	GROUP BY id_cliente, cliente.nombre, cliente.apellido1, cliente.apellido2;
$$
	LANGUAGE sql;
	
SELECT * FROM GASTO_POR_CLIENTE_FECHA ('2020-04-26', '2020-12-9');


--2. 

CREATE OR REPLACE FUNCTION MEDIA_DIARIA_VUELOS_SALIDA_AEROPUERTO (nombre varchar)
RETURNS TABLE (dia varchar, media_diaria int) AS
$$

	SELECT dia, ROUND(AVG(num_vuelos),2)
	FROM (
			SELECT nombre, to_char(vuelo.salida, 'TMDay') as dia, to_char(vuelo.salida, 'ID') as dia2, COUNT(*) as num_vuelos
			FROM vuelo JOIN aeropuerto ON (desde = id_aeropuerto)
			WHERE nombre = aeropuerto.nombre
			GROUP BY nombre, to_char(vuelo.salida, 'TMDay'), to_char(vuelo.salida, 'ID')
	 	 ) datos
	GROUP BY dia, dia2
	ORDER BY dia2;
$$
	LANGUAGE sql;
	

SELECT * FROM MEDIA_DIARIA_VUELOS_SALIDA_AEROPUERTO ('San Pablo')

SELECT *
FROM cliente;

SELECT *
FROM aeropuerto;

SELECT *
FROM vuelo;