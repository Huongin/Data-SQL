CREATE DATABASE BT2;

USE BT2;

-- Câu 1: Tạo bảng Product
CREATE TABLE Product(
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(30),
price DOUBLE,
quantity INT
);

-- Câu 2: Thêm thông tin vào bảng
INSERT INTO Product (product_name, price, quantity)
VALUES ('Sony Alpha 7C', 1760.0, 2) , ('Sony Alpha A7', 2160.5, 2) , ('Sony A6700', 1479.6, 1) , 
('Sony A6400', 1036.0, 1) , ('Sony ZV1', 780.0, 1), ('Sony ZVE10', 1112.0, 2), 
('Sony ZVE10 II', 1119.6, 3) , ('Sony AlphaA7S', 2999.6 , 3) ,  ('Sony A7CR', 2439.5 , 3),  ('Canon EOS', 791.6 , 1);

-- Câu 3: thêm trường
ALTER TABLE product ADD description VARCHAR(30);

-- Câu 4: Cập nhật giá id = 1 là 99
SELECT * FROM product WHERE id = 1;
UPDATE product SET price = 99 WHERE product_id = 1;

-- Câu 5: Tăng giá id = 2 up 10%
SELECT * FROM product WHERE id = 2;
UPDATE product SET price = price * 1.10 WHERE product_id = 2;


