SET SCHEMA 'vuelosv2';

--1.

SELECT ciudad, nombre, COUNT (*)
FROM vuelo JOIN reserva USING (id_vuelo)
     JOIN aeropuerto ON (hasta = id_aeropuerto)
WHERE to_char(llegada, 'MM') IN ('01', '02', '03')
GROUP BY ciudad, nombre
ORDER BY COUNT (*) ASC
LIMIT 3;

--2. 

WITH precio_medio AS (
	
	SELECT AVG(precio_final) AS avg_precio
	FROM operacion JOIN inmueble USING (id_inmueble)
	 	 JOIN tipo ON (tipo_inmueble = id_tipo)
	WHERE provincia = 'Almería'
  	AND tipo_operacio = 'Venta'
    AND tipo.nombre = 'Casa'

)

SELECT comprador, *
FROM comprador JOIN operacion USING (id_cliente)
     JOIN inmueble USING (id_inmueble)
	 JOIN tipo ON (tipo_inmueble = id_tipo)
WHERE provincia = 'Almería'
  AND tipo_operacio = 'Venta'
  AND tipo.nombre = 'Casa'
  AND precio_final > (SELECT avg_precio FROM precio_medio);
  
--4. 

SELECT DISTINCT ae1.ciudad, ae1.nombre, ae2.ciudad, ae2.nombre,
		llegada - salida
FROM vuelo JOIN aeropuerto ae1 
			ON (desde = ae1.id_aeropuerto)
		JOIN aeropuerto ae2
			ON (hasta = ae2.id_aeropuerto)
ORDER BY (llegada - salida)
LIMIT 10;


--5.

SELECT ROUND(SUM(COALESCE(precio - precio * (descuento/100.0), precio)),2)
FROM vuelo JOIN reserva USING (id_vuelo)
WHERE TO_CHAR(salida, 'ID') IN ('5', '6', '7')
  AND EXTRACT(month FROM salida) IN (7,8);

