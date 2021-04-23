SET SCHEMA 'demografia';

/* Crea un mensaje de bienvenida en la consulta y selecciona el porcentaje de mujeres y hombres 
en la Comunidad Valenciana en el año 2015 y del 2019. Redondea los resultados con decimales y 
ordena los años en orden ASC*/

SELECT provincia, anio, mujeres, hombres,
         round ((mujeres::numeric / (hombres + mujeres)) *100,2) AS "% de mujeres",
		 round ((hombres::numeric / (hombres + mujeres)) *100,2) AS "% de hombres"
FROM demografia_basica
WHERE provincia IN ('Valencia/València', 'Alicante/Alacant', 'Castellón/Castelló')
AND (anio = 2015 OR anio = 2019)
ORDER BY anio ASC;

/* Selecciona las provincias con contengan una letra "i" en su nombre, en las que la edad mayor de las mujeres
en el año 2014 y 2019 sea de 65 años o menos. Ordena las provincias y la edad mayor en orden ascendente y los 
años en orden descendente */

SELECT provincia, sexo, anio, edad_mayor
FROM demografia_avanzada
WHERE provincia LIKE '%i%'
AND sexo = 'M'
AND edad_mayor <= 65
AND (anio = 2014 OR anio = 2019)
ORDER BY provincia ASC, anio DESC, edad_mayor ASC;