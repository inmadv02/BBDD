SET	SCHEMA 'vuelosv2';

--Selecciona el número de pasajeros de los vuelos, agrupando aeropuerto de salida y mes

SELECT aeropuerto.nombre, to_char (salida, 'MM'), count(id_reserva)
FROM reserva JOIN vuelo USING (id_vuelo)
	 JOIN aeropuerto ON (desde = id_aeropuerto)
GROUP BY aeropuerto.nombre, to_char (salida, 'MM'),
        EXTRACT (month FROM salida)
ORDER BY aeropuerto.nombre, EXTRACT (month FROM salida);

SELECT *
FROM avion;

SELECT *
FROM reserva;

SELECT *
FROM vuelo;

SELECT *
FROM aeropuerto;