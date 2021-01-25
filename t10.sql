Create Table CUR
(name char(10),
 dob date,
 salary int(11));
 DELIMITER //
 Create PROCEDURE IMP()
 Begin
     Declare done int default FALSE;
     Declare emp_name char(10);
     Declare emp_dob date;
     Declare emp_salary int(11);
     Declare emp_record CURSOR for select name, dob, salary From employee;
     Declare Continue Handler For Found Set done=TRUE;
     Open emp_record;
     read_loop: LOOP
          Fetch emp_record Into emp_name, emp_dob, emp_salary;
          If done Then
                 Leave read_loop;
		  End If;
          Insert Into CUR Values(emp_name, emp_dob, emp_salary);
	 END LOOP;
     Close emp_record;
End;
DELIMITER;
Call IMP();
Select * From CUR;