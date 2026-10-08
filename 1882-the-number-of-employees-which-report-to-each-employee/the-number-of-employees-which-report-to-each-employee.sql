/* Write your PL/SQL query statement below */
SELECT m.employee_id, m.name, COUNT(e.employee_id) reports_count, ROUND(AVG(e.age)) average_age
FROM Employees m
JOIN Employees e ON m.employee_id = e.reports_to
GROUP BY m.employee_id, m.name
ORDER BY m.employee_id;