SET SCHEMA 'gourmet';

--1. 

WITH jefe_con_5 AS (
	
	SELECT COUNT(id_empleado) as num_empleado, jefe_id
	FROM empleado
	WHERE jefe_id IN(SELECT jefe_id FROM empleado)
	AND id_empleado IN (SELECT id_empleado FROM empleado)
	GROUP BY jefe_id
	
), jefe_definitivo AS (

	SELECT *
	FROM empleado
	WHERE jefe_id IN(SELECT jefe_id FROM empleado)
	AND id_empleado IN (SELECT id_empleado FROM empleado)
	AND jefe_id IN (SELECT jefe_id FROM empleado JOIN jefe_con_5 USING (jefe_id) WHERE num_empleado = 5)

), suma_importe_empleados AS (
	
	SELECT SUM((COALESCE(precio_unitario * (1 - descuento/100),precio_unitario))) as sumval, id_empleado, p.nombre
	FROM lineaventa lv JOIN venta ON (lv.id_venta = venta.id) 
		 JOIN producto p ON (p.id = venta.id)
	GROUP BY id_empleado, p.nombre
	HAVING id_empleado IN (SELECT jefe_id FROM jefe_definitivo)

), suma_importe_general AS (
	
	SELECT SUM((COALESCE(precio_unitario * (1 - descuento/100),precio_unitario))) as total_ventas, p.nombre
	FROM lineaventa lv JOIN venta ON (lv.id_venta = venta.id) 
		 JOIN producto p ON (p.id = venta.id)
	GROUP BY p.nombre
)

SELECT nombre, apellido1, apellido2, nombre, round(total_ventas,2), round((sumval/total_ventas * 100),2) as porcentaje_sobre_total
FROM jefe_con_5 JOIN jefe_definitivo USING (jefe_id)
     JOIN suma_importe_empleados USING (id_empleado)
	 JOIN suma_importe_general USING (nombre)


--2. 

WITH ingreso_total AS (

	SELECT SUM(COALESCE(precio_unitario * (1 - descuento/100),precio_unitario)) as total, p.nombre
	FROM lineaventa lv JOIN venta ON (lv.id_venta = venta.id) 
		JOIN producto p ON (p.id = venta.id)
	GROUP BY id_producto, p.nombre

)

SELECT round(AVG(total),2) as media, nombre
FROM ingreso_total
GROUP BY nombre

--3. 

SELECT nombre, apellido1, apellido2
FROM empleado 
WHERE id_empleado IN ( 	   
						   SELECT id_empleado
						   FROM empleado
						   WHERE fecha_alta::date - INTERVAL '6 year' < current_date
						  
					  )
AND id_empleado NOT IN (
	
						  SELECT id_empleado
						  FROM empleado JOIN venta USING (id_empleado)
							   JOIN producto p ON (p.id = venta.id)
						  WHERE p.nombre != 'Buey Mishi Kobe'
						
						)


--4.

SELECT MAX(numero_articulos) as num_unidades, c.nombre, c.apellidos, p.nombre
FROM lineaventa lv JOIN venta ON (lv.id_venta = venta.id)
	 JOIN producto p ON (p.id = venta.id)
	 JOIN cliente c ON (c.id = venta.id_cliente)
GROUP BY c.nombre, c.apellidos, p.nombre
HAVING p.nombre IN ( 
	
					  SELECT nombre
					  FROM producto p1 JOIN venta ON (p1.id = venta.id)
					  WHERE p1.nombre = p.nombre

					)
SELECT *
FROM empleado


SELECT *
FROM venta;

SELECT *
FROM lineaventa;

SELECT *
FROM producto

SELECT *
FROM cliente