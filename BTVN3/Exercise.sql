USE coffee_shop;

/* 1. From the customers table, 
select the first name and phone number of all the females 
who have a last name of Bluth. */
SELECT first_name, phone_number
FROM customers
WHERE gender = 'F' AND last_name = 'Bluth';

/* 2. From the products table, 
select the name for all products that have a price greater than 3.00 
or a coffee origin of Sri Lanka. */
 SELECT name 
 FROM products 
 WHERE price LIKE '3%' OR coffee_origin = 'Sri Lanka';

/* 3. How many male customers don’t have a phone number entered into the customers table? */
SELECT * FROM customers WHERE gender = 'M' AND phone_number IS NULL;

/* 4. From the products table, select the name and price of all products with a coffee origin
equal to Colombia or Indonesia. Ordered by name from A-Z. */
SELECT name, price
FROM products
WHERE coffee_origin IN ('Colombia', 'Indonesia')
ORDER BY coffee_origin;

/* 5. From the orders table, select all the orders from February 2017 for customers with 
id’s of 2, 4, 6 or 8. */
SELECT  * FROM orders 
WHERE customer_id IN (2,4,6,8) AND order_time BETWEEN '2017-02-01' AND '2017-12-31';

/* 6. From the customers table, select the first name and phone number of all customers 
who’s last name contains the pattern ‘ar’. */
SELECT first_name, phone_number
FROM customers
WHERE last_name LIKE '%ar%';


/* 7. From the customers table, select distinct last names and order alphabetically from A-Z. */
SELECT DISTINCT last_name
FROM customers
ORDER BY last_name;

/* 8. From the orders table, select the first 3 orders placed by customer with id 1, in February 2017. */
SELECT * FROM orders
WHERE customer_id = 1 AND order_time LIKE '2017-02%' LIMIT 3;

/* 9. From the products table, select the name, price and coffee origin but rename the price to 
retail_price in the results set. */
SELECT name, price AS retail_price, coffee_origin FROM products;







