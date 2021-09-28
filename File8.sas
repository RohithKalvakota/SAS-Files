*Part 1;

data emp1;
input EmployeeID Fname $ Lname $ Gender $ JobTitle $ Country $;
datalines;
1 Suraj Joshi M Manager IND 
2 John Doe M Manager ENG
3 Lucy James F SalesRep1 DEN
4 Mark Robin M SalesManager AUS 
5 Reena Joshi F SalesRep2 AUS
;

data emp2;
input EmployeeID Fname $ Lname $ Gender $ JobTitle $ Country $;
datalines;
6 Clark Donald M Manager CNA 
7 Tom Mark M SalesManager USA 
8 Ryleigh Matthew F SalesRep2 AUS 
9 John Cho M Manager JPN 
10 David Johnson M SalesManager RSA 
;

data empc1;
set emp1 emp2;
run;

proc print data = empc1 noobs;
run;

*Part 2;

data emp3;
input EmployeeID Fname $ Lname $ Gender $ JobTitle $ Region $;
datalines;
1 Suraj Joshi M Manager IND 
2 John Doe M Manager ENG
3 Lucy James F SalesRep1 DEN
4 Mark Robin M SalesManager AUS 
5 Reena Joshi F SalesRep2 AUS
;

data emp4;
input EmployeeID Fname $ Lname $ Gender $ JobTitle $ Country $;
datalines;
6 Clark Donald M Manager CNA 
7 Tom Mark M SalesManager USA 
8 Ryleigh Matthew F SalesRep2 AUS 
9 John Cho M Manager JPN 
10 David Johnson M SalesManager RSA 
;

data empc2;
set emp3 emp4 (rename=(Country=Region));
run;

proc print data = empc2 noobs;
run;

*Part 3;

data empsau;
input Fname $ Gender $ EmpID ;
datalines;
John M 121150
Laura F 121151
Dorothy F 121152
;

data phones;
input EmpID Type $ Phone $16.;
datalines;
121150 Home +912535645867
121150 Work +918956243569
121151 Home +914526325547
121152 Work +917854925634
121152 Home +911254388594
121152 Cell +915268648953
;

proc sort data = empsau;
by descending EmpID;
run;

proc sort data = phones;
by descending EmpID;
run;

data mergeset;
merge empsau phones;
by descending EmpID;
run;

proc print data=mergeset noobs;
run;
