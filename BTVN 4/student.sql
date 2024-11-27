-- Tạo cơ sở dữ liệu và sử dụng nó
CREATE DATABASE IF NOT EXISTS student;

USE student;

-- Tạo bảng students
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30),
    age INT
);

-- Tạo bảng courses
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(30),
    description TEXT
);

-- Tạo bảng enrollments
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students (student_id),
    FOREIGN KEY (course_id) REFERENCES courses (course_id)
);

-- Chèn dữ liệu vào bảng students
INSERT INTO students (student_name, age)
VALUES 
    ('Lê Thiên Ân', 22),
    ('Huỳnh Anh Khôi', 20),
    ('Phan Huỳnh Phương Du', 21),
    ('Đỗ Đức Minh', 22),
    ('Hoàng Nguyễn Kim Hồng', 20),
    ('Nguyễn Thu Hiền', 19),
    ('Phan Hữu Lộc', 25),
    ('Lê Thanh Hậu', 28),
    ('Đào Tiến Mạnh', 24),
    ('Nguyễn Quang Hưng', 29);

-- Chèn dữ liệu vào bảng courses
INSERT INTO courses (course_name, description)
VALUES 
    ('Đào tạo Flutter', '46 buổi * 2h – 4 tháng'),
    ('Đào tạo Java Spring Boot', '88 buổi * 2.5h – 8 tháng'),
    ('Đào tạo Web Front End', '60 buổi * 2.5h – 5 tháng'),
    ('Lập trình di động IOS', '46 buổi – 4 tháng'),
    ('Luyện thi FE', '60 buổi – 5 tháng');

-- Chèn dữ liệu vào bảng enrollments
INSERT INTO enrollments (student_id, course_id)
VALUES 
    (1, 2), (2, 4), (3, 1), (4, 4), (5, 2), (6, 2), (7, 1), (8, 4), (9, 2), (10, 5), (1, 5), (5, 5), (6, 5), (8, 5);

-- Hiển thị dữ liệu trong bảng students
SELECT * FROM students;

-- Hiển thị dữ liệu trong bảng courses
SELECT * FROM courses;

-- Hiển thị dữ liệu trong bảng enrollments
SELECT * FROM enrollments;

-- Bài tập 1: Lấy danh sách tất cả sinh viên và thông tin khóa học mà họ đã đăng ký.
SELECT s.student_name, c.course_name, c.description
FROM students s  
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;

-- Bài tập 2: Lấy tên của tất cả các khóa học mà một sinh viên cụ thể đã đăng ký (sử dụng tham số student_id).
SELECT s.student_name, c.course_name, c.description
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE s.student_id = 5;

-- Bài tập 3: Lấy danh sách tất cả sinh viên và số lượng khóa học mà họ đã đăng ký.
SELECT s.student_name, COUNT(c.course_id) AS total_courses
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
GROUP BY s.student_name;

-- Bài tập 4: Lấy tất cả các khóa học mà chưa có sinh viên nào đăng ký.
SELECT c.course_name
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;

-- Bài tập 5: Lấy tất cả sinh viên và thông tin khóa học mà họ đã đăng ký, sắp xếp theo tên sinh viên và tên khóa học.
SELECT s.student_name, c.course_name, c.description
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
ORDER BY s.student_name, c.course_id;

-- Bài tập 6: Lấy tất cả các sinh viên và thông tin của họ, cùng với tên khóa học mà họ đăng ký (nếu có).

SELECT s.student_id, s.student_name, s.age, c.course_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id;

-- Bài tập 7: Lấy danh sách tất cả sinh viên và thông tin của họ, cùng với tên khóa học mà họ đăng ký (nếu có). Sắp xếp theo tên sinh viên và tuổi từ cao xuống thấp.
SELECT s.student_id, s.student_name, s.age, c.course_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id
ORDER BY  s.age DESC, s.student_name;

-- Bài tập 8: Lấy tất cả các khóa học và số lượng sinh viên đã đăng ký vào mỗi khóa học.
SELECT c.course_id, c.course_name, COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;
