/* Write your PL/SQL query statement below */
SELECT MAX(num) num
FROM MyNumbers
WHERE num IN (SELECT num FROM MyNumbers GROUP BY num HAVING COUNT(*) = 1);