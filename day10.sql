use google;
show tables;
select * from employee;
select * from product;

select e.* ,
lag(salary,2,0) over(partition by DEPT_NAME order by emp_ID) as prev_emp_sal,
case when lag(salary,2,0) over(partition by DEPT_NAME order by emp_ID)=0 then 'It has zero value' else 'Successfully completed' end Prev_emp_status,
lead(salary,2,0) over(partition by DEPT_NAME order by emp_ID) as next_emp_sal,
case when lead(salary,2,0) over(partition by DEPT_NAME order by emp_ID)=0 then 'It has zero value' else 'Successfully completed' end Next_emp_status
from employee e;

select p.* ,
first_value(product_name) over(partition by product_category order by price desc) as Expensive_product
from product p;

select p.* ,
first_value(product_name) over(partition by product_category order by price ) as Cheap_product
from product p;

select p.* ,
last_value(product_name) over(partition by product_category order by price desc 
range between unbounded preceding and unbounded following) as cheap_product
from product p
where product_category ='Phone';

select p.* ,
last_value(product_name) over(partition by product_category order by price desc 
rows between unbounded preceding and unbounded following) as cheap_product
from product p
where product_category ='Phone';

select p.* ,
last_value(product_name) over(partition by product_category order by price  desc
range between 2 preceding and 2 following) as cheap_product
from product p
where product_category ='Phone';

select p.* ,
last_value(product_name) over(partition by product_category order by price desc 
rows between 2 preceding and 2 following) as cheap_product
from product p
where product_category ='Phone';

select *,
first_value(product_name) over w as most_expensive,
last_value(product_name) over w as most_cheapest
from product
where product_category ='Phone'
window w as (partition by product_category order by price desc
range between unbounded preceding and unbounded following);

select *,
nth_value(product_name,2) over w as second_expensive_product
from product
window w as (partition by product_category order by price desc
range between unbounded preceding and unbounded following);

select *,
nth_value(product_name,2) over w as second_expensive_product
from product
window w as (partition by product_category order by price desc
rows between unbounded preceding and unbounded following);


 select x.product_name, x.price,
 case when x.price = x.Expensive then 'Expensive' 
 when x.price =x.cheapest then 'cheapest'
 else 'Mid_range' end status
from (
select product_name,price,
    max(price) as 'Expensive',
    min(price) as 'cheapest'
    from product
    group by product_category order by price)x ;


select product_name, price,
case
when price>=2000 then 'high end'
when price>=1500 then 'midrange'
else 'cheap'
end as phone_range
from product
;
select *,
    ntile(5) over (order by price desc) as buckets
    from product;
select x.product_name, 
case when x.buckets = 1 then 'Expensive Phones'
     when x.buckets = 2 then 'Mid Range Phones'
     when x.buckets = 3 then 'Cheaper Phones' END as Phone_Category
from (
select *,
    ntile(4) over (order by price desc) as buckets
    from product)x;
    
    
select * from product 
limit (0.30 * (select count(*) from product)) 
order by price desc;

select product_name,per
from
(select * ,
 cume_dist() over (order by price desc) as cume_distribution,
concat( round((cume_dist() over (order by price desc))*100,2),'%') as per from product
) x
where x.cume_distribution <=0.3;

select *,
    percent_rank() over(order by price) ,
   concat( round(percent_rank() over(order by price) * 100, 2),'%') as per
    from product;