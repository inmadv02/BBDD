SET SCHEMA 'demografia';

SELECT concat_ws (',','a', 'b', 'c', 2)

SELECT *
FROM demografia_basica
WHERE anio = 2019
  AND length ((provincia) < 10);
  
SELECT DISTINCT upper(provincia)
FROM dmeografia_basica;

SELECT DISTINCT LOWER (provincia)

SELECT translate ('12345', '143', 'ax')

WHERE starts_with(lower(provincia), al');