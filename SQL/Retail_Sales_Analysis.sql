-- ============================================================
-- Retail Sales Analytics & Business Intelligence Dashboard
-- SQL Analysis Script
-- Author : Shridhan
-- ============================================================

-- ============================================================
-- DATABASE
-- ============================================================

CREATE DATABASE retail_sales_db;

USE retail_sales_db;

-- ============================================================
-- TABLE STRUCTURE
-- ============================================================

CREATE TABLE retail_sales (
    Row_ID INT,
    Order_ID VARCHAR(30),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(30),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(100),
    State VARCHAR(100),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Product_ID VARCHAR(30),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2),
    Order_Year INT,
    Order_Month VARCHAR(20),
    Order_Quarter INT,
    Shipping_Days INT,
    Profit_Margin DECIMAL(10,2)
);

-- ============================================================
-- BASIC QUERIES
-- ============================================================

-- 1. View all records
SELECT * FROM retail_sales;

-- 2. Total number of records
SELECT COUNT(*) AS Total_Records
FROM retail_sales;

-- 3. Total Sales
SELECT SUM(Sales) AS Total_Sales
FROM retail_sales;

-- 4. Total Profit
SELECT SUM(Profit) AS Total_Profit
FROM retail_sales;

-- 5. Total Orders
SELECT COUNT(DISTINCT Order_ID) AS Total_Orders
FROM retail_sales;

-- ============================================================
-- CATEGORY ANALYSIS
-- ============================================================

-- 6. Sales by Category
SELECT Category,
SUM(Sales) AS Total_Sales
FROM retail_sales
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 7. Profit by Category
SELECT Category,
SUM(Profit) AS Total_Profit
FROM retail_sales
GROUP BY Category
ORDER BY Total_Profit DESC;

-- ============================================================
-- SUB-CATEGORY ANALYSIS
-- ============================================================

-- 8. Sales by Sub-Category
SELECT Sub_Category,
SUM(Sales) AS Total_Sales
FROM retail_sales
GROUP BY Sub_Category
ORDER BY Total_Sales DESC;

-- 9. Profit by Sub-Category
SELECT Sub_Category,
SUM(Profit) AS Total_Profit
FROM retail_sales
GROUP BY Sub_Category
ORDER BY Total_Profit DESC;

-- ============================================================
-- REGIONAL ANALYSIS
-- ============================================================

-- 10. Sales by Region
SELECT Region,
SUM(Sales) AS Total_Sales
FROM retail_sales
GROUP BY Region
ORDER BY Total_Sales DESC;

-- 11. Profit by Region
SELECT Region,
SUM(Profit) AS Total_Profit
FROM retail_sales
GROUP BY Region
ORDER BY Total_Profit DESC;

-- ============================================================
-- STATE ANALYSIS
-- ============================================================

-- 12. Top 10 States by Sales
SELECT State,
SUM(Sales) AS Total_Sales
FROM retail_sales
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;

-- 13. Bottom 10 States by Profit
SELECT State,
SUM(Profit) AS Total_Profit
FROM retail_sales
GROUP BY State
ORDER BY Total_Profit ASC
LIMIT 10;

-- ============================================================
-- CUSTOMER ANALYSIS
-- ============================================================

-- 14. Sales by Customer Segment
SELECT Segment,
SUM(Sales) AS Total_Sales
FROM retail_sales
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- 15. Profit by Customer Segment
SELECT Segment,
SUM(Profit) AS Total_Profit
FROM retail_sales
GROUP BY Segment
ORDER BY Total_Profit DESC;

-- 16. Top 10 Customers
SELECT Customer_Name,
SUM(Sales) AS Total_Sales
FROM retail_sales
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- ============================================================
-- PRODUCT ANALYSIS
-- ============================================================

-- 17. Top 10 Products by Sales
SELECT Product_Name,
SUM(Sales) AS Total_Sales
FROM retail_sales
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- 18. Top 10 Products by Profit
SELECT Product_Name,
SUM(Profit) AS Total_Profit
FROM retail_sales
GROUP BY Product_Name
ORDER BY Total_Profit DESC
LIMIT 10;

-- ============================================================
-- TIME ANALYSIS
-- ============================================================

-- 19. Monthly Sales
SELECT Order_Month,
SUM(Sales) AS Total_Sales
FROM retail_sales
GROUP BY Order_Month
ORDER BY Total_Sales DESC;

-- 20. Yearly Sales
SELECT Order_Year,
SUM(Sales) AS Total_Sales
FROM retail_sales
GROUP BY Order_Year
ORDER BY Order_Year;

-- 21. Quarterly Sales
SELECT Order_Quarter,
SUM(Sales) AS Total_Sales
FROM retail_sales
GROUP BY Order_Quarter
ORDER BY Order_Quarter;

-- ============================================================
-- SHIPPING ANALYSIS
-- ============================================================

-- 22. Average Shipping Time
SELECT AVG(Shipping_Days) AS Average_Shipping_Days
FROM retail_sales;

-- ============================================================
-- PROFIT ANALYSIS
-- ============================================================

-- 23. Average Profit Margin
SELECT AVG(Profit_Margin) AS Average_Profit_Margin
FROM retail_sales;

-- ============================================================
-- DISCOUNT ANALYSIS
-- ============================================================

-- 24. Average Discount by Category
SELECT Category,
AVG(Discount) AS Average_Discount
FROM retail_sales
GROUP BY Category;

-- ============================================================
-- HIGH VALUE ORDERS
-- ============================================================

-- 25. Orders with Sales Greater Than $1000
SELECT Order_ID,
Customer_Name,
Sales
FROM retail_sales
WHERE Sales > 1000
ORDER BY Sales DESC;
