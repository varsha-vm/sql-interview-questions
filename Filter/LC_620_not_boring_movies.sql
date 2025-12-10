-- Approach: filter with WHERE, sort by rating
-- Time: O(N log N)   -- ORDER BY sorting cost
-- Space: O(N)        -- sorting buffer + output size   
SELECT
        *
FROM cinema
WHERE (id%2)!=0 AND description != 'boring'
ORDER BY rating DESC;