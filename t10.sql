CREATE TABLE Employee(
    code CHAR(6) PRIMARY KEY,
    name VARCHAR(80),
    dob date,
    designation VARCHAR(100),
    salary FLOAT
);
INSERT INTO Employee (code, name, dob, designation, salary)
VALUES
('gm0121','John','2000-10-05','General Manager',50000.25),
('pm2918','Ludo','1998-11-15','Product Manager',50000.50),
('cl0123','ISHKA','1992-02-06','Clerk',25000),
('cl1234','SASI','2001-02-05','Clerk',15000.75);
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
