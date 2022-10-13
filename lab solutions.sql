USE sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT fc.category_id AS category, count(*) AS num_films
FROM sakila.film_category fc
JOIN sakila.film f
ON fc.film_id = f.film_id
GROUP BY category
ORDER BY num_films DESC;

-- 2. Display the total amount rung up by each staff member in August of 2005.

SELECT concat(s.first_name, ' ', s.last_name) AS staff, sum(p.amount) AS total_amount_rung
FROM sakila.staff s
JOIN sakila.payment p
ON s.staff_id=p.staff_id
WHERE left(payment_date, 7) = '2005-08'
GROUP BY s.staff_id;

-- 3. Which actor has appeared in the most films?

SELECT concat(a.first_name, ' ', a.last_name) AS actor, count(*) AS num_films
FROM sakila.actor a
JOIN sakila.film_actor fa
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY num_films DESC
LIMIT 1;

-- 4. Most active customer (the customer that has rented the most number of films)

SELECT concat(c.first_name, ' ', c.last_name) AS customer, count(*) AS num_rentals 
FROM sakila.customer c
JOIN sakila.rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY num_rentals DESC
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member.

SELECT s.first_name, s.last_name, a.address
FROM sakila.staff s
JOIN sakila.address a
ON s.address_id = a.address_id
GROUP BY s.staff_id;

-- 6. List each film and the number of actors who are listed for that film.

SELECT f.title, count(fa.actor_id) AS num_actors
FROM sakila.film f
JOIN sakila.film_actor fa
ON f.film_id = fa.film_id
GROUP BY f.film_id
ORDER BY num_actors DESC;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT concat(c.first_name, ' ', c.last_name) AS customer, sum(p.amount) AS total_paid
FROM sakila.customer c
JOIN sakila.payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name;

-- 8. List number of films per category.

SELECT c.name AS category, count(*) AS num_films
FROM sakila.category c
JOIN sakila.film_category fc
ON c.category_id = fc.category_id
GROUP BY category
ORDER BY num_films DESC;