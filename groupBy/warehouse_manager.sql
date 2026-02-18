WITH inventory_stats AS(
SELECT
        w.name AS warehouse_name,
        w.product_id,
        w.units * (p.width * p.length * height) as vol_per_prod
FROM warehouse w JOIN products p ON w.product_id = p.product_id
ORDER BY warehouse_name
)

SELECT
        warehouse_name,
        SUM(vol_per_prod) AS volume
FROM inventory_stats 
GROUP BY warehouse_name
ORDER BY warehouse_name