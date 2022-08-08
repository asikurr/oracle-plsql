declare
not_update_with_null exception;
pragma exception_init(not_update_with_null, -01407);

begin 
    update employees_copy set email = null where employee_id = 100;
exception 
    when not_update_with_null then
    dbms_output.put_line('you cannot update null value.');
end;

/
declare
  cannot_update_to_null exception;
  pragma exception_init(cannot_update_to_null,-01407);
begin
  UPDATE employees_copy set email = null where employee_id = 100;
exception
  when cannot_update_to_null then
    dbms_output.put_line('You cannot update with a null value!');
end;