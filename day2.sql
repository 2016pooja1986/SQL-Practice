show databases;
create database tgc;
use tgc;
select	database();
drop database tgc;
create table student(
id int not null unique primary key,
name varchar(10) not null
);
show tables;
desc student;
use class;
insert into student1 
(id,name,age,class)
values
(1, 'mohit', 18, 12),
(2, 'rohit', 17, 11),
(3,'Mohit',18,12),
(4,'poorvi',16,11),
(5, 'prateek', 14, 8),
(6, 'vishnu', 12, 7),
(7, 'mahesh', 17, 10),
(8, 'aparna', 16, 11),
(9, 'jatin', 17, 11),
(10, 'rohit', 13, 8);

select * from student1;
select name from student1;
select id,name,class,age from student1;
select distinct name from student1;

select * from student1 limit 3;
select * from student1 limit 3 offset 5;
select * from student1 order by class desc;
select * from student1 order by class;
select * from student1 order by class,age ;
select * from student1 order by class desc, age desc;

select * from student1 where class=12;
select * from student1 where id=5;
select * from student1 where id <9;
select * from student1 where name ='poorvi';

select * from student1 where class>=11 and age<18;
select * from student1 where class>=11 or age <15;
SELECT * FROM student1 WHERE NOT name = 'jatin';
SELECT * FROM student1 WHERE age BETWEEN 13 AND 17;
SELECT * FROM student1 WHERE name IN('jatin','aparna', 'rohit');
SELECT * FROM student1 WHERE name LIKE 'a%';
SELECT * FROM student1 WHERE name LIKE '%a';
SELECT * FROM student1 WHERE name LIKE '%ti%';
