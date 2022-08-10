create or replace procedure salary_increase 
as
cursor c_emps is select * from employees_copy for update;
v_salary_increase pls_integer := 2;
v_old_salary pls_integer;
Begin
    for r_emps in c_emps loop
    v_old_salary := r_emps.salary;
    r_emps.salary := ((r_emps.salary * v_salary_increase)/100) + r_emps.salary;
    update employees_copy set row = r_emps where current of c_emps; --salary = r_emps.salary where employee_id = r_emps.employee_id; --current of c_emps;
    DBMS_OUTPUT.PUT_LINE('the employee id '|| r_emps.employee_id || ' salary increase from '|| v_old_salary || ' to '|| r_emps.salary);
    end loop;
end;
/

select * from employees_copy;

/

execute salary_increase;
/
begin
salary_increase;
end;
/