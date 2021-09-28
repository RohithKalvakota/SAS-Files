*Part A;

data payroll;
input EmployeeID FName $ LName $ Gender $ JobTitle $ Qualification $ Country $ Birthdate ddmmyy10. Salary Hiredate ddmmyy10.;
datalines;
1 Suraj Joshi M Manager PG IND 12/02/1987 150000 26/05/2019
2 John Doe M Manager UG ENG 06/05/1983 250000 13/07/2017
3 Lucy James F SalesRep1 PG DEN 01/07/1990 175000 27/06/2020
4 Mark Robin M SalesManager Diploma CND 26/08/1989 85000 15/09/2015
5 Reena Joshi F SalesRep2 PG IND 17/10/1983 140000 23/05/2021
6 Clark Donald M Manager UG CND 20/02/1980 167000 26/05/2019
7 Tom Mark M SalesManager Diploma USA 14/11/1992 65000 15/05/2022
8 Ryleigh Matthew F SalesRep2 PG CNA 01/02/1979 75000 15/07/2019
9 John Cho M Manager Diploma JPN 22/08/1979 90000 22/04/2015
10 David Johnson M SalesManager UG RUS 29/09/1975 17200 16/03/2010
;

proc print data=payroll noobs;
var FName LName Country JobTitle Salary HireDate;
format Salary Dollar10. Hiredate ddmmyy10.;
run;

*Part B;

proc print data=SASHELP.stocks noobs;
format Open Dollar9.2 High Dollar8. Low Dollar12. Close Dollar5.2; 
run;

proc print data=SASHELP.stocks noobs;
format Volume Comma12.2; 
run;

proc print data=SASHELP.stocks noobs;
format Volume Comma8.; 
run;

proc print data=SASHELP.stocks noobs;
format Volume Comma5.2; 
run;

proc print data=SASHELP.stocks noobs;
format Volume Commax12.2; 
run;

proc print data=SASHELP.stocks noobs;
format Volume Commax8.2; 
run;

proc print data=SASHELP.stocks noobs;
format Open Commax5.2; 
run;

proc print data=SASHELP.stocks noobs;
format Date MMDDYY8.; 
run;

proc print data=SASHELP.stocks noobs;
format Date MMDDYY6.; 
run;

proc print data=SASHELP.stocks noobs;
format Date DDMMYY10.; 
run;

proc print data=SASHELP.stocks noobs;
format Date Date7.; 
run;

proc print data=SASHELP.stocks noobs;
format Date Date9.; 
run;

proc print data=SASHELP.stocks noobs;
format Date MonYY7.; 
run;

proc print data=SASHELP.stocks noobs;
format Date Year4.; 
run;

*Part C;

proc format;
value $Countryfmt 
"IND" = "INDIA"
"CND" = "CANADA"
"ENG" = "ENGLAND"
other = "Others";
run;

proc print data=payroll noobs;
var FName LName Country Salary Birthdate Hiredate;
format Salary Dollar10. Birthdate ddmmyy10. Country $Countryfmt. Hiredate ddmmyy10.;
run;

*Part D;

proc format;
value tier 0 - 59999 = 'Tier1'
           60000 - 149999 = 'Tier2'
           150000 - 300000 = 'Tier3';
run;

proc print data=payroll noobs;
format Salary tier. Hiredate ddmmyy10. Birthdate ddmmyy10.;
run;

proc format;
value class low-<100000 = 'Class1'
            100000-<200000 = 'Class2'
            200000-high = 'Class3';
run;

proc print data = payroll noobs;
format Salary class. Hiredate ddmmyy10. Birthdate ddmmyy10.;
run;
