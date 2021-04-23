SET SCHEMA 'hr';

--Seleccionar el FIRST_NAME y LAST_NAME de los empleados del departamento de IT o 
--Finance cuya fecha de alta (HIRE_DATE) fuera un día cualquiera de Abril o Junio.

SELECT e.first_name, e.last_name
FROM employees e JOIN departments d USING (department_id)
WHERE department_name IN ('IT', 'Finance')
  AND (hire_date::text LIKE '%-04-%'
   OR hire_date::text LIKE '%-06-%');

--Seleccionar el FIRST_NAME y LAST_NAME de los managers de los empleados del 
--departamento de Administration.

SELECT e2.first_name, e2.last_name
FROM hr.employees e1 JOIN departments d ON (e1.department_id = d.department_id)
     JOIN employees e2 ON (e1.manager_id = e2.employee_id)
WHERE department_name = 'Administration';

--Seleccionar el COUNTRY_NAME donde tiene localización el departamento de Public Relations

SELECT c.country_name
FROM departments d JOIN locations l USING (location_id)
     JOIN countries c USING (country_id)
WHERE department_name = 'Public Relations';

--Seleccionar aquellos empleados que trabajen en oficinas de América.

SELECT e.first_name, e.last_name
FROM employees e JOIN departments d USING (department_id)
     JOIN locations l USING (location_id)
	 JOIN countries c USING (country_id)
	 JOIN regions r USING (region_id)
WHERE region_name = 'Americas';

--Seleccionar el nombre y apellidos de los hijos, así como el nombre y 
--apellidos de sus padres, para aquellos empleados que trabajen en oficinas 
--de América. Ordena la salida por orden alfabético del país :)

SELECT p.first_name, p.last_name, e.first_name, e.last_name
FROM dependents p JOIN employees e USING (employee_id)
     JOIN departments d USING (department_id)
     JOIN locations l ON (l.location_id = d.location_id)
	 JOIN countries c ON (l.country_id = c.country_id)
	 JOIN regions r USING (region_id)
WHERE region_name = 'Americas'
ORDER BY country_name ASC;

--Selecciona la media de los sueldos de los empleados que trabajan en departamentos
--de Europa. Sus nombres deben empezar por la letra 'S' y su sueldo sea igual o mayor
--a 6000. Hay que redondear con dos decimales.

SELECT round(avg(coalesce(e.salary,0)),2)
FROM hr.employees e JOIN hr.departments d USING (department_id)
     JOIN hr.locations l ON (l.location_id = d.location_id)
	 JOIN hr.countries c ON (l.country_id = c.country_id)
	 JOIN hr.regions r USING (region_id)
WHERE region_name = 'Europe'
  AND starts_with (e.first_name, 'S')
  AND salary >= 6000;
  
SELECT first_name, last_name, coalesce(department_name, 'Sin departamento')
FROM employees RIGHT OUTER JOIN 
              departments USING (department_id);

SELECT first_name, last_name, coalesce(department_name, 'Sin departamento')
FROM employees FULL OUTER JOIN 
               departments USING (department_id);
			   
SELECT department_name
FROM employees RIGHT OUTER JOIN departments USING (department_id)
WHERE employee_id IS NULL;