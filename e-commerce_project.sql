create Database ecommerce_project;
use ecommerce_project;
create table customers(
Customer_id int primary key,
Customer_name varchar(50),
City varchar(50)
);
INSERT INTO customers (Customer_id, Customer_name, City)
VALUES
(1,'Aman','Delhi'),
(2,'Anjali','Patna'),
(3,'Simran','Mumbai'),
(4,'Aryan','Kolkata');
select * from customers;
CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
category VARCHAR(50),
price INT
);
INSERT INTO products (product_id, product_name, category, price)
VALUES
(101,'Laptop','Electronics',50000),
(102,'Mobile','Electronics',20000),
(103,'Headphones','Accessories',2000),
(104,'Shoes','Fashion',3000);
select*from products;
CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE
);
INSERT INTO orders (order_id, customer_id, order_date)
VALUES
(1,1,'2024-01-10'),
(2,2,'2024-01-12'),
(3,3,'2024-01-15'),
(4,4,'2024-01-20');
select*from orders;
create table order_items (
order_item_id int primary key,
order_id int,
product_id int,
Quantity int,
);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity)
VALUES
(1,1,101,1),
(2,1,103,2),
(3,2,102,1),
(4,3,104,1),
(5,4,101,1);
select*from order_items
alter table order_items
add product_id int;
INSERT INTO order_items (order_item_id, order_id, product_id, quantity)
VALUES
(1,1,101,1),
(2,1,103,2),
(3,2,102,1),
(4,3,104,1),
(5,4,101,1);
select *from order_items
SELECT 
customers.customer_name,
products.product_name,
order_items.quantity
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN order_items ON orders.order_id = order_items.order_id
JOIN products ON order_items.product_id = products.product_id;
SELECT 
products.product_name,
SUM(order_items.quantity) AS total_sold
FROM order_items
JOIN products 
ON order_items.product_id = products.product_id
GROUP BY products.product_name
ORDER BY total_sold DESC;
SELECT 
SUM(products.price * order_items.quantity) AS total_revenue
FROM order_items
JOIN products
ON order_items.product_id = products.product_id;
SELECT 
customers.customer_name,
SUM(products.price * order_items.quantity) AS total_spent
FROM customers
JOIN orders 
ON customers.customer_id = orders.customer_id
JOIN order_items 
ON orders.order_id = order_items.order_id
JOIN products 
ON order_items.product_id = products.product_id
GROUP BY customers.customer_name
ORDER BY total_spent DESC;
-- Monthly Sales Analysis
SELECT 
YEAR(orders.order_date) AS year,
MONTH(orders.order_date) AS month,
SUM(products.price * order_items.quantity) AS monthly_revenue
FROM orders
JOIN order_items 
ON orders.order_id = order_items.order_id
JOIN products 
ON order_items.product_id = products.product_id
GROUP BY YEAR(orders.order_date), MONTH(orders.order_date)
ORDER BY year, month;
