-- create database
create database hr_project;
use hr_project;
-- creating Employee table
create table employees(
emp_id int primary key,
emp_name varchar(50),
department_id int,
city varchar(50),
);
-- create department table 
create table departments(
department_id int primary key,
department_name varchar(50),
);
-- crate salaries table
create table salaries(
salary_id int primary key,
emp_id int,
salary int,
);
-- inserting data into tables
-- Data into departments table
insert into departments(department_id,department_name)
values
(1,'HR'),
(2,'IT'),
(3,'Finance'),
(4,'Marketing');
-- insert into employees 
insert into employees(emp_id,emp_name,department_id,city)
values
(101,'Aman',2,'Delhi'),
(102,'Anjali',1,'Patna'),
(103,'Simran',3,'Mumbai'),
(104,'Aryan',2,'Kolkata'),
(105,'Neha',4,'Delhi');
-- insert into salaries
insert into salaries(salary_id,emp_id,salary)
values
(1,101,60000),
(2,102,40000),
(3,103,70000),
(4,104,65000),
(5,105,50000);
select*from departments;
select*from employees;
select*from salaries;
-- show employee name with department
select 
e.emp_name,
d.department_name
from employees e
join departments d
on e.department_id=d.department_id;
-- show employees name with salary
select
e.emp_name,
s.salary
from employees e
join salaries s
on e.emp_id=s.emp_id;
--calculate average salary  per department
select
d.department_name,
avg(s.salary) as avg_salary
from employees e
join  departments d
on e.department_id=d.department_id
join salaries s
on e.emp_id=s.emp_id
group by d.department_name;
-- Highest paid employees
select top 1
e.emp_name,
s.salary
from employees e
join salaries s
on e.emp_id=s.emp_id
order by s.salary desc;
--employee count per department
select
d.department_name,
count (e.emp_id) as  total_employees
from employees e 
join departments d
on e.department_id=d.department_id
group by d.department_name;


