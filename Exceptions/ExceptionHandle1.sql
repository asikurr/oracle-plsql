set SERVEROUTPUT on;
declare 
v_first_name varchar2(6);
v_depart_name varchar2(100);
begin

select first_name into v_first_name from employees where employee_id = 100;
    begin
        select department_id into v_depart_name from employees where first_name = v_first_name;
        EXCEPTION
              WHEN too_many_rows THEN
                v_depart_name := ' : Department Id contain too many rows.';
    end;
        dbms_output.put_line(v_first_name || ' his department is ' || v_depart_name);
exception
    when no_data_found then
        dbms_output.put_line('No Data Found with this id');
    when too_many_rows then
        dbms_output.put_line('first name ' || v_first_name || ' has more than one rows ');
        dbms_output.put_line('Try Another Id.');
    when others then
        dbms_output.put_line(' An unexpected error occur.');
        dbms_output.put_line(sqlcode || ' --> ' || sqlerrm);
end;

/
select * from employees where first_name = 'Lex';