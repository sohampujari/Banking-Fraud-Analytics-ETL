--1. High Amount Fraud--
SELECT *
FROM Clean_Transactions
WHERE Amount > 150000;

--2. Midnight Transactions--
SELECT *
FROM Clean_Transactions
WHERE DATEPART(HOUR, TransactionDate) BETWEEN 0 AND 3;

--3. Crypto / Gambling Transactions--
SELECT *
FROM Clean_Transactions
WHERE Merchant IN ('CryptoX', 'BetZone', 'Casino247', 'ForexHub');

--4. Dormant Account Transactions--
SELECT t.*, a.AccountStatus
FROM Clean_Transactions t
JOIN Clean_Accounts a
ON t.AccountID = a.AccountID
WHERE a.AccountStatus = 'Dormant';

--5. Create Fraud Analysis Table--
SELECT
    t.TransactionID,
    t.AccountID,
    t.TransactionDate,
    t.Amount,
    t.Merchant,
    t.Location,
    a.AccountStatus,
    CASE
        WHEN t.Amount > 150000 THEN 'High Amount Fraud'
        WHEN DATEPART(HOUR, t.TransactionDate) BETWEEN 0 AND 3 THEN 'Midnight Fraud'
        WHEN t.Merchant IN ('CryptoX', 'BetZone', 'Casino247', 'ForexHub') THEN 'Suspicious Merchant'
        WHEN a.AccountStatus = 'Dormant' THEN 'Dormant Account Activity'
        ELSE 'Normal'
    END AS FraudCategory
INTO Fraud_Analysis
FROM Clean_Transactions t
JOIN Clean_Accounts a
ON t.AccountID = a.AccountID;

--6. Verify Fraud Table--
SELECT TOP 50 * FROM Fraud_Analysis;

--7. Fraud Count--
SELECT FraudCategory, COUNT(*) AS Total
FROM Fraud_Analysis
GROUP BY FraudCategory
ORDER BY Total DESC;