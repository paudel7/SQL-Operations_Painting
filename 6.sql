-- Display the 3 least popular canva sizes
	SELECT label, ranking, no_of_paintings
FROM (
    SELECT cs.size_id, cs.label, COUNT(1) AS no_of_paintings,
           DENSE_RANK() OVER (ORDER BY COUNT(1)) AS ranking
    FROM work w
    JOIN product_size ps ON ps.work_id = w.work_id
    JOIN canvas_size cs ON CAST(cs.size_id AS CHAR) = CAST(ps.size_id AS CHAR)
    GROUP BY cs.size_id, cs.label
) x
WHERE x.ranking <= 3;