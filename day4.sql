show databases;
create database google;
use google;
select database();
drop database google;


create table whatsapp(
serial_no int not null,
First_name varchar(20) not null,
Last_name varchar(20),
Mobile_no int primary key,
subcriber varchar(10) default 'NA'
);
desc whatsapp;
show tables;
drop table whatsapp;
alter table whatsapp add calling varchar(10) default 'no';
alter table whatsapp add PG int(10);
alter table whatsapp drop PG;
alter table whatsapp modify column calling int;

insert into whatsapp
(serial_no,First_name,Last_name,Mobile_no,subcriber,calling)
values
(3,'Vivek',' Singh',234566845,'yes',0);

select * from whatsapp;
desc whatsaap;
select First_name from whatsapp;
select First_name,mobile_no from whatsapp;
select calling,First_name,Last_name,Mobile_no,subcriber,serial_no from whatsapp;

select * from whatsapp limit 2;
select * from whatsapp limit 2 offset 1;

select First_name,Last_name from whatsapp where subcriber ='yes';

select * from whatsapp;
truncate table whatsapp;