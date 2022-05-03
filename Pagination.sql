drop database if exists `Employee`;
create database `Employee`;

use `Employee`;

create table `emp_details` (
Id int primary key not null auto_increment,
Name varchar(50),
Department varchar(20),
Salary float); 

insert into `emp_details` (Name,Department,Salary) values ("Aman","IT",12000);
insert into `emp_details` (Name,Department,Salary) values ("Bhuvan","HR",15000);
insert into `emp_details` (Name,Department,Salary) values ("Chandan","Admin",18000);

select Name,Department,CASE
when Department = "IT" then "Complete the Development of new updates"
when Department = "HR" then "Complete the Recruitment process"
when Department = "Admin" then "Complete the system configuration"
end as Task
from `emp_details`;

select * from emp_details 
where Salary not in (Select min(Salary) from emp_details)
order by Salary desc
limit 2;

select * from emp_details 
/*where Salary not in (Select min(Salary) from emp_details)*/
order by Salary desc
limit 2,2;

