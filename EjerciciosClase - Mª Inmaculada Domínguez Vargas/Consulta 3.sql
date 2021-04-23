SET SCHEMA 'vuelos';

--Selecciona los vuelos que se han hecho entre 2015 y 2020 a Sevilla 
--desde Madrid y Barcelona. Ordenar la fecha de los vuelos por orden 
--descendente.


SELECT id
FROM vuelos
WHERE EXTRACT (year FROM salida) BETWEEN 2015 AND 2020
  AND desde IN ('Madrid', 'Barcelona')
  AND hasta = 'Sevilla'
ORDER BY salida DESC;

SELECT *
FROM vuelos;