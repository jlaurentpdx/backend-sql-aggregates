-- rank of film category by times rented
-- include the name, count, and rank

SELECT
	name,
    COUNT(*),
    RANK() OVER (ORDER BY COUNT(*) DESC) rank
FROM
	category
INNER JOIN
	film_category
    ON
    	category.category_id = film_category.category_id
INNER JOIN
	film
    ON
    	film_category.film_id = film.film_id
INNER JOIN
	inventory
    ON
    	film.film_id = inventory.film_id
INNER JOIN
	rental
	ON
    	rental.inventory_id = inventory.inventory_id
GROUP BY
	name
  