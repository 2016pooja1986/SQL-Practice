create database company;
use company;
create table department(
id int primary key auto_increment,
name varchar(50) not null
);
show tables;
describe department;

create table company(
cmp_id int primary key auto_increment,
name varchar(50) not null,
revenue int
);

create table employee(
emp_id int primary key auto_increment,
emp_name varchar(150) not null,
city varchar(150) not null,
dept_id int ,
salary int,
FOREIGN KEY (dept_id) REFERENCES department(id)
);

insert into department (id,name) values 
('IT'),
('Management'),
('IT'),
('Support');
select * from department;

insert into company  values 
(1, 'IBM', 2000000),
(2, 'GOOGLE', 9000000),
(3, 'Apple', 10000000);
select * from company;

insert into employee  values 
(1, 'David', 'London', 1, 80000),
(2, 'Emily', 'London', 3, 70000),
(3, 'Peter', 'Paris', 1, 60000),
(4, 'Ava', 'Paris', 3, 50000),
(5, 'Penny', 'London', 2, 110000),
(6, 'Jim', 'London', 2, 90000),
(7, 'Amy', 'Rome', 3, 30000),
(8, 'Cloe', 'London', 1, 110000);
select * from employee;


use company;
--  Query all rows from Department table
select * from department;

-- Change the name of department with id =  1 to 'Management'
UPDATE department
SET name = 'Management'
WHERE id = 1;

-- Delete employees with salary greater than 100 000
delete from employee
where salary >100000;

-- Query the names of companies
select name from company;

-- Query the name and city of every employee
select emp_name,city from employee;

-- Query all companies with revenue greater than 5 000 000
select * from company 
where revenue >5000000;

-- Query all companies with revenue smaller than 5 000 000
select * from company 
where revenue <5000000;

-- Query all companies with revenue smaller than 5 000 000, but you cannot use the '<' operator
select * from company 
where revenue not in  (select revenue from company where revenue >5000000);
-- or
select * from company
order by revenue
limit 1;

-- Query all employees with salary greater than 50 000 and smaller than 70 000, but you cannot use BETWEEN
 select * from employee 
 where salary between 50000 and 70000;
 
 -- Query all employees with salary equal to 80 000
select * from employee 
 where salary >=50000 and salary<=70000;
 
 --  Query all employees with salary not equal to 80 000
 select * from employee
 where salary=80000;
 
 -- Query all employees with salary not equal to 80 000
 SELECT * FROM employee
WHERE salary <> 80000;

-- Query all names of employees with salary greater than 70 000 together with employees who work on the 'IT' department.
 select * from employe
 where salary > 70000 or
 dept_id  in ( select id from department where name ='IT');
 
 -- Query all employees that work in city that starts with 'L'
 select * from employee 
where  city like 'L%';

-- Query all employees that work in city that starts with 'L' or ends with 's'
select * from employee 
where city like 'L%' or city like '%s';

-- Query all employees that  work in city with 'o' somewhere in the middle
 select * from employee 
where  city like '%o%';

-- Query all departments (each name only once)
SELECT DISTINCT name FROM department;

-- Query names of all employees together with id of department they work in, but you cannot use JOIN
select emp_name, dept_id,name from
employee,department
where dept_id = id;

-- Query names of all employees together with id of department they work in, using JOIN
select emp_name, dept_id,name from
employee
join department
on dept_id = id;

-- Query name of every company together with every department
-- Personal thoughts: It is kinda weird question, as there is no relationship between company and departement
select distinct * from( select c.name as cmp_name, d.name
FROM company c, department d
) x
order by cmp_name;

-- Query name of every company together with departments without the 'Support' department
select distinct * from( select c.name as cmp_name, d.name
FROM company c, department d
where d.name <> 'Support'
) x
order by cmp_name;

-- Query employee name together with the department name that they are not working in
SELECT emp_name, d.name
FROM employee e, department d
WHERE dept_id <> id;

-- Query company name together with other companies names
select c1.name ,c2.name 
from company c1
join company c2
where c1.name <>c2.name 
ORDER BY c1.name ,c2.name ;

--  Query employee names with salary smaller than 80 000 without using NOT and <
-- NOTE: for POSTGRESQL only. Mysql doesn't support except
select emp_name,salary  from employee 
where emp_name not in (select emp_name from employee where salary >=80000) ;

-- Query names of every company and change the name of column to 'Company'
select name  Company from company;

-- Query all employees that work in same department as Peter
select * from employee
where dept_id = 
(select dept_id from employee where emp_name='Peter');
