--select * from employees_copy;

--update employees_copy set phone_number = 1 where employee_id = 100;

declare 
cursor e_employee is select employee_id, first_name, last_name,phone_number, department_name from
employees_copy join departments using (department_id) where employee_id in (100, 101,102) 
for update of employees_copy.phone_number nowait;
-- we can use wait '5' here 5 means 5 second
--when use ''of employees_copy.phone_number'' it will be not wait or lock other join row or update row
begin
open e_employee;
   /* for emp_result in e_employee loop
        update employees_copy set phone_number = 1 where employee_id = emp_result.employee_id;
    end loop; */
end;
/


---this for my_user or another user
select * from hr.employees_copy;
select * from hr.departments;
update hr.employees_copy set phone_number = 1 where employee_id = 100;

update hr.departments set department_name = 'x' where department_id = 90;  -- it also lock because row are link with employee id with foreign key;

