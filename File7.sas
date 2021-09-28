*Part 1;

data work.comp;
infile '/home/u58422688/sales.csv' dlm=',';
input EmployeeId First_Name:$15. Last_Name:$18. Gender:$1. Salary Job_Title:$20. Country:$3. 
Birth_Date:Date9. Hire_Date:mmddyy10.;
Bonus=500;
Compensation = sum(Salary,Bonus);
BonusMonth = month(Hire_Date);
keep First_Name Last_Name Hire_Date Birth_Date Bonus Compensation BonusMonth;
run;

proc print data=comp noobs;
format Birth_Date ddmmyy10. Hire_Date ddmmyy10.;
run;

*Part 2;

data work.bonus;
infile '/home/u58422688/sales.csv' dlm=',';
input EmployeeId First_Name:$15. Last_Name:$18. Gender:$1. Salary Job_Title:$20. Country:$3. 
Birth_Date:Date9. Hire_Date:mmddyy10.;
length Freq $ 12;
Compensation = sum(Salary,Bonus);
BonusMonth = month(Hire_Date);
if country='US' then do;
bonus=500;
Freq='Once a year';
end;
else if country='AU' then do;
bonus=300;
Freq='Twice a year';
end;
keep First_Name Last_Name Hire_Date Birth_Date Bonus Compensation Freq;
run;

proc print data=bonus noobs;
format Birth_Date ddmmyy10. Hire_Date ddmmyy10.;
run;
