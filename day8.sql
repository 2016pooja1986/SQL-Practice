use google;
create table employee (
emp_ID int
, emp_NAME varchar(50)
, DEPT_NAME varchar(50)
, SALARY int);
desc employee;
insert into employee 
values
(101, 'Mohan', 'Admin', 4000),
(102, 'Rajkumar', 'HR', 3000),
(103, 'Akbar', 'IT', 4000),
(104, 'Dorvin', 'Finance', 6500),
(105, 'Rohit', 'HR', 3000),
(106, 'Rajesh',  'Finance', 5000),
(107, 'Preet', 'HR', 7000),
(108, 'Maryam', 'Admin', 4000),
(109, 'Sanjay', 'IT', 6500),
(110, 'Vasudha', 'IT', 7000),
(111, 'Melinda', 'IT', 8000),
(112, 'Komal', 'IT', 10000),
(113, 'Gautham', 'Admin', 2000),
(114, 'Manisha', 'HR', 3000),
(115, 'Chandni', 'IT', 4500),
(116, 'Satya', 'Finance', 6500),
(117, 'Adarsh', 'HR', 3500),
(118, 'Tejaswi', 'Finance', 5500),
(119, 'Cory', 'HR', 8000),
(120, 'Monica', 'Admin', 5000),
(121, 'Rosalin', 'IT', 6000),
(122, 'Ibrahim', 'IT', 8000),
(123, 'Vikram', 'IT', 8000),
(124, 'Dheeraj', 'IT', 11000);
select * from employee;
select *,max(salary) max_salary from employee
group by DEPT_NAME having emp_NAME = (select emp_NAME from employee where salary = max(salary));
use google;

select e.* ,
max(salary) over() max_salary
from employee e;

select * from (select e.* ,
max(salary) over(partition by DEPT_NAME) max_salary
from employee e) x
where x.salary = max(salary) over(partition by DEPT_NAME);

select e.* ,
min(salary) over(partition by DEPT_NAME) max_salary
from employee e;

select e.* ,
avg(salary) over(partition by DEPT_NAME) max_salary
from employee e;
select e.* ,
row_number() over(partition by DEPT_NAME) row_num
from employee e;
select * from 
(select e.* ,
row_number() over(partition by DEPT_NAME) row_num
from employee e) x
where row_num < 3;

select * from
(select e.* ,
rank() over(partition by DEPT_NAME order by salary desc) rank_num
from employee e) x
where x.rank_num < 4;

select e.* ,
dense_rank() over(partition by DEPT_NAME order by salary desc) dr_num
from employee e;

select e.*,
rank() over(partition by dept_name order by salary desc) as rnk,
dense_rank() over(partition by dept_name order by salary desc) as dense_rnk,
row_number() over(partition by dept_name order by salary desc) as rn
from employee e;

select e.*,
lag(salary) over(partition by DEPT_NAME order by emp_ID) as prev_emp_sal,
case
when e.salary > lag(salary) over(partition by DEPT_NAME order by emp_ID) then 'Higher than previous employee'
     when e.salary < lag(salary) over(partition by DEPT_NAME order by emp_ID) then 'Lower than previous employee'
	 when e.salary = lag(salary) over(partition by DEPT_NAME order by emp_ID) then 'Same than previous employee' end as sal_range
     from employee e;
     
     
     
select e.*,
lead(salary) over(partition by DEPT_NAME order by emp_ID) as next_emp_sal,
case
when e.salary > lead(salary) over(partition by DEPT_NAME order by emp_ID) then 'Higher than next employee'
     when e.salary < lead(salary) over(partition by DEPT_NAME order by emp_ID) then 'Lower than next employee'
	 when e.salary = lead(salary) over(partition by DEPT_NAME order by emp_ID) then 'Same than next employee' end as sal_range
     from employee e;
     
select e.*,
lag(salary) over(partition by dept_name order by emp_id) as prev_empl_sal,
lead(salary) over(partition by dept_name order by emp_id) as next_empl_sal
from employee e;

     