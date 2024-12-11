USE sakila;

SELECT SUM(amount) 
FROM payment
WHERE customer_id = 1;

-- /*3. MAX,MIN Function
-- 3.1 show me the maximum length of film we have?
SELECT * FROM film;
SELECT MAX(length) FROM film;
SELECT MIN(length) FROM film;

-- 3.2 show me the information of film that have length is maximun

SELECT film_id, title, length 
FROM film
ORDER BY length DESC
LIMIT 1;

SELECT film_id, title, length
FROM film
WHERE length = (SELECT MAX(length) FROM film);

-- 4.1
SELECT AVG(length)
FROM film
WHERE length > 120;

-- 5.GROUP BY Function
-- 5.1 Tell me the customer's information and the number of retals that person has made
SELECT * FROM rental;

SELECT customer_id, COUNT(rental_id)
FROM rental
GROUP BY customer_id;

-- 5.2
SELECT category_id, COUNT(film_id) AS film_count
FROM film_category
GROUP BY category_id
HAVING film_count > 65
ORDER BY film_count DESC;

SELECT COUNT(*) FROM film WHERE rating = 'R';

SELECT AVG(rental_rate)
FROM film
WHERE length > 60;



