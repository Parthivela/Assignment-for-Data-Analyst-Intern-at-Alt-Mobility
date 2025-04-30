#1.Order and Sales Analysis------------------------------------------------------
-- Total sales by order status ----
SELECT order_status, COUNT(*) AS total_orders, SUM(order_amount) AS total_sales
FROM customer_orders
GROUP BY order_status;


-- total sales amount ----
SELECT 
  COUNT(DISTINCT order_id) AS total_orders,
  SUM(order_amount) AS total_sales
FROM customer_orders;


--- Average order amount ---
SELECT 
  AVG(order_amount) AS average_order_value
FROM customer_orders;


--  This query calculates key performance indicators (KPIs) from the customer_orders table:----------------------------------------
-- 1. Total number of unique orders
-- 2. Total revenue from all orders
-- 3. Average order value
-- 4. Date of the first recorded order
-- 5. Date of the most recent order
SELECT
  COUNT(DISTINCT order_id) AS total_orders,
  SUM(order_amount) AS total_sales,
  ROUND(AVG(order_amount), 2) AS avg_order_value,
  MIN(order_date) AS first_order_date,
  MAX(order_date) AS last_order_date
FROM customer_orders;

--  Monthly order and sales analysis: shows trends over time------------------------------------
SELECT 
  DATE_FORMAT(order_date, '%Y-%m') AS month,
  COUNT(order_id) AS total_orders,
  SUM(order_amount) AS total_sales
FROM customer_orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

    
-- Total yearwise sales -------
SELECT 
    DATE_FORMAT(STR_TO_DATE(order_date, '%Y-%m-%d'), '%Y') AS year,
    SUM(order_amount) AS total_sales_year
FROM customer_orders
WHERE order_date IS NOT NULL
GROUP BY year
ORDER BY year DESC;

-- Total monthly sales ------
SELECT 
    DATE_FORMAT(STR_TO_DATE(order_date, '%Y-%m-%d'), '%Y-%m') AS month,
    SUM(order_amount) AS total_sales_month
FROM customer_orders
WHERE order_date IS NOT NULL
GROUP BY month
ORDER BY month DESC;

-- This query calculates the total sales for each year and month from the customer_orders table.---
SELECT 
    DATE_FORMAT(STR_TO_DATE(order_date, '%Y-%m-%d'), '%Y') AS year,
    SUM(order_amount) AS total_sales_year,
    DATE_FORMAT(STR_TO_DATE(order_date, '%Y-%m-%d'), '%Y-%m') AS month,
    SUM(order_amount) AS total_sales_month
FROM customer_orders
WHERE order_date IS NOT NULL
GROUP BY year, month
ORDER BY year DESC, month DESC;