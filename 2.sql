-- Which canva size costs the most?
	select cs.label as canva, ps.sale_price
	from (select *
		  , rank() over(order by sale_price desc) as rnk 
		  from product_size) ps
	JOIN canvas_size cs
    ON CAST(cs.size_id AS CHAR) = CAST(ps.size_id AS CHAR);				