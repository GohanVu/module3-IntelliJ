use ss1_exercise_student_management ;

select *
from student;

select *
from student
where  Status = true;

select *
from subject
where Credit < 10;

select s.StudentID, s.StudentName, c.ClassName
from student s
join class c on s.ClassID = c.ClassID;

select s.StudentID, s.StudentName, c.ClassName
from student s
join class c on s.ClassID = c.ClassID
where  c.ClassName ='A1';

select s.StudentID, s.StudentName, sub.SubName, m.Mark
from  student s
join  mark m on s.StudentID = m.StudentID
join subject sub on sub.SubID = m.SubID;

select s.StudentID, s.StudentName, sub.SubName, m.Mark
from  student s
join  mark m on s.StudentID = m.StudentID
join subject sub on sub.SubID = m.SubID
where sub.SubName= 'CF';

