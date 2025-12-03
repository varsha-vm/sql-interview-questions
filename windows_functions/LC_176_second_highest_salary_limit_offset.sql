-- Problem: LC 176 - Second Highest Salary
-- Solution Method: SELECT + LIMIT + OFFSET
-- Time Complexity: O(n log n) for sorting
-- Space Complexity: O(1)


SELECT 
(
        SELECT 
                DISTINCT salary FROM employee 
        ORDER BY salary DESC LIMIT 1 OFFSET 1) AS SecondHighestSalary;