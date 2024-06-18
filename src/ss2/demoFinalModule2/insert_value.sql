use c0324h1;
select * from teachers_teach_classes;
insert into classes(name) value ('Math');
insert into classes(name) value ('Physic');
insert into classes(name) value ('Chemistry');
insert into classes(name) value ('English');
insert into classes(name) value ('History');

insert into account_student value ('student1','123');
insert into account_student value ('student2','123');
insert into account_student value ('student3','123');
insert into account_student value ('student4','123');
insert into account_student value ('student5','123');
insert into account_student value ('student6','123');
insert into account_student value ('student7','123');
insert into account_student value ('student8','123');
insert into account_student value ('student9','123');
insert into account_student value ('student10','123');

insert into students(name,gender,phone,dob,id_class,username) value ('Hoang',1,'0329193149','1997-11-18',1,'student1');
insert into students(name,gender,phone,dob,id_class,username) value ('Ngoc',1,'0329593149','1998-10-20',2,'student2');
insert into students(name,gender,phone,dob,id_class,username) value ('Tien',1,'0320583049','1999-09-13',3,'student3');
insert into students(name,gender,phone,dob,id_class,username) value ('Toan',1,'0329578831','2000-07-30',4,'student4');
insert into students(name,gender,phone,dob,id_class,username) value ('Hoa',0,'0927567742','2001-01-29',5,'student5');
insert into students(name,gender,phone,dob,id_class,username) value ('Kieu Anh',0,'0909918762','1995-03-11',1,'student6');
insert into students(name,gender,phone,dob,id_class,username) value ('Truong',1,'0327895649','1996-06-09',2,'student7');
insert into students(name,gender,phone,dob,id_class,username) value ('Thao',0,'0328847601','1997-09-01',3,'student8');
insert into students(name,gender,phone,dob,id_class,username) value ('Long',1,'0917875442','1998-11-07',4,'student9');
insert into students(name,gender,phone,dob,id_class,username) value ('Quyen',1,'0902485986','1999-12-27',5,'student10');

insert into teachers(name,gender,phone,dob) value ('Tuan',1,'0909918762','1985-03-11');
insert into teachers(name,gender,phone,dob) value ('Lan',0,'0329318762','1985-03-22');
insert into teachers(name,gender,phone,dob) value ('Khuong',1,'0902485392','1990-10-01');
insert into teachers(name,gender,phone,dob) value ('Bac',1,'0320589584','1985-03-21');
insert into teachers(name,gender,phone,dob) value ('Trinh',0,'0909918762','1988-07-24');

insert into  teachers_teach_classes value (1,1);
insert into  teachers_teach_classes value (2,3);
insert into  teachers_teach_classes value (3,2);
insert into  teachers_teach_classes value (4,5);
insert into  teachers_teach_classes value (5,4);