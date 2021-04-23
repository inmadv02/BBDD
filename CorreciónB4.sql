SET SCHEMA 'vuelosv2';

--1. 

SELECT nombre, round(AVG(ocupacion),2)
FROM
	(
		SELECT a.nombre, id_vuelo, COUNT(id_reserva), max_pasajeros
			   (COUNT(id_reserva)/max_pasajeros::numeric) AS 
		FROM vuelo v JOIN reserva USING (id_vuelo)
		     JOIN aeropuerto a ON (desde = id_aeropuerto)
		     JOIN avion USING (id_avion)
		GROUP BY a.nombre, id_vuelo, max_pasajeros




	)
	
SELECT nombre, id_vuelo, count(id_reserva), 
			(select max_pasajeros from avion where v.id_avion = id_avion), 
			round(count(id_reserva) / (select max_pasajeros from avion where v.id_avion = id_avion)::numeric*100,2) as "ocupacion"
FROM vuelo v JOIN reserva USING (id_vuelo)
	 join aeropuerto ON (desde = id_aeropuerto)
GROUP BY nombre, id_vuelo;

