CREATE DATABASE SHOP;
USE SHOP;
drop database Grouping_Aggregations;

CREATE TABLE  customer(cst_id int primary key ,cst_name varchar(20),cst_number int(10),purchase_amt int);

INSERT INTO customer(cst_id,cst_name,cst_number,purchase_amt)VALUES
(001,'AMAN',1001001001,100),
(002,'NAMAN',1002002002,35),
(003,'SANDEEP',1003003003,68),
(004,'ANSHUMAAN',1004004004,32),
(005,'AMAN',1001001001,120),
(006,'AMAN',1001001001,110),
(007,'NAMAN',1002002002,330),
(008,'ANSHUMAAN',1004004004,400),
(009,'ANSHUMAAN',1004004004,10);

-- GROUPING THE DATA (GROUP BY clause is used to group rows that have the same values in specified columns into summary rows.)
SELECT cst_name,count(*) from customer group by cst_name;
 
-- GROUPING THE DATA WITH AGGREGATE FUNCTIONS (COUNT,AVG,MAX,MIN,SUM).

-- 1) COUNT - Counts the number of rows.
SELECT count(*) from customer;

-- 2) SUM - Sums the values of a numeric column.
SELECT cst_name,sum(purchase_amt) from customer group by cst_name;

-- 3) MAX - Returns the maximum value in a column.
SELECT cst_name,max(purchase_amt) from customer group by cst_name;

-- 4) MIN - Returns the minimum value in a column.
SELECT cst_name,min(purchase_amt) from customer group by cst_name;

-- 5) AVG - Returns the average value of the column.
SELECT cst_name ,avg(purchase_amt) from customer group by cst_name;

--  Using HAVING to filter groups.
SELECT cst_name,sum(purchase_amt) as total from customer group by cst_name having sum(purchase_amt)>100;


drop table customer;