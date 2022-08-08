declare
too_many_high exception;
v_check_salary pls_integer;

begin
    select salary into v_check_salary from employees where employee_id = 103;
    
    if v_check_salary > 10000 then
    raise too_many_high;
    end if;
    dbms_output.put_line('this salary amount is acceptable.');
    
    exception
    when too_many_high then
    dbms_output.put_line(' this salary amount is vary high..');
end;