SET SCHEMA 'vuelosv2';

SELECT ae.ciudad, salida, ae2.ciudad, llegada
FROM vuelos v
         JOIN aeropuerto ae ON (v.desde = ae.id_aeropuerto)
		 JOIN aeropuerto ae2 ON (v.hasta = ae2.id_aeropuerto)
		 JOIN avion a USING (id_avion)
WHERE ae.ciudad = 'Sevilla'
   AND to_char(v.salida, 'TMmonth/yyyy') = 'junio/2020'
   AND a.nombre LIKE 'Airbus%';
   
SELECT INITCAP(nombre), INITCAP(apellido1)
FROM reserva JOIN vuelo v USING (id_vuelo)
     JOIN cliente USING (id_cliente)
WHERE to_char(v.salida, 'TMmonth/yyyy') = 'septiembre/2020'
  AND date_trunc('hour', fecha_reserva + INTERVAL '1 month') = date_trunc('hour', salida) 
  AND nombre LIKE '% %';
  
SELECT count(*)
FROM vuelos v
         JOIN aeropuerto ae ON (v.desde = ae.id_aeropuerto)
		 JOIN aeropuerto ae2 ON (v.hasta = ae2.id_aeropuerto)
		 JOIN reserva USING (id_vuelo)
WHERE ae.nombre = 'Barajas'
  AND ae2.nombre = 'Berlin-Tegel'
  AND descuento IS NOT null
  
SELECT DISTINCT C.NOMBRE, APELLIDO1, APELLIDO2
FROM RESERVA JOIN CLIENTE C USING (ID_CLIENTE)
     JOIN VUELO USING (ID_VUELO)
	 JOIN AEROPUERTO A ON (HASTA = ID_AEROPUERTO)
WHERE TO_CHAR(FECHA_RESERVA, 'TMday') IN ('viernes', 'sábado', 'domingo')
AND LLEGADA <= LOCALTIMESTAMP
AND A.CIUDAD = 'Barcelona';


SELECT c.nombre, apellido1, apellido2, 
      COALESCE(precio - precio * (1 - (DESCUENTO/100.0)), PRECIO) AS "Cantidad que se han ahorrado"
FROM vuelo v JOIN reserva r USING (id_vuelo)
     JOIN cliente c USING (id_cliente)
	 JOIN aeropuerto a ON (desde = id_aeropuerto)
WHERE a.nombre = 'Pablo Picasso'
AND to_char(salida, 'TMDay/TMmonth') = 'Jueves/octubre';
AND EXTRACT (hour FROM salida) > 12;