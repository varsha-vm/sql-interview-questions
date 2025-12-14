--Write your MySQL query statement below
--Time: O(N log N) -> Iterate over all data + sort
--Space: O(1)
WITH CTE AS(
    (SELECT *,
           (SELECT MAX(id) FROM seat) AS max_id
    FROM seat)
)
SELECT
        CASE
            WHEN id < max_id AND id%2!=0 THEN id+1 --odd regular
            WHEN id%2=0 THEN id-1 #even
            ELSE id  --special odd end-case
        END AS id,
        student
FROM CTE
ORDER BY id