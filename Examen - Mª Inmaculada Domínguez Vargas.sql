SET SCHEMA 'vuelosv2';

--1.

SELECT v.desde, v.hasta, v.salida, v.llegada
FROM aeropuerto ar JOIN vuelo v ON (ar.id_aeropuerto = v.desde)
     JOIN aeropuerto ar2 ON (ar2.id_aeropuerto = v.hasta)
     JOIN avion a USING (id_avion)
WHERE a.nombre = 'Airbus'
  AND (EXTRACT (month FROM v.salida) = 6
       AND EXTRACT (year FROM v.salida) = '2020')
  AND ar.ciudad = 'Sevilla';
  
--2.

SELECT upper(c.nombre) AS "Nombre", upper(c.apellido1) AS "Apellido1", 
       upper(c.apellido2) AS "Apellido2"
FROM cliente c JOIN reserva r USING (id_cliente)
     JOIN vuelo v USING (id_vuelo)
WHERE to_char(fecha_reserva, 'TMMonth/YYYY') = 'Septiembre/2020'
  AND v.salida > fecha_reserva + INTERVAL '1 month'
  AND c.nombre LIKE '% %';
  
--3

SELECT id_cliente
FROM cliente c JOIN reserva r USING (id_cliente)
     JOIN vuelo v USING (id_vuelo)
	 JOIN aeropuerto ar ON (ar.id_aeropuerto = v.desde)
	 JOIN aeropuerto ar2 ON (ar2.id_aeropuerto = v.hasta)
WHERE v.descuento IS NOT null
  AND v.desde = 2
  AND v.hasta = 8;
  
--4

SELECT c.nombre, c.apellido1, c.apellido2
FROM cliente c JOIN reserva r USING (id_cliente)
     JOIN vuelo v USING (id_vuelo)
	 JOIN aeropuerto ar ON (ar.id_aeropuerto = v.desde)
	 JOIN aeropuerto ar2 ON (ar2.id_aeropuerto = v.hasta)
WHERE (to_char(fecha_reserva, 'TMDD') = 'Viernes'
      OR to_char(fecha_reserva, 'TMDD') = 'Sábado'
	  OR to_char(fecha_reserva, 'TMDD') = 'Domingo')
AND fecha_reserva::date < CURRENT_TIME::time
AND ae.ciudad = 'Barcelona'; 

--5

SELECT c.nombre, c.apellido1, c.apellido2, 
      round(precio - ((precio*coalesce(descuento,0)/100)),2) AS "Precio Final" 
FROM cliente c JOIN reserva r USING (id_cliente)
     JOIN vuelo v USING (id_vuelo)
	 JOIN aeropuerto ar ON (ar.id_aeropuerto = v.desde)
	 JOIN aeropuerto ar2 ON (ar2.id_aeropuerto = v.hasta)
WHERE ar.nombre = 'Pablo Picasso' 
  AND to_char(v.salida, 'TMDD/TMMonth') = 'Jueves/Octubre'
  AND EXTRACT (hour FROM v.salida) >= 12
  AND descuento IS NOT NULL;


SELECT *
FROM vuelo;

SELECT *
FROM aeropuerto;

SELECT *
FROM avion;

SELECT *
FROM reserva;

SELECT *
FROM cliente;


