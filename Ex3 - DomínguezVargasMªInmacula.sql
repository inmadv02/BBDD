SET SCHEMA 'climatologia';

/*Ejercicio 01*/

SELECT round((racha_viento),2)
FROM climatologia.climatologia
WHERE provincia IN ('A Coruña', 'Ourense', 'Pontevedra', 'Lugo')
  AND fecha BETWEEN '2019-05-01' AND '2019-05-31'
  AND racha_viento > 50;
  
/*Ejercicio 02*/

SELECT *, round(((temperatura_maxima + temperatura_minima)/2),2) AS "Promedio temp. máx y temp. mín"
FROM climatologia.climatologia
WHERE fecha::text BETWEEN '2019-01-01' AND '2019-01-31'
  AND (estacion LIKE '%á%' OR estacion LIKE '%í%' 
  OR estacion LIKE '%ó%' OR estacion LIKE '%é%' OR estacion LIKE '%ú%');

/*Ejercicio 03*/

SELECT *
FROM climatologia.climatologia
WHERE estacion LIKE '%_ón%'
  AND precipitacion_total BETWEEN 10 AND 20
  AND temperatura_minima < 10
  AND fecha::text BETWEEN '2019-02-01' AND '2019-03-31';

/* Ejercicio 04*/

SELECT estacion, provincia, fecha, temperatura_maxima,
  CASE
      WHEN temperatura_maxima > 30 OR temperatura_maxima < 35 then 'Caluroso'
	  WHEN temperatura_maxima >= 35 OR temperatura_maxima < 38 then 'Muy caluroso'
	  WHEN temperatura_maxima >= 38 then 'Extremadamente caluroso'
  END
FROM climatologia.climatologia
WHERE temperatura_maxima > 30
  AND hora_temperatura_maxima = '17:00'
  AND fecha BETWEEN '2019-06-01' AND '2019-07-31'
ORDER BY temperatura_maxima DESC;

/* Ejercicio 05*/

SELECT provincia, estacion, fecha, velocidad_maxima_viento, racha_viento, 
     round((racha_viento / (racha_viento + velocidad_maxima_viento))*100,2) AS "Porcentaje de racha superior a velocidad máx"
FROM climatologia.climatologia
WHERE velocidad_maxima_viento >= 60
  AND round((racha_viento / (racha_viento + velocidad_maxima_viento))*100,2) BETWEEN 20 AND 40 
ORDER BY provincia ASC, estacion DESC, fecha ASC;