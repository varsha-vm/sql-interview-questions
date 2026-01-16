-- How to bring other points to sample line? by join?
WITH CTE AS(
SELECT
        ROW_NUMBER() OVER() AS rn,
        x,
        y
FROM point2d 
)

SELECT
        ROUND(MIN(sqrt(((b.x - a.x)*(b.x - a.x)) + ((b.y - a.y)*(b.y - a.y)))),2) AS shortest
FROM CTE a
JOIN CTE b ON b.rn > a.rn;