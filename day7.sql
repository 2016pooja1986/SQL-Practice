show databases;
create database mydb;
show tables;
use mydb;
show tables;
drop database mydb;
create table salesman(
salesmanid int unique key,
name varchar(255),
city varchar(255),
commision int);
desc salesman;
select * from salesman;

alter table salesman add state varchar(255); 
drop table salesman;
alter table salesman drop column state;
insert into salesman 
(salesmanid,name,city,commision)
values
(5001,"James Hoog", "New York", 15),
(5002,"Nail Knite", "Paris", 13);

update salesman set 
commision=14
where salesmanid=5002;

SET SQL_SAFE_UPDATES = 0;

delete from salesman where  salesmanid = 5002;
truncate table salesman;
drop table salesman;

CREATE TABLE salesman 
( 
id int not null auto_increment, 
salesmanid int, 
name varchar(255), 
city varchar(255), 
commision int ,
Primary Key (id)
); 
show tables;
drop table salesman;
drop table customer;
CREATE TABLE salesman (
salesmanid int primary key, 
name varchar(255), 
city varchar(255), 
commision int
);
CREATE TABLE customer (
customerid int primary Key, 
custname varchar(255),
city varchar(255),grade int,first_puchase date,
salesmanid int,
FOREIGN KEY (salesmanid) REFERENCES salesman(salesmanid)
);
show tables;
INSERT INTO salesman
(salesmanid,name,city,commision) VALUES (5001,"James Hoog", "New York", 15),
(5002,"Nail Knite", "Paris", 13),
(5005,"Pit Alex", "London", 11),
(5006,"Mc Lyon", "Paris", 14),
(5007,"Paul Adam", "Rome", 13),
(5003,"Lauson Hen", "San Jose", 12);

select * from salesman;
INSERT INTO customer
(customerid,custname,city,grade,first_puchase,salesmanid)
VALUES (3002,"Nick Rimando","New York", 100,'2020-12-17', 5001),
(3007, "BradDavis", "New York", 200,'2020-11-10', 5001),
(3005,"Graham Zusi", "California", 200,'2020-10-19', 5002),
(3008,"Julian Green", "London", 300,'2020-02-21', 5002),
(3004,"Fabian Johnson", "Paris", 300,'2020-06-07', 5006),
(3009,"Geoff Cameron", "Berlin", 100,'2020-12-30', 5003),
(3003, "JozyAltidor", "Moscow", 200,'2020-09-01', 5007),
(3001, "BRAD Guzan", "London", 100,'2020-11-29', 5005),
(3006, "brad Guzan", "London", 100,'2020-06-20', 5005);

select * from customer;
select distinct salesmanid from customer;
select distinct salesmanid from customer where grade = 100;
select custname , city , grade from customer where grade = 100;
select * from customer where grade <> 100;
select * from customer where grade != 100;
select * from customer where grade > 100;
select * from customer where grade >= 200;
select * from customer where salesmanid = 5005 and customerid = 3006;
select * from customer where Not grade = 200;
select * from customer where salesmanid not between 5003 and 5006;
select * from customer where city like '%york%';
select * from customer where salesmanid not in (5003,5001 ,5006);
select * from salesman;
select * from customer;
desc customer;
select * from customer where salesmanid = Any(select salesmanid from salesman where commision = 13);
select customerid,custname,c.city,grade,first_puchase,c.salesmanid  from customer c
join salesman s on c.salesmanid = s.salesmanid
where commision=13;

select * from salesman where commision = All(select commision from salesman where commision = 13) ;
select * from salesman where commision = 13;
select * from salesman where Exists(select commision from salesman where commision = 20);

select * from salesman;
update salesman set city = (case when city='Paris' then 'Rome' when city = 'Rome' then 'Paris' end) ;  
select * from customer;

UPDATE [EMPDATA] SET GENDER = (CASE WHEN GENDER ='MALE' THEN 'FEMALE'
WHEN GENDER = 'FEMALE' THEN 'MALE'
END ) ;