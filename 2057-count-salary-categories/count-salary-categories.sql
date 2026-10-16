/* Write your PL/SQL query statement below */
SELECT 'Low Salary' category, COUNT(CASE WHEN income < 20000 THEN 1 END) accounts_count
FROM Accounts

UNION ALL

SELECT 'Average Salary' category, COUNT(CASE WHEN income BETWEEN 20000 AND 50000 THEN 1 END) accounts_count
FROM Accounts

UNION ALL

SELECT 'High Salary' category, COUNT(CASE WHEN income > 50000 THEN 1 END) accounts_count
FROM Accounts;