show databases;
drop database ineuron_fsda;

create database if not exists ineuron_fsda;
use ineuron_fsda;
create table if not exists bank_details(
age int,
job varchar(30),
marital varchar(30),
education  varchar(30),
`default` varchar(30),
balance int,
housing varchar(30),
loan varchar(30),
contact varchar(30),
`day` int,
`month` varchar(30),
duration int,
campaign int,
pday int,
previous int,
poutcome varchar(30),
y varchar(30));

select * from bank_details;

insert into bank_details values
(58,"management","married","tertiary","no",2143,"yes","no","unknown",5,"may",261,1,-1,0,"unknown","no");
select * from bank_details;

insert into bank_details values
(44,"technician","single","secondary","no",29,"yes","no","unknown",5,"may",151,1,-1,0,"unknown","no"),
(33,"entrepreneur","married","secondary","no",2,"yes","yes","unknown",5,"may",76,1,-1,0,"unknown","no"),
(47,"blue-collar","married","unknown","no",1506,"yes","no","unknown",5,"may",92,1,-1,0,"unknown","no"),
(33,"unknown","single","unknown","no",1,"no","no","unknown",5,"may",198,1,-1,0,"unknown","no"),
(35,"management","married","tertiary","no",231,"yes","no","unknown",5,"may",139,1,-1,0,"unknown","no"),
(28,"management","single","tertiary","no",447,"yes","yes","unknown",5,"may",217,1,-1,0,"unknown","no"),
(42,"entrepreneur","divorced","tertiary","yes",2,"yes","no","unknown",5,"may",380,1,-1,0,"unknown","no"),
(58,"retired","married","primary","no",121,"yes","no","unknown",5,"may",50,1,-1,0,"unknown","no"),
(43,"technician","single","secondary","no",593,"yes","no","unknown",5,"may",55,1,-1,0,"unknown","no"),
(41,"admin.","divorced","secondary","no",270,"yes","no","unknown",5,"may",222,1,-1,0,"unknown","no"),
(29,"admin.","single","secondary","no",390,"yes","no","unknown",5,"may",137,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",6,"yes","no","unknown",5,"may",517,1,-1,0,"unknown","no"),
(58,"technician","married","unknown","no",71,"yes","no","unknown",5,"may",71,1,-1,0,"unknown","no"),
(58,"technician","married","unknown","no",71,"yes","no","unknown",5,"may",71,1,-1,0,"unknown","no"),
(51,"retired","married","primary","no",229,"yes","no","unknown",5,"may",353,1,-1,0,"unknown","no"),
(45,"admin.","single","unknown","no",13,"yes","no","unknown",5,"may",98,1,-1,0,"unknown","no"),
(57,"blue-collar","married","primary","no",52,"yes","no","unknown",5,"may",38,1,-1,0,"unknown","no"),
(60,"retired","married","primary","no",60,"yes","no","unknown",5,"may",219,1,-1,0,"unknown","no"),
(33,"services","married","secondary","no",0,"yes","no","unknown",5,"may",54,1,-1,0,"unknown","no"),
(28,"blue-collar","married","secondary","no",723,"yes","yes","unknown",5,"may",262,1,-1,0,"unknown","no"),
(56,"management","married","tertiary","no",779,"yes","no","unknown",5,"may",164,1,-1,0,"unknown","no"),
(32,"blue-collar","single","primary","no",23,"yes","yes","unknown",5,"may",160,1,-1,0,"unknown","no"),
(25,"services","married","secondary","no",50,"yes","no","unknown",5,"may",342,1,-1,0,"unknown","no"),
(40,"retired","married","primary","no",0,"yes","yes","unknown",5,"may",181,1,-1,0,"unknown","no"),
(44,"admin.","married","secondary","no",-372,"yes","no","unknown",5,"may",172,1,-1,0,"unknown","no"),
(39,"management","single","tertiary","no",255,"yes","no","unknown",5,"may",296,1,-1,0,"unknown","no"),
(52,"entrepreneur","married","secondary","no",113,"yes","yes","unknown",5,"may",127,1,-1,0,"unknown","no"),
(46,"management","single","secondary","no",-246,"yes","no","unknown",5,"may",255,2,-1,0,"unknown","no"),
(36,"technician","single","secondary","no",265,"yes","yes","unknown",5,"may",348,1,-1,0,"unknown","no"),
(57,"technician","married","secondary","no",839,"no","yes","unknown",5,"may",225,1,-1,0,"unknown","no"),
(49,"management","married","tertiary","no",378,"yes","no","unknown",5,"may",230,1,-1,0,"unknown","no"),
(60,"admin.","married","secondary","no",39,"yes","yes","unknown",5,"may",208,1,-1,0,"unknown","no"),
(59,"blue-collar","married","secondary","no",0,"yes","no","unknown",5,"may",226,1,-1,0,"unknown","no"),
(51,"management","married","tertiary","no",10635,"yes","no","unknown",5,"may",336,1,-1,0,"unknown","no");

select * from bank_details;

select count(*) from bank_details;
select age,loan, job from bank_details;

select `default` from bank_details;

select * from bank_details  limit 5;
select * from bank_details  limit 10;

select * from bank_details where age=33;
select * from bank_details;

select * from bank_details where age=58;

select * from bank_details where age=58 and job='retired';

select * from bank_details;
select * from bank_details where marital='single' and job='admin.';

select * from bank_details;

select * from bank_details where education='unknown' or marital='single';

select * from bank_details where (education='unknown' or marital='single') and balance=447;

select * from bank_details where (education='unknown' or marital='single') and balance < 447;

select * from bank_details;

select distinct job from bank_details;
select * from bank_details;

select * from bank_details order by age;
select * from bank_details order by age desc;

/* Q.with this data try to find out sum of balance 
1. try to find out average of balance
2. try to out who is haviing a min balance
3. try to out who is haviing a maximum balance
4. try to prepare a list all the person who having loan 
5. try to find out a person average balance for all the people whose job role is admmin
6. try to find out a record without job whose age is below 45
7. try to find a record where education is primary and person is jobless
8. try to find record whose bank balance is having a negative balance
9. try to find out a record who is not having house at all along with there balance 
*/

select * from bank_details;
/* ans:*/
/* 1:* try to find out average of balance */
select avg(balance) from bank_details;

/* 2: try to out who is haviing a min balance
*/
select * from bank_details order by balance limit 1;

select *, min(balance) from bank_details; # not corrct 
select * from bank_details where balance in (select min(balance) from bank_details); 
select * from bank_details where balance = (select min(balance) MinBalance from bank_details); 

/* 3: try to out who is haviing a maximum balance */
select * from bank_details where balance in (select max(balance) from bank_details); 
select * from bank_details where balance = (select max(balance) MaxBalance from bank_details); 

select * from bank_details order by balance desc limit 1;

/* 4: try to prepare a list all the person who having loan */
select * from bank_details;

select * from bank_details where loan='yes';

/* 5: try to find out a person average balance for all the people whose job role is admmin */
select * from bank_details where job='admin.';

/* 6: try to find out a record without job whose age is below 45 */

select * from bank_details;

select * from bank_details where job='unknown' and age <=45;

/* 7: try to find a record where education is primary and person is jobless */
select * from bank_details;
select * from bank_details where education='primary' and job='unknown' ;

/* 8: try to find record whose bank balance is having a negative balance */
select * from bank_details;
select * from bank_details  where balance < 0 ;

/* 9:. try to find out a record who is not having house at all along with there balance 
*/
select * from bank_details;
select balance,housing from bank_details where housing ='no';

select * from bank_details;

DELIMITER &&
CREATE procedure sk()
BEGIN
select * from bank_details;
END &&

CALL sk()

DELIMITER &&
CREATE procedure bal_max()
BEGIN
select * from bank_details where balance in (select max(balance) from bank_details); 
END &&

call bal_max()

DELIMITER &&
CREATE procedure avg_bal_jobrole1(in SWATI varchar (30))

BEGIN
select avg(balance) from bank_details where job=SWATI;
END &&

call avg_bal_jobrole1('admin.');

call avg_bal_jobrole1('retired');
call avg_bal_jobrole1('unknown');

DELIMITER &&
CREATE procedure sel_edu_job1(in v1 varchar (30),in v2 varchar (30))

BEGIN
select * from bank_details where education=v1 and job=v2 ;
END &&

call sel_edu_job1;
CALL sk()
call sel_edu_job1( 'tertiary','retired')

create view bank_view as select age , job , marital, balance, education from bank_details;

select avg(balance) from bank_view where job='admin.';






