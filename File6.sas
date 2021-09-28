*Part A;

*Subpart 1;

data salessubset;
	infile "/home/u58422688/sales.csv" dlm=',';
	input EmployeeId FName $ LName $ Gender $ Salary Jobtitle $ Country $ Birthdate:DATE9. Hiredate:mmddyy10.;
run;

*Subpart 2;

proc print data = salessubset noobs;
format Birthdate ddmmyy10. Hiredate ddmmyy10.;
run;

*Subpart 3;
proc print data = salessubset noobs;
format Salary Dollar8. Birthdate ddmmyy10. Hiredate ddmmyy10.;
run;

*Subpart 4;

proc format;
value $Genderfmt
"F" = "Female"
"M" = "Male";
run;

proc format;
value $Countryfmt
"AU" = "Australia"
"US" = "America";
run;

proc print data=salessubset noobs;
format Gender $Genderfmt. Country $Countryfmt. Salary Dollar8. Birthdate ddmmyy10. Hiredate ddmmyy10.;
run;

*Subpart 5;

proc print data = salessubset noobs;
format Gender $Genderfmt. Country $Countryfmt. Salary Dollar8. Birthdate date9. Hiredate date9.;
run;

*Part B;

*Subpart 1;

data salessubset;
infile "/home/u58422688/sales.csv" dlm=',';
input EmployeeId FName $ LName $ Gender $ Salary Jobtitle $ Country $ Birthdate:DATE9. Hiredate:mmddyy10.;
run;

data salessub;
set work.salessubset;
Bonus = Salary * 0.10;
run;

proc print data = salessub noobs;
format Birthdate ddmmyy10. Hiredate ddmmyy10.;
run;

*Subpart 2;

data salessubset;
infile '/home/u58422688/sales.csv' dlm=',';
input EmployeeId First_Name:$15. Last_Name:$18. Gender:$1. Salary Job_Title:$20. Country:$3. 
Birth_Date:Date9. Hire_Date:mmddyy10.;
run;

data salessub;
set work.salessubset;
Bonus = 0.10 * Salary;
keep EmployeeId First_Name Gender Salary Bonus;
if Bonus > 500;
run;

proc print data = salessub noobs;
run;

*Subpart 3;

data Phone2;
infile '/home/u58422688/phone2.csv' dlm= ',' dsd;
input Name:$20. Home_Number:$15. Office_Number:$15.;
run;

proc print data = Phone2 noobs;
run;

data Phone;
infile '/home/u58422688/phone.csv' dlm= ',' missover; 
input Name:$20. Home_Number:$15. Office_Number:$15.;
run;

proc print data = Phone noobs;
run;

*Subpart 4;

proc print data = Phone2 label noobs;
title "Employees with their Contact Details";
label Name = 'Name'
	  Office_Number = 'Office Number'
	  Home_Number = 'Home Number';
footnote "Confidential Data";
run;
