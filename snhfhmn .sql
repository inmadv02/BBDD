SET SCHEMA 'northwind';

--Selecciona los pedidos que han sido atendidos por los empleados cuyo
--id sea mayor o igual que 3 y que vivan en una región que contenga dos ‘o’. 
--Estos pedidos deben haberse hecho entre los dos primeros trimestres de 1998.
--Ordenar la fecha de los pedidos por orden ascendente.


SELECT o.order_id
FROM territories t JOIN employee_territories et USING (territory_id)
     JOIN employees e USING (employee_id)
	 JOIN orders o USING (employee_id)
WHERE e.employee_id >= 3
  AND territory_description LIKE '%o%o%'
  AND EXTRACT (month FROM order_date) BETWEEN 1 AND 6
  AND EXTRACT (year FROM order_date) = '1998'
ORDER BY order_date ASC;

--Selecciona el precio medio de los productos que son proporcionados 
--por las empresas United Package y Speedy Express durante los meses 
--de noviembre y diciembre. Ordenar la fecha de los pedidos por orden 
--ascendente.

SELECT round((avg(p.unit_price)),2)
FROM shippers s JOIN orders o ON (s.shipper_id = o.ship_via)
     JOIN order_details d USING (order_id)
	 JOIN products p USING (product_id)
WHERE s.company_name IN ('United Package', 'Speedy Express')
  AND EXTRACT(month FROM order_date) BETWEEN 11 AND 12
ORDER BY order_date ASC;

--Selecciona los vuelos que se han hecho entre 2015 y 2020 a Sevilla desde Madrid
--y Barcelona. Ordenar la fecha de los vuelos por orden descendente.



SELECT *
FROM shippers;