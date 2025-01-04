-- Q1-- Identify the museums which are open on both Sunday and Monday. Display
-- museum name, city.
select distinct m.name as museum_name, m.city, m.state,m.country
	from museum_hours mh 
	join museum m on m.museum_id=mh.museum_id
	where day='Sunday'
	and exists (select 1 from museum_hours mh2 
				where mh2.museum_id=mh.museum_id 
			    and mh2.day='Monday');
