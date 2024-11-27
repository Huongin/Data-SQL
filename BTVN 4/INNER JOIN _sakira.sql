USE sakila;

-- 1.Lấy ra tên các thành phố và tên các quốc gia tương ứng của thành phố đó
SELECT c.city, co.country
FROM city c INNER JOIN country co ON co.country_id = c.country_id
ORDER BY c.city_id;

-- 2.Lấy ra tên các thành phố của nước Mỹ
SELECT c.city, co.country
FROM city c JOIN country co ON co.country_id = c.country_id
WHERE country = 'United States';


-- 3.Lấy ra các địa chỉ của thành phố Hanoi
SELECT c.city, ad.address
FROM address ad INNER JOIN city c ON c.city_id = ad.city_id
WHERE city = 'Hanoi';

-- 4.Lấy ra tên, mô tả, tên category của các bộ phim có rating = R
SELECT f.title , f.description, ca.name
FROM film f 
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category ca ON fc.category_id = ca.category_id
WHERE f.rating = 'R';

-- 5.Lấy ra thông tin của các bộ phim mà diễn viên NICK WAHLBERG tham gia
SELECT f.film_id, f.title, f.description, f.release_year
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON fa.film_id = f.film_id
WHERE a.first_name = 'NICK' AND a.last_name = 'WAHLBERG';

-- 6.Tìm email của các khách hàng ở Mỹ
SELECT cus.email
FROM customer cus
INNER JOIN address ad ON cus.address_id = ad.address_id
INNER JOIN city c ON ad.city_id = c.city_id
INNER JOIN country co ON c.country_id = co.country_id
WHERE country = 'United States';
