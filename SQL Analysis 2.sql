SELECT name, 
CASE WHEN quartile = 1 THEN 1
WHEN quartile = 2 THEN 2 
WHEN quartile = 3 THEN 3 
ELSE 4 END AS standard_quartile,
COUNT(*)
FROM 
	(SELECT title, name, rental_duration, NTILE(4) OVER (ORDER BY rental_duration) AS quartile
	FROM category c
	JOIN film_category fc
	ON  c.category_id = fc.category_id 
	JOIN film f
	ON fc.film_id = f.film_id
	WHERE name LIKE 'Animation' OR name LIKE 'Children' OR name LIKE 'Classics' OR name LIKE 'Comedy' OR name LIKE 'Family' OR name LIKE 'Music'
	ORDER BY name) t1	
GROUP BY 1,2
ORDER BY 1,2
	
	
	


