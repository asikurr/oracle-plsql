declare 
cursor e_info is select e.first_name, e.last_name, d.department_name from employees e join departments d USING (department_id)
                                                                                where department_id between 30 and 50;
v_first_name employees.first_name%type;
v_last_name employees.last_name%type;
v_department_name departments.department_name%type;

begin
open e_info;
fetch e_info into v_first_name, v_last_name, v_department_name;
DBMS_OUTPUT.PUT_LINE(v_first_name ||' '|| v_last_name || ' ' ||v_department_name);
close e_info;
end; 
/
----------------------
--- using join;
----------------------
/
declare 

cursor e_info is select e.first_name, e.last_name, d.department_name from employees e join departments d USING (department_id)
                                                                                where department_id between 30 and 50;
e_emp e_info%rowtype;


begin
open e_info;
fetch e_info into e_emp.first_name, e_emp.last_name, e_emp.department_name;
DBMS_OUTPUT.PUT_LINE(e_emp.first_name ||' '|| e_emp.last_name || ' his department is ' ||e_emp.department_name);
close e_info;
end; 
/




--select * from departments
--select * from employees
--select first_name, last_name, departments.department_name from employees join departments USING (department_id)where department_id between 30 and 50;
