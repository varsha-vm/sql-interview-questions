WITH CTE AS(
    SELECT
            *,
            LAG(month, 1) OVER(PARTITION BY id ORDER BY month) AS prev_one_month,
            LAG(month, 2) OVER(PARTITION BY id ORDER BY month) AS prev_two_month,
            LAG(salary, 1) OVER(PARTITION BY id ORDER BY month) AS prev_one_salary,
            LAG(salary, 2) OVER(PARTITION BY id ORDER BY month) AS prev_two_salary,
            MAX(month) OVER(PARTITION BY id) AS latest_mon
    FROM EMPLOYEE
),
        
CTE2 AS(
    SELECT
            id,
            month,
            salary,
            CASE WHEN month = prev_one_month + 1 THEN prev_one_salary ELSE 0 END AS s1,
            CASE WHEN month = prev_two_month + 2 THEN prev_two_salary ELSE 0 END AS s2
    FROM CTE
    WHERE month < latest_mon
)

SELECT
        id,
        month,
        s1 + s2 + salary AS Salary
FROM CTE2
ORDER BY id, month DESC