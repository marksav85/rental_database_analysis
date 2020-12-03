SELECT
DATE_PART('month', rental_date) rental_month,
DATE_PART('year', rental_date) rental_year, str.store_id, COUNT(*) AS count_rentals
FROM rental r
JOIN staff stf
ON stf.staff_id = r.staff_id
JOIN store str
ON str.store_id = stf.store_id
GROUP BY 1,2,3
ORDER BY 4 DESC
	
	
	


