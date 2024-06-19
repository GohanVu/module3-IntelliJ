select Address ,count(StudentID) as 'So luong sinh vien'
from student
group by Address ;

select s.StudentID, s.StudentName, avg(m.Mark)
from student s join mark m on s.StudentID = m.StudentID
group by s.StudentID, s.StudentName;

select s.StudentID, s.StudentName,avg(m.Mark)
from student s join  mark m on s.StudentID = m.StudentID
group by s.StudentID, s.StudentName
having avg(m.Mark) > 15;

select s.StudentID, s.StudentName, avg(m.Mark) as avgMark
from student s
join mark m on s.StudentID = m.StudentID
group by  s.StudentID, s.StudentName
having avgMark >= all (select avg(Mark) from mark group by StudentID);