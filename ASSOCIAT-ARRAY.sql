SET SERVEROUTPUT ON;
DECLARE 
type e_list is table of employees.first_name%type index by PLS_INTEGER;
employee e_list;
idx PLS_INTEGER;
BEGIN
    for i in 100..120 loop
        select first_name into employee(i) from employees where employee_id = i;
     end loop;
     idx := employee.first;
     
     while idx is not null loop
            dbms_output.put_line(employee(idx));
            idx := employee.next(idx);
     end loop;
END;
/
-- make index email column
DECLARE 
type e_list is table of employees.first_name%type index by varchar2(50);
employee e_list;
idx employees.email%type;
v_first_name employees.first_name%type;
v_email employees.email%type;

BEGIN
    for i in 100..110 loop
        select first_name, email into v_first_name,v_email  from employees where employee_id = i;
        employee(v_email) := v_first_name;
     end loop;
     idx := employee.first;
     while idx is not null loop
            dbms_output.put_line('name : ' ||employee(idx) || ' email : '||idx);
            idx := employee.next(idx);
     end loop;
END;
/

DECLARE 
type e_list is table of employees%rowtype index by employees.email%type;
employee e_list;
idx employees.email%type;
v_first_name employees.first_name%type;
v_email employees.email%type;

BEGIN
    for i in 100..110 loop
        select * into employee(i)  from employees where employee_id = i;
     end loop;
     idx := employee.first; 
     while idx is not null loop
            dbms_output.put_line('name : ' ||employee(idx).first_name || ' ' ||employee(idx).last_name || ' email : '||employee(idx).email);
            idx := employee.next(idx);
     end loop;
END;
/
--ADDED RECORD TYPE
DECLARE 
type e_type is record (first_name employees.first_name%type,
                        last_name employees.last_name%type,
                        email employees.email%type
                        );

type e_list is table of e_type index by employees.email%type;
employee e_list;
idx employees.email%type;
v_first_name employees.first_name%type;
v_email employees.email%type;

BEGIN
    for i in 100..110 loop
        select first_name, last_name, email into employee(i)  from employees where employee_id = i;
     end loop;
     
     -- employee.delete(100,105);
     idx := employee.first; 
     while idx is not null loop
            dbms_output.put_line('name : ' ||employee(idx).first_name || ' ' ||employee(idx).last_name || ' email : '||employee(idx).email);
            idx := employee.next(idx);
     end loop;
END;
/


select * from employees;
