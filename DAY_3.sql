DROP DATABASE EDUCATION;
CREATE DATABASE EDUCATION;
USE EDUCATION;

CREATE TABLE teacher(tech_id int primary key, tech_name varchar(30) unique, tech_subject varchar(40), class_teacher_name varchar(40),free_period_timing time);

INSERT INTO teacher(tech_id , tech_name , tech_subject , class_teacher_name ,free_period_timing) VALUES
(001,'LOVE BABAR','DSA','LOVEBABAR','12:12:12'),
(002,'LAKSHAY','DBMS','CODE-HELP','11:11:11'),
(003,'SHRADHA KHAPRA','WEB-DEV','APNA-COLLEGE','10:10:10'),
(004,'HARRY','JAVA','CODE-WITH-HARRY','09:09:09'),
(005,'DURGESH','SPRING-BOOT','LEARN-CODE-WITH-DURGESH','08:08:08');

SELECT * FROM teacher;


CREATE TABLE student(tech_id int,std_id int , std_name varchar(30) unique, std_subject varchar(40), student_teacher_name varchar(40), foreign key(std_id) references teacher(tech_id));

INSERT INTO student(tech_id,std_id, std_name , std_subject, student_teacher_name) VALUES
(001,001,'AMAN','DSA','LOVE BABAR'),
(002,002,'NAMAN','DBMS','LAKSHYA'),
(003,003,'SANDEEP','WEB-DEV','SHRADHA KHAPRA'),
(004,003,'ANSHUMAAN','JAVA','HARRY'),
(005,005,'ARYAN','SPRING-BOOT','DURGESH');

SELECT * FROM student;
DROP TABLE student;
DROP TABLE teacher;

-- THIS QUERY IS FOR INNER JOIN 
SELECT * FROM teacher AS t INNER JOIN student AS s on t.tech_id=s.std_id;  

-- THIS QUERY SELECTS PARTICULAR COLUMNS FROM THE SPECIFIED TABLE AND DO INNER JOIN
SELECT tech_name,tech_subject,std_name FROM teacher AS t INNER JOIN student AS s on t.tech_id=s.std_id;  

-- THIS QUERY IF FOR LEFT JOIN
SELECT * FROM teacher as t LEFT JOIN student as s on t.tech_id=s.std_id;

-- THIS QUERY IF FOR LEFT JOIN
SELECT * FROM teacher as t RIGHT JOIN student as s on t.tech_id=s.std_id;

-- THIS QUERY IF FOR CROSS JOIN
SELECT t.tech_id,t.tech_name,s.std_id,s.std_name FROM teacher as t CROSS JOIN student as s;
