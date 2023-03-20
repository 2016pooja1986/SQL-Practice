use Company;
show tables;
--- Q-1. Write an SQL query to fetch “FIRST_NAME” from employees table using the alias name as <employee_NAME>.--
Select first_name as  EMPLOYEE_NAME  from employees ;
--- Q-2. Write an SQL query to fetch unique values of DEPARTMENT from departments table.---
Select DISTINCT department_name from departments ;

--- Q-3. Write an SQL query to show the last 5 record from employees table.---
(select * from employees order by employee_id desc limit 5) order by employee_id;

--- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from employees table---
select substr(first_name,1,3) as short_name
from employees;

---  Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Alexander’ from employees table.---
select instr(first_name,'a') from employees where first_name='Alexander' limit 1;

--- Q-6. Write an SQL query to print the name of employees having the highest salary in each department.---
select department_name,first_name,
first_value(salary) over(partition by e.department_id order by salary desc) highest_salary from employees e
join departments d on e.department_id = d.department_id;

--- Q-7. Write an SQL query to print the FIRST_NAME from employees table after removing white spaces from the right side.--
select rtrim(first_name) as first_name from employees;

--- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from departments table and prints its length.

select distinct department_name, length(department_name) as dept_name_len from departments;
--- Q-9. Write an SQL query to fetch nth max salaries from a table.---
select *,
nth_value(salary,2) over(order by salary desc range between unbounded preceding and unbounded following) as 2nd_max_salary 
from employees;

--- Q-10. Write an SQL query to print the FIRST_NAME from employees table after replacing ‘a’ with ‘A’.---
select replace(first_name,'a','A') as FiRsT_nAmE from employees;
--- Q-11. Write an SQL query to print all Worker details from the employees table order by FIRST_NAME Ascending and DEPARTMENT Descending.---
select * from employees order by first_name , department_id desc;

--- Q-12. Write an SQL query to fetch the names of workers who earn the highest salary.--
select concat(first_name,' ',last_name) as Employee_name 
from employees where salary=(select max(salary) from employees);

--- Q-13. Write an SQL query to print details of workers excluding first names, “Valli” and “Shelli” from employees table. --
select * from employees
where first_name not in ('Valli','Shelli');
--- Q-14. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘l’ and contains six alphabets.---
select * from employees
where first_name like '_____l';
--- Q-15. Write a query to validate Email of Employee.---
select *,
case 
when email like '%.%@sqltutorial.org' then 'Valid email id' 
else 'Invalid email id' end Validation
from employees;

--- Q-16. Write an SQL query to print details of the Workers who have joined in Feb’2014.---
select * from employees
where year(hire_date) ='1996' and month(hire_date) = 2;
--- Q-17. Write an SQL query to fetch duplicate records having matching data in some fields of a table.--
select  first_name,count(first_name) as count from employees group by first_name
having count>1;
--- Q-18. How to remove duplicate rows from Employees table.---
select first_name,last_name,email,phone_number,hire_date,job_id ,count(*) 
from employees group by first_name,last_name,email,phone_number,hire_date,job_id
having count(*) >1;

--- Q-19. Write an SQL query to show only odd rows from a table.---
select * from 
(
select 
row_number() over(order by employee_id) as rn,e.* from employees e
) x
where x.rn % 2 !=0;
--- Q-20. Write an SQL query to clone a new table from another table.--
create table clone_emp like employees;
insert into clone_emp select * from employees;
show tables;
select * from clone_emp;

--- Q-21. Write an SQL query to fetch intersecting records of two tables.--- 
select employee_id,e.department_id,department_name,first_name,last_name,email
from employees e
join departments d on e.department_id =d.department_id;
--- Q-22. Write an SQL query to show records from one table that another table does not have.---
SELECT *
FROM departments
WHERE department_id NOT IN
    (SELECT department_id 
     FROM employees);
--- Q-23.  Write an SQL query to show the top n (say 10) records of a table.-- 
select * from employees limit 10;
--- Q-24. Write an SQL query to determine the nth (say n=5) highest salary from a table.--
select * from employees order by salary desc limit 4,1;
--- Q-25. Write an SQL query to determine the 5th highest salary without using TOP or limit method.
select concat(x.first_name,' ',x.last_name) Emp_name,x.salary as 5th_highest_sal,x.department_id,job_id,manager_id
 from (select *,
dense_rank() over(order by salary desc) as dr 
from employees) x
where x.dr=5;
--- Q-26. Write an SQL query to fetch the list of employees with the same salary.---
SELECT employee_id, EmpName, salary From
 (
 SELECT employee_id,concat(first_name,' ',last_name) EmpName, salary, Count(*) Over (Partition by salary) as SalaryCnt
 FROM employees
 ) x
WHERE x.SalaryCnt>1
ORDER By salary Desc

    