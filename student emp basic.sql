--CREATE DATABASE TITANS
--USE [DP6-Titans]
--DROP DATABASE TITANS
--------------------------

CREATE TABLE STUDENT
(
RollNo int,
Name varchar(25),
percentage numeric(6,2),
city varchar(10),
dob date
)
----------------------------
--Modify the data types or size of data types
alter table student alter column name varchar(26)

--Add column to the existing table
alter table student add County varchar(10)

--Remove Column fron existing table
alter table student drop column county

--Remane column name
exec sp_rename'student.name','StudentName'

-------------------------------------------------------
create table employee
(
Emp_Id int,
Emp_Name varchar(20),
Department varchar(10),
Salary int,
)
alter table employee alter column Emp_name varchar(25) --Modify data
alter table employee add caste varchar(10) --Add column
alter table employee drop column caste --Remove column
exec sp_rename'employee.Emp_name','EmployeeName' --Remane column name : Emp_Name ->EmployeeName

--show table
select * from employee

alter table employee add age int --add table
alter table employee drop column Department --delete column
alter table employee add mail_id varchar(30) --add mail column
alter table employee drop column mail_id

--remove data
truncate table employee 

--Add data in table

insert into Employee (emp_id,EmployeeName,salary,age,mail) values(1,'sandesh',95000,23,'sandesh@gmai.com')
insert into Employee (emp_id,EmployeeName,salary,age,mail) values(2,'rohit j',75000,25,'rohitj@@gmai.com')
insert into Employee (emp_id,EmployeeName,salary,age,mail) values(3,'sujit s',55000,24,'sujis@gmai.com')
insert into Employee (emp_id,EmployeeName,salary,age,mail) values(4,'payal g',95000,24,'payal@gmai.com')
insert into Employee (emp_id,EmployeeName,salary,age,mail) values(5,'alisha m',65000,25,'alisha@gmai.com')
insert into Employee (emp_id,EmployeeName,salary,age,mail) values(6,'sagar a',85470,26,'sagar@gmai.com')
insert into Employee (emp_id,EmployeeName,salary,age,mail) values(7,'milind p ',74100,27,'milindp@gmai.com')
insert into Employee (emp_id,EmployeeName,salary,age,mail) values(8,'rushi k',87500,28,'rushik@gmai.com')
insert into Employee (emp_id,EmployeeName,salary,age,mail) values(9,'suraj ',45900,21,'suraj@gmai.com')
insert into Employee (emp_id,EmployeeName,salary,age,mail) values(10,'chidanad g',85900,34,'chidanad@gmai.com')
insert into Employee (emp_id,EmployeeName,salary,age,mail) values(11,'aditya l',50000,32,'aditya@gmai.com')

insert into Employee(emp_id,EmployeeName,salary,age,mail) values(4,'shubham',58296,24,'shubham@gmail.com')

--Delete line
delete from employee where salary=95000 
--delete all data in table
truncate table employee 

select * from employee

alter table employee add City varchar(10)--Add column

--add city to employees
update Employee set city='Mumbai' where emp_id in(1,4,5,6,11)
update Employee set city='pune' where emp_id in(2,7,9)
update Employee set city='Nashik' where emp_id in(3,8,10)

--Delete --> To remove data from table
            

-- Clause
--start with s
select * from employee where EmployeeName like's%'
--not start with s
select * from employee where EmployeeName not like's%' 


--Name end with j
select * from employee where employeename like '%j'
--Name not end with j
select * from employee where employeename not like '%j'

--"d" in name
select *from employee where employeename like'%d%'
--not "d" in name
select *from employee where employeename not like'%d%'

--name are ends with r/s/a
select *from employee where employeename like '%[rsa]'
--name are not ends with j/k
select *from employee where employeename not like '%[jk]'


--[s&a]available
select *from employee where EmployeeName like '%[sa]%'
--s/a are not availble in name
select *from employee where EmployeeName not like '%[sa]%'


--range[a-g],[h,z]
select * from employee where EmployeeName like '[a-d]%'

--match exact count
select *from employee where employeename like '__r__'

--Order by--> sort
select *from employee order by EmployeeName--asending

select *from employee order by Employeename desc--desending

select *from employee order by Employeename,age


--top Query
--First Top 5 
select top 5 * from employee 

--Last 5 by id
select top 5* from employee order by Emp_Id desc

--Percentage 
select top 10 percent *from employee

--ties -->match data based on column that we specify in order by
select top 3 with ties *from employee order by salary desc

--Display employee who have 3rd highest salary in he table 
select * from Employee order by salary desc
offset 2 rows
fetch next 1 rows only

--Display employee who have 5th highest salary in he table
select *from employee order by salary desc
offset 4 rows
fetch next 1 rows only

--Display emp who have 3rd,4th highest salary
select * from employee order by salary desc
offset 2 rows
fetch next 2 rows only

--Display 3rd lowest salary employee
select * from Employee order by salary
offset 2 rows
fetch next 1 rows only


select max(salary) as 'Max salary' from employee --get max salary

select max(age) as 'Max age' from employee

select min (salary) as 'Min salary' from employee --Min salary

select avg(salary) as 'avg salry' from employee

