CREATE OR REPLACE FUNCTION GET_AVG_SALARY 
(
dept_id in departments.department_id%type
)
RETURN NUMBER AS 
v_salary number;
BEGIN
    select avg(salary) into v_salary from employees where department_id = dept_id;
  RETURN v_salary;
END GET_AVG_SALARY;
/
declare 
v_ave_salary number;
begin 
v_ave_salary := GET_AVG_SALARY(60);
print(v_ave_salary);
end;
/
select first_name, last_name, GET_AVG_SALARY(department_id) as Avg_Sal from employees;