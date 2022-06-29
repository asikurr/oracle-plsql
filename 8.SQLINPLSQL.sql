DECLARE 
V_NAME NVARCHAR2(20);
V_SALARY employees.salary%TYPE;

BEGIN
    SELECT first_name ||' '|| LAST_NAME, SALARY INTO v_name, V_SALARY FROM employees WHERE employee_id = 100;
     DBMS_OUTPUT.put_line('NAME IS '|| v_name || ' SALARY ' ||V_SALARY );   
END;


CREATE TABLE EMPLOYEES_COPY AS SELECT * FROM employees;
SELECT * FROM employees_copy;

DECLARE
V_SALARY_INCREASE NUMBER := 400;
BEGIN 
    FOR I IN 207..216 LOOP
--        INSERT INTO EMPLOYEES_COPY(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY)
--        VALUES
--        (I,'EMPLOYEE_ID#'||I, 'TEMP_EMP', 'ASIKUR@GMAIL.COM', SYSDATE, 'IT_PROG',10000);
--        UPDATE EMPLOYEES_COPY SET SALARY = SALARY + V_SALARY_INCREASE WHERE EMPLOYEE_ID = I;
            DELETE FROM EMPLOYEES_COPY WHERE EMPLOYEE_ID = I;
    
    END LOOP;
END;

--DROP TABLE EMPLOYEES_COPY;
--CREATE TABLE EMPLOYEES_COPY AS SELECT * FROM employees;
--SELECT * FROM employees_copy;

--CREATE SEQUENCE EMP_ID_SEQ
--  START WITH 207
--  INCREMENT BY 1;

BEGIN 
    FOR I IN 1..20 LOOP
        INSERT INTO EMPLOYEES_COPY(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY)
        VALUES
        (EMP_ID_SEQ.NEXTVAL,'EMPLOYEE_ID#'||EMP_ID_SEQ.NEXTVAL, 'TEMP_EMP', 'ASIKUR@GMAIL.COM', SYSDATE, 'IT_PROG',10000);
    END LOOP;
END;
----------------------------------
declare
  v_seq_num number;
begin
  select EMP_ID_SEQ.nextval into v_seq_num from dual;
  dbms_output.put_line(v_seq_num);
end;
----------------------------
declare
  v_seq_num number;
begin
  select EMP_ID_SEQ.nextval into v_seq_num from employees_copy where rownum = 1;
  dbms_output.put_line(v_seq_num);
end;
----------------------------
declare
  v_seq_num number;
begin
  v_seq_num := EMP_ID_SEQ.nextval; 
  dbms_output.put_line(v_seq_num);
end;
----------------------------
declare
  v_seq_num number;
begin
  v_seq_num := EMP_ID_SEQ.CURRVAL; 
  dbms_output.put_line(v_seq_num);
end;
