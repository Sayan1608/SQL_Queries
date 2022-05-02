drop database if exists `SubqueriesImpl`;

create database `SubqueriesImpl`;

use SubqueriesImpl;

drop table if exists `salesperson`;

create table `salesperson` (s_id int primary key,
name varchar(50),
city varchar(50),
earning float); 

insert into salesperson values (1,"Amit","Delhi",25000);
insert into salesperson values (2,"Ankit","Pune",15000);
insert into salesperson values (3,"Chandra","Ahmedabad",10000);
insert into salesperson values (4,"Monica","Delhi",35000);
insert into salesperson values (5,"Rohini","Bhopal",25000);

drop table if exists `customer`;

create table `customer` (c_id int primary key,
cust_name varchar(50),
city varchar(50),
grade int,
s_id int,
foreign key (s_id) references salesperson(s_id));

insert into customer values (10,"Manish","Ahmedabab",100,1);
insert into customer values (11,"Nisanth","Chennai",300,1);
insert into customer values (12,"Guru","Delhi",400,2);
insert into customer values (13,"Sonia","Delhi",200,2);
insert into customer values (14,"Sakshi","Lucknow",400,3);

drop table if exists `orders`;

create table orders (ord_no int primary key,
purchase_amt float,
ord_date date,
c_id int,
s_id int,
foreign key (c_id) references customer(c_id),
foreign key (s_id) references salesperson(s_id));

alter table `orders` modify column ord_date varchar(20);

insert into orders values (1,5000,'04-MAY-17',10,1);
insert into orders values (2,450,'20-JAN-17',10,2);
insert into orders values (3,1000,'24-FEB-17',13,2);
insert into orders values (4,3500,'13-APR-17',14,3);
insert into orders values (5,550,'09-MAR-17',12,2);

select * from salesperson;
select * from customer;
select * from orders;

select cust_name,city,grade from customer where grade > 
(select avg(grade) from customer group by city having city = 'Delhi') and city not in ('Delhi');


select s_id,name from salesperson where s_id in 
(select s_id from orders
group by s_id having count(s_id) > 1);

/*salesperson having customers in their city*/

select salesperson.s_id, salesperson.name, salesperson.city, customer.c_id,customer.cust_name,customer.city 
from salesperson , customer  
where salesperson.city = customer.city
union
select salesperson.s_id, salesperson.name, salesperson.city, customer.c_id,customer.cust_name,customer.city 
from salesperson , customer  
where salesperson.city not in (select city from customer);
