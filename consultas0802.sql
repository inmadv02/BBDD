SET SCHEMA 'climatologia';

--Selecciona el numero de estaciones andaluzas cuya temperatura minima durante los 3 primeros
--tres meses del año haya sido entre 0 y -10 grados bajo cero.

SELECT COUNT(estacion), temperatura_minima
FROM climatologia
WHERE EXTRACT (month FROM fecha) BETWEEN 1 AND 3
AND provincia IN ('Sevilla', 'Huelva', 'Cádiz', 'Málaga', 'Jaén', 'Granada', 'Almería')
GROUP BY estacion, provincia
HAVING temperatura_minima BETWEEN 0 AND 5;

SELECT *
FROM climatologia;

--Selecciona las provincias en las que la precipitacion total haya sido mayor de 10 litros 
--durante los primeros 5 meses de 2018 y 2019