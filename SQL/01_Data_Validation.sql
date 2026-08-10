-- Data Validation
 Use phonepe_analytics;

-- Extracting Total users and Total Transaction Value
SELECT * FROM users;
SELECT COUNT(*) AS Total_Users
FROM users;
SELECT COUNT(*) as Total_Transactions
FROM transactions;

-- Checking for duplicate values 
SELECT User_ID, Count(*) AS Duplicate_count
FROM users 
GROUP BY User_ID 
HAVING Count(*)>1;

SELECT Transaction_ID, Count(*) AS Duplicate_count
FROM transactions 
GROUP BY Transaction_ID 
HAVING Count(*)>1;

-- Checking for no missing values/blanks
SELECT COUNT(*) AS Total_rows,
COUNT(User_ID) as Total_Users,
COUNT(Name) as Names,
COUNT(Age) as Ages,
COUNT(Join_Date) as Dates
from users;

SELECT COUNT(*) AS Total_rows,
COUNT(Transaction_ID) as Total_Transactions,
COUNT(Amount) as amounts,
COUNT(User_ID) as Total_Users,
COUNT(Service) as Services,
COUNT(Service_Type) as Service_Types,
COUNT(Payment_Status) as PaymentStatus,
COUNT(Reason) as Reasons,
COUNT(Datee) as Datess
from transactions;

SELECT COUNT(*) AS unmatched_transactions
from transactions t 
join users u on u.user_ID=t.User_ID
where u.User_ID=null;

SELECT MIN(Amount),
MAX(Amount),
AVG(Amount)
from transactions;

SELECT DISTINCT Service 
from transactions;

SELECT DISTINCT Payment_Status 
from transactions;


