select database();
use class;
show tables;
desc marks;
desc student1;
select * from student1;
select * from marks;
select student1.id, name,class,subject, marks 
from student1, marks
where student1.id=marks.id;
-- OR--
select student1.id, name,class,subject, marks 
from student1
inner join marks on
student1.id=marks.id;

select student1.id, name,class,subject, marks 
from student1
inner join marks on
student1.id=marks.id;

select student1.id, name,class,subject, marks 
from student1
left join marks on
student1.id=marks.id;

select student1.id, name,class,subject, marks 
from student1
right join marks on
student1.id=marks.id;

select student1.id, name,class,subject, marks 
from student1
left join marks on student1.id=marks.id
union
select student1.id, name,class,subject, marks 
from student1
right join marks on
student1.id=marks.id;

select student1.id, name,class,subject, marks 
from student1 
full join marks 
on student1.id=marks.id;
-- grant and revoke

create user 'pooja' identified by 'pooja123';
grant select on class.* to 'pooja';
flush privileges;
show grants for 'pooja';

revoke select on class.* from 'pooja';
drop user 'pooja';

use mysql;
select user from user;
use class;

CREATE PROCEDURE selectallstudents()
begin
select * from student1 
end;
execute selectallstudents


