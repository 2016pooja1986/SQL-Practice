show databases;
create database company;
use company;
drop database company;
create database class;
show databases;
use class;

create table student(
name Varchar(50),
roll_no int
);
show tables;
desc student;
drop table student;
alter table student add class int;
alter table student add age  Varchar(10);
alter table student drop class;
alter table student modify age int ;
CREATE TABLE student1(
	id int NOT NULL UNIQUE PRIMARY KEY,
	name varchar(50) NOT NULL DEFAULT 'Unnamed',
	age int NOT NULL,
	class int NOT NULL
);
desc student1;
