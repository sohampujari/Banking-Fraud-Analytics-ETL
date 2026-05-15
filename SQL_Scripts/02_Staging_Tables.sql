--Create Staging Customers Table--
CREATE TABLE Stg_Customers (
    CustomerID VARCHAR(10),
    Name VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    AccountType VARCHAR(20),
    KYCStatus VARCHAR(20),
    AccountOpenDate DATE
);

--Create Staging Accounts Table--
CREATE TABLE Stg_Accounts (
    AccountID VARCHAR(10),
    CustomerID VARCHAR(10),
    AccountNumber BIGINT,
    IFSCCode VARCHAR(20),
    Balance DECIMAL(18,2),
    Branch VARCHAR(50),
    AccountStatus VARCHAR(20),
    CreditScore INT,
    LastLoginIP VARCHAR(50)
);

--Create Staging Transactions Table--
CREATE TABLE Stg_Transactions (
    TransactionID VARCHAR(10),
    AccountID VARCHAR(10),
    TransactionDate DATETIME,
    Amount DECIMAL(18,2),
    TransactionType VARCHAR(20),
    PaymentMode VARCHAR(20),
    Location VARCHAR(50),
    DeviceID VARCHAR(20),
    DeviceType VARCHAR(20),
    IP_Address VARCHAR(50),
    Merchant VARCHAR(100),
    FraudFlag VARCHAR(10),
    FraudType VARCHAR(50)
);


--Verify Tables--
SELECT * FROM INFORMATION_SCHEMA.TABLES;


--Final Verification--
SELECT COUNT(*) FROM Stg_Customers;
SELECT COUNT(*) FROM Stg_Accounts;
SELECT COUNT(*) FROM Stg_Transactions;
