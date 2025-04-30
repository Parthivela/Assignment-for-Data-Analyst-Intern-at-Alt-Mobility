#Introduction
This repository contains the work completed for the Data Analyst Intern assignment at Alt Mobility. The tasks involve analyzing various aspects of order, payment, and customer data, and creating visualizations to uncover actionable insights. Below is a detailed explanation of each task and the steps taken to complete them
The goal of this analysis is to uncover trends in order fulfillment, customer purchase behavior, payment success rates, and monthly retention patterns using SQL and data visualization tools.



# Data Cleaning and Verification
**Objective:In this task, I cleaned the data and verified its integrity. I checked for any missing (null) values and duplicates in the customer_orders and payments datasets.
## Steps Taken:
1. **Database Setup**: 
   - Created a database named customer and imported the datasets (customer_orders and payments).
2. **Null Values Check**:
   - Checked for any null values in the datasets. No null values were found.
3. **Duplicate Records Check**:
   - Checked for any duplicate records. No duplicates were found.
## Findings:
- No null or duplicate values were found.
- Data is now clean and ready for analysis.



# Task 1: Order and Sales Analysis
**Objective:In this task, I analyzed the order status and sales data to identify trends in order fulfillment and revenue generation.
## Steps Taken:
1. **Order Status Analysis**:
   - Analyzed the order status to identify any issues with order fulfillment.
2. **Revenue Analysis**:
   - Analyzed the sales data to track revenue trends and identify growth patterns.


# Task 2:Customer Analysis
**Objective:Analyzed customer behavior and spending patterns to identify trends, loyalty, and customer retention
##Steps Taken:
Conducted repeating orders analysis to track customer order frequency and time since last purchase.
Performed customer segmentation based on recency (days since last order) and total spend.
Analyzed sales trends over time to identify patterns in customer purchasing behavior.
Summarized customer lifetime, order frequency, and total spend to calculate estimated yearly orders.
Categorized customers into segments (Active, At Risk, Inactive) based on recency, and into Loyalty segments (Loyal, Regular, Occasional) based on frequency of orders.


#Task 3: Payment Status Analysis
**Objective:Analyzed payment status data to assess payment success, failure, and trends over time.
##Steps Taken:
Calculated total payment counts, including successful, failed, and pending payments.
Analyzed monthly payment trends by status and method.
Investigated payment success rates and failures.


#Task 4: Order Details Report Analysis
**Objective:Generated a detailed order report, analyzing order data, payment details, and trends over time.
##Steps Taken:
Extracted order details with respect to customer ID, order date, and order amount.
Calculated the number of days since each order was placed.
Joined customer orders with payment data to analyze payment-related details.
Calculated the total payment received for each order.
Analyzed payment counts and average payment amounts per order.
Calculated the total number of orders placed per year.


#Task 5:Customer Retention Analysis:
**Objective:Visualized customer retention by analyzing repeat purchases over time.
##Steps Taken:
Analyzed customer cohorts and tracked repeat purchases over subsequent months.
Used Power BI to create visualizations showing retention trends by cohort and month.
Created a dashboard to highlight customer retention metrics such as repeat purchase rate


#Conclusion:
In this analysis, I focused on understanding the key aspects of customer behavior, including order frequency, total spend, and customer loyalty. By analyzing the data, I was able to categorize customers based on their activity levels and spending habits, providing insights into customer retention and potential churn risks. The findings suggest that a significant portion of customers are active and loyal, but there are also opportunities to engage with at-risk and inactive customers. Additionally, the sales trends indicate a steady increase in customer purchases, highlighting positive growth. The Power BI visuals created for this analysis offer a clear and interactive way to track these trends and make data-driven decisions for improving customer retention strategies.
   
