*Part A;

data sales;
input EmployeeID FName $ LName $ Gender $ JobTitle $ Country $ Birthdate ddmmyy10. Salary Hiredate ddmmyy10.;
datalines;
1 Suraj Joshi M Manager India 12/02/1987 150000 26/05/2019
2 John Doe M Manager England 06/05/1983 250000 13/07/2017
3 Lucy James F SalesRep1 Denmark 01/07/1990 175000 27/06/2020
4 Mark Robin M SalesManager Canada 26/08/1989 85000 15/09/2015
5 Reena Joshi F SalesRep2 India 17/10/1983 140000 23/05/2021
6 Clark Donald M Manager Canada 20/02/1980 167000 26/05/2019
7 Tom Mark M SalesManager USA 14/11/1992 65000 15/05/2022
8 Ryleigh Matthew F SalesRep2 China 01/02/1979 75000 15/07/2019
9 John Cho M Manager Japan 22/08/1979 90000 22/04/2015
10 David Johnson M SalesManager Russia 29/09/1975 17200 16/03/2010
;

proc print data = sales noobs;
format Birthdate date9. Hiredate date9.;
run;

*Part B Subpart 1;

proc print data=sales noobs;
format Birthdate DATE9. Hiredate DATE9.;
where country IN ('India','Canada');
run;

*Part B Subpart 2;

proc print data=sales noobs;
format Birthdate DATE9. Hiredate DATE9.;
where JobTitle like '%Rep%';
run;

*Part B Subpart 3;

proc print data=sales noobs;
format Birthdate DATE9. Hiredate DATE9.;
where (Salary>50000 and Salary<100000);
run;

*Part C;

proc sort data=sales out=sortsales;
by country;
run;

proc print data=sortsales noobs;
format birthDate DATE9. hireDate DATE9.;
run;

*Part D;

proc sort data=sales out=sortsales;
by Country descending Salary;
run;

title1 'Employee Salary Report by Country';
footnote 'Confidential';

proc print data=sortsales noobs;
format Birthdate DATE9. Hiredate DATE9.;
sum Salary;
by Country;
run;

title;
footnote;
