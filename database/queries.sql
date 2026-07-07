
-- 1. KPI Card: Total Sales, Profit, Orders
SELECT SUM(sales) as Total_Sales, SUM(profit) as Total_Profit, COUNT(DISTINCT order_id) as Total_Orders FROM train;

-- 2. Top 10 Sub-Category by Sales
SELECT sub_category, SUM(sales) as Total_Sales FROM train GROUP BY 1 ORDER BY 2 DESC LIMIT 10;

-- 3. top 3 sales in st
SELECT 
    State,
    SUM(Sales) AS Total_Sales
FROM 
    house_prices
GROUP BY 
    State
ORDER BY 
    Total_Sales DESC
LIMIT 3;
-- Step 4: Sales by Region + Category
SELECT region, category, SUM(sales) as Total_Sales FROM train GROUP BY 1, 2 ORDER BY 3 DESC;

-- Step 5: Top 10 Products by Profit
SELECT product_name, SUM(profit) as Total_Profit FROM train GROUP BY 1 ORDER BY 2 DESC LIMIT 10;

-- Step 6: Monthly Sales Trend
SELECT TO_CHAR(order_date, 'YYYY-Mon') as Month, SUM(sales) as Monthly_Sales 
FROM train GROUP BY 1, EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date) 
ORDER BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date);

-- Step 7: Discount vs Profit
SELECT discount, SUM(profit) as Total_Profit FROM train GROUP BY 1 ORDER BY 1;

-- Step 8: Profit Margin % by Category
SELECT category, ROUND(SUM(profit)*100.0 / NULLIF(SUM(sales),0), 2) as Profit_Margin_Percent 
FROM train GROUP BY 1 ORDER BY 2 DESC;

-- Step 9: RFM Segment - Best Customers
WITH rfm AS (
  SELECT customer_id, customer_name, MAX(order_date) as Last_Order, COUNT(order_id) as Frequency, SUM(sales) as Monetary
  FROM train GROUP BY 1,2
)
SELECT customer_name, Monetary as Total_Spent FROM rfm ORDER BY 2 DESC LIMIT 10;

-- Step 10: Year-over-Year Growth
WITH yearly AS (
  SELECT EXTRACT(YEAR FROM order_date) as Yr, SUM(sales) as Sales FROM train GROUP BY 1
)
SELECT Yr, Sales, LAG(Sales) OVER(ORDER BY Yr) as Prev_Sales, 
       ROUND((Sales - LAG(Sales) OVER(ORDER BY Yr))*100.0 / LAG(Sales) OVER(ORDER BY Yr), 2) as YoY_Growth_Percent
FROM yearly;
