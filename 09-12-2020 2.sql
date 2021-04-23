SET SCHEMA 'climatologia';

SELECT *
FROM climatologia
WHERE date_part('month', fecha) - 4;