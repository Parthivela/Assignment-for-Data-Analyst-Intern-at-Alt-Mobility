-- 4. Order details Report Analysis--------------------------------
-- order details with respect to customer id,order_date and order_amount-----
SELECT 
    order_id, 
    customer_id, 
    order_date, 
    order_amount
FROM 
    customer_orders
ORDER BY 
    order_date DESC;

-- in the no of days the orders were placed ---------
SELECT 
    order_id, 
    customer_id, 
    STR_TO_DATE(order_date, '%d-%m-%Y') AS formatted_order_date,
    DATEDIFF(CURDATE(), STR_TO_DATE(order_date, '%d-%m-%Y')) AS days_since_order
FROM 
    customer_orders;
    
-- check the payment details by joining the customers and orders table------------
-- Join the customer_orders table with the payments table to analyze payment-related details for each order-------
SELECT 
    o.order_id, 
    o.customer_id, 
    STR_TO_DATE(o.order_date, '%d-%m-%Y') AS formatted_order_date,
    DATEDIFF(CURDATE(), STR_TO_DATE(o.order_date, '%d-%m-%Y')) AS days_since_order,
    p.payment_status, 
    p.payment_method, 
    p.payment_date, 
    p.payment_amount
FROM 
    customer_orders o
LEFT JOIN 
    payments p ON o.order_id = p.order_id
ORDER BY 
    o.order_date DESC;
    
    
-- calculate the total payment received for each order----
SELECT 
    o.order_id, 
    o.customer_id, 
    STR_TO_DATE(o.order_date, '%d-%m-%Y') AS formatted_order_date,
    DATEDIFF(CURDATE(), STR_TO_DATE(o.order_date, '%d-%m-%Y')) AS days_since_order,
    SUM(p.payment_amount) AS total_payment_received
FROM 
    customer_orders o
LEFT JOIN 
    payments p ON o.order_id = p.order_id
GROUP BY 
    o.order_id, o.customer_id, o.order_date;
    
    
-- calculate the count of payments and the average payment amount for each order-----------
SELECT 
    o.order_id, 
    o.customer_id, 
    STR_TO_DATE(o.order_date, '%d-%m-%Y') AS formatted_order_date,
    DATEDIFF(CURDATE(), STR_TO_DATE(o.order_date, '%d-%m-%Y')) AS days_since_order,
    COUNT(p.payment_status) AS payment_count,
    AVG(p.payment_amount) AS avg_payment_amount
FROM 
    customer_orders o
LEFT JOIN 
    payments p ON o.order_id = p.order_id
GROUP BY 
    o.order_id, o.customer_id, o.order_date;


-- caculate total orders per year -----------------------
SELECT 
    o.order_id, 
    o.customer_id, 
    STR_TO_DATE(o.order_date, '%d-%m-%Y') AS formatted_order_date,
    DATEDIFF(CURDATE(), STR_TO_DATE(o.order_date, '%d-%m-%Y')) AS days_since_order,
    IF(DATEDIFF(CURDATE(), STR_TO_DATE(o.order_date, '%d-%m-%Y')) > 0, 
       COUNT(o.order_id) / DATEDIFF(CURDATE(), STR_TO_DATE(o.order_date, '%d-%m-%Y')) * 365, 
       0) AS orders_per_year
FROM 
    customer_orders o
LEFT JOIN 
    payments p ON o.order_id = p.order_id
GROUP BY 
    o.order_id, o.customer_id, o.order_date;