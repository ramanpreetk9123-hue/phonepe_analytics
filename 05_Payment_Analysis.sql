-- Payment Analysis
USE phonepe_analytics;

-- Payment Status and the percentage 
SELECT Payment_Status, COUNT(Transaction_ID) as Total_transactions,
Round(COUNT(Transaction_ID)*100 /
(SELECT COUNT(*) FROM Transactions),2) as Percentage
from transactions
group by Payment_Status;

-- Reasons why the payments failed and the percentage accounting for it
SELECT Reason, count(Transaction_ID) as Failed_transactions,
ROUND(
count(Transaction_ID)*100 / (SELECT COUNT(*) FROM transactions),2
) as Failed_percentage
from transactions where Payment_status='Failed'
group by Reason
order by Failed_percentage desc;