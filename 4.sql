-- How many museums are open every single day?
	select count(1)
	from (select museum_id, count(1)
		  from museum_hours
		  group by museum_id
		  having count(1) = 7) x;