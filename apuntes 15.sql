SET SCHEMA 'inmo';

SELECT *
FROM inmueble;

SELECT id_inmueble, to_char(fecha_alta, 'dd/mm/yyyy'), 
       provincia, precio
FROM inmueble;

SELECT to_char(fecha_alta, 'dd/FMTMmonth/yyyy')
FROM inmueble;

--Pisos vendidos un martes

SELECT *
FROM inmueble
WHERE to_char(fecha_alta, 'D') = 3;
--WHERE to_char(fecha_alta, 'TMDAY') = 'Martes'
--WHERE to_char(fecha_alta, 'ID') = 'Martes'
--WHERE to_char(fecha_alta, 'TMDY') = 'Mar'