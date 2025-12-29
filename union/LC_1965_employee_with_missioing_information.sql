-- Write your MySQL query statement below
-- Time: O(N LOG N)
-- Space: O(N)
SELECT
        a.employee_id
FROM employees a
LEFT JOIN salaries b ON a.employee_id=b.employee_id
WHERE B.employee_id IS NULL
UNION
SELECT
        a.employee_id
FROM salaries a
LEFT JOIN employees b ON a.employee_id=b.employee_id
WHERE b.employee_id IS NULL
ORDER BY employee_id;