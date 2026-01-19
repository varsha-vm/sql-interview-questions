-- Write your MySQL query statement below
WITH CTE AS(
SELECT
        *,
        ROW_NUMBER() OVER() AS rn
FROM point)

SELECT
        MIN(abs(a.x - b.x)) AS shortest
FROM CTE a 
JOIN CTE b ON b.rn > a.rn
