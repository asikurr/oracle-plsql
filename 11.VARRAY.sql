SET SERVEROUTPUT ON;


DECLARE 
type e_list is varray(5) of VARCHAR2(50);
employee e_list;
BEGIN
employee  := e_list('alex', 'asikur', 'rahaman','john', 'smit');
    for i in 1..5 loop
        dbms_output.put_line(employee(i));
     end loop;
END;
/
DECLARE 
type e_list is varray(5) of VARCHAR2(50);
employee e_list;
BEGIN
employee  := e_list('alex', 'asikur', 'rahaman','john', 'smit');
    for i in 1..employee.count() loop
        dbms_output.put_line(employee(i));
     end loop;
END;
/

DECLARE 
type e_list is varray(5) of VARCHAR2(50);
employee e_list;
BEGIN
employee  := e_list('alex', 'asikur', 'rahaman','john', 'smit');
    for i in employee.first()..employee.last() loop
        dbms_output.put_line(employee(i));
     end loop;
END;

DECLARE 
type e_list is varray(5) of VARCHAR2(50);
employee e_list;
BEGIN
employee  := e_list('alex', 'asikur', 'rahaman','john');
   
    for i in 1..5 loop
     if employee.exists(i) then
        dbms_output.put_line(employee(i));
          end if;
     end loop;
   
END;
/
DECLARE 
type e_list is varray(5) of VARCHAR2(50);
employee e_list;
BEGIN
employee  := e_list('alex', 'asikur', 'rahaman','john');
dbms_output.put_line(employee.limit());
   
END;
/
DECLARE 
type e_list is varray(5) of VARCHAR2(50);
employee e_list := e_list('alex', 'asikur', 'rahaman','john', 5);
BEGIN
--employee  := e_list('alex', 'asikur', 'rahaman','john', 5);
dbms_output.put_line(employee.limit());
END;
/
drop type e_list;
create or replace type e_list is varray(15) of varchar2(50); -- create list in database
/
declare 
employee e_list := e_list();
idx number := 1;
begin 
    for i in 115..125 loop
       employee.extend();
       select first_name into employee(idx) from employees where employee_id = i;
       idx := idx + 1;
     end loop;
    
    for x in 1..employee.count() loop
        dbms_output.put_line(employee(x));
    end loop;
end;













