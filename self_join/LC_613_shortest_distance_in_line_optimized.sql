-- Write your MySQL query statement below
WITH CTE AS(
SELECT
        *,
        LAG(x) OVER(ORDER BY x) AS prev_x
FROM point)

SELECT
        MIN(abs(prev_x - x)) AS shortest
FROM CTE 
WHERE prev_x IS NOT NULL;
