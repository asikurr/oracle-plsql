create user my_user IDENTIFIED BY 123;
grant create session to my_user;
grant select any table to my_user;
grant update on HR.employees_copy to my_user;
grant update on HR.departments to my_user;