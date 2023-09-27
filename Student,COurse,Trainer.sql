create database Student_Course_Trainer
--=====================================================--

create table Student
(
roll_no int primary key,
Stud_name varchar(50),
Degree varchar(20),
Birthday date,
Course_id int ,
constraint fk_courseid_student foreign key (Course_id) references course(Course_id),
Batch_id int,
Fee_paid int,
Remark varchar(50),
Place varchar(50),
)

insert into Student values (1,'Sandesh','Mechanical Engg.','1999/11/28',107,111,20000,'Eligible','Pune')
insert into Student values (2,'Chidand','BSC','1999/01/08',101,112,4500,'Not Eligible','Delhi')
insert into Student values (3,'Shubham','IT Engg.','2000/05/18',102,113,2500,'Eligible','Mumbai')
insert into Student values (4,'Payal','Comp. Engg.','2001/12/01',103,114,1000,'Not Eligible','Pune')
insert into Student values (5,'Alisha','Civil Engg.','1998/05/17',104,115,35000,'Eligible','Delhi')
insert into Student values (6,'Tanuja','It Engg.','2003/09/09',105,116,5000,'Not Eligible','Mumbai')
insert into Student values (7,'Rushi','E&TC Engg.','1997/04/15',106,117,1000,'Eligible','Pune')
insert into Student values (8,'Rohit','Electrical Engg.','1998/06/08',108,118,5000,'Not Eligible',null)
insert into Student values (9,'Sagar','BA','2005/01/28',109,119,20000,'Eligible','Pune')
insert into Student values (10,'Piyush','Production Engg.','1998/03/08',107,111,32000,'Eligible','Mumbai')
insert into Student values (98,'Raj','Bsc','2005/08/11',101,111,3000,'Not Eligible','Thane')
insert into Student values (12,'Abhi','Bsc','2004/11/10',101,111,null,'Not Eligible','Pune')
update Student set place='Delhi' where roll_no = 5

create table Course
(
Course_id int primary key,
Course_Name varchar(50),
Duration varchar(20),
Trainer_id int ,
constraint fk_trainerid_Course foreign key (Trainer_id) references Trainer(Trainer_id),
Total_fees int,
)
insert into Course values (101,'C#','2 Months',11,4000)
insert into Course values (102,'C++','3 Months',22,3000)
insert into Course values (103,'C','1 Months',33,1000)
insert into Course values (104,'Java','3 Months',44,4500)
insert into Course values (105,'python','1 Months',55,5000)
insert into Course values (106,'Sql','2 Months',11,4000)
insert into Course values (107,'.net','10 Months',11,40000)
insert into Course values (108,'Front end','6 Months',22,25000)
insert into Course values (109,'Back End','5 Months',44,35000)
update  course set duration='1' where Course_id=101
update  course set duration='2' where Course_id=102
update  course set duration='3' where Course_id=103
update  course set duration='4' where Course_id=104
update  course set duration='5' where Course_id=105
update  course set duration='6' where Course_id=106
update  course set duration='1' where Course_id=107
update  course set duration='2' where Course_id=108
update  course set duration='3' where Course_id=109


create table Trainer
(
Trainer_id int primary key,
Trainer_Name varchar(50),
Join_date Date,
Email varchar(50),
Experiances_in_year int,
)
insert into Trainer values (11,'Aniket','2015/11/01','aniketk101@gmail.com',8)
insert into Trainer values (22,'Kalyani','2016/12/10','kalyani456@gmail.com',7)
insert into Trainer values (33,'Rushali','2017/01/11','rushali111@gmail.com',6)
insert into Trainer values (44,'medha','2014/01/01','Medha789@gmail.com',9)
insert into Trainer values (55,'Pranav','2020/01/01','pranav1101@gmail.com',3)

-----------------------------------------------------
select * from Trainer
select * from Course
select * from Student
------------------------------------------------------
--1.Show list of students. List contains roll no , student name , course name , trainer name in order of course name and student name.
select  s.roll_no,s.Stud_name,c.Course_Name,t.trainer_name from Student s
inner join Course c on c.Course_id=s.Course_id
inner join Trainer t on t.Trainer_id=c.Trainer_id

--2.Show list of students who have pending fees more than 1000rs . 
--List should have student name, course name, balance fees.Show this list in descending order of balance fees. 
select s.Stud_name,c.Course_Name,(c.Total_fees-s.Fee_paid) as balance_fees
from Student s 
join course c on c.Course_id=s.Course_id
order by balance_fees desc

--3. Append letter ‘_spl’ to all batch ids of trainer ‘Deepa’.
  

--4.Update table student. Update ‘remark’ field. Remark should be ‘Eligible for exam’ if fees paid by student is more than 60%.
update Student set Remark='Eligible' where Fee_paid>any(select Total_fees -0.6 from Course) 

--5.Create a index to make retrieval faster based on course name.
create index A_Indexs on course(Course_name)

--6.List name of course for which more than 20 students are enrolled.
select c.Course_Name
from Course c
join Student s on s.Course_id=c.Course_id
group by c.Course_Name
having count(s.course_id)>=2

--7.List name of course for which maximum revenue was generated. ( max fee collection)
select top 1 c.Course_Name,sum(s.fee_paid) as Total
from Course c
join Student s on s.course_id=c.course_id
group by c.Course_Name 
order by Total desc



--9.Delete all students who are in course which is less than 2 months duration.
delete from Student where course_id in
(
select Course_id from Course where Duration<'2'
)

--10.Delete all students for whom is placed is ‘yes’ and who have paid all the fees of their course
delete from Student where Course_id=(
select Course_id from Course 
where (Total_fees-Fee_paid)=0 and Place='yes'
)


--11. Show names of students who have paid all the fees. 
select s.Stud_name from Student s
join Course c on c.Course_id=s.Course_id
where (c.Total_fees-s.Fee_paid)=0

