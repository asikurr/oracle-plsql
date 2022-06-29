SET SERVEROUTPUT ON;
DECLARE 
emp_rec   EMPLOYEES%ROWTYPE; 
BEGIN
    SELECT * INTO emp_rec FROM employees  WHERE employee_id = 100;
     DBMS_OUTPUT.put_line('NAME IS '|| emp_rec.FIRST_NAME || ' '||emp_rec.LAST_NAME || ' SALARY : ' ||emp_rec.SALARY );   
END;
/
DECLARE 
TYPE T_rec IS RECORD (
                        FIRST_NAME NVARCHAR2(50),
                        LAST_NAME EMPLOYEES.last_name%TYPE,
                        SALARY employees.salary%TYPE,
                        HIRE_DATE DATE
                        );
   emp_rec T_rec;
BEGIN
    SELECT FIRST_NAME, LAST_NAME, SALARY, HIRE_DATE INTO emp_rec FROM employees WHERE employee_id = 100;
--    emp_rec.FIRST_NAME := 'ASIKUR';
--    --emp_rec.LAST_NAME  := 'RAHAMAN';
--    emp_rec.SALARY := 2000;
--    emp_rec.HIRE_DATE := '01-JAN-2022';
    
     DBMS_OUTPUT.put_line('NAME IS '|| emp_rec.FIRST_NAME || ' '||emp_rec.LAST_NAME || ' SALARY : ' 
     ||emp_rec.SALARY || ' JOIN DATE : ' ||emp_rec.HIRE_DATE  );   
END;
/

declare 
type t_edu is record ( high_school VARCHAR2(100),
                       college VARCHAR2(100),
                       university VARCHAR2(100),
                       passing_year date);
            
type t_emp is record ( first_name VARCHAR2(30),
                       last_name employees.last_name%type,
                       salary employees.salary%type not null default 10000,
                       hire_date employees.hire_date%type,
                       dept_id employees.department_id%type,
                       department departments%rowtype,
                       education t_edu
                       );
r_emp t_emp;

begin
    select first_name, last_name, salary, hire_date, department_id 
    into r_emp.first_name, r_emp.last_name, r_emp.salary, r_emp.hire_date, r_emp.dept_id
    from employees where employee_id = 146;
    
    select * into r_emp.department from departments where department_id = r_emp.dept_id;
    
    r_emp.education.university := 'National University';
    r_emp.education.passing_year := '01-DEC-2017';
    
    DBMS_OUTPUT.PUT_LINE('name :'|| r_emp.first_name ||' '||r_emp.first_name ||' his salary : '|| r_emp.salary || ' his join date : ' ||r_emp.hire_date 
        || ' and his Department name is : '|| r_emp.department.department_name || ' He graduate from ' || r_emp.education.university || ' in '||r_emp.education.passing_year
    );

end;
/                   


















