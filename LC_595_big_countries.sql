--Write your MySQL query statement below
--Time: O(N)
--Space: O(1)
SELECT
        name,
        population,
        area
FROM world
WHERE (area >= 3000000 OR population>=25000000);