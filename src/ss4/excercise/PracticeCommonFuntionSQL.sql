#Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất
select *
from subject
where Credit = (select max(Credit) from subject);

#Hiển thị các thông tin môn học có điểm thi lớn nhất.

select m.SubID, s.SubName, m.Mark
from mark m
left join subject s on  m.SubID = s.SubID
where m.Mark = (select max(Mark) from mark);

#Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần

select s.StudentID, StudentName,s.Address, s.Phone, avg(m.Mark) as avgMark
from student s
left join mark m on s.StudentID = m.StudentID
group by  s.StudentID, StudentName,s.Address, s.Phone
order by avgMark desc ;
