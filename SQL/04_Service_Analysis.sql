-- Service Analysis

-- Service based analysis 
SELECT Service, SUM(Amount) as Transaction_Value, COUNT(Transaction_ID) as Total_Transactions,
ROUND(COUNT(Transaction_ID)*100/(SELECT COUNT(*) FROM TRANSACTIONS),2) AS Transactions_share,
ROUND(SUM(Amount)*100 / (SELECT SUM(AMOUNT) FROM TRANSACTIONS), 2) AS Value_Share
from transactions
group by service
ORDER BY Value_Share desc;

-- Split of Payment Status grouped by Service
SELECT Service, COUNT(Transaction_ID) as Total_Transactions,
SUM(CASE
       WHEN Payment_Status= 'Successful'THEN 1 
       ELSE 0
       END) AS Successful_Payments,
SUM(CASE
       WHEN Payment_Status= 'Failed'THEN 1 
       ELSE 0
       END) AS Failed_Payments
FROM transactions
GROUP BY service;