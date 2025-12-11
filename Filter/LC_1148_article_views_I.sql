-- Write your MySQL query statement below
-- Time : O(N log N)
-- Space : O(N)

SELECT
        distinct author_id as id
FROM views
WHERE author_id = viewer_id  
order by id