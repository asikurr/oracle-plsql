create or replace type v_phone_number as object (p_type varchar2(10), p_number varchar2(30));
/
create or replace type r_phone_number as varray(3) of v_phone_number;
/
create table emp_with_rec (
    emp_id number,
    first_name varchar2(20),
    last_name varchar2(20),
    phone_number r_phone_number
);
/
select * from emp_with_rec;
/

insert into emp_with_rec values (10, 'asikur','rahaman', r_phone_number(
                                                        v_phone_number('home', '01823980517'),
                                                        v_phone_number('work', '01677227506'),
                                                        v_phone_number('mobile', '000111222333'))
                                                        );
/                                                   
insert into emp_with_rec values (12, 'rah','man', r_phone_number(
                                                        v_phone_number('home', '01823980517'),
                                                        v_phone_number('work', '01677227506'))
                                                        );
/
select e.first_name, e.last_name, p.p_type, p.p_number from emp_with_rec e , table (e.phone_number) p;
/
---------------------------------
--- Nested table store phone number
---------------------------------
create or replace type n_phone_number as table of v_phone_number;
/
create table emp_with_rec2 (
    emp_id number,
    first_name varchar2(20),
    last_name varchar2(20),
    phone_number n_phone_number )
    NESTED TABLE phone_number STORE AS phone_number_store_tab;
/
select * from emp_with_rec2;
/

insert into emp_with_rec2 values (10, 'asikur','rahaman', n_phone_number(
                                                        v_phone_number('home', '01823980517'),
                                                        v_phone_number('work', '01677227506'),
                                                        v_phone_number('mobile', '000111222333'))
                                                        );
/                                                   
insert into emp_with_rec2 values (12, 'rah','man', n_phone_number(
                                                        v_phone_number('home', '01823980517'),
                                                        v_phone_number('work', '01677227506'))
                                                        );
/
insert into emp_with_rec2 values (12, 'alex','john', n_phone_number(
                                                        v_phone_number('home', '01823980517'),
                                                        v_phone_number('work', '01677227506'),
                                                        v_phone_number('work2', '01677221234'),
                                                        v_phone_number('work3', '01677227500'))
                                                        );
/
---------------------
---update data
--------------------

update emp_with_rec2 set phone_number = n_phone_number(
                                                        v_phone_number('home', '1234567891'),
                                                        v_phone_number('work', '01677227506'),
                                                        v_phone_number('mobile', '000111222333')
                                                        )
                                                        where emp_id = 12;
/


select e.first_name, e.last_name, p.p_type, p.p_number from emp_with_rec2 e , table (e.phone_number) p;
/
--------------------------
---update data with pl/sql
---------------------------

declare 
p_num n_phone_number;
begin 
    select phone_number into p_num from emp_with_rec2 where emp_id = 10;
    p_num.extend();
    p_num(5) := v_phone_number('TT','2255446699');
 --dbms_output.put_line(p_num);
    update emp_with_rec2 set phone_number = p_num where emp_id = 10;
end;

                                                        