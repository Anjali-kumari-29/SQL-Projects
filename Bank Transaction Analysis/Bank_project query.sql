-- create datbase for bank project
create database Bank_project;
-- use the database
use Bank_project;
-- create customer table
create table Customer(
Customer_ID INT PRIMARY KEY,
Customer_Name varchar(50),
City varchar(50),
);
-- create Accounts table
create table Accounts(
Account_ID INT PRIMARY KEY,
Customer_ID int,
Account_type varchar(20),
Balance int,
);
-- create transaction table
create table Transactions(
transaction_ID int primary key,
Customer_ID int,
transaction_type varchar(10),
amount int,
transaction_date Date
);
-- inserts customer data
insert into Customer(Customer_ID,Customer_Name,City)
values
(1,'Aman','Delhi'),
(2,'Anjali','Gurgaon'),
(3,'Simran','Mumbai'),
(4,'Aaryan','Patna');
--insert accounts data
insert into Accounts(Account_ID,Customer_ID,Account_type,Balance)
values
(101,1,'Savings',50000),
(102,2,'Current',70000),
(103,3,'Savings',30000),
(104,4,'Savings',90000);
-- insert transactions data
insert into Transactions(transaction_ID,Customer_ID,transaction_type,amount,transaction_date)
values
(1,101,'Deposit',10000,'2024-01-10'),
(2,101,'Withdrawal',5000,'2024-01-12'),
(3,102,'Deposit',20000,'2024-01-15'),
(4,103,'Withdrawal',7000,'2024-01-18'),
(5,104,'Deposit',15000,'2024-01-20'),
(6,102,'Withdrawal',10000,'2024-01-22');
select * from Customer
select *from Accounts
select*from Transactions
EXEC sp_rename 'transactions.Customer_ID', 'account_id', 'COLUMN';
-- Analysis queries
--Customer transactions
SELECT 
c.Customer_Name,
a.Account_type,
t.transaction_type,
t.amount
FROM customer c
JOIN accounts a 
ON c.Customer_ID = a.Customer_ID
JOIN transactions t 
ON a.Account_ID = t.Account_ID;
-- total balance per customer
SELECT 
c.Customer_Name,
SUM(a.[Balance]) AS total_balance
FROM Customer c
JOIN accounts a 
ON c.Customer_ID = a.Customer_ID
GROUP BY c.Customer_Name;
-- Total transaction type
SELECT 
transaction_type,
SUM(amount) AS total_amount
FROM transactions
GROUP BY transaction_type;
-- Highest balance customer
SELECT 
c.Customer_Name,
a.Balance
FROM Customer c
JOIN accounts a 
ON c.Customer_ID = a.Customer_ID
ORDER BY a.Balance DESC;
-- Monthly transaction analysis
SELECT 
MONTH(transaction_date) AS month,
SUM(amount) AS total_transaction
FROM transactions
GROUP BY MONTH(transaction_date)
ORDER BY month;

