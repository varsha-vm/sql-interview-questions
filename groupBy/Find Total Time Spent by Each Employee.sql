-- Write your query below
SELECT
        event_day AS day,
        emp_id,
        SUM(out_time - in_time) AS total_time
FROM employees
GROUP by emp_id, event_day
ORDER BY day;