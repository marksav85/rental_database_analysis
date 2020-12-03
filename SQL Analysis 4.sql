/* Query returns frequency and total amount paid by top ten customers on monthly basis */
SELECT  t5.pay_mon, t3.full_name, t5.pay_countpermon, t5.pay_amount
FROM 
	/* Query obtains list of top ten customers  */
	(SELECT full_name, SUM(pay_amount) AS top_ten
	FROM 
		(SELECT full_name, COUNT(*) AS pay_countpermon, SUM(amount) AS pay_amount
		FROM 
			(SELECT first_name, last_name, payment_date, amount,
			CONCAT(first_name, ' ', last_name) AS full_name
			FROM customer c
			JOIN payment p
			ON c.customer_id = p.customer_id
			GROUP BY 1,2,3,4) t1
		GROUP BY 1) t2
	GROUP BY 1
	ORDER BY top_ten DESC
	LIMIT 10) t3 
	/* Query lists frequency and total amount paid by all customers on a monthly basis */
JOIN (SELECT pay_mon, full_name, COUNT(*) AS pay_countpermon, SUM(amount) AS pay_amount
	 FROM 
		(SELECT first_name, last_name, payment_date, amount,
		CONCAT(first_name, ' ', last_name) AS full_name,
		 DATE_TRUNC('month', payment_date) AS pay_mon
		FROM customer c
		JOIN payment p
		ON c.customer_id = p.customer_id
		GROUP BY 1,2,3,4) t4
	  GROUP BY 1,2) t5
ON t5.full_name = t3.full_name
ORDER BY 2,1

