SET SCHEMA 'demografia';

SELECT demografia_basica.*, hombres + mujeres AS "total_habitantes"
FROM demografia_basica

SELECT provincia, anio,
       hombres, mujeres,
	   hombres + mujeres AS "total_hab"
FROM demografia_basica

SELECT provincia, anio,
		( mujeres::numeric / (hombres + mujeres)) *100
		  AS "% de mujeres", hombres + mujeres AS "total"
FROM demografia_basica