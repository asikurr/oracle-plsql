SET SERVEROUTPUT ON;

create table retierd_employee as select * from employees where 1 = 2;
select * from retierd_employee;
/

DECLARE 
emp_rec   employees%rowtype; 
BEGIN
    SELECT * INTO emp_rec FROM employees  WHERE employee_id = 104;
    emp_rec.salary := 100;
    emp_rec.commission_pct := 0;
    
   -- insert into retierd_employee values emp_rec;
   
   update retierd_employee set row = emp_rec where employee_id = 104;

END;
/
