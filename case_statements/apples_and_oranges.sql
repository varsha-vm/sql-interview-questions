-- Write your query below

WITH CTE AS(
SELECT
        sale_date,
        (CASE WHEN fruit = 'apples' THEN sold_num END) AS apple_cnt,
        (CASE WHEN fruit = 'oranges' THEN sold_num END) AS orange_cnt
FROM sales
)

SELECT
        sale_date,
        SUM(apple_cnt) - SUM(orange_cnt) AS diff 
FROM CTE
GROUP BY sale_date
ORDER BY sale_date