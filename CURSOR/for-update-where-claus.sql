set serveroutput on;
select rowid,employees.* from employees where department_id = 30;
/
select e.* from employees e , departments d  
where 
e.department_id = d.department_id 
and e.department_id = 30;
/
declare 
cursor e_employee is select e.ROWID, e.phone_number from employees e , departments d  where e.department_id = d.department_id and  e.department_id = 30 for UPDATE;
begin
for r_emp in e_employee loop
    --DBMS_OUTPUT.PUT_LINE(r_emp.employee_id);
    update employees set salary = salary + 20 where  rowid = r_emp.rowid; --CURRENT OF e_employee;  --employee_id = r_emp.employee_id;
end loop;
end; 
/