/* Write your PL/SQL query statement below */
SELECT product_id, 10 price
FROM Products
GROUP BY product_id
HAVING MIN(change_date) > DATE '2019-08-16'

UNION ALL

SELECT product_id, new_price price
FROM Products
WHERE (product_id, change_date) IN (
    SELECT product_id, MAX(change_date)
    FROM Products
    WHERE change_date <= DATE '2019-08-16'
    GROUP BY product_id
);