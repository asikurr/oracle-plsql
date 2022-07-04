declare 
cursor e_info(emp_id number) is select e.employee_id, e.first_name, e.last_name, d.department_name from employees e join departments d USING (department_id)
                                                                                where department_id = emp_id;
r_emp e_info%rowtype;
begin
open e_info(:emp_id);
fetch e_info into r_emp;
DBMS_OUTPUT.PUT_LINE( ' The Employees in department of '||r_emp.department_name || ' are ');
close e_info;

open e_info(:emp_id);
loop
fetch e_info into r_emp;
exit when e_info%notfound;
DBMS_OUTPUT.PUT_LINE(r_emp.first_name ||' '|| r_emp.last_name);
end loop;
close e_info;

open e_info(:emp_id2);
fetch e_info into r_emp;
    DBMS_OUTPUT.PUT_LINE( ' The Employees in department of '||r_emp.department_name || ' are ');
close e_info;

for i in e_info(:emp_id2) loop
    DBMS_OUTPUT.PUT_LINE(i.first_name ||' '|| i.last_name);
end loop;

end; 
/