declare 
cursor e_info is select e.first_name, e.last_name, d.department_name from employees e join departments d USING (department_id)
                                                                                where department_id between 30 and 50;
r_emp e_info%rowtype;
v_count number := 0;
begin
open e_info;
while e_info%notfound loop
fetch e_info into r_emp;
v_count := v_count + 1;
--exit when e_info%notfound;
DBMS_OUTPUT.PUT_LINE(v_count || '. ' || r_emp.first_name ||' '|| r_emp.last_name || ' ' ||r_emp.department_name);
end loop;
close e_info;
end; 
/
-----------------
----FOUND FUNCTION;
------------------
/

declare 
cursor e_info is select e.first_name, e.last_name, d.department_name from employees e join departments d USING (department_id)
                                                                                where department_id between 30 and 50;
r_emp e_info%rowtype;
v_count number := 0;
begin
open e_info;
fetch e_info into r_emp;
while e_info%found loop

v_count := v_count + 1;
--exit when e_info%notfound;
DBMS_OUTPUT.PUT_LINE(v_count || '. ' || r_emp.first_name ||' '|| r_emp.last_name || ' ' ||r_emp.department_name);
fetch e_info into r_emp;
end loop;
close e_info;
end; 
/

-----------------
----FOR LOOP;
------------------
/

declare 
cursor e_info is select e.employee_id, e.first_name, e.last_name, d.department_name from employees e join departments d USING (department_id)
                                                                                where department_id between 30 and 50;
begin
for i in e_info loop
DBMS_OUTPUT.PUT_LINE(i.employee_id || ' ' || i.first_name ||' '|| i.last_name || ' and his department name ' || i.department_name );
end loop;
end; 
/

select * from employees