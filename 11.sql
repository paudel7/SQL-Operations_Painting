-- Identify the artist and the museum where the most expensive and least expensive painting is placed. 
-- Display the artist name, sale_price, painting name, museum name, museum city and canvas label
-- check ans/much time taken to this-17 sec
	WITH cte AS (
    SELECT *, 
           RANK() OVER (ORDER BY sale_price DESC) AS rnk,
           RANK() OVER (ORDER BY sale_price) AS rnk_asc
    FROM product_size
)
SELECT 
    w.name AS painting,
    cte.sale_price,
    a.full_name AS artist,
    m.name AS museum,
    m.city,
    cz.label AS canvas
FROM cte
JOIN work w ON w.work_id = cte.work_id
JOIN museum m ON m.museum_id = w.museum_id
JOIN artist a ON a.artist_id = w.artist_id
JOIN canvas_size cz ON cz.size_id = CAST(cte.size_id AS UNSIGNED)  -- Casting size_id to UNSIGNED (numeric)
WHERE cte.rnk = 1 OR cte.rnk_asc = 1;

