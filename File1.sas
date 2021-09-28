*Part A;

data Employee;
input EmployeeID FName $ LName $ Gender $ Salary;
datalines;
1 John Newman Male 10000
2 Robin Mark Male 15000
3 Lucy Jones Female 13500
4 Sarah Lee Female 17500
;

data Company;
input CompanyName $ Country $ CMMLevel NumberOfHQ;
datalines;
IBM India 3 50
Apple USA 2 25
Hitachi Germany 4 18
;

*Part B;

proc print data=Employee noobs;
run;

proc print data=Company noobs;
run;

*Part C;

proc contents data=SASHELP._ALL_;
run;

proc contents data=SASHELP._ALL nods;
run;

*Part D Subpart 1;

proc print data=SASHELP.STOCKS noobs;
var stock open date volume;
run;

*Part D Subpart 2;

proc print data=SASHELP.STOCKS noobs;
var stock open date volume;
sum open;
run;

*Part D Subpart 3;

PROC PRINT DATA=SASHELP.STOCKS NOOBS;
VAR stock open date volume;
WHERE stock IN ("Intel");
RUN;

PROC PRINT DATA=SASHELP.STOCKS NOOBS;
VAR stock open date volume;
WHERE stock LIKE "%soft";
RUN;

PROC PRINT DATA=SASHELP.STOCKS NOOBS;
VAR stock open date volume;
WHERE STOCK CONTAINS "nt";
RUN;

DATA Employee;
INPUT EmployeeID FName $ LName $ Gender $ Salary;
DATALINES;
1 John Newman Male 10000
2 Robin Mark Male 15000
3 Lucy Jones Female 13500
4 Sarah Lee Female ""
;

PROC PRINT DATA=Employee noobs;
WHERE SALARY IS NULL;
RUN;

*Part E;

proc print data=SASHELP.STOCKS noobs;
where date<="02NOV88"d;
run;

*Part F;

proc print data=SASHELP.STOCKS noobs;
where stock IN ("IBM","Microsoft");
run;

*Part G;

proc print data=SASHELP.STOCKS;
run;

proc print data= SASHELP.STOCKS;
run;

proc print data=SASHELP.AIR;
run;

proc contents data= SASHELP.AIR;
run;

proc print data=SASHELP.CARS;
run;

proc contents data = SASHELP.CARS;
run;

*Part H;

proc contents data=SASHELP._ALL_ nods;
run;
