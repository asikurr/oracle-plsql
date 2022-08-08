declare
too_many_high exception;
v_check_salary pls_integer;

begin
    select salary into v_check_salary from employees where employee_id = 100;
    
    if v_check_salary > 10000 then
    raise too_many_high;
    --raise_application_error(-20142, ' this salary amount is too high..');
    end if;
    dbms_output.put_line('this salary amount is acceptable.');
    
    exception
    when too_many_high then
    dbms_output.put_line(' this salary amount is vary high.');
    raise_application_error(-20142, ' this salary amount is too high..');
end;