*Part 1;

data saledataset;
infile "/home/u58422688/nonsales.csv" dlm=',';
length EmployeeID 6 Fname $ 10 Lname $ 10 Gender $ 1 Salary 8 JobTitle $ 50 Country $ 3;
input EmployeeID Fname $ Lname $ Gender $ Salary JobTitle $ Country $ BirthDate:Date9. HireDate:Date9.;
run;

proc print data = saledataset noobs;
format BirthDate Date9. HireDate Date9.;
run;  

proc FREQ data = saledataset;
tables country;
run;

proc FREQ data = saledataset;
tables country*gender;
run;

proc FREQ data = saledataset;
tables country/nocum;
run;

proc FREQ data = saledataset;
tables country/nopercent;
run;

proc FREQ data = saledataset nlevels;
run;

proc FREQ data = saledataset order=freq;
tables jobtitle;
run;

proc FREQ data = saledataset order=data;
tables jobtitle;
run;

proc FREQ data = saledataset order=formatted;
tables jobtitle;
run;

proc FREQ data = saledataset order=internal;
tables jobtitle;
run;

*Part 2;

proc FREQ data = saledataset;
tables country*gender /nocol nopercent norow;
run;

proc means data=saledataset mean SUM;
class country gender;
var salary;
run;

*Part 3;

ods select ExtremeObs;
proc univariate data=saledataset;
var salary;
run;

*Part 4;

ods pdf body="/home/u58422688/nonsales.pdf";
proc report data=saledataset;
format birthdate ddmmyy10. hiredate ddmmyy10.;
run;
ods pdf close;

ods rtf body="/home/u58422688/nonsales.rtf";
proc report data=saledataset;
format birthdate ddmmyy10. hiredate ddmmyy10.;
run;
ods rtf close;

ods html body="//home/u58422688/nonsales.html";
proc report data=saledataset;
format birthdate ddmmyy10. hiredate ddmmyy10.;
run;
ods html close;
