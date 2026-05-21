create database reatilsalesdata;
use retailsalesdata;
drop database reatilsalesdata;
create database retaildsalesdata;
use retailsalesdata;
drop database retaildsalesdata;
create database retailsalesdata;
create table Sales_Data_Tansaction (
Customer_ID varchar(20) Primary Key,
Trans_date varchar(200),
tran_amount Int);

create table Sales_Data_response (
Customer_ID varchar(20) Primary Key,
Response Int);

select * from Sales_Data_Tansaction;
select * from Sales_Data_response;

-- 1. Create a fresh database for the project
CREATE DATABASE RetailCampaignDB;
USE RetailCampaignDB;

-- 2. Create the Transactions table
CREATE TABLE Transactions (
    customer_id VARCHAR(50),
    trans_date VARCHAR(50), -- Initially imported as text to avoid formatting strictness
    tran_amount INT
);

-- 3. Create the Campaign Response table
CREATE TABLE Response (
    customer_id VARCHAR(50) PRIMARY KEY,
    response INT
);

SHOW VARIABLES LIKE "secure_file_priv";

USE RetailCampaignDB;

-- TRUNCATE empties any partial data left over from the wizard attempts
TRUNCATE TABLE Transactions; 
TRUNCATE TABLE Response;

-- 1. Lightning fast upload for Transactions (125,000 rows instantly)
LOAD DATA INFILE 'C:\Users\shivs\Downloads\clean_transactions.csv' -- Change backslashes to forward slashes
INTO TABLE Transactions
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- Skips header column

-- 2. Lightning fast upload for Response
LOAD DATA INFILE 'C:\Users\shivs\Downloads\clean_response.csv'
INTO TABLE Response
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SHOW VARIABLES LIKE "secure_file_priv";

USE RetailCampaignDB;

-- 1. Load Transactions
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/clean_transactions.csv'
INTO TABLE Transactions
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 2. Load Response
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/clean_response.csv'
INTO TABLE Response
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

USE RetailCampaignDB;

-- 1. Check total rows in Transactions (Should be 125,000)
SELECT COUNT(*) AS total_transaction_rows FROM Transactions;

-- 2. Check total rows in Response (Should be 6,884)
SELECT COUNT(*) AS total_response_rows FROM Response;

-- 3. Preview a small combined sample to ensure data types look clean
SELECT t.customer_id, t.trans_date, t.tran_amount, r.response 
FROM Transactions t
LEFT JOIN Response r ON t.customer_id = r.customer_id
LIMIT 5;