-- 18) Display the country and the city with most no of museums. Output 2 seperate columns to mention the city and country. If there are multiple value, seperate them with comma.
	-- looks like wrong ans
    WITH cte_country AS (
    SELECT country, COUNT(1) AS num_museums,
           RANK() OVER (ORDER BY COUNT(1) DESC) AS rnk
    FROM museum
    GROUP BY country
),
cte_city AS (
    SELECT city, COUNT(1) AS num_museums,
           RANK() OVER (ORDER BY COUNT(1) DESC) AS rnk
    FROM museum
    GROUP BY city
)
SELECT 
    GROUP_CONCAT(DISTINCT country ORDER BY country SEPARATOR ', ') AS countries,
    GROUP_CONCAT(DISTINCT city ORDER BY city SEPARATOR ', ') AS cities
FROM cte_country
JOIN cte_city 
    ON cte_country.rnk = 1 AND cte_city.rnk = 1;

