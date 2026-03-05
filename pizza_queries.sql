/* 
======================================================
PIZZA SALES SQL QUERIES
Project: Analyzing Customer Trends & Product Performance
Tool: MySQL
======================================================
*/

-- 1. Total Revenue: The sum of all pizza order prices
SELECT SUM(Price) AS Total_Revenue 
FROM pizzaplace;

-- 2. Total Orders: The count of unique transactions
SELECT COUNT(DISTINCT Id) AS Total_Orders 
FROM pizzaplace;

-- 3. Average Order Value (AOV)
-- Calculated by dividing Total Revenue by Total Orders
SELECT SUM(Price) / COUNT(DISTINCT Id) AS Avg_Order_Value 
FROM pizzaplace;

-- 4. Total Pizzas Sold
-- Each row in this dataset represents one pizza sold
SELECT COUNT(Id) AS Total_Pizzas_Sold 
FROM pizzaplace;

-- 5. Sales Performance by Category
SELECT Category, 
       SUM(Price) AS Total_Sales, 
       ROUND(SUM(Price) * 100 / (SELECT SUM(Price) FROM pizzaplace), 2) AS Percentage_of_Sales
FROM pizzaplace
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 6. Top 5 Best Sellers by Revenue
SELECT Name, SUM(Price) AS Total_Revenue
FROM pizzaplace
GROUP BY Name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- 7. Bottom 5 Worst Sellers by Revenue
SELECT Name, SUM(Price) AS Total_Revenue
FROM pizzaplace
GROUP BY Name
ORDER BY Total_Revenue ASC
LIMIT 5;
