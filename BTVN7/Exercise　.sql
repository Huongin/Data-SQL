USE sakila;

-- 1. How many category film we have?
SELECT COUNT(DISTINCT category_id) 
FROM category;

-- 2. Count the number of "ACTION" films
SELECT COUNT(*) AS film_ACTION
FROM film f 
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Action';

-- 3. Count the number of unique customers who have in rental table
SELECT COUNT(DISTINCT r.customer_id) AS rentalCustomer_total
FROM rental r;

-- 4. Select the film title and length of all films that have length greater than the average film length
SELECT title, length
FROM film
WHERE length > (SELECT AVG(length) FROM film);

-- 5. Select the maximum number and the minimum number of films for each category

SELECT category_id,
       COUNT(film_id) AS film_count
FROM film_category 
GROUP BY category_id
HAVING COUNT(film_id) = (
    SELECT MAX(film_count)
    FROM (SELECT COUNT(film_id) AS film_count
          FROM film_category
          GROUP BY category_id) AS category_count) 
   OR COUNT(film_id) = (
    SELECT MIN(film_count)
    FROM (SELECT COUNT(film_id) AS film_count
          FROM film_category
          GROUP BY category_id) AS category_count);

-- 6. Tell me each category name and the number of films for that category
SELECT c.category_id, c.name AS category_name, COUNT(fc.film_id) AS film_count
FROM film_category fc LEFT JOIN category c ON fc.category_id = c.category_id
GROUP BY c.category_id, category_name;

-- 7. concatenate the film titles and length from the films table
SELECT CONCAT(title,'- length ',length) AS film_detail
FROM film;

-- 8. Extract the customers email from the 5th character onwards
SELECT customer_id, first_name, last_name, SUBSTR(email,5) AS email
FROM customer;

-- 9. Tell me the customers first name in lower case and last name in upper case for each customer who have last name is "Smith"
SELECT LOWER(first_name) AS first_name, UPPER(last_name) AS last_name
FROM customer
WHERE last_name = 'Smith';

-- 10. Tell me the last 3 letters of each film title from the films table
SELECT RIGHT(title,3) AS film_title_last3letter
FROM film;

-- 11. Concatenate the first three letters in the first name and last name columns together from the customers table
SELECT CONCAT(LEFT(first_name,3),'  ', last_name) AS customer_name
FROM customer;

-- 12. Which films are over 2 hours long?
SELECT * FROM film WHERE length > 120;

-- 13. Which category name had the most film?
SELECT c.category_id, c.name AS category_name, COUNT(fc.film_id) AS film_count
FROM film_category fc LEFT JOIN category c ON fc.category_id = c.category_id
GROUP BY c.category_id, c.name
HAVING COUNT(film_id) = (
    SELECT MAX(film_count)
    FROM (SELECT COUNT(film_id) AS film_count
          FROM film_category
          GROUP BY category_id) AS category_count) ;


-- 14. How many actor for the film 'AFFAIR PREJUDICE'?
 SELECT COUNT(fc.actor_id) AS actor_count
 FROM film_actor fc JOIN film f ON fc.film_id = f.film_id
 WHERE f.title =  'AFFAIR PREJUDICE';
 
-- 15. Which 5 customers made the most rental?
SELECT customer_id, COUNT(customer_id) AS rental_total
FROM rental
GROUP BY customer_id
ORDER BY rental_total DESC
LIMIT 5;


-- 16. Which films were shown in category 'Action'?
SELECT f.film_id, F.title
FROM film f 
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Action';


-- 17. How many of the customers made a rental?
SELECT customer_id, COUNT(customer_id) AS rental_total
FROM rental
GROUP BY customer_id
HAVING COUNT(customer_id) = 1;


