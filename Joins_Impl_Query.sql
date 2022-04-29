create database `JoinsImplementation`;
use JoinsImplementation;

drop table if exists `restaurant`;

create table `restaurant` (id int primary key,
				Name varchar(50));
                
create table `dishes` (dishId int primary key,
				 dishName varchar(50),
                 price float,
                 restaurantId int,
                 foreign Key (restaurantId) references restaurant(id));
                 
insert into restaurant (id,Name) values (1,"Punjabi Rasoi"),(2,"Howrah Bridge"),(3,"BBQ Nation");

insert into restaurant values (4,"City Residency");

insert into dishes (dishId, dishName, price, restaurantId) values 
						(1,"Dal Makhani",120,1),
                        (2,"Sarso Saag",100,1),
                        (3,"Tandoori Roti",12,1),
                        (4,"Fish Curry",200,2),
                        (5,"Prawn Curry",300,2),
                        (6,"Hyderabadi Chicken Biriyani",250,3),
                        (7,"Mutton Kebab",275,3);
                        
insert into dishes values (8,"Chicken Lasagna",300,4);
                        
select restaurant.Name, dishes.dishName, dishes.price from restaurant left join dishes
on restaurant.id = dishes.restaurantId;

select restaurant.Name, dishes.dishName, dishes.price from restaurant right join dishes
on restaurant.id = dishes.restaurantId;

select restaurant.Name, dishes.dishName, dishes.price from restaurant inner join dishes
on restaurant.id = dishes.restaurantId;

select restaurant.Name, dishes.dishName, dishes.price from restaurant, dishes
where restaurant.id = dishes.restaurantId;

select restaurant.Name, dishes.dishName, dishes.price from restaurant left join dishes
on restaurant.id = dishes.restaurantId union 
select restaurant.Name, dishes.dishName, dishes.price from restaurant right join dishes
on restaurant.id = dishes.restaurantId;

select count(distinct price) from dishes;

select dishes.dishname, dishes.price from dishes where price < 150;

select r.name from restaurant r, dishes d where r.id = d.restaurantId group by restaurantId having count(restaurantId)>1;

select restaurant.Name, dishes.dishName from restaurant, dishes where restaurant.id = dishes.restaurantId and restaurant.Name in
 (select r.name from restaurant r, dishes d where r.id = d.restaurantId group by restaurantId having count(restaurantId)>1);

set sql_safe_updates = 0;
update dishes set price = 1.1*price where price < 200; 



