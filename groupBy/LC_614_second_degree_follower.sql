# Write your MySQL query statement below
WITH CTE AS(
    SELECT
        DISTINCT follower
FROM follow
)

SELECT
        followee AS follower,
        COUNT(followee) AS num
FROM follow
WHERE followee IN (SELECT * FROM CTE)
GROUP BY followee
ORDER BY follower


