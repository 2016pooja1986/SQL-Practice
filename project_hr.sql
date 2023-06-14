create database projects;
use projects;
show tables;
desc hr;

ALTER TABLE hr
RENAME COLUMN  ï»¿id to Emp_id;
alter table hr modify column Emp_id varchar(20) null;

UPDATE hr SET birthdate= case
when birthdate like '%/%' then date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
when birthdate like '%-%' then date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
else null
end;
alter table hr modify birthdate date;

UPDATE hr SET hire_date= case
when hire_date like '%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
when hire_date like '%-%' then date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
else null
end;
alter table hr modify hire_date date;

UPDATE hr SET termdate= date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
where termdate is not null and termdate !="";
update hr set termdate ='1000-01-01'
where termdate='2023-06-14';
alter table hr modify termdate date;

alter table hr add column age int;
update hr set age = date_format( from_days( datediff(now(),birthdate)),'%Y');
update hr set age = timestampdiff(year,birthdate,curdate());
select age from hr;
desc hr;

-- 1. What is the gender breakdown of employees in the company?

select gender,count(*) as No_of_employee from hr 
where age >=18 and termdate = "1000-01-01"
group by gender;


-- 2. What is the race/ethnicity breakdown of employees in the company?

select race,count(*) as No_of_employee from hr
where age >=18 and termdate = "1000-01-01"
group by race
order by count(*) desc;


-- 3. What is the age distribution of employees in the company?

select case when age>= 18 and age<=24 then "18-24"
when age>= 25 and age<=34 then "25-34"
when age>= 35 and age<=44 then "35-44"
when age>= 45 and age<=54 then "45-54"
when age>= 55 and age<=64 then "55-64"
else "65+"
end as Age_Group, count(*) as No_OF_Emp
from hr  where age >=18 and termdate = "1000-01-01"
group by Age_Group
order by Age_Group;

select min(age) youngest, max(age) oldest from hr  
where age >=18 and termdate = "1000-01-01";


-- 4. How many employees work at headquarters versus remote locations?

select location, count(*) No_of_Emp from hr
where age >=18 and termdate = "1000-01-01"
group by location;


-- 5. What is the average length of employment for employees who have been terminated?

select round(avg(datediff(termdate,hire_date))/365,1) Avg_len_employment from hr
where age >=18 and termdate != "1000-01-01" and termdate<=current_date();



-- 6. How does the gender distribution vary across departments and job titles?

select gender, department,count(*) as No_of_Emp  from hr
where age >=18 and termdate = "1000-01-01"
group by department,gender
order by department;

select department,
       sum( gender = 'Female' ) as Female,
       sum( gender = 'Male' ) as Male
from hr
where age >=18 and termdate = "1000-01-01"
group by department
order by department,gender;

select jobtitle,
       sum( gender = 'Female' ) as Female,
       sum( gender = 'Male' ) as Male
from hr
where age >=18 and termdate = "1000-01-01"
group by jobtitle
order by jobtitle;


-- 7. What is the distribution of job titles across the company?

select jobtitle, count(*) No_of_Emp from hr
where age >=18 and termdate = "1000-01-01"
group by jobtitle
order by jobtitle;


-- 8. Which department has the highest turnover rate?

select department,total_count,terminated_count/total_count as termination_rate 
from
(select department, count(*) as total_count,
sum(case when termdate<>'1000-01-01' and termdate<=curdate() then 1 else 0 end) as terminated_count
from hr
where age>=18
group by department) as sub_query
order by termination_rate desc
limit 1;



-- 9. What is the distribution of employees across locations by city and state?

select location_city, count(*) No_of_Emp from hr
where age >=18 and termdate = "1000-01-01"
group by location_city
order by No_of_Emp;
select location_state, count(*) No_of_Emp from hr
where age >=18 and termdate = "1000-01-01"
group by location_state
order by No_of_Emp desc;

-- 10. How has the company's employee count changed over time based on hire and term dates?

select year_,hires,termination,(hires-termination) as net_change,
round(((hires-termination)/hires)*100,2) as "change_percentage(%)" from
(select year(hire_date) as year_ ,count(*) as hires,
sum(case when termdate<>'1000-01-01' and termdate<=current_date() then 1 else 0 end) as termination
from hr
where age >=18 
group by year(hire_date) ) x
order by year_ ;


-- 11. What is the tenure distribution for each department?

select department , round(avg(datediff(termdate,hire_date)/365),0) as tenure from hr
where age >=18 and termdate != "1000-01-01" and termdate<=current_date()
group by department;