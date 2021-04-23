SET SCHEMA 'hr';

--Seleccionar aquellos primeros 5 empleados que trabajen en oficinas de América.

SELECT e.first_name, e.last_name
FROM employees e JOIN departments d USING (department_id)
     JOIN locations l USING (location_id)
	 JOIN countries c USING (country_id)
	 JOIN regions r USING (region_id)
WHERE region_name = 'Americas'
LIMIT 5;

--Seleccionar aquellos empleados que trabajen en oficinas de América.

SELECT e.first_name, e.last_name
FROM employees e JOIN departments d USING (department_id)
     JOIN locations l USING (location_id)
	 JOIN countries c USING (country_id)
	 JOIN regions r USING (region_id)
WHERE region_name = 'Americas'
LIMIT 5 OFFSET 5;

SELECT provincia, estacion, temperatura_minima
FROM climatologia
GROUP BY provincia, estacion;

SELECT MAX(temperatura_maxima), provincia, fecha
FROM climatologia
WHERE to_char(fecha, 'TMDay') IN ('Sábado', 'Domingo')
GROUP BY provincia, fecha
HAVING MAX(temperatura_maxima) BETWEEN 10 AND 20 --Aquí ponemos las cosas que no hayan sido incluidas en el GROUP BY
ORDER BY provincia, fecha;
