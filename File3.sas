*Part A;

data payroll;
input EmployeeID FName $ LName $ Gender $ JobTitle $ Qualification $ Country $ Birthdate ddmmyy10. Salary Hiredate ddmmyy10.;
datalines;
1 Suraj Joshi M Manager PG India 12/02/1987 150000 26/05/2019
2 John Doe M Manager UG England 06/05/1983 250000 13/07/2017
3 Lucy James F SalesRep1 PG Denmark 01/07/1990 175000 27/06/2020
4 Mark Robin M SalesManager Diploma Canada 26/08/1989 85000 15/09/2015
5 Reena Joshi F SalesRep2 PG India 17/10/1983 140000 23/05/2021
6 Clark Donald M Manager UG Canada 20/02/1980 167000 26/05/2019
7 Tom Mark M SalesManager Diploma USA 14/11/1992 65000 15/05/2022
8 Ryleigh Matthew F SalesRep2 PG China 01/02/1979 75000 15/07/2019
9 John Cho M Manager Diploma Japan 22/08/1979 90000 22/04/2015
10 David Johnson M SalesManager UG Russia 29/09/1975 17200 16/03/2010
;

proc sort data=payroll out=sortpayroll;
by Country descending Salary;
run;

proc print data=sortpayroll noobs;
format Birthdate DATE9. Hiredate DATE9.;
by Country;
sum Salary;
run;

*Part B;

proc sort data=payroll out=sortpayroll;
by Country descending Salary;
run;

title1 'Employee and Total Salary for each Country';
footnote 'Confidential Details';

proc print data=sortpayroll noobs;
format Birthdate DATE9. Hiredate DATE9.;
sum Salary;
by Country;
run;

title;
footnote;

*Part C;

data payroll;
input E_ID FName $ L_Name $ Gender $ JobTitle $ Qualification $ Country $ Birthdate ddmmyy10. Sal Hiredate ddmmyy10.;
datalines;
1 Suraj Joshi M Manager PG India 12/02/1987 150000 26/05/2019
2 John Doe M Manager UG England 06/05/1983 250000 13/07/2017
3 Lucy James F SalesRep1 PG Denmark 01/07/1990 175000 27/06/2020
4 Mark Robin M SalesManager Diploma Canada 26/08/1989 85000 15/09/2015
5 Reena Joshi F SalesRep2 PG India 17/10/1983 140000 23/05/2021
6 Clark Donald M Manager UG Canada 20/02/1980 167000 26/05/2019
7 Tom Mark M SalesManager Diploma USA 14/11/1992 65000 15/05/2022
8 Ryleigh Matthew F SalesRep2 PG China 01/02/1979 75000 15/07/2019
9 John Cho M Manager Diploma Japan 22/08/1979 90000 22/04/2015
10 David Johnson M SalesManager UG Russia 29/09/1975 17200 16/03/2010
;

proc print data=payroll label;
title1 'Details for each Employee';
footnote 'Confidential Details';

var E_ID L_Name Sal;
label
E_ID = 'Employee ID' 
L_Name='Last Name'  
Sal= 'Salary';   
run;

title;
footnote;
