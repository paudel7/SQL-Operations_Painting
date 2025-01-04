-- Which museum is open for the longest during a day. Dispay museum name, state and hours open and which day?
-- wrong: could not provide the duration
	SELECT 
    m.name AS museum_name, 
    m.state, 
    mh.day,
    -- Calculate the duration in hours as a decimal value
    TIMESTAMPDIFF(MINUTE, 
                  STR_TO_DATE(mh.open, '%h:%i %p'), 
                  STR_TO_DATE(mh.close, '%h:%i %p')) / 60.0 AS hours_open
FROM museum_hours mh
JOIN museum m ON m.museum_id = mh.museum_id
ORDER BY hours_open DESC
LIMIT 1;
