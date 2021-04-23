SET SCHEMA 'inmo';

SELECT SUM(precio_final)
FROM inmueble JOIN operacion USING (id_inmueble)
     JOIN tipo ON (tipo_inmueble = id_tipo)
WHERE to_char(fecha_operacion,  'TMMonth/YYYY') = 'Agosto/2019'
  AND tipo_operacion = 'Venta'
  AND provincia IN ('Jaén', 'Cádiz', 'Almería') 
  --AND provincia = 'Jaén'
  AND tipo.nombre = 'Piso'
GROUP BY provincia;


SELECT to_char(fecha_alta, 'MM/YYYY'), MAX(precio)
FROM inmueble JOIN tipo ON (id_tipo = tipo_inmueble)
WHERE tipo.nombre = 'Piso'
AND tipo_operacion = 'Alquiler'
GROUP BY to_char(fecha_alta, 'MM/YYYY'),
         to_char(fecha_alta, 'YYYY/MM')
ORDER BY to_char(fecha_alta, 'YYYY/MM') ASC;

--Todo lo que esté en el SELECT, que no sea la función de agregación, tiene que estar en el GROUP BY. 
--No todo lo que esté en el GROUP BY tiene que estar en el SELECT
SELECT *
FROM inmueble;
