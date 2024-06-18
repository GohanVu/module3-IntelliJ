use c0324h1;
# select s.name,s.gender,s.phone,s.dob,s.id_class,s.username,c.name
# from students s
# join classes c on s.id_class = c.id_class

# select s.name,s.gender,s.phone,s.dob,s.id_class,s.username,c.name,t.name
# from  students s
# join classes c on s.id_class = c.id_class
# join teachers_teach_classes tts on c.id_class = tts.id_class
# join teachers t on t.id_teacher = tts.id_teacher

# select  *
# from  students
# where name in ('Tien','Toan')

# select count(*) as number_student , c.name
# from  students s
# join classes c on s.id_class = c.id_class
# group by c.id_class

# select *
# from  students
# order by name asc