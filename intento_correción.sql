SET SCHEMA 'gourmet';

--1. tiene que ser correlacionada leñes

SELECT e.nombre, e.apellido1, e.apellido2, p.nombre,
      SUM(sumval)
FROM empleado e JOIN venta v USING (id_empleado)
     JOIN lineaventa lv ON (id_venta = v.id)
	 JOIN producto p2 ON (id_producto = p.id)
GROUP BY e.id_empleado, e.nombre, apellido1, apellido2, p.nombre
HAVING SUM(cantidad) >= ALL ( SELECT SUM(cantidad) as sumval
							 FROM empleado e2 JOIN venta v2 USING (id_empleado)
							  JOIN lineaventa lv2 ON (id_venta = v2.id)
							  JOIN producto p2 ON (id_producto = p2.id)
							 WHERE e.id_empleado= e2.id_empleado
							 GROUP BY e2.nombre, e2.apellido1, e2.apellido2, p2.nombre
							 )
ORDER BY nombre, apellido1, apellido2


--2. 

SELECT *
FROM empleado
WHERE LOCALTIMESTAMP - fecha_alta < INTERVAL '5 year'
  AND id_empleado NOT IN ( 	  
	  SELECT DISTINCT id_empleado
	  FROM empleado JOIN venta USING (id_empleado)
	       JOIN cliente ON (venta.id_cliente = cliente.id)
	  WHERE fecha_nacimiento + interval '70 year' < current_date
  );
  
--3. 

WITH gasto_cliente AS (

	SELECT c.fecha_nacimiento, c.id, SUM(precio_total) as sumval
	FROM venta v JOIN cliente c (v.id_cliente = c.id)
	     JOIN lineaventa lv ON (v.id = lv.id_venta)
	GROUP BY c.fecha_nacimiento, c.id

)

SELECT date_part('year', age(current_date, fecha_nacimiento)), 
       round(AVG(sumval),2)

WITH jefeS_segundo AS (
	
	SELECT *
	FROM empleado 
	WHERE jefe_id IN (SELECT empleado FROM empleado WHERE jefe_id IS NULL)
	AND id_empleado IN (SELECT jefe_id FROM empleado)
	
), total_ventas AS(
	
	SELECT SUM(precio unitario...) AS TOTAL
	FROM venta JOIN lineaventa ON (lineaventa.id_venta = venta.id)
	
), ventas_por_empleado AS (
	
	
)