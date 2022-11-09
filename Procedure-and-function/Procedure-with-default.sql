
create or replace PROCEDURE print 
(
v_text varchar2 default 'this is default text.'
)
as
begin
    DBMS_OUTPUT.PUT_LINE(v_text);
end;
/

execute print();

select * from jobs;
/
create or replace procedure add_job 
(
 job_id varchar2,
 job_title varchar2,
 min_salary number DEFAULT 1000,
 max_salary number DEFAULT NULL
)
is
begin
    insert into jobs values ( job_id, job_title, min_salary, max_salary);
    DBMS_OUTPUT.put_line('The job ' + job_title + ' is Inserted!');
end;
/

exec add_job('IT_PRO', 'Asst Programmer', 2345);



create or replace procedure add_jobs(job_id pls_integer, job_title varchar2, 
                                    min_salary number default 1000, max_salary number default null) is
begin
  insert into jobs values (job_id,job_title,min_salary,max_salary);
  print('The job : '|| job_title || ' is inserted!..');
end;
-----------------A standard run of the procedure
exec ADD_JOBS('IT_DIR','IT Director',5000,20000); 
-----------------Running a procedure with using the default values
exec ADD_JOBS('IT_DIR2','IT Director',5000); 
-----------------Running a procedure with the named notation
exec ADD_JOBS('IT_DIR5','IT Director',max_salary=>10000); 
-----------------Running a procedure with the named notation example 2
exec ADD_JOBS(job_title=>'IT Director',job_id=>'IT_DIR7',max_salary=>10000 , min_salary=>500);
