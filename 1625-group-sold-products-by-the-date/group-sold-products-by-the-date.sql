/* Write your PL/SQL query statement below */
SELECT TO_CHAR(sell_date, 'YYYY-MM-DD') sell_date,
       COUNT(*) AS num_sold,
       LISTAGG(product, ',') WITHIN GROUP (ORDER BY product) products
FROM (
    SELECT DISTINCT sell_date, product
    FROM Activities
)
GROUP BY sell_date
ORDER BY sell_date;