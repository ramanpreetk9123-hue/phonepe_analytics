CREATE DATABASE PhonePe_Analytics;
USE PhonePe_Analytics;
CREATE TABLE Users(
User_ID VARCHAR (20) PRIMARY KEY,
Name Varchar(100),
Age INT,
Join_Date DATE
);
CREATE TABLE Transactions (
Transaction_ID VARCHAR (30) PRIMARY KEY,
Amount DECIMAL(15,2),
User_ID VARCHAR(20),
Service VARCHAR (50),
Service_Type VARCHAR (100),
Payment_Status VARCHAR (50),
Reason VARCHAR (50), 
Datee DATE,
FOREIGN KEY (User_ID) references Users (User_ID)
);

LOAD DATA LOCAL INFILE 'C:/uploads/transactions.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';
LOAD DATA LOCAL INFILE 'C:/uploads/transactions.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM transactions;
TRUNCATE TABLE transactions;

ALTER TABLE transactions
drop foreign key transactions_ibfk_1;

LOAD DATA LOCAL INFILE 'C:/Users/GM574VT/Downloads/transactionsss.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Transaction_ID, Amount, User_ID, Service, Service_Type, Payment_Status, Reason, Datee);

SELECT * FROM transactions;

ALTER TABLE transactions 
add constraint fk_transactions
FOREIGN KEY (User_ID)
references users(User_ID);


