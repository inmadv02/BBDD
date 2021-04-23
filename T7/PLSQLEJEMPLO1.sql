SET SCHEMA 'climatologia';

CREATE OR REPLACE FUNCTION temp_max_fecha(date)
RETURNS numeric
AS $$
DECLARE
	resultado numeric;
BEGIN

	SELECT max(temperatura_maxima) INTO resultado
	FROM climatologia
	WHERE fecha = $1;
	
	RETURN resultado;
	
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION temp_max_fecha;

SELECT temp_max_fecha('2019-05-25')

do $$
DECLARE
	resultado_vuelo vuelo%rowtype;
BEGIN
	FOR resultado_vuelo > IN
		SELECT * FROM VUELO
		WHERE extract(month from salida) = 3 LOOP

		RAISE NOTICE '% % % %', resultado_vuelo.desde, resultado_vuelo.hasta,
		resultado_vuelo.salida, resultado_vuelo.llegada;

	END LOOP;
END;
$$ LANGUAGE plpgsql;