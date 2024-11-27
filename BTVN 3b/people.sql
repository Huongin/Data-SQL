SELECT * FROM people.person;

-- 1.Lấy ra danh sách các nghề nghiệp (job) duy nhất mà người trong bảng không làm trùng lặp.
SELECT DISTINCT job FROM person ORDER BY job;

-- 2.Lấy ra danh sách các người có nghề nghiệp (job) là ‘Manager’ và lương (salary) lớn hơn 70000.
SELECT * FROM person 
WHERE job = 'Manager' AND salary > 70000;

-- 3.Lấy ra người có tuổi từ 25 đến 35.
SELECT * FROM person 
WHERE YEAR(curdate()) - YEAR(birthday) BETWEEN 25 AND 35
AND (MONTH(curdate()) > MONTH(birthday) 
OR (MONTH(curdate()) = MONTH(birthday) AND DAY(curdate()) >= DAY(birthday)));
    
-- 4.Lấy ra danh sách các quốc gia (country) và tổng số lượng người từng quốc gia.
SELECT COUNT(*) AS total_people, country
FROM person
GROUP BY country
ORDER BY total_people DESC;

-- 5.Tính số lượng nam (gender = ‘Male’) và nữ (gender = ‘Female’) trong bảng.
SELECT COUNT(*) AS total_males
FROM person
WHERE gender = 'M'
UNION
SELECT COUNT(*) AS total_females
FROM person
WHERE gender = 'F';

-- 6.Lấy ra số lượng người có cùng nghề nghiệp (job) và quốc gia (country).
SELECT COUNT(*) AS total_people, job, country
FROM person
GROUP BY job, country
ORDER BY total_people DESC;

-- 7.Lấy ra danh sách người theo thứ tự giảm dần của ngày sinh (birthday).
SELECT * FROM person ORDER BY birthday DESC;

-- 8.Lấy ra các nghề nghiệp (job) và tổng số lượng người làm nghề đó, nhưng chỉ hiển thị những nghề nghiệp có ít nhất 3 người làm.
SELECT COUNT(*) AS total_people, job
FROM person
GROUP BY job
HAVING COUNT(*) >= 3
ORDER BY total_people DESC;