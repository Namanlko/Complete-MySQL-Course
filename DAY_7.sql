CREATE DATABASE CustomerDB;
USE CustomerDB;
DROP DATABASE CustomerDB;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    city VARCHAR(100)
);
INSERT INTO customers (customer_id, name, age, city) VALUES
(1, 'Aman', 25, 'LKO'),
(2, 'Naman', 30, 'NOIDA'),
(3, 'Sandeep', 22, 'GERMANY'),
(4, 'Anshumaan', 35, 'NOIDA'),
(5, 'Gaurav', 28, 'BARABANKI');

CREATE INDEX idx_customer_name
ON customers (name);

CREATE UNIQUE INDEX idx_unique_name
ON customers (name);

CREATE INDEX idx_customer_name_age
ON customers (name, age);

SELECT * FROM customers WHERE name = 'Aman';

SELECT * FROM customers WHERE city = 'GERMANY';

SELECT * FROM customers WHERE name = 'Naman' AND age = 30;

EXPLAIN SELECT * FROM customers WHERE name = 'Aman';