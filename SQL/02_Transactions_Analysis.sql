-- Transaction Analysis
USE phonepe_analytics;

-- Extracting Total transactions, Total Transaction Value and Average Transaction Value
SELECT COUNT(*) as Total_transactions,
SUM(Amount) as Total_transaction_value,
AVG(Amount) as Avg_value
FROM transactions;

-- Which Service has highest transaction value and number of transactions
SELECT Service, 
COUNT(*) as Total_transactions,
SUM(Amount) as Total_transaction_value
FROM transactions
GROUP BY Service
ORDER BY Total_transaction_value DESC;

-- Percentage of the share 
SELECT Service, 
COUNT(*) as Total_transactions,
SUM(Amount) as Total_transaction_value,
ROUND(SUM(Amount) * 100.0 / 
(SELECT SUM(Amount) from transactions), 2
) AS Value_percentage
FROM transactions
GROUP BY Service
ORDER BY Value_percentage DESC;

-- Transactions by month
SELECT DATE_FORMAT(Datee, '%Y-%M') AS Month,
COUNT(Transaction_ID) AS Total_transactions,
ROUND(SUM(AMOUNT),2) AS Total_value, 
ROUND(AVG(AMOUNT),2) AS Avg_value
FROM transactions
GROUP BY DATE_FORMAT(Datee, '%Y-%M')
ORDER BY Month;

-- Calculating MoM Growth in terms of Volume of transactions
WITH Monthly as (
SELECT DATE_FORMAT(Datee, '%Y-%M') AS Month,
COUNT(Transaction_ID) AS Total_transactions,
SUM(AMOUNT) AS Total_value
FROM transactions
GROUP BY DATE_FORMAT(Datee, '%Y-%M')
)

SELECT 
Month,
Total_transactions, ROUND(Total_value,2) as Total_Value,
LAG(Total_transactions) OVER (ORDER BY Month) AS Previous_month_Transactions,

ROUND(
(Total_transactions- LAG(Total_transactions) OVER (ORDER BY Month)) / 
LAG(Total_transactions) OVER (ORDER BY Month) * 100 , 2) AS MOM_Growth
FROM Monthly
ORDER BY Month;

-- Grouping Payment Status by volume of transactions
SELECT Payment_Status,
COUNT(Transaction_ID) as Total_Transactions, 
ROUND(COUNT(Transaction_ID)*100 /
(SELECT COUNT(*) FROM Transactions),2) as Perc
FROM transactions
GROUP BY Payment_Status;

-- Calculating MoM Growth in terms of Transaction Value
WITH Monthly as 
(SELECT date_format(Datee, '%Y-%m') as Month,
SUM(Amount) as Total_Value
FROM transactions
group by date_format(Datee, '%Y-%m'))

SELECT Month, Total_Value, LAG(Total_Value) OVER (ORDER BY Month) as Previous_Month_Value,

Round(
(Total_Value-LAG(Total_Value) OVER (ORDER BY Month))
/(LAG(Total_Value) OVER (ORDER BY Month)) * 100, 2) as MOM_Growth_Value
FROM Monthly
ORDER BY Month;

-- Which service had highest successful transactions and lowest failed transactions
SELECT Service, count(Transaction_ID) AS Total_Transactions,
sum(CASE 
       WHEN Payment_Status= 'Successful' THEN 1 
       ELSE 0
       END
) AS Successful_Transactions,
sum(CASE 
       WHEN Payment_Status= 'Failed' THEN 1 
       ELSE 0
       END
) AS Failed_Transactions,

ROUND(SUM(
         CASE
         WHEN Payment_Status='Successful' THEN 1 
       ELSE 0
       END) * 100 / COUNT(Transaction_ID),2)
       AS Success_rate
       
FROM transactions
GROUP BY Service
Order by Successful_Transactions DESC;

-- Reasons for which the payments failed
SELECT Reason, count(Transaction_ID) AS Failed_trans,
ROUND(
COUNT(Transaction_ID) * 100 / (SELECT COUNT(*) FROM Transactions where Payment_Status= 'Failed'),2)
as Failure_Percentage
FROM Transactions
where Payment_Status= 'Failed'
GROUP BY Reason;

SELECT Service, Reason, count(Transaction_ID) AS Failed_trans
FROM transactions
where Payment_status='Failed'
GROUP BY Service, Reason;

-- Weekday vs Weekday analysis
SELECT CASE WHEN DAYOFWEEK(Datee) IN (1,7) THEN 'Weekend' ELSE 'Weekday' END AS Day_type,
count(Transaction_ID) as Total_transactions,
round(count(Transaction_ID) * 100 /
(SELECT COUNT(*) FROM transactions),2
)
as Transactions_share
FROM Transactions
GROUP BY Day_type;

WITH Service_data as (
SELECT Service, SUM(Amount) as Total_Value
From transactions
Group by Service
)

Select Service, Total_Value, RANK() OVER(ORDER BY Total_Value DESC) as Value_rank
FROM Service_data
ORDER BY Value_rank;
