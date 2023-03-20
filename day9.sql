show databases;
select database();
show tables;
select * from employee;

select e.*, 
min(salary) over(partition by DEPT_NAME) as min_salary 
from employee e;

select e.*,
row_number() over(partition by DEPT_NAME ) as row_num
from employee e;

select * from
(
select e.*,
row_number() over(partition by DEPT_NAME order by emp_ID ) as row_num
from employee e ) x
where x.row_num <3;

select * from
(
select e.*,
row_number() over(partition by DEPT_NAME order by emp_ID ) as row_num
from employee e ) x
where x.row_num <3;

select * from
(
select e.*,
rank() over(partition by DEPT_NAME order by SALARY desc ) as ranking
from employee e ) x
where x.ranking <4;

select e.*,
rank() over(partition by DEPT_NAME order by SALARY desc ) as ranking
from employee e;

select e.*,
rank() over(partition by DEPT_NAME order by SALARY desc ) as ranking,
dense_rank() over(partition by DEPT_NAME order by SALARY desc) as dense_ranking,
row_number() over(partition by DEPT_NAME order by SALARY desc) as row_num
from employee e; 

select e.*,
lag(salary) over(partition by DEPT_NAME) as prev_emp_sal
from employee e;

select e.*,
lead(salary) over(partition by  DEPT_NAME) as next_emp_sal
from employee e;

show tables;
CREATE TABLE product
( 
    product_category varchar(255),
    brand varchar(255),
    product_name varchar(255),
    price int
);

INSERT INTO product VALUES
('Phone', 'Apple', 'iPhone 12 Pro Max', 1300),
('Phone', 'Apple', 'iPhone 12 Pro', 1100),
('Phone', 'Apple', 'iPhone 12', 1000),
('Phone', 'Samsung', 'Galaxy Z Fold 3', 1800),
('Phone', 'Samsung', 'Galaxy Z Flip 3', 1000),
('Phone', 'Samsung', 'Galaxy Note 20', 1200),
('Phone', 'Samsung', 'Galaxy S21', 1000),
('Phone', 'OnePlus', 'OnePlus Nord', 300),
('Phone', 'OnePlus', 'OnePlus 9', 800),
('Phone', 'Google', 'Pixel 5', 600),
('Laptop', 'Apple', 'MacBook Pro 13', 2000),
('Laptop', 'Apple', 'MacBook Air', 1200),
('Laptop', 'Microsoft', 'Surface Laptop 4', 2100),
('Laptop', 'Dell', 'XPS 13', 2000),
('Laptop', 'Dell', 'XPS 15', 2300),
('Laptop', 'Dell', 'XPS 17', 2500),
('Earphone', 'Apple', 'AirPods Pro', 280),
('Earphone', 'Samsung', 'Galaxy Buds Pro', 220),
('Earphone', 'Samsung', 'Galaxy Buds Live', 170),
('Earphone', 'Sony', 'WF-1000XM4', 250),
('Headphone', 'Sony', 'WH-1000XM4', 400),
('Headphone', 'Apple', 'AirPods Max', 550),
('Headphone', 'Microsoft', 'Surface Headphones 2', 250),
('Smartwatch', 'Apple', 'Apple Watch Series 6', 1000),
('Smartwatch', 'Apple', 'Apple Watch SE', 400),
('Smartwatch', 'Samsung', 'Galaxy Watch 4', 600),
('Smartwatch', 'OnePlus', 'OnePlus Watch', 220);

select * from product;
select * from
(
select p.*,
max(price) over(partition by product_category ) as expensive_product,
row_number() over(partition by product_category order by price desc) as row_num
from product p ) x
where x.row_num <2;

select p.*,
max(price) over(partition by product_category ) as expensive_product,
row_number() over(partition by product_category order by price desc)
from product p;

select *, 
first_value(product_name) over(partition by product_category order by price desc) as expensive_product
from product; 

select *, 
first_value(product_name) over(partition by product_category order by price ) as expensive_product
from product; 

select *, 
last_value(product_name) over(partition by product_category order by price desc range between unbounded preceding and unbounded following) as expensive_product
from product; 

select *,
first_value(product_name) 
    over(partition by product_category order by price desc) 
    as most_exp_product,
last_value(product_name) 
    over(partition by product_category order by price desc  range between unbounded preceding and unbounded following) 
    as least_exp_product    
from product;