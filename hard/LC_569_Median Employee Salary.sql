# Write your MySQL query statement below
WITH CTE AS(
    SELECT
        *,
        ROW_NUMBER() OVER(PARTITION BY company ORDER BY salary) as row_num,
        COUNT(*) OVER(PARTITION BY company) AS total_rows
FROM employee

)

SELECT 
        id,
        company,
        salary
FROM CTE
WHERE row_num IN (FLOOR((total_rows+1)/2), (total_rows+2)/2)
ORDER BY company, salary;