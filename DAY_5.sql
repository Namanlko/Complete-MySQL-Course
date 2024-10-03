create database sub_queries;
use sub_queries;
drop database sub_queries;

create table project(id int,empID int,name varchar(15),startdate date,clentID int);
insert into project(id,empID,name,startdate,clentID) VALUES
(1,1,'A','2021-04-21',3),
(2,2,'B','2021-03-12',1),
(3,3,'C','2021-01-16',5),
(4,3,'D','2021-04-27',2),
(5,5,'E','2021-05-01',4);
select * from project;
drop table project;

create table employee(id int,fname varchar(20),lname varchar(20),Age int,emailID varchar(35),PhoneNO int,City varchar(15));
insert into employee(id,fname,lname,Age,emailID,PhoneNO,City) VALUES
(1,'Aman','Proto',32,'aman@gmail.com',898,'Delhi'),
(2,'Yagya','Narayan',44,'yagya@gmail.com',222,'Palam'),
(3,'Rahul','BD',22,'rahul@gmail.com',444,'Kolkata'),
(4,'Jatin','Hermit',31,'jatin@gmail.com',666,'Raipur'),
(5,'PK','Pandey',21,'pk@gmail.com',555,'Jaipur');
select * from employee;
drop table employee;

create table client(id int,fname varchar(20),lname varchar(20),Age int,emailID varchar(35),PhoneNO int,City varchar(15),empID int);
insert into client(id,fname,lname,Age,emailID,PhoneNO,City,empID) VALUES
(1,'Mac','Roger',47,'mac@hotmail.com',333,'Kolkata',3),
(2,'Max','Poirier',27,'max@gmail.com',222,'Kolkata',3),
(3,'Peter','Jain',24,'peter@abc.com',111,'Delhi',1),
(4,'Sushant','Agrawal',23,'sushant@yahoo.com',45454,'Hyderabad',5),
(5,'Pratap','Singh',36,'p@xyz.com',77767,'Mumbai',2);
select * from client;
drop table client;

/* SUB QUERIES */ 
-- WHERE Clause in same table
-- Employees with age>30
Select * From employee Where age in (Select age from employee where age >30 );

-- WHERE Clause in different tables
-- employee details who are working in more than one project
Select * from employee where id in (Select empId from project group by empID having count(empID) >1);

-- Single value subquery
select * from employee where age>(select avg(age) from employee);

-- From Clause
-- select max age person whose first name has 'a'
select max(age) from (select * from employee where fname like '%a%') as temp;

-- Correlated Sub Queries
-- This query is to display 3rd oldest employee
Select * from employee e1
Where 3=(
Select count(e2.age)
from employee e2 where e2.age>=e1.age);
