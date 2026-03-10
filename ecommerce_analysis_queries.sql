-- ==========================================================
-- E-COMMERCE CUSTOMER & REVENUE ANALYSIS
-- SQL ANALYTICAL QUERIES
-- ==========================================================

-- Dataset: Cleaned E-commerce Transactions
-- Table: ecommerce_data

-- ==========================================================
-- 1. DATASET OVERVIEW
-- ==========================================================

-- Total number of records
SELECT COUNT(*) 
FROM ecommerce_data;

-- ==========================================================
-- 2. BUSINESS KPI METRICS
-- ==========================================================

-- Total Revenue
SELECT SUM(Revenue) AS Total_Revenue
FROM ecommerce_data;

-- Total Orders
SELECT COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM ecommerce_data;

-- Total Unique Customers
SELECT COUNT(DISTINCT CustomerID) AS Total_Customers
FROM ecommerce_data;

-- Average Order Values 
SELECT 
    SUM(Revenue) / COUNT(DISTINCT InvoiceNo) AS Average_Order_Value
FROM ecommerce_data;

-- =======================================================
-- 3. GEOGRAPHIC SALES ANALYSIS
-- =======================================================

-- Revenue by Country 
SELECT 
    Country,
    SUM(Revenue) AS Total_Revenue
FROM ecommerce_data
GROUP BY Country
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Orders by Country 
SELECT 
    Country,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM ecommerce_data
GROUP BY Country
ORDER BY Total_Orders DESC
LIMIT 10;

-- ==================================================
-- 4. PRODUCT PERFORMANCE ANALYSIS 
-- ==================================================

--Top Products by Revenue 
SELECT 
    Description,
    SUM(Revenue) AS Product_Revenue,
    RANK() OVER (ORDER BY SUM(Revenue) DESC) AS Revenue_Rank
FROM ecommerce_data
GROUP BY Description
LIMIT 10;

-- Top Products by Quantity Sold 
SELECT 
    Description,
    SUM(Quantity) AS Total_Quantity_Sold
FROM ecommerce_data
GROUP BY Description
ORDER BY Total_Quantity_Sold DESC
LIMIT 10;

-- ===============================================
-- 5. CUSTOMER ANALYSIS
-- ===============================================

-- Top Customers by Revenue 
SELECT 
    CustomerID,
    SUM(Revenue) AS Customer_Revenue
FROM ecommerce_data
GROUP BY CustomerID
ORDER BY Customer_Revenue DESC
LIMIT 10;

-- Repeat vs One-Time Customers 
SELECT 
    CASE 
        WHEN CustomerPurchaseCount = 1 THEN 'One-Time Customer'
        ELSE 'Repeat Customer'
    END AS Customer_Type,
    COUNT(DISTINCT CustomerID) AS Customer_Count
FROM ecommerce_data
GROUP BY Customer_Type;

-- ================================================
-- 6. TIME SERIES ANALYSIS
-- ================================================

-- Monthly Revenue 
SELECT 
    OrderMonth,
    SUM(Revenue) AS Monthly_Revenue
FROM ecommerce_data
GROUP BY OrderMonth
ORDER BY OrderMonth;

-- Yearly Revenue 
SELECT 
    OrderYear,
    SUM(Revenue) AS Yearly_Revenue
FROM ecommerce_data
GROUP BY OrderYear
ORDER BY OrderYear;

-- =================================================
-- 7. ADVANCED SQL ANALYSIS (WINDOW FUNCTIONS)
-- =================================================

-- Product Revenue Ranking
SELECT 
    Description,
    SUM(Revenue) AS Product_Revenue,
    RANK() OVER (ORDER BY SUM(Revenue) DESC) AS Revenue_Rank
FROM ecommerce_data
GROUP BY Description
LIMIT 10;

-- Customer Revenue Ranking
SELECT 
    CustomerID,
    SUM(Revenue) AS Customer_Revenue,
    RANK() OVER (ORDER BY SUM(Revenue) DESC) AS Customer_Rank
FROM ecommerce_data
GROUP BY CustomerID
LIMIT 10;

-- ========================================
-- 8. ADVANCED ANALYSIS USING CTE
-- ========================================

-- Top Countries by Revenue 
WITH country_sales AS (
    SELECT 
        Country,
        SUM(Revenue) AS Total_Revenue
    FROM ecommerce_data
    GROUP BY Country
)

SELECT 
    Country,
    Total_Revenue
FROM country_sales
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Customer Revenue Segmentation
WITH customer_revenue AS (
    SELECT 
        CustomerID,
        SUM(Revenue) AS Total_Revenue
    FROM ecommerce_data
    GROUP BY CustomerID
)

SELECT 
    CASE
        WHEN Total_Revenue >= 5000 THEN 'High Value'
        WHEN Total_Revenue >= 1000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Segment,
    COUNT(CustomerID) AS Customer_Count
FROM customer_revenue
GROUP BY Customer_Segment;

-- ========================================
-- 9. REVENUE TREND ANALYSIS
-- ========================================

-- Monthly Revenue Growth
SELECT 
    OrderMonth,
    SUM(Revenue) AS Monthly_Revenue,
    LAG(SUM(Revenue)) OVER (ORDER BY OrderMonth) AS Previous_Month_Revenue
FROM ecommerce_data
GROUP BY OrderMonth
ORDER BY OrderMonth;

-- XXXXXXXXXXXX FINISHED XXXXXXXXXXXXXX