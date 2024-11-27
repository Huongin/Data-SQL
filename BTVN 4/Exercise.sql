USE coffee_shop;


/* 10. Select the order id and customers phone number for all orders of product id 4. */
SELECT c.id, o.id, c.phone_number
FROM customers c LEFT JOIN orders o ON c.id = o.customer_id
ORDER BY o.id;

/* 11. Select the product name and order time for filter coffees sold between January 15th 2017 and February 14th 2017. */
SELECT p.id, o.id, p.name, o.order_time
FROM products p RIGHT JOIN orders o ON p.id = o.product_id
WHERE o.order_time BETWEEN '2017-1-15' AND '2017-2-14';

/* 12. Select the product name and price and order time for all orders from females in January 2017. */
SELECT p.id, o.id, c.id, p.name, p.price, o.order_time, c.gender
FROM orders o 
JOIN products p ON p.id = o.product_id
JOIN customers c ON c.id = o.customer_id
WHERE c.gender = 'F' AND o.order_time BETWEEN '2017-01-01' AND '2017-01-31';







