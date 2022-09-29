-- Normalization and pivote table

create database pivote;

use pivote;
#drop table order_table
create table order_table(
order_id int,
employee_id int,
vendor_id int);

select * from order_table;

insert into order_table values (1, 258, 1580),
(2, 254, 1496),
(3, 257, 1494),
(4, 261, 1650),
(5, 251, 1654),
(6, 255, 1664);


select * from order_table;

-- creating pivot table

select vendor_id,
if(employee_id = 254,1,NULL) as emp254,
if(employee_id = 257,1,NULL) as emp257,
if(employee_id = 261,1,NULL) as emp261,
if(employee_id = 251,1,NULL) as emp251,
if(employee_id = 253,1,NULL) as emp253
from order_table;

select order_id,
if(employee_id = 254,1,NULL) as emp254,
if(employee_id = 257,1,NULL) as emp257,
if(employee_id = 261,1,NULL) as emp261,
if(employee_id = 251,1,NULL) as emp251,
if(employee_id = 253,1,NULL) as emp253
from order_table;
