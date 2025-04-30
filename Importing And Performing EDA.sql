# create the database #
create database customer;
#use the particular database which you have created#
use customer;
#check whether the data is imported to db correctly or not#
select * from customer_orders;
#check the count of the records#
select count(*) from customer_orders;
select * from payments;
select count(*) from payments;
#check whether there are any null values in the data------
SELECT
  SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
  SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
  SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS null_order_date,
  SUM(CASE WHEN order_amount IS NULL THEN 1 ELSE 0 END) AS null_order_amount,
  SUM(CASE WHEN shipping_address IS NULL THEN 1 ELSE 0 END) AS null_shipping_address,
  SUM(CASE WHEN order_status IS NULL THEN 1 ELSE 0 END) AS null_order_status
FROM customer_orders;
# As there are no null values in the Customer_orders table
#check the null values in the payments table
SELECT
  SUM(CASE WHEN payment_id IS NULL THEN 1 ELSE 0 END) AS null_payment_id,
  SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
  SUM(CASE WHEN payment_date IS NULL THEN 1 ELSE 0 END) AS null_payment_date,
  SUM(CASE WHEN payment_amount IS NULL THEN 1 ELSE 0 END) AS null_payment_amount,
  SUM(CASE WHEN payment_method IS NULL THEN 1 ELSE 0 END) AS null_payment_method,
  SUM(CASE WHEN payment_status IS NULL THEN 1 ELSE 0 END) AS null_payment_status
FROM payments;
# As there are no null values in the payments table-----
#check whether there are duplicate values in the customers data-----
SELECT order_id, customer_id, order_date, order_amount, shipping_address, order_status, COUNT(*) AS duplicate_count
FROM customer_orders
GROUP BY order_id, customer_id, order_date, order_amount, shipping_address, order_status
HAVING COUNT(*) > 1;
#check whether there are duplicate valuesin the payments table---
SELECT payment_id, order_id, payment_date, payment_amount, payment_method, payment_status, COUNT(*) AS duplicate_count
FROM payments
GROUP BY payment_id, order_id, payment_date, payment_amount, payment_method, payment_status
HAVING COUNT(*) > 1;
#As there are no duplicate values in both the tables we can proceed further --------