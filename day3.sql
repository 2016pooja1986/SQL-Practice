use class;
select * from student1;


update student1 set class =10 where id=5;
update student1 set name = 'Vivek',age=19 where id =4;
update student1 set name='Ronit';


delete from student1 where age<16;


SELECT COUNT(DISTINCT name) UNIQ_NAMES FROM student1;
select min(age) from student1;
select max(age) from student1;
select avg(age) from student1;
select sum(age) from student1;

select class from student1 group by class;
select class ,count(name) no_of_stud from student1 group by class;
select class ,count(name) no_of_stud from student1 group by class having no_of_stud>2;

create table marks(
id int not null,
subject varchar(10) not null,
marks int not null,
primary key(id,subject)
);

desc marks;
insert into marks
(id,subject,marks)
values
(9, 'maths', 89),
(2, 'english', 75),
(1, 'maths', 91),
(4, 'science', 97),
(10, 'computer', 83),
(1, 'english', 55),
(3, 'maths', 58);

select * from marks;