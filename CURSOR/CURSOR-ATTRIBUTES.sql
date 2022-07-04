SET SERVEROUTPUT ON;
declare 
cursor e_info is select e.first_name, e.last_name from employees e where department_id= 50;
r_emp e_info%rowtype;

begin

if not e_info%isopen then
open e_info;
DBMS_OUTPUT.PUT_LINE('cursor open.');
end if;
fetch e_info into r_emp;
DBMS_OUTPUT.PUT_LINE(e_info%rowcount);
fetch e_info into r_emp;
DBMS_OUTPUT.PUT_LINE(e_info%rowcount);
fetch e_info into r_emp;
DBMS_OUTPUT.PUT_LINE(e_info%rowcount);
close e_info;



for i in e_info loop
 CONTINUE WHEN e_info%notfound or e_info%rowcount > 5;
    DBMS_OUTPUT.PUT_LINE(e_info%rowcount ||' '|| i.first_name ||' '|| i.last_name );
end loop;


end; 
/