Use sakila;
-- 2 cac bo phim co nam tu 2000 den 2010
SELECT * FROM film WHERE release_year BETWEEN 2000 AND 2010;

-- 3 lay danh sach cac bo phim co rating la PG hoac PG-13
SELECT * FROM film WHERE rating = 'PG' OR rating = 'PG-13';
SELECT * FROM film WHERE rating IN ( 'PG','PG-13');

-- 4 Lay danh sach dien vien actors -id, first_name, last_name va so luong film films ma ho tham gia va sap xep giam dan
SELECT a.actor_id, first_name, last_name, COUNT(film_id) AS film_count
FROM actor a JOIN film_actor fa ON a.actor_id =  fa.actor_id
GROUP BY a.actor_id, first_name, last_name
ORDER BY film_count DESC;

-- 5 lay danh sach cac bo phim films va the loai categories cua chung
SELECT c.name, f.*
FROM film f, film_category fc, category c
WHERE f.film_id = fc.film_id AND fc.category_id = c.category_id;

-- 6 Lay danh sach cac bo films va tong so dien vien actors tham gia trong moi bo film sap xep theo tong so dien vien giam dan
SELECT f.film_id, f.title, COUNT(fa.actor_id) AS actor_count
FROM film f JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY f.film_id
ORDER BY actor_count DESC;

-- 7  lay danh sach cac dien vien actors co so luong bo phim films tham gia lon hon 30
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
FROM actor a, film_actor fa
WHERE a.actor_id = fa.actor_id
GROUP BY a.actor_id
HAVING film_count > 30
ORDER BY film_count DESC;

-- 8. Lay danh sach cac dien vien (actors_id, first_name, last_name) ko tham gia trong bat ky bo phim nao
SELECT a.actor_id, a.first_name, a.last_name
FROM actor a LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
WHERE fa.film_id IS NULL;

-- 10. lay ra cac bo phim va the loai cua chung voi the loai horror
SELECT c.name, f.*
FROM film f, film_category fc, category c
WHERE f.film_id = fc.film_id AND fc.category_id = c.category_id
AND f.title ='Horror';