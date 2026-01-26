-- Write your MySQL query statement below
WITH CTE AS(
    SELECT
        product_id,
        MIN(year) AS first_year
FROM sales
GROUP BY product_id
)

SELECT
        product_id,
        year AS first_year,
        quantity,
        price
FROM sales 
WHERE (product_id, year) IN (SELECT * FROM CTE);
