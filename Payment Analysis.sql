-- 3. Payment analysis-----
-- Total count of each Payment details --------------
-- Count of successful payments
-- Count of failed payments
-- Count of pending payments
SELECT 
    payment_status, 
    COUNT(*) AS payment_count,  
    SUM(CASE WHEN payment_status = 'completed' THEN 1 ELSE 0 END) AS successful_payments, 
    SUM(CASE WHEN payment_status = 'failed' THEN 1 ELSE 0 END) AS failed_payments,  
    SUM(CASE WHEN payment_status = 'pending' THEN 1 ELSE 0 END) AS pending_payments  
FROM payments
GROUP BY payment_status;

-- Payment success rate --------
SELECT 
    (SUM(CASE WHEN payment_status = 'completed' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS payment_success_rate
FROM payments;

-- Montly Payment status analysis ----
-- Trends Over Time----------------------
SELECT 
    DATE_FORMAT(payment_date, '%Y-%m') AS month, 
    payment_status, 
    COUNT(*) AS payment_count
FROM payments
GROUP BY month, payment_status
ORDER BY month DESC, payment_status;

-- Total Payments failed count -------------
SELECT 
    payment_status, 
    COUNT(*) AS payment_count
FROM payments
WHERE payment_status = 'Failed'
GROUP BY payment_status
ORDER BY payment_count DESC;

-- Payment count detais by payment method ---------
SELECT 
    payment_method, 
    COUNT(*) AS payment_count
FROM payments
GROUP BY payment_method
ORDER BY payment_count DESC;

-- through which payment method how much payment made ------------
SELECT 
    payment_method, 
    SUM(payment_amount) AS total_payment_amount
FROM payments
GROUP BY payment_method
ORDER BY total_payment_amount DESC;

-- which order_id made more payments---
SELECT 
    order_id, 
    COUNT(*) AS payment_count
FROM payments
GROUP BY order_id
ORDER BY payment_count DESC
LIMIT 1;

--- Monthly trends in failed payments -----------
SELECT 
    DATE_FORMAT(payment_date, '%Y-%m') AS month, 
    COUNT(*) AS failed_payments,
    payment_method
FROM payments
WHERE payment_status = 'failed'
GROUP BY month,payment_method
ORDER BY month DESC;

-- Monthy trends successful payments ---------
SELECT 
    DATE_FORMAT(payment_date, '%Y-%m') AS month, 
    COUNT(*) AS success,
    payment_method
FROM payments
WHERE payment_status = 'completed'
GROUP BY month,payment_method
ORDER BY month DESC;

-- Pending payments of monthly trends
SELECT 
    DATE_FORMAT(payment_date, '%Y-%m') AS month, 
    COUNT(*) AS Pending,
    payment_method
FROM payments
WHERE payment_status ='pending'
GROUP BY month,payment_method
ORDER BY month DESC;