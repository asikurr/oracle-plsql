DECLARE 
V_INNER number:=0;
BEGIN

FOR I IN 1..5 LOOP
    DBMS_OUTPUT.PUT_LINE('THE OUTER LOOP IS : ' || I);
    V_INNER :=  0;
    LOOP 
    V_INNER := V_INNER + 1;
    DBMS_OUTPUT.PUT_LINE('THE INNER LOOP IS : ' || V_INNER);
    EXIT WHEN I*V_INNER >= 15;
    END LOOP;
END LOOP;

END;
/

DECLARE 
V_INNER number:=0;
BEGIN

FOR I IN 1..5 LOOP
    DBMS_OUTPUT.PUT_LINE('THE OUTER LOOP IS : ' || I);
    
    FOR J IN 1..5 LOOP 
        DBMS_OUTPUT.PUT_LINE('THE INNER LOOP IS : ' || J);

    END LOOP;
END LOOP;

END;
/

declare
 v_inner number := 1;
begin
for v_outer in 1..5 loop
  dbms_output.put_line('My outer value is : ' || v_outer );
    v_inner := 1;
    loop
      v_inner := v_inner+1;
      dbms_output.put_line('  My inner value is : ' || v_inner );
      exit when v_inner*v_outer >= 15;
    end loop;
 end loop;
end;

declare
 v_inner number := 1;
begin
<<outer_loop>>
 for v_outer in 1..5 loop
  dbms_output.put_line('My outer value is : ' || v_outer );
    v_inner := 1;
    <<inner_loop>>
    loop
      v_inner := v_inner+1;
      dbms_output.put_line('  My inner value is : ' || v_inner );
      exit outer_loop when v_inner*v_outer >= 16;
      exit when v_inner*v_outer >= 15;
    end loop inner_loop;
 end loop outer_loop;
end;

