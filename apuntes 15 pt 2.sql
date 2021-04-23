SET SCHEMA 'northwind';

SELECT distinct e.first_name
FROM orders r JOIN employees e USING (employee_id)
	 JOIN employees e2 ON (e.reports_to = e2.employee_id)
	 JOIN employee_territories et ON (et.employee_id = e.employee_id)
	 JOIN territories t USING (territory_id)
WHERE t.territory_description LIKE '%e%'
  AND starts_with (r.customer_id, 'V')
  --AND order_date BETWEEN '1996-01-01'::date AND '1998-12-31'::date
 -- AND order_date BETWEEN to_date ('01/01/1996', 'DD/MM/YYYY')
 -- AND order_date BETWEEN to_date ('31/12/1998', 'DD/MM/YYYY')
 -- AND order_date BETWEEN to_date ('01/01/1996', 'DD/MM/YYYY') + INTERVAL '2 years'
 -- AND EXTRACT (year FROM order_date) BETWEEN 1996 AND 1998
ORDER BY e.first_name ASC;
