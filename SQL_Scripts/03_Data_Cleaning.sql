--Create Clean Customers Table--
SELECT DISTINCT
    CustomerID,
    Name,
    Gender,
    Age,
    PhoneNumber,
    Email,
    City,
    State,
    AccountType,
    KYCStatus,
    AccountOpenDate
INTO Clean_Customers
FROM Stg_Customers
WHERE CustomerID IS NOT NULL;

--Create Clean Accounts Table--
SELECT DISTINCT
    AccountID,
    CustomerID,
    AccountNumber,
    IFSCCode,
    Balance,
    Branch,
    AccountStatus,
    CreditScore,
    LastLoginIP
INTO Clean_Accounts
FROM Stg_Accounts
WHERE AccountID IS NOT NULL;

--Create Clean Transactions Table--
SELECT DISTINCT
    TransactionID,
    AccountID,
    TransactionDate,
    Amount,
    TransactionType,
    PaymentMode,
    Location,
    DeviceID,
    DeviceType,
    IP_Address,
    Merchant,
    FraudFlag,
    FraudType
INTO Clean_Transactions
FROM Stg_Transactions
WHERE TransactionID IS NOT NULL;

--Verify Counts--
SELECT COUNT(*) FROM Clean_Customers;
SELECT COUNT(*) FROM Clean_Accounts;
SELECT COUNT(*) FROM Clean_Transactions;

--Verify Sample Data--
SELECT TOP 10 * FROM Clean_Transactions;
