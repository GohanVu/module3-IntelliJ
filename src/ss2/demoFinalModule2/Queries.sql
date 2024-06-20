use c0324h1;
#Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào.
select s.name,s.gender,s.phone,s.dob,s.id_class,s.username,c.name
from students s
join classes c on s.id_class = c.id_class;

#2. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào, lớp đó giảng viên nào dạy
select s.name,s.gender,s.phone,s.dob,s.id_class,s.username,c.name,t.name
from  students s
join classes c on s.id_class = c.id_class
join teachers_teach_classes tts on c.id_class = tts.id_class
join teachers t on t.id_teacher = tts.id_teacher;

#3. Lấy ra thông tin các học viên đang theo học tại các lớp kể cả các học viên không theo học lớp nào.
select s.name,s.gender,s.phone,s.dob,s.id_class,s.username
from students s
where s.id_class not in (select distinct  id_class from classes );

#4. Lấy thông tin của các học viên tên ‘Tien’ và ‘Toan’. (dữ liệu tự insert để thỏa mãn)
select  *
from  students
where name in ('Tien','Toan');

#5. Lấy ra số lượng học viên của từng lớp.
select count(*) as number_student , c.name
from  students s
join classes c on s.id_class = c.id_class
group by c.id_class;

#6. Lấy ra danh sách học viên và sắp xếp tên theo alphabet. (edited)
select *
from  students
order by name ;