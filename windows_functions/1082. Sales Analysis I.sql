WITH total AS(
SELECT
        seller_id,
        SUM(price) AS total_price,
        RANK() OVER(ORDER BY SUM(price) DESC) AS rnk
FROM sales 
GROUP BY seller_id
)

SELECT
        seller_id
FROM total
WHERE rnk =1;
