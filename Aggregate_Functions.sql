drop database if exists `Employee_DBMS`;
create database `Employee_DBMS`;
use `Employee_DBMS`;

drop table if exists `Employee_Details` ;

create table `Employee_Details` (id int primary key,
							department varchar(50),
                            salary float);
                            
alter table `Employee_Details` add column name varchar(50);
                            
insert into Employee_Details (id,department,salary) values (101,"IT",200000);
insert into Employee_Details (id,department,salary) values (201,"HR",300000);
insert into Employee_Details (id,department,salary) values (104,"IT",500000);
insert into Employee_Details (id,department,salary) values (106,"Accounts",400000);

update Employee_Details set name = 'Amit' where id = 101;
update Employee_Details set name = 'Asif' where id = 201;
update Employee_Details set name = 'Sayan' where id = 104;
update Employee_Details set name = 'Priyanka' where id = 106;

select sum(salary),avg(salary),max(salary),min(salary) from Employee_Details; 


select * from Employee_Details order by department asc;

select * from Employee_Details where salary > (select avg(salary) from Employee_Details) order by department asc;

select * from Employee_Details where name like "A%";

select * from Employee_Details where department = 'IT';

select department, count(id) from Employee_Details group by department having count(id) > 1;

select * from Employee_Details where not department = 'HR';