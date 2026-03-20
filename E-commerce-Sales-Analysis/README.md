# 🛒 E-Commerce Sales Analysis (SQL Project)

## 📌 Project Overview
This project demonstrates the use of SQL for analyzing sales data of an e-commerce system. A relational database was created to store customer, product, and order information, and various SQL queries were used to generate business insights.

---

## 🗂️ Database Structure

The database consists of the following tables:

### 1. Customers
- Customer_id (Primary Key)
- Customer_name
- City

### 2. Products
- product_id (Primary Key)
- product_name
- category
- price

### 3. Orders
- order_id (Primary Key)
- customer_id
- order_date

### 4. Order_Items
- order_item_id (Primary Key)
- order_id
- product_id
- quantity

---

## 🛠️ SQL Concepts Used
- CREATE DATABASE
- CREATE TABLE
- INSERT INTO
- SELECT
- JOIN
- GROUP BY
- ORDER BY
- SUM()
- Aggregate Functions

---

## 📊 Analysis Performed

### 1. Customer Purchase Analysis
Identified which customers purchased which products using JOIN operations.

### 2. Top Selling Products
Calculated total quantity sold for each product.

### 3. Total Revenue
Computed total revenue using product price and quantity.

### 4. Highest Spending Customer
Identified customers who spent the most.

### 5. Monthly Sales Analysis
Analyzed revenue trends month-wise using date functions.

---

## 📈 Key Insights
- Customers purchased multiple products across different categories  
- Electronics products contributed significantly to revenue  
- Certain customers contributed more to total sales  
- Sales can be analyzed monthly to identify trends  

---

## 💻 Tools Used
- SQL (Database Management System)

---

## ✅ Project Outcome
This project demonstrates the ability to:
- Design a relational database  
- Perform data insertion and querying  
- Use SQL for business data analysis  
- Generate meaningful insights from structured data  

---
