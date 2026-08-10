-- Customer Analysis
USE phonepe_analytics;

-- Number of transacting users
SELECT COUNT(DISTINCT User_ID) AS Transacting_users from transactions; 

-- Users with more than 10 transactions
SELECT User_ID, COUNT(Transaction_ID) AS Total_transactions
FROM transactions
GROUP BY User_ID
HAVING COUNT(Transaction_ID)>10
ORDER BY Total_transactions DESC;

-- Top 10 users (based off total transaction value)
SELECT t.User_ID, SUM(t.Amount) as Total_Value, u.name
from Transactions t
join users u on t.User_ID=u.User_ID
group by user_ID
ORDER BY Total_Value DESC
LIMIT 10;

-- Top 10 users (based off total transactions)
SELECT t.User_ID, COUNT(transaction_ID) as Total_Transactions, u.name
from Transactions t
join users u on t.User_ID=u.User_ID
group by user_ID
ORDER BY Total_Transactions DESC
LIMIT 10;

-- Split between different age groups
SELECT 
CASE WHEN Age<25 THEN 'Gen Z'
WHEN Age BETWEEN 25 AND 42 THEN 'Millenial'
WHEN Age BETWEEN 42 AND 58 THEN 'Gen X'
ELSE 'Boomers'
End AS Age_Group,

COUNT(DISTINCT u.user_ID) as Users,
COUNT(DISTINCT t.transaction_ID) as Transactions,
SUM(t.Amount) as Total_value

FROM users u 
join transactions t
on u.user_ID=t.user_ID
Group by Age_Group
Order by Total_value DESC;

-- Segmenting users based on their transactions
SELECT User_ID, COUNT(Transaction_ID) AS total_transactions, 
SUM(Amount) as Total_Value,
CASE 
   WHEN COUNT(Transaction_ID) >= 10 AND SUM(Amount)>50000 THEN 'High Value and High Frequency'
   WHEN COUNT(Transaction_ID) >= 10 THEN 'High Frequency'
   WHEN SUM(Amount) >= 50000 THEN 'High Value'
   ELSE 'Low Engagement'
   end as user_segment
FROM transactions
group by user_ID
ORDER BY Total_Value DESC;


SELECT 
CASE WHEN Age<25 THEN 'Gen Z'
WHEN Age BETWEEN 25 AND 42 THEN 'Millenial'
WHEN Age BETWEEN 42 AND 58 THEN 'Gen X'
ELSE 'Boomers'
End AS Age_Group,
t.service,
COUNT(t.Transaction_ID) as Total_Transaction,
SUM(t.Amount) as Transactions_Value
FROM users u
join transactions t
on u.user_ID = t.user_id

GROUP BY age_group, t.service
order by age_group, Transactions_Value DESC;


