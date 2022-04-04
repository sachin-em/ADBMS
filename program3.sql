create database university;
use university;

create table student (Name varchar(10),student_number int(3) primary key,class int(2),major varchar(3));
create table course (course_name varchar(50),course_number varchar(10) primary key,credit_hours int(1),department varchar(5));
create table section (section_identifier int(4) primary key,course_number varchar(10),semester varchar(10),year int(3),instructor varchar(20), foreign key(course_number) references course(course_number));
create table grade_report(student_number int(3),section_identifier int(4) ,grade varchar(1), foreign key(section_identifier) references section(section_identifier), foreign key(student_number) references student(student_number));
create table prerequisite(course_number varchar(20),prerequisite_number varchar(15) primary key,foreign key(course_number)references course(course_number));

insert into student values('Smith',17,1,'CS');
insert into student values('Brown',8,2,'CS');

insert into course values('Intro into Computer Science','CS1310',4,'cs');
insert into course values('Data Structures','CS3320',4,'cs');
insert into course values('Discrete Mathematics','Math2410',3,'MATH');
insert into course values('Database','CS3380',3,'CS');

insert into section values(85,'MATH2410','Fall',07,'King');
insert into section values(92,'CS1310','Fall',07,'Anderson');
insert into section values(102,'CS3320','Spring',08,'Kruth');
insert into section values(112,'MATH2410','Fall',08,'Chang');
insert into section values(119,'CS1310','Fall',08,'Anderson');
insert into section values(135,'CS3380','Fall',08,'Stone');


insert into grade_report values(17,112,'B');
insert into grade_report values(17,119,'C');
insert into grade_report values(8,85,'A');
insert into grade_report values(8,92,'A');
insert into grade_report values(8,102,'B');
insert into grade_report values(8,135,'A');

insert into prerequisite values('CS3380','CS3320');
insert into prerequisite values('CS3380','MATH2410');
insert into prerequisite values('CS3320','CS1310');

#retrieve the list of all courses and grades of Smith

#name of student who took section database course offered in fall 2008 and their grade in that section
select student.name, grade_report.grade,course_name from student inner join grade_report on student.student_number=grade_report.student_number inner join section on grade_report.section_identifier=section.section_identifier inner join course on section.course_number=course.course_number where course.course_name='Database' and section.semester='fall' and section.year='08';

#list the prereq of the 'Database' course.
select prerequisite_number from prerequisite inner join course on course.course_number=prerequisite.course_number where course.course_name='database';
