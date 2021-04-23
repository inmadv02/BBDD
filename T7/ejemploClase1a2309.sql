--Una función para sumar 3 números enteros
--suma3

CREATE OR REPLACE FUNCTION suma3 ()
RETURNS integer AS
$$
DECLARE
	numero1 integer = 1;
	numero2 integer = 2;
	numero3 integer = 4;
	total integer;
	
BEGIN

	total = numero3 + numero2 + numero1;
	RETURN total;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION suma4 (op1 int, op2 int, op3 int)
RETURNS int AS
$$
	SELECT op1 + op2 + op3;
$$ LANGUAGE sql;
	
SELECT suma4(1,1,1)