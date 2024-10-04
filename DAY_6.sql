CREATE DATABASE BankTransactionsDB;
USE BankTransactionsDB;

CREATE TABLE User_account(acc_no int primary key not null unique,acc_holder_name varchar(20),acc_type varchar(20));
INSERT INTO User_account(acc_no,acc_holder_name,acc_type) VALUES
(10001,'AMAN','SAVING'),
(10002,'NAMAN','SAVING'),
(10003,'ANSHUMAAN','CURRENT'),
(10004,'SANDEEP','CURRENT'),
(10005,'ARYAN','SAVING'),
(10006,'GAURAV','CURRENT');

SELECT * FROM User_account;
DROP TABLE User_account;

-- Update single value for particular condition
UPDATE User_account SET acc_type='Current' WHERE acc_no=10001;
SELECT * FROM User_account WHERE acc_no=10001;

-- Update all value of a column to do this we have to disable safe mode
SET SQL_SAFE_UPDATES=0;
UPDATE User_account SET acc_holder_name=concat('Mr ',acc_holder_name);
SELECT * FROM User_account;

-- Delete single tuple for particular condition
DELETE FROM User_account WHERE acc_no=10001;
SELECT * FROM User_account;

-- Delete all value of a column to do this we have to disable safe mode
SET SQL_SAFE_UPDATES=0;
DELETE FROM User_account;
SELECT * FROM User_account;

/* Transaction Control */
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(100),
    balance DECIMAL(10, 2)
);
INSERT INTO accounts(account_id ,account_holder,balance) VALUES
(10001,'AMAN',1000000),
(10002,'NAMAN',200000),
(10003,'ANSHUMAAN',300000),
(10004,'SANDEEP',400000),
(10005,'ARYAN',500000),
(10006,'GAURAV',600000);
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    amount DECIMAL(10, 2),
    transaction_date TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
INSERT INTO transactions(transaction_id,account_id ,amount,transaction_date) VALUES
(10101,10001,1000,'2024-10-1'),
(10202,10001,2000,'2024-10-2'),
(10303,10001,3000,'2024-10-3'),
(10404,10002,400,'2024-10-1'),
(10505,10002,50,'2024-10-6'),
(10606,10005,60000,'2024-10-7');
DROP TABLE transactions;

/*                                              Transaction Script with BEGIN and COMMIT                                                   */
-- Start a transaction
BEGIN;

-- Update operation within the transaction
UPDATE accounts
SET balance = balance - 100
WHERE account_id = 10001;

-- Insert operation within the same transaction
INSERT INTO transactions (account_id, amount, transaction_date)
VALUES (10001, 100, NOW());

-- Commit the transaction if everything is successful
COMMIT;

SELECT * FROM accounts WHERE account_id=10001;

-- End of the transaction 

/*                                              Transaction Script with ROLLBACK                                                           */

-- Start a transaction
BEGIN;

-- Update operation
UPDATE accounts
SET balance = balance - 10000
WHERE account_id = 10005;

-- Simulate an error or rollback condition
-- Inserting a record with negative amount
INSERT INTO transactions (account_id, amount, transaction_date)
VALUES (10005, -100, NOW());

-- If there is an error or you decide to undo the changes
ROLLBACK;

SELECT * FROM accounts WHERE account_id=10005;

