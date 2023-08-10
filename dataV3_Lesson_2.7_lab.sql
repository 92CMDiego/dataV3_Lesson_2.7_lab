USE sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT c.name, COUNT(f.film_id) AS cat_num_films
FROM sakila.film_category f
JOIN sakila.category c
ON f.category_id = c.category_id
GROUP BY c.category_id;

-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT s.first_name, s.last_name, SUM(p.amount) AS staff_tot_amount
FROM sakila.payment p
JOIN sakila.staff s
USING (staff_id)
WHERE YEAR(p.payment_date) = 2005 AND MONTHNAME(p.payment_date) = 'August'
GROUP BY staff_id;

-- 3. Which actor has appeared in the most films?
SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS actor_tot_films
FROM sakila.film_actor fa
JOIN sakila.actor a
USING (actor_id)
GROUP BY fa.actor_id
ORDER BY actor_tot_films DESC;

-- 4. Most active customer (the customer that has rented the most number of films).
SELECT c.first_name, c.last_name, COUNT(rental_id) AS cust_num_rents
FROM sakila.rental r
JOIN sakila.customer c
USING (customer_id)
GROUP BY customer_id
ORDER BY cust_num_rents DESC;
-- Most active customer we get is ELEANOR HUNT.
-- We can use COUNT(DISTINCT inventory_id) instead of rental_id to calculate the actual number of films rented,
-- not the number of times that the customer has made a rental.

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT s.staff_id, s.first_name, s.last_name, a.address
FROM sakila.staff s
JOIN sakila.address a
ON s.address_id = a.address_id
GROUP BY staff_id;

-- 6. List each film and the number of actors who are listed for that film.
SELECT fa.film_id, f.title, COUNT(fa.actor_id) AS film_num_actor
FROM sakila.film_actor fa
JOIN sakila.film f
ON fa.film_id = f.film_id
GROUP BY film_id;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer.
-- List the customers alphabetically by last name.
SELECT c.first_name, c.last_name, SUM(amount) AS cust_amount
FROM sakila.payment p
JOIN sakila.customer c
USING (customer_id)
GROUP BY customer_id
ORDER BY c.last_name ASC;

-- 8. List the titles of films per category.
SELECT c.name, f.title
FROM sakila.film_category fc
JOIN sakila.film f
USING (film_id)
JOIN sakila.category c
USING (category_id);