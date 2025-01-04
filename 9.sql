-- Identify the artists whose paintings are displayed in multiple countries
	WITH cte AS (
    SELECT DISTINCT a.full_name AS artist, m.country
    FROM work w
    JOIN artist a ON a.artist_id = w.artist_id
    JOIN museum m ON m.museum_id = w.museum_id
)
SELECT artist, COUNT(1) AS no_of_countries
FROM cte
GROUP BY artist
HAVING COUNT(1) > 1
ORDER BY no_of_countries DESC;

