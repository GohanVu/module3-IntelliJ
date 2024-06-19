use ss1_exercise_student_management;

#Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select *
from student
where StudentName like 'h%';

#Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select *
from class
where month(StartDate) = 12;

#Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select *
from subject
where Credit between 3 and 5;

#Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update student set ClassID = 2 where StudentName = 'Hung';

#Hiển thị các thông tin: StudentName, SubName, Mark.
#Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.

select s.StudentName , sub.SubName, m.Mark
from student s
join mark m on m.StudentID = s.StudentID
join subject sub on sub.SubID = m.SubID
order by m.Mark desc , s.StudentName;

