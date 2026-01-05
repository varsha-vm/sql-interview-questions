-- Write your MySQL query statement below
WITH CTE AS(
SELECT
        *,
        ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date ASC) as rn
FROM activity
)

SELECT
        player_id,
        device_id
FROM CTE 
WHERE rn=1
