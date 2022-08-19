#drop database dress_data;

create database if  not exists dress_data;
use dress_data;

create table if not exists dress(
`Dress_ID` varchar(30),	
`Style`	varchar(30),	
`Price`	varchar(30),	
`Rating`	varchar(30),	
`Size`	varchar(30),	
`Season`	varchar(30),	
`NeckLine`	varchar(30),	
`SleeveLength` varchar(30),		
`waiseline`	varchar(30),	
`Material`	varchar(30),	
`FabricType`	varchar(30),	
`Decoration`	varchar(30),	
`Pattern Type` varchar(30),		
`Recommendation` varchar(30))	;

select * from dress;

/*
LOAD DATA INFILE  'path/AttributeDataSet.csv'
into table dress 
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS; */ 

# import dataset from table data export wizart fron schemas

select * from dress;

create table if not exists test( 
test_id int  not null auto_increment,
test_name varchar(30) , 
test_mailid varchar(30),
test_address varchar(30),
primary key (test_id));

select * from test;

insert into test values(1,'shudhanshu','shudhanshu@ineuron.ai','benglaore'),
(2,'krish','krish@ineuron.ai','benglaore'),
(3,'hitesh','hitesh@ineuron.ai','benglaore'),
(4,'shubham','shubham@ineuron.ai','jaipur');

select * from test;

create table if not exists test2( 
test_id int not null auto_increment,
test_name varchar(30) , 
test_mailid varchar(30),
test_address varchar(30),
primary key (test_id));

insert into test2 (test_name,test_mailid,test_address) values
('shudhanshu','shudhanshu@ineuron.ai','benglaore'),
('krish','krish@ineuron.ai','benglaore'),
('hitesh','hitesh@ineuron.ai','benglaore'),
('shubham','shubham@ineuron.ai','jaipur');

select * from test2;

create table if not exists test3(
test_id int, 
test_name varchar(30) , 
test_mailid varchar(30),
test_address varchar(30),
test_salary int check(test_salary > 10000));

select * from test3;

insert into test3 values (1,'sudhanshu','sudhanshu@ineuron.ai','benglaore' , 50000),
(2,'krish','krish@ineuron.ai','benglaore',30000),
(3,'hitesh','hitesh@ineuron.ai','benglaore',111000),
(4,'shubham','shubham@ineuron.ai','jaipur',20000);

select * from test3;

alter table test3 add check (test_id >0) ;
insert into test3 values (19,'sudhanshu','sudhanshu@ineuron.ai','benglaore' , 50000);


create table if not exists test4( 
test_id int  ,
test_name varchar(30)   , 
test_mailid varchar(30) ,
test_address varchar(30) check (test_address= 'bengalore'),
test_salary int check(test_salary > 10000) NOT NULL,
primary key (test_id));

insert into test4 values (1,'sudhanshu','sudhanshu@ineuron.ai','bengalore' , 50000);

select * from test4;


create table if not exists test5( 
test_id int NOT NULL ,
test_name varchar(30), 
test_mailid varchar(30) ,
test_address varchar(30) check (test_address= 'bengalore'),
test_salary int check(test_salary > 10000) )


select * from test5;

insert into test5 ( test_name , test_mailid , test_address,test_salary) values
 (34,'sudhanshu','sudhanshu@ineuron.ai','bengalore' , 50000);

select * from test5;

create table if not exists test6( 
test_id int NOT NULL default 0 ,
test_name varchar(30) , 
test_mailid varchar(30),
teast_adress varchar(30) check (test_address= 'bengalore'),
test_salary int check(test_salary > 10000));

insert into test6 ( test_name , test_mailid , test_address,test_salary) values
 ('sudhanshu','sudhanshu@ineuron.ai','bengalore' , 50000);


select * from test6;
insert into test6 ( test_id,test_name , test_mailid , test_address,test_salary) values 
(101 , 'sudhanshu1','sudhanshu@ineuron.ai','bengalore' , 50000);

create table if not exists test7( 
test_id int NOT NULL default 0 ,
test_name varchar(30)  , 
test_mailid varchar(30) unique ,
test_address varchar(30) check (test_address= 'bengalore'),
test_salary int check(test_salary > 10000));

insert into test7 ( test_name , test_mailid , test_address,test_salary) values
 ('sudhanshu','sudhanshu@ineuron.ai','bengalore' , 50000);

select * from test7;

create table if not exists test8( 
test_id int NOT NULL default 0 auto_increment  ,
test_name varchar(30)  NOT NULL default 'unknown' , 
test_mailid varchar(30) unique,
test_address varchar(30) check (test_address= 'bengalore') NOT NULL,
test_salary int check(test_salary > 10000) NOT NULL,
primary key (test_id));

select * from test8;

insert into test8 ( test_id , test_name , test_mailid , test_address,test_salary) values (101 , 'sudhanshu','sudhanshu55@ineuron.ai','bengalore' , 50000);

insert into test8 ( test_name , test_mailid , test_address,test_salary) values ('sudhanshu','sudhanshu90@ineuron.ai','bengalore' , 50000);

select * from test8;



