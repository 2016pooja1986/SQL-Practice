use google;
show tables;
desc employee;

select e.*,
max(SALARY) over(partition by DEPT_NAME)
from employee e;

select * from
(select e.* ,
row_number() over(partition by DEPT_NAME order by salary desc) as rn
from employee e
) x
where x.rn<4;

select * from
(select e.* ,
rank() over(partition by DEPT_NAME order by salary desc) as rn
from employee e
) x
where x.rn<3;

select e.*,
rank() over(partition by dept_name order by salary desc) as rnk,
dense_rank() over(partition by dept_name order by salary desc) as dense_rnk,
row_number() over(partition by dept_name order by salary desc) as rn
from employee e;

select e.* ,
lag(salary) over(partition by DEPT_NAME order by salary) as prev_sal
from employee e;

select e.* ,
lead(salary) over(partition by DEPT_NAME order by salary) as next_sal
from employee e;


select e.*,
case 
when e.salary > lag(salary) over(partition by DEPT_NAME order by salary) then 'Higher than previous emp'
when e.salary < lag(salary) over(partition by DEPT_NAME order by salary) then 'Lower than previous emp'
else  'Equal to previous emp'
end status
from employee e;

select * from product;
-- Most expensive product under each category
select *
from product
where product_name in (select first_value(product_name) over(partition by product_category order by price desc) from product); 

use google;
select * from product;
select product_category,
max(price) from product group by product_category;

select p.*,
last_value(product_name) over(partition by product_category order by price desc
range between unbounded preceding and unbounded following) as least_expensive
from product p
where product_category='phone';
select *,
first_value(product_name) over w as most_exp_product,
last_value(product_name) over w as least_exp_product    
from product
WHERE product_category ='Phone'
window w as (partition by product_category order by price desc
range between unbounded preceding and unbounded following);

select x.product_name, 
case when x.buckets = 1 then 'Expensive Phones'
     when x.buckets = 2 then 'Mid Range Phones'
     when x.buckets = 3 then 'Cheaper Phones' END as Phone_Category
from (
    select *,
    ntile(3) over (order by price desc) as buckets
    from product
    where product_category = 'Phone') x;
    
    select product_name, cume_dist_percetage
from (
    select *,
    cume_dist() over (order by price desc) as cume_distribution,
    concat(round(cume_dist() over (order by price desc)* 100,2),'%') as cume_dist_percetage
    from product) x
where x.cume_distribution <= 0.3;

select product_name, per
from (
    select *,
    percent_rank() over(order by price) ,
    concat(round(percent_rank() over(order by price)* 100, 2),'%') as per
    from product) x
where x.product_name='Galaxy Z Fold 3';
select *,
    percent_rank() over(order by price) ,
    concat(round(percent_rank() over(order by price)* 100, 2),'%') as per
    from product;