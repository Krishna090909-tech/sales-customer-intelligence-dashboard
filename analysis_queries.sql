CREATE DATABASE sales_project;
USE sales_project;
-- Verify Data First
SELECT * FROM orders LIMIT 10;

----- Total Sales & Profit
SELECT 
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM orders;


---- Total Orders
SELECT COUNT(DISTINCT ﻿Order_ID) AS total_orders
FROM orders;


---- Sales by Region
SELECT 
    region,
    SUM(sales) AS total_sales
FROM orders
GROUP BY region
ORDER BY total_sales DESC;


---- Profit by Region
SELECT 
    region,
    SUM(profit) AS total_profit
FROM orders
GROUP BY region
ORDER BY total_profit DESC;


---- Profit by Category
SELECT 
    category,
    SUM(profit) AS total_profit
FROM orders
GROUP BY category
ORDER BY total_profit DESC;


---- Loss Analysis
SELECT 
    category,
    SUM(profit) AS total_loss
FROM orders
WHERE profit < 0
GROUP BY category
ORDER BY total_loss;


---- Top 5 Loss-Making Products
SELECT 
    product_name,
    SUM(profit) AS total_loss
FROM orders
WHERE profit < 0
GROUP BY product_name
ORDER BY total_loss ASC
LIMIT 5;


---- Top Customers by Sales
SELECT 
    customer_name,
    SUM(sales) AS total_sales
FROM orders
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 5;


----- Top Customers by Profit
SELECT 
    customer_name,
    SUM(profit) AS total_profit
FROM orders
GROUP BY customer_name
ORDER BY total_profit DESC
LIMIT 5;


----- Customers Causing Loss
SELECT 
    customer_name,
    SUM(profit) AS total_loss
FROM orders
WHERE profit < 0
GROUP BY customer_name
ORDER BY total_loss ASC
LIMIT 5;


------ Segment Analysis
SELECT 
    segment,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM orders
GROUP BY segment;


----- Sales Trend by Year
SELECT 
    Order_Year,
    SUM(sales) AS total_sales
FROM orders
GROUP BY Order_Year
ORDER BY Order_Year;


---- Profit Trend by Year
SELECT 
    Order_Year,
    SUM(profit) AS total_profit
FROM orders
GROUP BY Order_Year
ORDER BY Order_Year;


---- Monthly Sales Trend
SELECT 
    Order_Year,
    Order_Month,
    SUM(sales) AS monthly_sales
FROM orders
GROUP BY Order_Year, Order_Month;
