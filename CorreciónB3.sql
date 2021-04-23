SET SCHEMA 'northwind';
--Boletín 3

--1.

SELECT first_name, last_name, COUNT(*)
FROM orders JOIN employees USING (employee_id)
GROUP BY first_name, last_name
HAVING COUNT(*) BETWEEN 100 AND 150;

--2.

SELECT *
FROM customers
WHERE customer_id NOT IN (
							SELECT DISTINCT customer_id
							FROM orders
							)
							
--3. (variación)

SELECT category_name, COUNT(DISTINCT product_id)
FROM order_details JOIN products USING (product_id)
      JOIN categories USING (category_id)
GROUP BY category_name
HAVING COUNT(DISTINCT product_id) = 

	(
		SELECT MAX(num_prod_dif)
		FROM (
			
				SELECT COUNT (DISTINCT product_id) AS num_prod_dif
			    FROM order_details JOIN products USING (product_id)
			    JOIN categories USING (category_id)
			    GROUP BY category_name
		
			 )cat
										
					
	)--;
ORDER BY COUNT(DISTINCT product_id) DESC
LIMIT 1;

--4.

SELECT category_name, product_name, 
       round(SUM(0.25 * od.unit_price * quantity * (1 - discount)),2)
FROM orders JOIN order_details od USING (product_id)
	 JOIN products USING (product_id)
	 JOIN categories USING (category_id)
GROUP BY category_name, product_name;

--5. 

SELECT DISTINCT customers.company_name
FROM customers JOIN orders USING (customer_id)
     JOIN shippers ON (ship_via = shipper_id)
WHERE customer_id NOT IN 
		(
			SELECT customer_id
			FROM customers JOIN orders USING (customer_id)
     		JOIN shippers ON (ship_via = shipper_id)
			WHERE shippers.company_name != 'United Package'
		);