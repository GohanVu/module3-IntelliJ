drop  database  ss1_exercise_student_management;
create database ss1_exercise_student_management;

use ss1_exercise_student_management;

create table Class(
                      ClassID int auto_increment primary key ,
                      ClassName varchar(50) not null ,
                      StartDate datetime not null ,
                      Status bit
);
create table Student(
                        StudentID int auto_increment primary key ,
                        StudentName varchar(30) not null ,
                        Address varchar(50),
                        Phone varchar(20),
                        Status bit,
                        ClassID int not null ,
                        foreign key (ClassID) references  Class(ClassID)
);
create table  Subject(
                         SubID int auto_increment primary key ,
                         SubName varchar(30) not null ,
                         Credit tinyint not null  default 1 check ( Credit >=1 ),
                         Status bit default 1
);
create table Mark(
                     MarkID int auto_increment primary key ,
                     SubID int not null ,
                     StudentID int not null ,
                     Mark float default 0 check ( Mark between 0 and 100 ),
                     ExamTimes tinyint default 1,
                     unique (SubID,StudentID),
                     foreign key (SubID) references Subject(subid),
                     foreign key (StudentID) references  Student(StudentID)
);