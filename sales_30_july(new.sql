create database if not exists  sales;
use sales1;

#drop database sales;

CREATE TABLE if not exists sales1 (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL , 
	ship_date VARCHAR(15) NOT NULL , 
	ship_mode VARCHAR(14) NOT NULL,
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 8) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL);

select * from sales1;
select count(*) from sales1;

drop table sales1;

#load data in bulk:
# Load data from python by using csvkit library-pip install csvkit(in cmd)

#csvsql --dialect mysql --snifflimit 100000 sales_data_final.csv > output_sales.sql

SET SESSION sql_mode = '';
SET SQL_SAFE_UPDATES = 0;

show variables like 'local_infile';
show variables like 'secure_file_prive';

SET global local_infile = 'ON';
SET GLOBAL local_infile=1;

LOAD DATA local INFILE "F://FSDA1//live//mysql//myfile1//sales_data_final.csv"
INTO table sales1
FIELDS TERMINATED BY ',' 
ENCLOSED by '"'
lines TERMINATED BY '\n'
IGNORE 1 ROWS;

select count(*) from sales1;
select * from sales1;

# convert string into date formate using 'str_to_date function' :

select str_to_date(order_date,'%d/%m/%Y') from sales1;
select * from sales1;

# create new column order_date_new

alter table sales1 add column order_date_new date after order_date;

#store records in order_date_new column
update sales1 set order_date_new = str_to_date(order_date,'%d-%m-%Y');

select * from sales1;

# add colume ship_date_new
alter table sales1  add column ship_date_new date after ship_date;

#fill reocrds  in ship_date_new
select str_to_date(ship_date,'%m-%d-%Y') from sales1;
update sales1 set ship_date_new = str_to_date(ship_date,'%d-%m-%Y');

select * from sales1;

#perfoming some operation by using comparision operator

select * from sales1 where ship_date_new ='2011-01-05';
select * from sales1 where ship_date_new >'2011-01-05';
select * from sales1 where ship_date_new <'2011-01-05';

# record between 

select * from sales1 where ship_date_new between '2011-01-05' and '2011-08-30';
select count(*) from sales1 where ship_date_new between '2011-01-05' and '2011-08-30';

# current date and time of sysytem

select now();
select curdate();
select curtime();

#record from 1 week interval

select * from sales1 where ship_date_new < date_sub(now(),interval  1 week);
select count(*) from sales1 where ship_date_new < date_sub(now(),interval  1 week);

select date_sub(now(),interval  1 week);
select date_sub(now(),interval  30 day);
select date_sub(now(),interval  30 year);

# to find current year
select year(now());

#to find day
select dayname('2022-09-20 21:10:30');
select dayname('2022-12-23 21:10:30');
select dayname('2023-02-24 21:10:30');

# create new column flag date column with current date

alter table sales1 add column flag date after order_id;
select * from sales1;

#fill flag column with current date
update sales1 set flag =now(); 

select * from sales1;

alter table sales1 modify column year datetime;

update sales1 set year = year(flag);

select * from sales1;

#add column Year_new, Month_new & day_new 

alter table sales1 add column Year_new int;
alter table sales1 add column Month_new int;
alter table sales1 add column Day_new int;

select * from sales1;

alter table sales1 modify column Year_New int;
alter table sales1 modify column Month_new int;
alter table sales1 modify column Day_new int;
select * from sales1;

#fills the columns year_new,month_new and day_new

update  sales1 set Year_new = str_to_date(order_date,'%Y');
update  sales1 set Month_new =str_to_date(order_date,'%m');
update  sales1 set Day_new =str_to_date(order_date,'%d');

select * from sales1;

#insert records

update sales1 set Month_new= month(order_date_new);
update sales1 set Day_new= day(order_date_new);
update sales1 set Year_new= year(order_date_new);

# fetching top 5 records 
select * from sales1 limit 5;

#Average sales from Year_new
select Year_new  , avg(sales) from sales1 group by Year_new;

# total sum,max and minimun sales from Year_new column

select Year_new  , sum(sales) from sales1 group by Year_new;
select Year_new  , min(sales) from sales1 group by Year_new;
select Year_new  , max(sales) from sales1 group by Year_new;

# no. of quantity sales every year selling
select Year_new , sum(quantity) from sales1 group by Year_new;

# find sumation and discount
select (discount+shipping_cost)  as CTC from sales1;
select (sales*discount+shipping_cost)  as SCTC from sales1;

select * from sales1 ;

#create new column discount_flag (yes/no)

alter table sales1 add column discount_flag varchar(20) after discount;
select * from sales1 ;

#fill records in discount_flag if discount > 0 ,'yes','no' -> condition

select order_id ,discount , if(discount > 0 ,'yes','no' ) as discount_flag from sales1;
update sales1 set discount_flag = if(discount > 0 ,'yes','no');

select * from sales1 ;

#no of record in discount_flag with discount and without discount
select discount_flag , count(*) from sales1 group by discount_flag ;

select count(*) from  sales1 where discount > 0 ;
select count(*) from sales1 where discount = 0;

