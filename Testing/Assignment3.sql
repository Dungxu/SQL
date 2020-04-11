USE 	Testingsystem;
-- Q2 lấy ra tất cả các phòng ban
SELECT 	*
FROM 	department;

-- Q3 lấy ra id của phòng ban "Sale"
SELECT 	Department_id
FROM 	department
WHERE 	Department_name = 'sale' ;

-- Q4 lấy ra thông tin account có full name dài nhất và sắp xếp chúng theo thứ tự giảm dần
SELECT *, LENGTH(Fullname)
FROM `account`
WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `account`)
ORDER BY Fullname ASC;

-- Q5 Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id= 3
 SELECT *, LENGTH(Fullname)
 FROM `account`
 WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `account` ) AND Account_id = 3;
 
 -- Q6 : lấy ra tên group đã tham gia trước ngày 20/12/2019
 SELECT Group_name,Create_date
 FROM `group`
 WHERE Create_date < '20/12/2019';
 
 -- Q7 : Lấy ra ID của question có >= 4 câu trả lời
 SELECT  Question_id, COUNT(Content) AS So_cau_tra_loi
 FROM 		Answer
 GROUP BY Question_id 
 HAVING COUNT(Content) >=2 ;
 
 -- Q8 : Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019 
 SELECT `code` , Duration
 FROM exam 
 WHERE Duration >= 60 AND Create_date < '20/12/2019';
 
 -- Q9  Lấy ra 5 group được tạo gần đây nhất 
 SELECT Group_name,Create_date
 FROM `group` 
 ORDER BY Create_date ASC 
 Limit  5;
 
 -- Q10 : Đếm số nhân viên thuộc department có id = 2
 SELECT *, COUNT(Department_id)
 FROM department
 Where Department_id = 2;
 
 --  Q11 Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
 SELECT *
 FROM `account`
 WHERE Username LIKE 'D%o';
 
 -- Q12 xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE
FROM exam 
WHERE Create_date < '2019/12/20';

-- Q13 xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi
DELETE 
FROM question 
WHERE Content LIKE 'cau hoi%';

-- Q14 update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE `account`
SET Fullname = 'Nguyen Ba Loc', Email = 'loc.nguyenba@vti.com.vn'
WHERE Account_id = 5;

-- Q15 update account có id = 5 sẽ thuộc group có id = 4
UPDATE `groupaccount`
SET Group_id  = 4 
WHERE Account_id = 5;