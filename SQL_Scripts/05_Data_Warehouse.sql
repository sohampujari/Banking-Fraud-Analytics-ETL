--Create Customer Dimension--
SELECT DISTINCT
    IDENTITY(INT,1,1) AS CustomerKey,
    CustomerID,
    Name,
    Gender,
    Age,
    City,
    State,
    AccountType,
    KYCStatus
INTO DimCustomer
FROM Clean_Customers;

--Create Account Dimension-
SELECT DISTINCT
    IDENTITY(INT,1,1) AS AccountKey,
    AccountID,
    AccountNumber,
    IFSCCode,
    Branch,
    AccountStatus,
    CreditScore
INTO DimAccount
FROM Clean_Accounts;

--Create Location Dimension--
SELECT DISTINCT
    IDENTITY(INT,1,1) AS LocationKey,
    Location
INTO DimLocation
FROM Clean_Transactions;

--Create Date Dimension--
SELECT DISTINCT
    IDENTITY(INT,1,1) AS DateKey,
    CAST(TransactionDate AS DATE) AS FullDate,
    YEAR(TransactionDate) AS Year,
    MONTH(TransactionDate) AS Month,
    DATENAME(MONTH, TransactionDate) AS MonthName,
    DAY(TransactionDate) AS Day
INTO DimDate
FROM Clean_Transactions;

--Create Fact Table--
SELECT
    IDENTITY(INT,1,1) AS TransactionKey,
    dc.CustomerKey,
    da.AccountKey,
    dl.LocationKey,
    dd.DateKey,
    t.TransactionID,
    t.Amount,
    t.TransactionType,
    t.PaymentMode,
    t.Merchant,
    fa.FraudCategory
INTO FactTransactions
FROM Clean_Transactions t
JOIN Clean_Accounts a
    ON t.AccountID = a.AccountID
JOIN DimCustomer dc
    ON a.CustomerID = dc.CustomerID
JOIN DimAccount da
    ON t.AccountID = da.AccountID
JOIN DimLocation dl
    ON t.Location = dl.Location
JOIN DimDate dd
    ON CAST(t.TransactionDate AS DATE) = dd.FullDate
JOIN Fraud_Analysis fa
    ON t.TransactionID = fa.TransactionID;

    --Verify Tables--
SELECT * FROM DimCustomer;
SELECT * FROM DimAccount;
SELECT * FROM DimLocation;
SELECT * FROM DimDate;
SELECT TOP 20 * FROM FactTransactions;

--Verify Fact Count--
SELECT COUNT(*) FROM FactTransactions;


