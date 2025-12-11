-- Write your MySQL query statement below
-- Time : O(N)
-- Space : O(1)

SELECT
        distinct author_id as id
FROM views
WHERE author_id = viewer_id  
order by id