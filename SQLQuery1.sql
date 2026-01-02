create database CourseRegesiterationDatabase;
GO
use CourseRegesiterationDatabase;
GO

create table Students (
    Student_ID int primary key identity,
    First_Name varchar(100),
    Last_Name varchar(100),
    Email varchar(100),
    Phone_Number char(10),
    Enrollment_Date date,
);
create table Departments (
    Department_ID int primary key identity,
    Department_Name varchar(100) ,
);

create table Instructors (
    Instructor_ID int primary key identity,
    Name varchar(100),
    Department int,
    Email varchar(100),
    foreign key (Department) references Departments(Department_ID),
);
create table Courses(
Course_ID int primary key identity,
Courses_Name varchar(100),
Instructor_ID int,
Credits int,
Department int,
foreign key (Instructor_ID)references Instructors(Instructor_ID),
);
create table Course_Requirements (
    Course_ID int,
    Prerequisite_Course_ID int,
    foreign key (Course_ID) references Courses(Course_ID),
    foreign key (Prerequisite_Course_ID) references Courses(Course_ID),
);
create table Enrollments (
    Enrollment_ID int primary key identity,
    Student_ID int,
    Course_ID int,
    Enrollment_Date date,
    Status varchar(20),
    foreign key (Student_ID) references Students(Student_ID),
    foreign key (Course_ID) references Courses(Course_ID)
);
alter table Courses
add constraint FK_Courses_Department
foreign key (Department)
references Departments(Department_ID);

insert into Departments values
('Computer Science'),
('Information Technology'),
('Engineering'),
('Business'),
('Mathematics');

insert into Instructors values
('Dr. Mahmoud', 1, 'mahmoud@uni.com'),
('Dr. Tella', 2, 'tella@uni.com'),
('Dr. Shadin', 3, 'shadin@uni.com'),
('Dr. Lina', 4, 'lina@uni.com'),
('Dr. Ali', 5, 'ali@uni.com');

insert into Courses (Courses_Name, Instructor_ID, Credits, Department)
values
('Database Systems', 2, 3, 2),
('Web Development', 3, 3, 2),
('Data Structures', 3, 4, 1),
('Business Management', 4, 3, 4),
('Calculus', 8, 4, 1);


insert into Students values
('Mohammad', 'Ali', 'mohd@gmail.com', '0791111111', '2025-09-01'),
('Sara', 'Amjad', 'sara@gmail.com', '0792222222', '2025-09-01'),
('Omar', 'Wleed', 'omar@gmail.com', '0793333333', '2025-09-03'),
('Lina', 'Yousef', 'lina@gmail.com', '0794444444', '2025-09-04'),
('Saba', 'Osama', 'saba@gmail.com', '0795555555', '2025-09-05');

insert into Enrollments values
(1, 13, '2025-09-10', 'Enrolled'),
(7, 14, '2025-09-10', 'Completed'),
(3, 15, '2025-09-10', 'Enrolled'),
(6, 16, '2025-09-10', 'Withdrawn'),
(4, 17, '2025-09-10', 'Completed');
insert into Course_Requirements values
(13, 14),
(14, 15);


select s.First_Name, s.Last_Name
from Students s
join Enrollments e on s.Student_ID = e.Student_ID
where e.Course_ID = 15;

insert into Students 
values ('Toqa', 'Abdallah', 'toqa@gmail.com', '0796666666', GETDATE());
update Enrollments
set status = 'Completed'
where Enrollment_ID = 5;

select Courses_Name
from Courses
where Instructor_ID = 4;

select s.First_Name, s.Last_Name
from Students s
join Enrollments e on s.Student_ID = e.Student_ID
where e.Course_ID = 16 and e.status = 'Completed';

select Courses_Name
from Courses
where Department = 1;

insert into Enrollments
values (2, 3, '2025-10-15', 'Enrolled');

select s.Student_ID, s.First_Name
from Students s
where s.Student_ID not in (
    select e.Student_ID
    from Enrollments e
    where e.status = 'Completed'
);

SELECT * FROM Courses;
select * from Instructors;
select * from Students;
select * from Enrollments;
select * from  Course_Requirements;




