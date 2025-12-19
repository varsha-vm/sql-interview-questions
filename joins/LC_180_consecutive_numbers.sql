-- Write your MySQL query statement below
-- Time: O(N) => Joins
-- Space: O(N) =>Joins
SELECT 
        c.num AS ConsecutiveNums
FROM logs a JOIN logs b ON (a.id = b.id+1) AND (a.num = b.num)
JOIN logs c on (b.id = c.id+1) AND (b.num = c.num)
GROUP BY c.num
