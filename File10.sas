*Part A;

data usa(keep = Employee_Id First_Name Last_Name Country Gender) australia(drop= Employee_Id Gender) other;
infile "/home/u58422688/sales.csv" dlm=',';
input Employee_Id First_Name:$15. Last_Name:$18. Gender:$1. Salary Job_Title:$20. Country:$2. Birth_Date:DATE9. Hire_Date:mmddyy10.;
if country= "AU" then output australia;
else if country = "US" then output usa;
run;

proc print data= usa noobs;
run;

proc print data =australia noobs;
format Birth_Date ddmmyy10. Hire_Date ddmmyy10.;
run;

*Part B;

data stockaccumulate(keep= stock date open stockprice close);
set sashelp.stocks;
retain stockprice 0;
stockprice=open+stockprice;
run;

proc print data = stockaccumulate noobs;
format stockprice DOLLAR10.2;
run;

*Part C;

proc sort data =sashelp.stocks
out=StockSort;
by stock;
run;

data DataStockWise;
set StockSort;
by stock;
retain stockprice;
if first.stock then stockprice=0;
stockprice=stockprice+open;
if last.stock;
run;

proc print data=DataStockWise noobs;
format stockprice DOLLAR10.2;
run;
