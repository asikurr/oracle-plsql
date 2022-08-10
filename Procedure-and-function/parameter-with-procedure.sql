create or replace procedure salary_increase_parameter 
(
v_salary_increase in out pls_integer,
v_department in pls_integer,
v_affected_count out integer
)
as
cursor c_emps is select * from employees_copy where department_id =v_department  for update;
--v_salary_increase pls_integer := 2;
v_old_salary pls_integer;
v_sal_inc number :=0;
Begin
    v_affected_count := 0;
    for r_emps in c_emps loop
    v_old_salary := r_emps.salary;
    r_emps.salary := ((r_emps.salary * v_salary_increase)/100) + r_emps.salary;
    update employees_copy set row = r_emps where current of c_emps; --salary = r_emps.salary where employee_id = r_emps.employee_id; --current of c_emps;
    DBMS_OUTPUT.PUT_LINE('the employee id '|| r_emps.employee_id || ' salary increase from '|| v_old_salary || ' to '|| r_emps.salary);
    v_affected_count := v_affected_count + 1;
    v_sal_inc := v_sal_inc + v_salary_increase;
    end loop;
    v_salary_increase := v_sal_inc / v_affected_count;
end;
/

select * from employees_copy;

/

execute salary_increase_parameter(1.5, 90);
/
declare
v_increase_sal number := 2;
v_affect_num number;
begin
print('Salary Increment Start From Here...');
salary_increase_parameter(v_increase_sal, 60, v_affect_num);
print('effected employee count is '|| v_affect_num );
print('Average salary increase '|| v_increase_sal || ' percent..' );
end;
/




create or replace PROCEDURE print 
(
v_text varchar2
)
as
begin
    DBMS_OUTPUT.PUT_LINE(v_text);
end;
/