# Function and Procedure

use sales;

select * from sales1;

# create own function

DELIMITER $$
CREATE FUNCTION add_to_col(a INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE b int;
    set b = a+10;
    return b;
END $$
DELIMITER ;

select * from sales1;
select quantity from sales1;

select quantity + 10 from sales1;

select add_to_col(quantity) from sales1;

# max=inbuild function
select max(sales) from sales1; 

select add_to_col(15);
select * from sales1;

#create final_profits function
DELIMITER $$
create function final_profits(profit int , discount int )
returns int
Deterministic
Begin 
Declare final_profit int ;
set final_profit = profit - discount ;
return final_profit;
end $$

select profit, discount from sales1;
select profit, discount  , final_profits(profit, discount) from sales1 ;
 
#create final_profits_real function

DELIMITER $$
create function final_profits_real(profit decimal(20,6) , discount decimal(20,6) , sales decimal(20,6) )
returns int
Deterministic
Begin 
Declare final_profit int ;
set final_profit = profit - sales * discount ;
return final_profit;
end $$

select profit, discount  ,sales ,  final_profits_real(profit, discount,sales) from sales1 ; 

# create function to convert int data into string

DELIMITER &&
create function int_to_str(a INT)
returns varchar(30)
DETERMINISTIC
BEGIN 
DECLARE b varchar(30) ;
set b = a ;
return b ;
end &&

select int_to_str(45);

select * from sales1;
select quantity,int_to_str(quantity)  from sales1 ;

# Maximun and minimum sales from sales1

select max(sales) , min(sales) from sales1 ;

/*#create 4-category

1  - 100 - super affordable product 
100-300 - affordable 
300 - 600 - moderate price 
600 + - expensive */

# create function mark_sales

DELIMITER &&
create function mark_sales(sales int ) 
returns varchar(30)
DETERMINISTIC
begin 
declare flag_sales varchar(30); 
if sales  <= 100  then 
	set flag_sales = `super affordable product` ;
elseif sales > 100 and sales < 300 then 
	set flag_sales = "affordable" ;
elseif sales >300 and sales < 600 then 
	set flag_sales = "moderate price" ;
else 
	set flag_sales = "expensive" ;
end if ;
return flag_sales;
end &&

#drop function mark_sales2;
# call the function

SELECT MARK_SALES(100);
SELECT MARK_SALES(500);
select mark_sales(755);
select mark_sales(55);
select mark_sales(20);
select sales ,mark_sales(sales) from sales1;


### LOOP:

create table loop_table(val int)

#Create procedure

Delimiter $$
create procedure insert_data()
Begin
set @var  = 10 ;
generate_data : loop
insert into loop_table values (@var);
set @var = @var + 1  ;
if @var  = 100 then 
	leave generate_data;
end if ;
end loop generate_data;
End $$

# call procedure

call insert_data();

select * from loop_table ;

#precedure having even number

Delimiter $$
create procedure insert_data1()
Begin
set @var  = 10 ;
generate_data : loop
insert into loop_table values (@var);
set @var = @var + 2  ;
if @var  = 100 then 
	leave generate_data;
end if ;
end loop generate_data;
End $$

call insert_data1();
select * from loop_table ;


# procedure having multiple of 5
# procedure having divisible by 3
Delimiter $$
create procedure insert_data2()
Begin
set @var  = 10 ;
generate_data : loop
if @val %3 = 0 then
set @var = @var+1 ;
insert into loop_table values(@var);
if @var  = 100 then 
	leave generate_data;
end if ;
end if;
end loop generate_data;
End $$

call insert_data2();

/*Task 
	1 . Create a loop for a table to insert a record into a table for two
    columns in first column you have to inset a data ranging from 1 to 100 
    and in second column you hvae to inset a square of the first column .
    */

    create table tab1(
    val1 int,
    sq_val1 int);

select * from tab1;
    
DELIMITER&&
create procedure insert_tab1()
Begin
set val1  = 1 ;
generate_data : loop
insert into tab1 values (val1);
set val1 = val1 + 1  ;
set sq_val1 = val1*val1;
if val1= 100 then 
	leave generate_data;
end if ;
end if ;
end loop generate_data;
END &&

    
	/*2 . create a user defined function to find out a date differences in 
    number of days 
    3 . create a UDF to find out a log base 10 of any given number 
    4 . create a UDF which will be able to check a total number of records
    available in your table 
    5 . create a procedure to find out  5th highest profit in your sales
    table you dont have to use rank and windowing function 
    */
