SELECT SYSDATE FROM DUAL;
--Punto 9 teorico
DECLARE
V_INVALID INTEGER;
BEGIN
	V_INVALID := 100/0;
EXCEPTION
WHEN ZERO_DIVIDES THEN
	 dbms_output.put_line('ATTEMPT TO DIVIDE BY O');
END;
/

SELECT MOD(12,4) "Modulus" FROM DUAL;

--Punto 1 Practico

CREATE OR REPLACE FUNCTION divisible_sum_pairs (SUMA_VARRAY NUMBER, ENTRADA NUMBER) 
    RETURN NUMBER
IS
RESULTADO NUMBER;
MENSAJE_ERROR EXCEPTION;
BEGIN
    
    SELECT MOD(SUMA_VARRAY,ENTRADA) INTO RESULTADO FROM  DUAL;
    
    IF ENTRADA < 0 AND ENTRADA > 100 THEN
      RAISE MENSAJE_ERROR;
    ELSE 
      RETURN   (RESULTADO  + 0);
    END IF;
    
    EXCEPTION
    WHEN MENSAJE_ERROR THEN
         DBMS_OUTPUT.PUT_LINE('El valor ingresado es incorrecto.');
END;
/




CREATE OR REPLACE TYPE number_array AS VARRAY(100) OF INTEGER;
/


DECLARE 
   TYPE number_array IS VARRAY(100) OF INTEGER;
   a number_array; 
   b grades; 
   total integer; 
   k integer;
   i INTEGER;
   j INTEGER;
   c integer;
   RESPUESTA1 INTEGER;
   d integer;
BEGIN 
   a := number_array(1, 3, 2, 6, 1, 2); 
   k := 3;
   total := b.count; 

   FOR i in 0 .. total-1 LOOP 
        FOR j in 0 .. total-1 LOOP 
            IF a(i) != a(j) THEN
             c := a(j) + a(i);
             SELECT divisible_sum_pairs(c, k) INTO RESPUESTA1 FROM DUAL;
                IF RESPUESTA1 = 0 THEN
                  d := d + 1;
                END IF;
            END IF;
        END LOOP;
        j := 0;
    END LOOP;
         DBMS_OUTPUT.PUT_LINE('El total de parejas es.' || d);
END; 
/


--Punto 2


CREATE OR REPLACE FUNCTION VALOR_DIVISIBLE (VALOR1 NUMBER) 
    RETURN NUMBER
IS
RESULTADO NUMBER;
LARGO INTEGER;
d integer;
VALORUNICO INTEGER;
BEGIN
    SELECT LENGTH(VALOR1) INTO LARGO FROM DUAL;
    FOR i IN 1..LARGO LOOP
    SELECT SUBSTR(VALOR1,i,1) INTO VALORUNICO FROM DUAL;      
    SELECT MOD(VALORUNICO,VALORUNICO) INTO RESULTADO FROM  DUAL;
    IF RESULTADO = 0 THEN
      d := d + 1;
      end if;
        END LOOP;
    
         DBMS_OUTPUT.PUT_LINE('El total de divisibles es.' || d);
    
END;
/

SELECT SUBSTR('ABCDEFG',3,1) "Substring" FROM DUAL;



--Punto 3

CREATE TABLE FINAL2
( ID INTEGER,
PARES VARCHAR(20));

INSERT INTO FINAL2 (ID) VALUES(1);
INSERT INTO FINAL2 (ID) VALUES(2);
INSERT INTO FINAL2 (ID) VALUES(3);
INSERT INTO FINAL2 (ID) VALUES(4);
INSERT INTO FINAL2 (ID) VALUES(5);
INSERT INTO FINAL2 (ID) VALUES(6);
INSERT INTO FINAL2 (ID) VALUES(7);
INSERT INTO FINAL2 (ID) VALUES(8);

declare 
  cursor c_paises (ID2 INTEGER) is
  SELECT ID  INTO ID3 FROM FINAL2 
  WHERE ID = ID2;
begin

  UPDATE FINAL2 SET PARES = 'PARES'
  WHERE ID = ID2;
end;