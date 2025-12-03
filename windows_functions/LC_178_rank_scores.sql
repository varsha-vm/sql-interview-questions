--Time: O(N lOG N)
--Space: O(N)
SELECT
        score,
        DENSE_RANK() OVER(ORDER BY score DESC) AS 'rank'
FROM scores
ORDER BY score DESC
