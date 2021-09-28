*Part A;

data sale;
input EmployeeID FName $ LName $ Gender $ JobTitle $ Country $ Birthdate ddmmyy8. Salary Hiredate ddmmyy8.;
datalines;
1 Suraj Joshi M Manager IND 12021987 150000 26052019
2 John Doe M Manager ENG 06051983 250000 13072017
3 Lucy James F SalesRep1 DEN 01071990 175000 27062020
4 Mark Robin M SalesManager AUS 26081989 85000 15092015
5 Reena Joshi F SalesRep2 AUS 17101983 140000 23052021
6 Clark Donald M Manager CNA 20021980 167000 26052019
7 Tom Mark M SalesManager USA 14111992 65000 15052022
8 Ryleigh Matthew F SalesRep2 AUS 01021979 75000 14071999
9 John Cho M Manager JPN 22081979 90000 22042015
10 David Johnson M SalesManager RSA 29091975 17200 16032010
;

data salesubset;
set work.sale;
where Country = "AUS" and JobTitle contains "Rep";
run;

proc print data = salesubset noobs;
format Birthdate date9. Hiredate date9.;
run;

*Part B;

data salesubset;
set work.sale;
Bonus = Salary * 0.10;
where Country = "AUS" and JobTitle contains "Rep" and Hiredate < '01JAN2000'd;
run;

proc print data = salesubset noobs;
format Birthdate date9. Hiredate date9.;
run;

*Part C Subpart 1;

data salesubset;
set work.sale;
Bonus = Salary * 0.10;
where Country = "AUS" and JobTitle contains "Rep" and Hiredate < '01JAN2000'd;
drop EmployeeID Gender Country Birthdate;
run;

proc print data = salesubset noobs;
format Hiredate date9.;
run;

*Part C Subpart 2;

data salesubset;
set work.sale;
Bonus = Salary * 0.10;
where Country = "AUS" and JobTitle contains "Rep" and Hiredate < '01JAN2000'd;
keep FName LName Salary JobTitle Hiredate Bonus;
run;

proc print data = salesubset noobs;
format Hiredate date9.;
run;

*Part C Subpart 3;

data salesubset;
set work.sale;
Bonus = Salary * 0.10;
where Hiredate < '01APR2020'd;
run;

proc print data = salesubset noobs;
format Birthdate date9. Hiredate date9.;
run;

*Part D Subpart 1;

data StockDemo;
set SASHELP.stocks;
Facevalue = Open * 0.10;
drop High Low Volume;
run;

proc print data = StockDemo noobs;
run;

*Part D Subpart 2;

data StockDemo;
set SASHELP.stocks;
Facevalue = Open * 0.10;
keep Stock Volume Facevalue;
run;

proc print data = StockDemo noobs;
run;

*Part D Subpart 3;

data StockDemo;
set SASHELP.stocks;
Facevalue = Open * 0.10;
format Stock $2.;
run;

proc print data = StockDemo noobs;
run;

*Part D Subpart 4;

data StockDemo;
set SASHELP.stocks;
Facevalue = Open * 0.10;
format Open Dollar8.2 Facevalue Dollar8.2;
run;

proc print data = StockDemo noobs;
run;
