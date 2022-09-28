-- trigger(action) and cases

/* 6-types of triggers:
1 - before insert
2 - after insert
3 - before delete
4 - after delete
5 - before update
6 - after update
*/

-- create database
create database if not exists ineuron;
use ineuron;
#drop database ineuron;

create table if not exists course(
course_id int , 
course_desc varchar(50),
course_mentor varchar(60),
course_price int ,
course_discount int,
create_date date);


create table if not exists course_update(
course_metor_update varchar(50),
course_price_update int ,
course_discount_update int );

select * from course;

show tables;

-- create trigger 1)before insert

create table if not exists course1(
course_id int , 
course_desc varchar(50),
course_mentor varchar(60),
course_price int ,
course_discount int,
create_date date);

delimiter //
create trigger course_before_insert11
before insert 
on course1 for each row
begin
	set new.create_date = sysdate();
end ; //

select user();

select * from course1;

insert into course1 (course_id ,course_desc,course_mentor,course_price,course_discount)
value (101,'FSDA','sudhanshu',4000,10);

 select * from course1;
 
create table if not exists course2(
course_id int , 
course_desc varchar(50),
course_mentor varchar(60),
course_price int ,
course_discount int,
create_date date,
user_info varchar(50));

 select * from course2;
 
 -- create trigger
 
delimiter //
create trigger course_before_insert12
before insert 
on course2 for each row
begin
	declare user_val varchar(50);
	set new.create_date = sysdate();
    select user() into user_val;
    set new.user_info = user_val;
end ; //

 select * from course2;
 select user();
 
insert into course2 (course_id ,course_desc,course_mentor,course_price,course_discount)
value (101,'FSDA','sudhanshu',4000,10);
 
 select * from course2;
 
 select sysdate();
 
 -- relation between course and course update table
 
 create table ref_course (
record_insert_date date,
record_insert_user varchar(50)
);


delimiter //
create trigger course_before_insert13
before insert 
on course2 for each row
begin
	declare user_val varchar(50);
	set new.create_date = sysdate();
    select user() into user_val;
    set new.user_info = user_val;
    insert into ref_course values(sysdate(), user_val);
end ; //

select* from ref_course;

-- update on test2 and test3 then automaic update on test1

create table test1(
c1 varchar(50),
c2 date,
c3 int);

create table test2(
c1 varchar(50),
c2 date,
c3 int );

create table test3(
c1 varchar(50),
c2 date,
c3 int );

-- create trigger

delimiter //
create trigger to_update_others
before insert on test1 for each row 
begin
	insert into  test2 values("xyz",sysdate(),23354);
	insert into  test3 values("xyz",sysdate(),23354);
end; //

select * from test1;
select * from test2;
select * from test3;

insert into test1 values ("abc",sysdate(),234234);

select * from test1;
select * from test2;
select * from test3;

-- 2) after insert trigger

delimiter //
create trigger to_update_others_table111
after insert on test1 for each row 
begin
	update test2 set c1 = 'abc' where c1 = 'xyz';
	delete from test3 where c1 = 'xyz';
end; //

select * from test1;
select * from test2;
select * from test3;

-- to remove safe mode

SET SQL_SAFE_UPDATES=0;

insert into test1 values ("shudanshu",sysdate(),23434);
insert into test1 values ("krish",sysdate(),90077897);

select * from test1;
select * from test2;
select * from test3;

-- create trigger 3)after delete

delimiter //
create trigger to_delete_others_table1
after delete on test1 for each row 
begin
	insert into test3 values("after delete" , sysdate(), 435456);
end; //

select * from test1;
select * from test2;
select * from test3;

delete from test1 where c1 = 'sudhanshu';

delimiter //
create trigger to_delete_others_before1212
after delete on test1 for each row 
begin
	insert into test3 values("after delete" , sysdate(), 435456);
end; //

select * from test1;
select * from test2;
select * from test3;

-- create trigger 4)before delete

delimiter //
create trigger to_delete_others_before
before delete on test1 for each row 
begin
	insert into test3 values("after delete" , sysdate(), 435456);
end; //

select * from test1;
delete from test1 where c1 = 'sudhanshu';

-- before delete

delimiter //
create trigger to_delete_others_before11
before delete on test1 for each row 
begin
	insert into test3 values("after delete" , sysdate(), 435456);
end; //

select * from test1;

delimiter //
create trigger to_delete_others_before_observation2
before delete on test1 for each row 
begin
	insert into test2(c1,c2,c3) values(old.c1, old.c2,old.c3);
end; //

select * from test1;
select * from test2;

delete from test1 where c1 = 'abc';


create table test11(
c1 varchar(50),
c2 date,
c3 int);

create table test12(
c1 varchar(50),
c2 date,
c3 int );


create table test13(
c1 varchar(50),
c2 date,
c3 int );

delimiter //
create trigger to_delete_others_before_observation3
before delete on test11 for each row 
begin
	insert into test12(c1,c2,c3) values(old.c1, old.c2,old.c3);
end; //

insert into test11 values("sudh" , sysdate(), 435456);
select * from test11;

delete from test11 where c1 = 'sudh';

select * from test12;

delimiter //
create trigger to_delete_others_before_observation4
after delete on test11 for each row 
begin
	insert into test12(c1,c2,c3) values(old.c1, old.c2,old.c3);
end; //

delete from test11 where c1 = 'sudhanshu';

-- create trigger 5)after update

delimiter //
create trigger to_upate_others
after update on test11 for each row 
begin
	insert into test12(c1,c2,c3) values(old.c1, old.c2,old.c3);
end; //

select * from test11;

insert into test11 values("sudh",sysdate(),234354);

update test11 set c1 = "after update" where c1 = "after delete";

select * from  test12;

-- create trigger 6)before update

delimiter //
create trigger to_upate_others_before
before update on test11 for each row 
begin
	insert into test12(c1,c2,c3) values(new.c1, new.c2,new.c3);
end; //

select * from  test12;

update test11 set c1 = "insert new" where c1 = "sudh";
select * from  test12;

/*
1.create a table col = name , mail_id,phone_number , address , users_sys, time_sys,salary,incentive,final_salary
2.try to time all the time that uses name should start with s for each and every insert op
*/

create table employee(
name varchar(60),
mail_id varchar(60),
phone_number int,
address varchar(60),
users_sys varchar(60), 
time_sys date,
salary int,
incentive int,
final_salary int);

select * from employee;

-- cases

use ineuron_partition;

SELECT * FROM ineuron_partition.ineuron_course;

select * ,
case 
	when course_name = 'fsda' then 'this is my batch'
    else "this is not your batch"
end as statement 
from ineuron_course;

select * ,
case 
	when length(course_name) = 4  then "len 4"
    when length(course_name)= 2  then "len 2"
    else "other lenght"
end as statement 
from ineuron_course;

select * ,
case 
	when course_name = 'fsda' then sysdate()
    when course_name = 'fsds' then system_user()
    else "this is not your batch"
end as statement 
from ineuron_course;

select * from ineuron_course;



select * ,
case 
	when course_name = 'fsda' then sysdate()
    when course_name = 'fsds' then system_user()
    else "this is not your batch"
end as statement 
from ineuron_course;

update ineuron_course set course_name = case 
when course_name = 'RL' then 'reinforcement learing'
when course_name = 'dl' then 'deep learning'
end ;

select * from ineuron_course;
