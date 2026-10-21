/* Write your PL/SQL query statement below */
SELECT TO_CHAR(visited_on, 'YYYY-MM-DD') visited_on,
       amount,
       ROUND(amount / 7, 2) average_amount
FROM (
    SELECT visited_on,
           SUM(daily_amount) OVER (
               ORDER BY visited_on
               RANGE BETWEEN 6 PRECEDING AND CURRENT ROW
           ) amount
    FROM (
        SELECT visited_on, SUM(amount) daily_amount
        FROM Customer
        GROUP BY visited_on
    )
)
WHERE visited_on >= (
    SELECT MIN(visited_on) + 6
    FROM Customer
)
ORDER BY visited_on;