create database key_prim;
use key_prim;
#drop database key_prim;

create table if not exists ineuron(
course_id int not null,
course_name varchar(60),
course_status varchar(40),
number_of_enro int,
primary key(course_id));

insert into ineuron values(01,"FSDA",'active',100);
insert into ineuron values(02,"FSDA",'not-active',100);

select * from ineuron;

create table if not exists student_ineuron(
student_id int not null,
course_name varchar(60),
student_mail varchar(60),
student_status varchar(40),
course_id1 int,
foreign key (course_id1) references ineuron(course_id));

select * from student_ineuron;

insert into student_ineuron values(101,"FSDA",'test@gmail.com','active',05);
insert into student_ineuron values(101,"FSDA",'test@gmail.com','active',01);
insert into student_ineuron values(101,"FSDA",'test@gmail.com','active',01);
insert into student_ineuron values(101,"FSDA",'test@gmail.com','active',01);

select * from student_ineuron;  

create table payment(
course_name varchar(60),
course_id int ,
course_live_status varchar(60),
course_launch_date varchar(60),
foreign key(course_id) references ineuron(course_id));

insert into payment values ('fsda',01,'not-active','7th aug');
insert into payment values ('fsda',05,'active','7th aug');
insert into payment values ('fsda',06,'not-active','7th aug');

select * from payment;  


create  table class(
course_id int ,
class_name varchar(60),
class_topic varchar(60),
class_duration int ,
primary key(course_id),
foreign key(course_id) references ineuron(course_id));

select * from class;  
alter table ineuron drop primary key; # not working 

alter table class drop primary key;

alter table ineuron ADD CONSTRAINT test_prim primary key (course_id,course_name);

drop table ineuron; #parent table not drop

drop table class;

create table test(
id int not null , 
name varchar(60),
email_id varchar(60),
mobile_no varchar(9),
address varchar(50));

select * from test;  

alter table test add primary key(id);

alter table test drop primary key; 

alter table test add constraint test_prim primary key(id , email_id);
select * from test;  

create table parent(
id int not null ,
primary key(id));

create table child (
id int ,
parent_id int ,
foreign key (parent_id) references parent(id));

insert into parent values(1);
insert into parent values(2);

select * from parent ;

insert into child values(1,1);

select * from child ;

insert into child values(2,2); # not working

delete from parent where id =1; # not deleted
delete from child where id =1;

# cascade option

drop table child;

create table child (
id int ,
parent_id int ,
foreign key (parent_id) references parent(id) on delete cascade );

insert into child values(1,1),(1,2),(3,2),(2,2);

select * from child;

select * from parent;
delete from parent where id  = 1;

update parent set id = 3 where id = 2;

drop table child;

create table child (
id int ,
parent_id int ,
foreign key (parent_id) references parent(id) on update cascade );

insert into child values(1,1),(1,2),(3,2),(2,2);

select * from child ; 
select * from parent;

delete from parent where id=1;
select * from child ; # automatic update child table
select * from parent;

update parent set id = 3 where id = 2;

drop table child;

create table child (
id int ,
parent_id int ,
foreign key (parent_id) references parent(id) on update cascade );

insert into child values(1,1),(1,2),(3,2),(2,2);

select * from child ; 
select * from parent;
update parent set id = 3 where id = 2;

create table child1 (
id int ,
parent_id int ,
foreign key (parent_id) references parent(id) on update cascade
on delete cascade );

select * from child1 ; 
