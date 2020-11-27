SELECT film_title, category_name, COUNT(*) AS rental_count
FROM 
	(SELECT title AS Film_title, name AS category_name, rental_id AS rid
	FROM category c
	JOIN film_category fc
	ON  c.category_id = fc.category_id 
	JOIN film f
	ON fc.film_id = f.film_id
	JOIN inventory i
	ON f.film_id = i.film_id
	JOIN rental r
	ON i.inventory_id = r.inventory_id
	WHERE c.name LIKE 'Animation' OR c.name LIKE 'Children' OR c.name LIKE 'Classics' OR c.name LIKE 'Comedy' OR c.name LIKE 'Family' OR c.name LIKE 'Music') t1
GROUP BY 1, 2
ORDER BY 2

