/* Write your PL/SQL query statement below */
SELECT results
FROM (
    SELECT u.name results,
           ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC, u.name) rn
    FROM Users u
    JOIN MovieRating mr ON u.user_id = mr.user_id
    GROUP BY u.user_id, u.name
)
WHERE rn = 1

UNION ALL

SELECT results
FROM (
    SELECT m.title results,
           ROW_NUMBER() OVER (ORDER BY AVG(mr.rating) DESC, m.title) rn
    FROM Movies m
    JOIN MovieRating mr ON m.movie_id = mr.movie_id
    WHERE mr.created_at >= DATE '2020-02-01'
      AND mr.created_at < DATE '2020-03-01'
    GROUP BY m.movie_id, m.title
)
WHERE rn = 1;