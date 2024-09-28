use google;
show tables;

select * from employee;

drop view All_data_admin;
create view All_data_admin as
select * from employee where DEPT_NAME='Admin';

select * from All_data_admin where emp_ID=101;

select * from All_data_admin ;
update All_data_admin set emp_NAME ="MOHAN Singh" 
where emp_ID=101;
delete from All_data_admin where emp_ID=101;

select * from employee;
drop view   max_min_price;
create view  max_min_price as
    select product_category,
    max(price) as 'Expensive',
    min(price) as 'cheapest'
    from product
    group by product_category;
select * from product;
select * from max_min_price;

CREATE TABLE admission_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    s_name VARCHAR(255),
    age INT,
    email VARCHAR(255),
    registration_date  DATE default current_date()
) auto_increment=1;

INSERT INTO admission_table (s_name, age, email, registration_date) VALUES
('John Doe', 25, 'john.doe@email.com', '2022-01-01'),
('Jane Smith', 30, 'jane.smith@email.com', '2022-02-15'),
('Bob Johnson', 22, 'bob.johnson@email.com', '2022-03-10'),
('Alice Brown', 28, 'alice.brown@email.com', '2022-04-05'),
('Charlie Davis', 35, 'charlie.davis@email.com', '2022-05-20'),
('Eva White', 29, 'eva.white@email.com', '2022-06-25'),
('Frank Miller', 32, 'frank.miller@email.com', '2022-07-30'),
('Grace Taylor', 27, 'grace.taylor@email.com', '2022-08-12'),
('Henry Wilson', 31, 'henry.wilson@email.com', '2022-09-18'),
('Ivy Lee', 26, 'ivy.lee@email.com', '2022-10-22'),
('Jack Adams', 33, 'jack.adams@email.com', '2022-11-05'),
('Karen Clark', 28, 'karen.clark@email.com', '2022-12-08'),
('Leo Turner', 29, 'leo.turner@email.com', '2023-01-15'),
('Mia Garcia', 30, 'mia.garcia@email.com', '2023-02-28'),
('Nathan Hill', 26, 'nathan.hill@email.com', '2023-03-14'),
('Olivia Reed', 34, 'olivia.reed@email.com', '2023-04-20'),
('Paul Evans', 27, 'paul.evans@email.com', '2023-05-25'),
('Quinn Morris', 31, 'quinn.morris@email.com', '2023-06-30'),
('Rachel Scott', 29, 'rachel.scott@email.com', '2023-07-15'),
('Samuel Hall', 32, 'samuel.hall@email.com', '2023-08-22');

INSERT INTO admission_table (s_name, age, email, registration_date) VALUES
('pooja', 25, 'pooja.doe@email.com', '2023-12-24'),
('preeti', 30, 'preeti.smith@email.com', '2023-12-15'),
('priyanka', 22, 'priyanka.johnson@email.com', '2023-12-30');
select * from admission_table;

-- Retrieve all records registered after a specific date:
select * from admission_table where registration_date >='2022-11-05';
-- Count the number of registrants per month:
select month(registration_date) "month",count(*) No_of_admissions from admission_table
group by month(registration_date);
select monthname(registration_date) "month",count(*) No_of_admissions from admission_table
group by monthname(registration_date);

select year(registration_date) "year",count(*) No_of_admissions from admission_table
group by year(registration_date);

select quarter(registration_date) "quarter",count(*) No_of_admissions from admission_table
group by quarter(registration_date);

SELECT
    EXTRACT(quarter FROM registration_date) AS registration_month,
    COUNT(*) AS registrations_count
FROM
    admission_table
GROUP BY
    registration_month;
    
-- Calculate the difference in days between registration dates:
SELECT
    DATEDIFF(MAX(registration_date), MIN(registration_date)) AS days_difference
FROM
    admission_table;
    
SELECT
    s_name,
    age,
    DATEDIFF(CURDATE() ,registration_date)  AS calculated_days
FROM
    admission_table;
    
-- Retrieve registrants who registered in the current year:
SELECT *
FROM admission_table
WHERE YEAR(registration_date) = YEAR(CURDATE());

-- Retrieve records where registration date is within the last 30 days:
SELECT *
FROM admission_table
WHERE registration_date >= CURDATE() - INTERVAL 30 DAY;

select now(),curdate(),curtime();
SELECT DATE(NOW()),time(now());
SELECT EXTRACT(YEAR FROM NOW()) AS year;
SELECT DATE_FORMAT(NOW(), '%Y/%m/%d %H:%i:%s') AS formatted_date;
-- Adds a specified time interval to a date.
SELECT DATE_ADD(NOW(), INTERVAL 1 WEEK) AS future_date;
-- Subtracts a specified time interval from a date.
SELECT DATE_SUB(NOW(), INTERVAL 1 MONTH) AS past_date;

-- Returns the difference in a specified unit between two dates or times.
SELECT TIMESTAMPDIFF(MINUTE, '2024-01-07 12:00:00', NOW()) AS minutes_difference;
SELECT TIMESTAMPDIFF(hour, '2024-01-07 12:00:00', NOW()) AS hours_difference;
SELECT TIMESTAMPDIFF(day, '2024-01-07 12:00:00', NOW()) AS days_difference;


use company;
show tables;
desc airpassengers;
select * from airpassengers;





