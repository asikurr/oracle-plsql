declare 
type t_emps is ref cursor return employees%ROWTYPE;
rc_emps t_emps;
r_emps employees%rowtype;
begin 
open rc_emps for select * from retierd_employee;
loop
fetch rc_emps into r_emps;
exit when rc_emps%notfound;
DBMS_OUTPUT.put_line(r_emps.employee_id ||' '|| r_emps.first_name || ' ' || r_emps.last_name);
end loop;
close rc_emps;

DBMS_OUTPUT.put_line(' ----------------------');

open rc_emps for select * from employees where job_id = 'IT_PROG';
loop
fetch rc_emps into r_emps;
exit when rc_emps%notfound;
DBMS_OUTPUT.put_line(r_emps.employee_id ||' '|| r_emps.first_name || ' ' || r_emps.last_name);
end loop;
close rc_emps;
end;
/
----------------------------
declare
type ty_emps is record (e_id number,
                          first_name employees.first_name%type,
                          last_name employees.last_name%type,
                          department_name departments.department_name%type);
 
r_emps ty_emps;     
type t_emps is ref cursor return ty_emps;
rc_emps t_emps;
begin 
open rc_emps for select employee_id, first_name, last_name, department_name from employees join departments using (department_id);
loop
fetch rc_emps into r_emps;
exit when rc_emps%notfound;
DBMS_OUTPUT.put_line( r_emps.first_name || ' '|| r_emps.last_name ||' '|| r_emps.department_name);
end loop;
close rc_emps;
end;
/
--------
---------------------------- just remove return type
declare
type ty_emps is record (e_id number,
                          first_name employees.first_name%type,
                          last_name employees.last_name%type,
                          department_name departments.department_name%type);
 
r_emps ty_emps;     
type t_emps is ref cursor; -- return ty_emps
rc_emps t_emps;
v_query varchar2(200);
begin 
v_query := 'select employee_id, first_name, last_name, department_name from employees join departments using (department_id)';
open rc_emps for v_query ;
loop
fetch rc_emps into r_emps;
exit when rc_emps%notfound;
DBMS_OUTPUT.put_line( r_emps.first_name || ' '|| r_emps.last_name ||' '|| r_emps.department_name);
end loop;
close rc_emps;
end;
/

--------------- bind variables with cursors example
declare
  type ty_emps is record (e_id number, 
                         first_name employees.last_name%type, 
                         last_name employees.last_name%type,
                         department_name departments.department_name%type);
 r_emps ty_emps;
 type t_emps is ref cursor;
 rc_emps t_emps;
 r_depts departments%rowtype;
 --r t_emps%rowtype;
 q varchar2(200);
begin
  q := 'select employee_id,first_name,last_name,department_name 
                      from employees join departments using (department_id)
                      where department_id = :t';
  open rc_emps for q using '50';
    loop
      fetch rc_emps into r_emps;
      exit when rc_emps%notfound;
      dbms_output.put_line(r_emps.first_name|| ' ' || r_emps.last_name|| 
            ' is at the department of : '|| r_emps.department_name );
    end loop;
  close rc_emps;
  
  open rc_emps for select * from departments;
    loop
      fetch rc_emps into r_depts;
      exit when rc_emps%notfound;
      dbms_output.put_line(r_depts.department_id|| ' ' || r_depts.department_name);
    end loop;
  close rc_emps;
end;

---------------sys_refcursor example
declare
  type ty_emps is record (e_id number, 
                         first_name employees.last_name%type, 
                         last_name employees.last_name%type,
                         department_name departments.department_name%type);
 r_emps ty_emps;
-- type t_emps is ref cursor;
 rc_emps sys_refcursor;
 r_depts departments%rowtype;
 --r t_emps%rowtype;
 q varchar2(200);
begin
  q := 'select employee_id,first_name,last_name,department_name 
                      from employees join departments using (department_id)
                      where department_id = :t';
  open rc_emps for q using '90';
    loop
      fetch rc_emps into r_emps;
      exit when rc_emps%notfound;
      dbms_output.put_line(r_emps.first_name|| ' ' || r_emps.last_name|| 
            ' is at the department of : '|| r_emps.department_name );
    end loop;
  close rc_emps;
  
  open rc_emps for select * from departments;
    loop
      fetch rc_emps into r_depts;
      exit when rc_emps%notfound;
      dbms_output.put_line(r_depts.department_id|| ' ' || r_depts.department_name);
    end loop;
  close rc_emps;
end;