-- 2.Customer Analysis--------------------------------
# Repeating Orders Analysis #
-- As the date format is in text data type so i have used %Y-%m-%d format and to avoid negative values i have used absolute--------------------------
SELECT 
    customer_id, 
    COUNT(order_id) AS total_orders,
    MAX(STR_TO_DATE(order_date, '%Y-%m-%d')) AS last_order_date,
    ABS(DATEDIFF(CURRENT_DATE, MAX(STR_TO_DATE(order_date, '%Y-%m-%d')))) AS days_since_last_order 
FROM customer_orders
WHERE order_date IS NOT NULL
GROUP BY customer_id
HAVING total_orders > 1
ORDER BY days_since_last_order ASC;

-- Customer segmentation 

SELECT 
    customer_id,
    COUNT(order_id) AS total_orders,
    SUM(order_amount) AS total_spend,
    MAX(STR_TO_DATE(order_date, '%d-%m-%Y')) AS last_order_date,
    DATEDIFF(CURDATE(), MAX(STR_TO_DATE(order_date, '%d-%m-%Y'))) AS recency
FROM customer_orders
WHERE order_date IS NOT NULL
GROUP BY customer_id
ORDER BY recency ASC;

--- Sales trends over time ---
SELECT 
    DATE_FORMAT(STR_TO_DATE(order_date, '%Y-%m-%d'), '%Y-%m') AS month,  
    COUNT(order_id) AS total_orders,  
    SUM(order_amount) AS total_sales,  
    AVG(order_amount) AS average_order_value  
FROM customer_orders
GROUP BY month  
ORDER BY month DESC;


--- summarizes customer behavior by calculating total spend, 
--- total orders, average order value, customer lifetime (days since first order), 
-- recency (days since last order), and estimated order frequency per year
SELECT 
    customer_id,
    SUM(order_amount) AS total_spend,  -- Total amount the customer has spent
    COUNT(order_id) AS total_orders,  -- Total number of orders
    AVG(order_amount) AS average_order_value,  -- Average order value
    DATEDIFF(CURDATE(), MIN(STR_TO_DATE(order_date, '%d-%m-%Y'))) AS customer_lifetime_days,  -- Days since first order
    DATEDIFF(CURDATE(), MAX(STR_TO_DATE(order_date, '%d-%m-%Y'))) AS recency,  -- Days since last order
    COUNT(order_id) / DATEDIFF(CURDATE(), MIN(STR_TO_DATE(order_date, '%d-%m-%Y'))) * 365 AS orders_per_year  -- Yearly order frequency estimate
FROM customer_orders
WHERE order_date IS NOT NULL
GROUP BY customer_id;

-- Customers are categorized as Active if their recency (days since last order) is between 0-30 days, 
-- At Risk if it's between 31-90 days, 
-- and Inactive if it's over 90 days. 
-- They are categorized as Loyal if they have 10 or more orders per year, 
--  Regular if they have between 3 and 10 orders, and Occasional if they have fewer than 3 orders
SELECT 
    customer_id,
    SUM(order_amount) AS total_spend,
    COUNT(order_id) AS total_orders,
    AVG(order_amount) AS average_order_value,
    DATEDIFF(CURDATE(), MIN(STR_TO_DATE(order_date, '%d-%m-%Y'))) AS customer_lifetime_days,
    DATEDIFF(CURDATE(), MAX(STR_TO_DATE(order_date, '%d-%m-%Y'))) AS recency,
    COUNT(order_id) / DATEDIFF(CURDATE(), MIN(STR_TO_DATE(order_date, '%d-%m-%Y'))) * 365 AS orders_per_year,
   -- Recency 
    CASE
        WHEN DATEDIFF(CURDATE(), MAX(STR_TO_DATE(order_date, '%d-%m-%Y'))) <= 30 THEN 'Active'
        WHEN DATEDIFF(CURDATE(), MAX(STR_TO_DATE(order_date, '%d-%m-%Y'))) <= 90 THEN 'At Risk'
        ELSE 'Inactive'
    END AS recency_segment,
  -- Frequency 
    CASE
        WHEN COUNT(order_id) / DATEDIFF(CURDATE(), MIN(STR_TO_DATE(order_date, '%d-%m-%Y'))) * 365 > 10 THEN 'Loyal'
        WHEN COUNT(order_id) / DATEDIFF(CURDATE(), MIN(STR_TO_DATE(order_date, '%d-%m-%Y'))) * 365 >= 3 THEN 'Regular'
        ELSE 'Occasional'
    END AS frequency_segment
FROM customer_orders
WHERE order_date IS NOT NULL
GROUP BY customer_id;

-- Customer Total spent details --
--  included customers who spent more than 1000 (adjust threshold as needed)
SELECT 
    customer_id, 
    SUM(order_amount) AS total_spend 
FROM customer_orders
GROUP BY customer_id
HAVING total_spend > 1000  
ORDER BY total_spend DESC;
