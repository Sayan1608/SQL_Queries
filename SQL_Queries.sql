/*dropping database `employee_DBMS` if already exists */
drop database if exists `employee_DBMS`;

create database employee_DBMS;

use  employee_DBMS;

/*Drop table if exists*/
drop table if exists `emp_details`;
create table `emp_details` (id int, emp_name varchar(50), department varchar(50));

/*adding new col to table using alter command*/
alter table `emp_details` add column salary int;

/*renaming table using alter command*/
alter table `emp_details` rename to `employee_details`;

/*renaming table using rename command only*/
rename table `employee_details` to `emp_details`;

/*inserting value into the table `emp_details`*/
insert into emp_details (id,emp_name,department,salary) values (1,"Sayan","IT",455000);
insert into emp_details (id,emp_name,department,salary) values (2,"Rahul","HR",450000);
insert into emp_details (id,emp_name,department,salary) values (3,"Pritam","IT",555000);
insert into emp_details (id,emp_name,department,salary) values (5,"Sneha","Customer Care",350000);
insert into emp_details (id,emp_name,department,salary) values (6,"Preeti","Finamce",500000);
insert into emp_details (id,emp_name,department,salary) values (7,"Mohit","IT",375000);
insert into emp_details (id,emp_name,department,salary) values (8,"Megha","Finance",475000);

alter table emp_details add column department varchar(50);

/*updating the rows in a table*/
SET SQL_SAFE_UPDATES = 0;
update emp_details set emp_name = "Ratan" where id = 2;
update emp_details set emp_name = "Rajeev" where id = 5;

update emp_details set salary = 1.3*salary;

alter table emp_details drop column department;

/*drop the table rows*/
truncate table emp_details;

/*Deleting a row from table*/
delete from emp_details where id = 1;