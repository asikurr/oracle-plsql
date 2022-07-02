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

------------------------------------------------------
create table employees_salary_history as select * from employees where 1 = 2;
alter table employees_salary_history add insert_date date;
select * from employees_salary_history;
---------------------------------------------------------------
/

declare 
type e_list is table of employees_salary_history%rowtype index by PLS_INTEGER;
r_emp e_list;
idx pls_integer;

begin 
    
    for x in 100..110 loop
        select e.* , '02-JUL-2022' into r_emp(x) from employees e where employee_id = x;
    end loop;
    
    idx := r_emp.first;
    
    while idx is not null loop
        r_emp(idx).salary := r_emp(idx).salary + r_emp(idx).salary * 2;
        insert into employees_salary_history values r_emp(idx);
        dbms_output.put_line('First Name is : ' || r_emp(idx).first_name || ' and salary is history table ' ||r_emp(idx).salary  || 'idx '|| idx);
        idx := r_emp.next(idx);
    end loop;

end;










select first_name, e.* from employees e;
