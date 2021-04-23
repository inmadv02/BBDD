SET SCHEMA 'climatologia';

--1.
CREATE OR REPLACE FUNCTION MEDIA_PROVINCIA (texto varchar, fecha1 date)
RETURNS bigint AS
$$

	SELECT AVG(temperatura_media)
	FROM climatologia
	WHERE texto = provincia
	AND fecha1 = fecha;
	
$$ LANGUAGE sql;

--1.1

--Variante de la función anterior pero utilizando argumentos ordinales 

CREATE OR REPLACE FUNCTION MEDIA_PROVINCIA2 (texto varchar, fecha1 date)
RETURNS bigint AS
$$

	SELECT AVG(temperatura_media)
	FROM climatologia
	WHERE texto = $1
	AND fecha1 = $2;
	
$$ LANGUAGE sql;


--2. 

--Con esta función, devolvemos la temperatura media máxima de una estación durante un mes.
--Para ello, introducimos el nombre de la estación y el número correspondiente al mes.

CREATE OR REPLACE FUNCTION MEDIA_MENSUAL_MAXIMA_POR_ESTACION (est text, num int)
RETURNS TABLE (est text, mes text, mes2 int, media bigint) AS 
$$

	SELECT estacion, to_char(fecha, 'Month'), 
			EXTRACT(month from fecha), AVG(temperatura_maxima) as media
	FROM climatologia
	WHERE est = estacion
	AND num = EXTRACT(month from fecha)
	GROUP BY estacion, to_char(fecha, 'Month'), 
			EXTRACT(month from fecha);
	
$$ LANGUAGE sql;
	

SELECT *
FROM climatologia;


