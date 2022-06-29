SET SERVEROUTPUT ON;
/*
BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLO WORLD.');
    BEGIN
        DBMS_OUTPUT.PUT_LINE('PL/SQL');
    END;
END; 

DECLARE 
V_NAME VARCHAR2(50) NOT NULL DEFAULT 'ASIKUR';

BEGIN
    V_NAME := 'PL/SQL' || ' LEARNING.';
    dbms_output.put_line(V_NAME);
END; */



declare
V_TYPE employees.JOB_ID%TYPE;
V_TYPE2 V_TYPE%TYPE;
V_TYPE3 employees.JOB_ID%TYPE ;
V_PHONE employees.phone_number%TYPE;
begin
v_type := 'IT_PROG';
v_type2 := 'SA_MAN';
v_type3 := NULL;
V_PHONE := '018239844442517234567890';
dbms_output.put_line(v_type);
dbms_output.put_line(v_type2);
dbms_output.put_line(v_type3 || ' HELLO');
dbms_output.put_line(V_PHONE);
end;

------------------------VARIABLE SCOPE--------------------------
begin <<outer>>
DECLARE
  --v_outer VARCHAR2(50) := 'Outer Variable!';
  v_text  VARCHAR2(20) := 'Out-text';
BEGIN 
  DECLARE
    v_text  VARCHAR2(20) := 'In-text';
    v_inner VARCHAR2(30) := 'Inner Variable';
  BEGIN
    --dbms_output.put_line('inside -> ' || v_outer);
    --dbms_output.put_line('inside -> ' || v_inner);
      dbms_output.put_line('inner -> ' || v_text);
      dbms_output.put_line('outer -> ' || outer.v_text);
  END;
  --dbms_output.put_line('inside -> ' || v_inner);
  --dbms_output.put_line(v_outer);
  dbms_output.put_line(v_text);
END;
END outer;


variable var_sql number;
begin 
  :var_sql := 100;
end;
select * from employees where employee_id = :var_sql;


