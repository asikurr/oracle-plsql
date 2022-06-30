SET SERVEROUTPUT ON;
DECLARE 
type e_list is table of employees.first_name%type;
employee e_list := e_list();
idx pls_integer := 1;
BEGIN

    for i in 100..115 loop
        employee.extend();
        select first_name into employee(idx) from employees where employee_id = i;
        idx := idx + 1;
       -- dbms_output.put_line(employee(i));
     end loop;
     employee.delete(3);
     for x in 1..employee.count() loop
        if employee.exists(x) then
            dbms_output.put_line(employee(x));
        end if;
     end loop;
END;
/

