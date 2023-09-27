--------customers & product1--------

create table customers 
(
Customer_id int primary key,
Customer_Name varchar(30),
City varchar(10),
County varchar(10),
Postal_Code int,

)

create table product1
(product_id int primary key,
customer_id int ,
constraint fk_product foreign key (customer_id) references customers(Customer_id),
product_name varchar(25),
product_price int
)
--Show table
select * from customers

--(Customer_id,'Customer_Name','city','county',postal_code)
insert into customers values(11,'Sandesh','london','Uk',121516)
insert into customers values(22,'Chidanand','Barlin','Germany',100115)
insert into customers values(23,'Rohit','London','Uk',121110)
insert into customers values(25,'Sagar','new york','Us',152425)
insert into customers values(14,'Rohan','London','Uk',121514)
insert into customers values(18,'Shubham','Bangkok','thailand',142585)
insert into customers values(19,'alisha','paris','france',null)
insert into customers values(12,'payal','istanbul','turkey',748595)
insert into customers values(13,'Riya','tokyo','japan',442585)
insert into customers values(17,'pradnya','delhi','india',175585)
insert into customers values(18,'Suraj','dubai','UAE',122555)
insert into customers values(5,'Ananta','Bangkok','thailand',859621)
insert into customers values(1,'Aishwarya','mecca','saudi',null)
insert into customers values(55,'Sakshi','osaka','japan',332585)

update customers set Postal_Code =null where Customer_Id in (5,55,17)

select *from product1

insert into product1 values(1,11,'Tv ',55000)
insert into product1 values(2,22,'Mobile',95000)
insert into product1 values(3,1,'Pen',100)
insert into product1 values(4,17,'Laptop',65000)
insert into product1 values(5,18,'Laptop',65000)
insert into product1 values(6,19,'Mobile',45000)
insert into product1 values(7,1,'Watch',10000)
insert into product1 values(8,5,'speaker',15000)
insert into product1 values(9,19,'Mobile',75000)
insert into product1 values(10,25,'Bag',2500)

select * from customers

--1)select city column
select city from customers

--2)Unique city
select distinct city from customers

--3)All records where city is 'London'
select*from customers where city ='London'

--4)Records they are not in barlin
select*from customers where  city not in ('Barlin')

--5)All Record Whose id is 23
select * from customers where Customer_id=23

--6)All record where city 'barlin' and postal code is 100115
select * from customers where city='barlin' and Postal_Code=100115

--7)All records where city 'barlin; or'London'
select * from customers where city='barlin' or city='London'

-- 8)Sort the result asending alphabetically by column city
select * from customers order by city asc

-- 9)Sort the result desending alphabetically by column city
select * from customers order by city desc

--10)sort the result alphabetically 1st country then city
select * from customers order by county,city 

--11)All record Where postal code is empty
select *from customers where Postal_Code is null

--12)All record where postal code is not empty
select *from customers where postal_code is not null

--13)set value to city (----)column where county is 'india'
update customers set city ='delhi' where county='india'

--14)delete Customer where county is 'japan'
delete from customers  where county ='japan'

--15)Use Min Function for smallest value from product1-->100
select min (product_price) as'product_price' from product1

--16)Use max function for highest value from product1-->95000
select max (product_price) as 'product_price' from product1

--17)Use the correct function to return the number of records that have the Price value set to 20
select Count (product_price) as 'total_Count' from product1 where product_price=100

--18)Average price of all products.
select avg(product_price) as 'avg price' from product1

--19)Sum of all prices in product1 table
select sum(Product_price) as 'Sum Of price' from product1

--20)All record where City name start with 'L'
select * from customers where city like 'L%'

--21)All record where City name end with 'a'
select *from customers where city like '%a'

--22)All record where City which contains 'a'
select * from customers where city like'%a%'

--23)All record which city start with 'L' & end with 'N'
select *from customers where city like 'l%n'

--24)All record where city does not start with 'L' 
select *from customers where city not like'L%'

--25)All record where city second letter is 'a'
select * from customers where city like '_a%'

--26)All records where the first letter of the City is U/L/I.
select * from customers	where city like '[uli]%'

--27)All record where city name start with [a to j]
select *from customers where city like '[a-j]%'

--28)All records where the first letter of the City is not U/L/I.
select * from customers	where city not like '[uli]%'

--29)Use IN operator to select all the records where Country is  "barlin" and  "london"
select * from customers where city in ('barlin','london') 

--30)Use IN operator to select all the records where Country is NOT "delhi" and NOT "paris"
select*from customers where city not in ('delhi', 'paris')

--31)use Between operator price is 5000 to 50000 
select *from product1 where product_price between 5000 and 50000

--32)Use between operator price not in 50000 to 100000
select * from product1 where product_price not between 50000 and 100000

--33)Use
select *from product1 where product_name between 'Laptop'and'tv' 