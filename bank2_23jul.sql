call bal_max();

call SELECT_REC();

DELIMITER &&
create procedure avg_bal_jobrole()
Begin
	select avg(balance) from bank_details where job='admin.';
end &&

call avg_bal_jobrole()

DELIMITER &&
create procedure avg_bal_jobrole1(IN sudh varchar(30))
Begin
	select avg(balance) from bank_details where job=sudh;
end &&

call avg_bal_jobrole1('admin.');
call avg_bal_jobrole1('retired');
call avg_bal_jobrole1('unknown');
call avg_bal_jobrole1('management');

DELIMITER &&
create procedure sel_edu_job1(in v1 varchar(30),in v2 varchar(30))
Begin
	select * from bank_details where education=v1 and job= v2;
end &&

drop procedure sel_edu_job;

call sel_edu_job1('tertiary','retired');

# create view : it is a subset of original table

call SELECT_REC();

create view bank_view as select age,job,marital,balance,education from bank_details;
select * from  bank_view
# drop view bank_view

# try to find out average balance for all the people whose job role is admin from view

select avg(balance) from bank_view where job='admin.';
