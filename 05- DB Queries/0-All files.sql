

--EXEC sp_addextendedproperty 'MS_Description', 'This is sp description\ntry line two', 'schema', dbo, 'PROCEDURE', 'examGenerator'

--EXEC sp_dropextendedproperty 'MS_Description', 'schema', dbo, 'PROCEDURE', 'examGenerator'

--
use master
go
--drop database iti_examination
--
--EXCUTE THE FIRST LINE SEPERATELY FIRST
create database ITI_Examination
go
--
--SELECT FROM HERE TO THE END OF THE FILE AND THEN EXCUTE
use ITI_Examination
go
--drop table Department
create table Department(
	dept_No smallint primary key IDENTITY(301,1) CHECK(dept_No <= 399),
	dept_Name varchar(50) unique not null,
	mngr_Id smallint unique,
	mngr_HireDate date
)
EXEC sp_addextendedproperty 'MS_Description', 'This table contains data of departments', 'schema', dbo, 'table', 'Department'
EXEC sp_addextendedproperty 'MS_Description', 'Department number (identifier)', 'schema', dbo, 'table', 'Department', 'column', dept_No
EXEC sp_addextendedproperty 'MS_Description', 'Department name', 'schema', dbo, 'table', 'Department', 'column', dept_Name
EXEC sp_addextendedproperty 'MS_Description', 'Manager ID (FK refers to instructor ID)', 'schema', dbo, 'table', 'Department', 'column', mngr_Id
EXEC sp_addextendedproperty 'MS_Description', 'Manager hiring date', 'schema', dbo, 'table', 'Department', 'column', mngr_HireDate

--drop table Instructor
create table Instructor(
	inst_Id smallint primary key IDENTITY(2001,1) CHECK(inst_Id between 2001 and 2999),
	inst_Fname varchar(20)  not null,
	inst_Lname varchar(20)  not null,
	inst_Salary int  not null,
	inst_Degree varchar(50),
	dept_No smallint not null FOREIGN KEY REFERENCES Department(dept_No),
	unique (inst_Fname,inst_Lname,inst_Degree,inst_Salary)
)
ALTER TABLE Department
ADD FOREIGN KEY (mngr_Id) REFERENCES Instructor(inst_Id);
EXEC sp_addextendedproperty 'MS_Description', 'This table contains data of instructors', 'schema', dbo, 'table', 'Instructor'
EXEC sp_addextendedproperty 'MS_Description', 'Instructor ID (identifier)', 'schema', dbo, 'table', 'Instructor', 'column', inst_Id
EXEC sp_addextendedproperty 'MS_Description', 'Instructor first name', 'schema', dbo, 'table', 'Instructor', 'column', inst_Fname
EXEC sp_addextendedproperty 'MS_Description', 'Instructor last name', 'schema', dbo, 'table', 'Instructor', 'column', inst_Lname
EXEC sp_addextendedproperty 'MS_Description', 'Instructor salary', 'schema', dbo, 'table', 'Instructor', 'column', inst_Salary
EXEC sp_addextendedproperty 'MS_Description', 'Instructor degree', 'schema', dbo, 'table', 'Instructor', 'column', inst_Degree
EXEC sp_addextendedproperty 'MS_Description', 'Department number (FK refers to department number)', 'schema', dbo, 'table', 'Instructor', 'column', dept_No

--drop table Course
create table Course(
	crs_Code smallint primary key IDENTITY(4001,1) CHECK(crs_Code between 4001 and 4999),
	crs_Name varchar(50) unique not null,
	crs_Duration tinyint not null
)
EXEC sp_addextendedproperty 'MS_Description', 'This table contains data of courses', 'schema', dbo, 'table', 'Course'
EXEC sp_addextendedproperty 'MS_Description', 'Course code (identifier)', 'schema', dbo, 'table', 'Course', 'column', crs_Code
EXEC sp_addextendedproperty 'MS_Description', 'Course name', 'schema', dbo, 'table', 'Course', 'column', crs_Name
EXEC sp_addextendedproperty 'MS_Description', 'Course duration in hours', 'schema', dbo, 'table', 'Course', 'column', crs_Duration

--drop table Course_Topics
create table Course_Topics(
	crs_Code smallint not null foreign key references Course(crs_Code) on delete cascade,
	topic_name varchar(50) not null,
	primary key(crs_Code,topic_name)
)
EXEC sp_addextendedproperty 'MS_Description', 'This table contains the topics for each course', 'schema', dbo, 'table', 'Course_Topics'
EXEC sp_addextendedproperty 'MS_Description', 'Course code (FK refers to course code)', 'schema', dbo, 'table', 'Course_Topics', 'column', crs_Code
EXEC sp_addextendedproperty 'MS_Description', 'Topic name', 'schema', dbo, 'table', 'Course_Topics', 'column', topic_name

create table Questions(
	quest_No smallint primary key IDENTITY(1,1),
	quest_Body varchar(250) unique not null,
	quest_ModelAnswer varchar(1) not null check(quest_ModelAnswer in ('a','b','c','d','t','f')),
	quest_Mark tinyint not null check(quest_Mark between 1 and 10),
	quest_Type varchar(10) not null check (quest_Type in ('MCQ','TorF')),
	crs_Code smallint not null foreign key references Course(crs_Code) on delete cascade
)
--not null befor foreign key is a must or not
EXEC sp_addextendedproperty 'MS_Description', 'This table contains courses questions', 'schema', dbo, 'table', 'Questions'
EXEC sp_addextendedproperty 'MS_Description', 'Question number (identifier)', 'schema', dbo, 'table', 'Questions', 'column', quest_No
EXEC sp_addextendedproperty 'MS_Description', 'Question body', 'schema', dbo, 'table', 'Questions', 'column', quest_Body
EXEC sp_addextendedproperty 'MS_Description', 'Question model answer', 'schema', dbo, 'table', 'Questions', 'column', quest_ModelAnswer
EXEC sp_addextendedproperty 'MS_Description', 'Question mark', 'schema', dbo, 'table', 'Questions', 'column', quest_Mark
EXEC sp_addextendedproperty 'MS_Description', 'Question type. It can be either TorF or MCQ. Choices of MCQ can not exceed 4 choices', 'schema', dbo, 'table', 'Questions', 'column', quest_Type
EXEC sp_addextendedproperty 'MS_Description', 'Course that the question belongs to code (FK refers to course code)', 'schema', dbo, 'table', 'Questions', 'column', crs_Code

--drop table Question_Choices
create table Question_Choices(
	quest_No smallint foreign key references Questions(quest_No) on delete cascade,
	choice varchar(1) not null check(choice in ('a','b','c','d')),
	choice_Body varchar(150) not null,
	primary key(quest_No, choice)
)
EXEC sp_addextendedproperty 'MS_Description', 'This table contains choices of MCQ questions', 'schema', dbo, 'table', 'Question_Choices'
EXEC sp_addextendedproperty 'MS_Description', 'Question number that the choices belong to (FK refers to question number)', 'schema', dbo, 'table', 'Question_Choices', 'column', quest_No
EXEC sp_addextendedproperty 'MS_Description', 'Choice', 'schema', dbo, 'table', 'Question_Choices', 'column', choice
EXEC sp_addextendedproperty 'MS_Description', 'Choice body', 'schema', dbo, 'table', 'Question_Choices', 'column', choice_Body

create table Exam(
	exam_No smallint primary key identity(1,1),
	exam_Date datetime not null,
	total_Marks smallint,
	exam_Duration smallint  not null default 60,
	crs_Code smallint not null foreign key references Course(crs_Code)
)
EXEC sp_addextendedproperty 'MS_Description', 'This table contains all exams', 'schema', dbo, 'table', 'Exam'
EXEC sp_addextendedproperty 'MS_Description', 'Exam number (identifier)', 'schema', dbo, 'table', 'Exam', 'column', exam_No
EXEC sp_addextendedproperty 'MS_Description', 'Exam date', 'schema', dbo, 'table', 'Exam', 'column', exam_Date
EXEC sp_addextendedproperty 'MS_Description', 'Exam total mark (the sum of its questions marks)', 'schema', dbo, 'table', 'Exam', 'column', total_Marks
EXEC sp_addextendedproperty 'MS_Description', 'Exam duration (in minutess)', 'schema', dbo, 'table', 'Exam', 'column', exam_Duration
EXEC sp_addextendedproperty 'MS_Description', 'Course which is the exam for (FK refers to course code)', 'schema', dbo, 'table', 'Exam', 'column', crs_Code
--SELECT SMALLDATETIMEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), DAY(GETDATE())+3, 9, 0);

create table Exam_Questions(
	exam_No smallint not null,
	quest_No smallint not null,
	primary key(exam_No, quest_No),
	foreign key (exam_No) references  Exam(exam_No) on delete cascade,
	foreign key (quest_No) references Questions(quest_No)
)
EXEC sp_addextendedproperty 'MS_Description', 'This table linking the exam with its questions', 'schema', dbo, 'table', 'Exam_Questions'
EXEC sp_addextendedproperty 'MS_Description', 'Exam number (FK refers to exam number)', 'schema', dbo, 'table', 'Exam_Questions', 'column', exam_No
EXEC sp_addextendedproperty 'MS_Description', 'Question number (FK refers to question number)', 'schema', dbo, 'table', 'Exam_Questions', 'column', quest_No

create table Student(
	std_Id smallint primary key identity(10001,1),
	std_Fname varchar(20) not null,
	std_Lname varchar(20) not null,
	std_DOB date check(year(getdate())-year(std_DOB) >= 18),
	std_Address varchar(250) not null,
	std_Mobile varchar(20),
	dept_No smallint not null foreign key references Department(dept_No),
	unique (std_Fname,std_Lname,std_DOB)
)
--if i have a check constraint, i will not need to write not null?
EXEC sp_addextendedproperty 'MS_Description', 'This table contains students data', 'schema', dbo, 'table', 'Student'
EXEC sp_addextendedproperty 'MS_Description', 'Student ID (identifier)', 'schema', dbo, 'table', 'Student', 'column', std_Id
EXEC sp_addextendedproperty 'MS_Description', 'Student first name', 'schema', dbo, 'table', 'Student', 'column', std_Fname
EXEC sp_addextendedproperty 'MS_Description', 'Student last name', 'schema', dbo, 'table', 'Student', 'column', std_Lname
EXEC sp_addextendedproperty 'MS_Description', 'Student date of birth', 'schema', dbo, 'table', 'Student', 'column', std_DOB
EXEC sp_addextendedproperty 'MS_Description', 'Student address', 'schema', dbo, 'table', 'Student', 'column', std_Address
EXEC sp_addextendedproperty 'MS_Description', 'Student mobile number', 'schema', dbo, 'table', 'Student', 'column', std_Mobile
EXEC sp_addextendedproperty 'MS_Description', 'Department that the Student belongs to (FK refers to department number)', 'schema', dbo, 'table', 'Student', 'column', dept_No

create table Instructor_Course(
	inst_Id smallint not null,
	crs_Code smallint not null,
	primary key(inst_Id,crs_Code),
	foreign key (inst_Id) references Instructor(inst_Id) on delete cascade,
	foreign key (crs_Code) references Course(crs_Code) on delete cascade
)
EXEC sp_addextendedproperty 'MS_Description', 'This table linking the instructors with the courses they teach', 'schema', dbo, 'table', 'Instructor_Course'
EXEC sp_addextendedproperty 'MS_Description', 'Instructor ID (FK refers to instructor ID)', 'schema', dbo, 'table', 'Instructor_Course', 'column', inst_Id
EXEC sp_addextendedproperty 'MS_Description', 'Course code (FK refers to course code)', 'schema', dbo, 'table', 'Instructor_Course', 'column', crs_Code

create table Student_Course(
	std_Id smallint not null ,
	crs_Code smallint not null,
	grade decimal(5,2),
	primary key(std_Id, crs_Code),
	foreign key (std_Id) references Student(std_Id) on delete cascade,
	foreign key (crs_Code) references Course(crs_Code)
)
--calculate the grade of the student in student_course table
EXEC sp_addextendedproperty 'MS_Description', 'This table linking the student with the courses they take', 'schema', dbo, 'table', 'Student_Course'
EXEC sp_addextendedproperty 'MS_Description', 'Student ID (FK refers to student ID)', 'schema', dbo, 'table', 'Student_Course', 'column', std_Id
EXEC sp_addextendedproperty 'MS_Description', 'Course code (FK refers to course code)', 'schema', dbo, 'table', 'Student_Course', 'column', crs_Code
EXEC sp_addextendedproperty 'MS_Description', 'Grade is the student GPA in this course', 'schema', dbo, 'table', 'Student_Course', 'column', grade

create table Student_Answers(
	std_Id smallint not null,
	exam_No smallint not null,
	quest_No smallint not null,
	std_Answer varchar(1) check(std_Answer in('a','b','c','d','t','f')),
	score smallint,
	primary key(std_Id, exam_No, quest_No),
	foreign key(std_Id) references Student(std_Id) on delete cascade,
	foreign key(exam_No) references Exam(exam_No),
	foreign key(quest_No) references Questions(quest_No)
)
-- score doesnt exceed the exam total marks
EXEC sp_addextendedproperty 'MS_Description', 'This table represents the ternary relation between student, exam, questions tables', 'schema', dbo, 'table', 'Student_Answers'
EXEC sp_addextendedproperty 'MS_Description', 'Student ID (FK refers to student ID)', 'schema', dbo, 'table', 'Student_Answers', 'column', std_Id
EXEC sp_addextendedproperty 'MS_Description', 'Exam Number (FK refers to exam number)', 'schema', dbo, 'table', 'Student_Answers', 'column', exam_No
EXEC sp_addextendedproperty 'MS_Description', 'Question Number(FK refers to question number)', 'schema', dbo, 'table', 'Student_Answers', 'column', quest_No
EXEC sp_addextendedproperty 'MS_Description', 'Student Answer is the actual answer of the student in the exam in this question', 'schema', dbo, 'table', 'Student_Answers', 'column', std_Answer
EXEC sp_addextendedproperty 'MS_Description', 'Score is the grade of the student answer in this question in the exam', 'schema', dbo, 'table', 'Student_Answers', 'column', score

--
----
use ITI_Examination
GO

--select * from Questions

--select * from Question_Choices

--spt select
--drop proc select_question
GO
create proc selectQuestion (@no smallint)
as
begin
	begin try
		if exists(select * from Questions where quest_No=@no)
		begin
			declare @type varchar(10)
			select @type = quest_Type from Questions
			where quest_No = @no
			if @type = 'MCQ'
			begin
				select crs_Code as 'Course Code', q.quest_No as 'Question Number', 
						quest_Type as 'Type', quest_Body as 'Question', 
						quest_Mark as 'Mark', choice as 'Choice Number', choice_Body as'Choice'
				from Questions q inner join Question_Choices qc
					on q.quest_No = qc.quest_No
				where q.quest_No = @no
			end
			else
			begin
				select crs_Code as 'Course Code', q.quest_No as 'Question Number', 
						quest_Type as 'Type', quest_Body as 'Question', 
						quest_Mark as 'Mark'
				from Questions q 
				where q.quest_No = @no
			end
		end
		else
			select 'This question number does NOT exist' as 'Error'
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end
GO

--exec select_question 2

--SP that insert questions
--it uses tables (Questions & Question_Choices)
GO
create proc insertQuestion	(@course smallint,
							@body varchar(250),
							@answer varchar(1),
							@mark tinyint,
							@choice_a varchar(150) = null,
							@choice_b varchar(150) = null,
							@choice_c varchar(150) = null,
							@choice_d varchar(150) = null)
as
if (@answer = 'a' and @choice_a is null) or
	(@answer = 'b' and @choice_b is null) or
	(@answer = 'c' and @choice_c is null) or
	(@answer = 'd' and @choice_d is null)
		select 'You have to enter the choice that matches your answer'
else if (@answer = 't' or @answer = 'f') and
		(@choice_a is not null or @choice_b is not null or @choice_c is not null or @choice_d is not null)
			select 'You can not enter choices to TorF question'
else
begin
	declare @generated_id table (id smallint unique)
	declare @type varchar(5)
	if @choice_a is null
		set @type = 'TorF'
	else
		set @type = 'MCQ'
	begin try
		insert Questions
			output inserted.quest_No
				into @generated_id
		values(@body,@answer,@mark,@type,@course)
		declare @qn smallint
		select @qn=id from @generated_id
		if @choice_a is not null
		begin
			insert into Question_Choices
			values	(@qn,'a',@choice_a)
		end
		if @choice_b is not null
		begin
			insert into Question_Choices
			values	(@qn,'b',@choice_b)
		end
		if @choice_c is not null
		begin
			insert into Question_Choices
			values	(@qn,'c',@choice_c)
		end
		if @choice_d is not null
		begin
			insert into Question_Choices
			values	(@qn,'d',@choice_d)
		end
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end
GO

--sp update question
GO
create proc updateQuestion	(@no smallint,
							@course smallint,
							@body varchar(250),
							@answer varchar(1),
							@mark tinyint)
as
begin
	begin try
		if exists(select * from Questions where quest_No = @no)
		begin
			update Questions
			set crs_Code = @course, quest_Body = @body, quest_ModelAnswer = @answer, quest_Mark = @mark
			where quest_No = @no
		end
		else
			select 'This question number does NOT exist' as 'Error'
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end
GO

--select * from Questions

--exec updateQuestion 3,4003,'With SQL, how do you select a column named "FirstName" from a table named "Persons"?','c',2

--sp update choice
GO
create proc updateQuestionChoices	(@no smallint,
									@choice varchar(1),
									@choiceBody varchar(150))
as
begin
	begin try
		if exists (select * from Question_Choices where quest_No = @no)
		begin
			update Question_Choices
			set choice_Body = @choiceBody
			where quest_No = @no and choice = @choice
		end
		else
			select 'This question number with this choice number does NOT exist' as 'Error'
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end

--exec updateQuestionChoices 2,'a','a)GET'

--select * from Question_Choices

--sp delete question
--drop proc deleteQuestion
GO
create proc deleteQuestion(@no smallint)
as
begin
	begin try
		if exists (select * from Questions where quest_No = @no)
			delete from	Questions
			where quest_No = @no
		else
			select 'This question number does NOT exist' as 'Error'
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end
GO


--
use ITI_Examination

GO

insert into Course
values	('C#',80),
		('C++',42),
		('SQL Fundamentals',30),
		('Advanced SQL',42),
		('Client Site Technologies',48),
		('Advanced JS',18),
		('Data Structure and Algorithms',30)

GO
--select * from Course

exec insertQuestion 4003,'What does SQL stand for?','b',2,'a)Structured Question Language','b)Structured Query Language','c)Strong Question Language'
exec insertQuestion 4003,'Which SQL statement is used to extract data from a database?','b',2,'a)GET','b)SELECT','c)EXTRACT','d)OPEN'
exec insertQuestion 4003,'With SQL, how do you select a column named "FirstName" from a table named "Persons"?','c',2,'a)SELECT Person.FirstName','b)EXTRACT FirstName FROM Person','c)SELECT FirstName FROM Person'
exec insertQuestion 4003,'Which SQL statement is used to return only different values?','c',2,'a)SELECT UNIQUE','b)SELECT DIFFERENT','c)SELECT DISTINCT'
exec insertQuestion 4003,'With SQL, how can you insert "Olsen" as the "LastName" in the "Persons" table?','b',2,'a)INSERT INTO Persons (''Olsen'') INTO LastName','b)INSERT INTO Persons (LastName) VALUES (''Olsen'')','c)INSERT (''Olsen'') INTO Persons (LastName)'
exec insertQuestion 4003,'With SQL, how can you return the number of records in the Persons table?','c',2,'a)SELECT LEN(*) FROM Persons','b)SELECT COLUMNS(*) FROM Persons','c)SELECT COUNT(*) FROM Persons','d)SELECT NO(*) FROM Persons'
exec insertQuestion 4003,'Which operator is used to select values within a range?','a',2,'a)BETWEEN','b)RANGE','c)WITHIN'
exec insertQuestion 4003,'Which operator is used to search for a specified pattern in a column?','b',2,'a)GET','b)LIKE','c)FROM'
exec insertQuestion 4003,'Which SQL statement is used to update data in a database?','d',2,'a)MODIFY','b)SAVE','c)SAVE AS','d)UPDATE'
exec insertQuestion 4003,'With SQL, how can you return all the records from a table named "Persons" sorted descending by "FirstName"?','b',2,'a)SELECT * FROM Persons SORT BY ''FirstName'' DESC','b)SELECT * FROM Persons ORDER BY FirstName DESC','c)SELECT * FROM Persons SORT ''FirstName'' DESC','d)SELECT * FROM Persons ORDER FirstName DESC'
exec insertQuestion 4003,'SQL provides five built-in functions: COUNT, SUM, AVG, MAX, MIN.','t',1
exec insertQuestion 4003,'The keyword BETWEEN can be used in a WHERE clause to refer to a range of values.','t',1
exec insertQuestion 4003,'If you are going to use a combination of three or more AND and OR conditions, it is often easier to use the NOT and NOT IN operators.','t',1
exec insertQuestion 4003,'The keyword LIKE can be used in a WHERE clause to refer to a range of values.','f',1
exec insertQuestion 4003,'The SQL keyword GROUP BY instructs the DBMS to group together those rows that have the same value in a column.','t',1
exec insertQuestion 4003,'The format SELECT-FROM-WHERE is the fundamental framework of SQL SELECT statements.','t',1
exec insertQuestion 4003,'Indexes may be created or dropped at any time.','t',1
exec insertQuestion 4003,'ORDER BY can be combined with the SELECT statements.','t',1
exec insertQuestion 4003,'Most companies keep at least two versions of any database they are using.','t',1
exec insertQuestion 4003,'SUM, AVG, MIN, and MAX can only be used with numeric columns.','f',1
exec insertQuestion 4001,'We can use reserved keywords as identifiers in C# by prefixing them with @ character?','t',1
exec insertQuestion 4001,'C# supports multiple inheritance.','f',1
exec insertQuestion 4001,'The finally block is used to execute a given set of statements, whether an exception is thrown or not thrown.','t',1
exec insertQuestion 4001,'User-defined exception classes are derived from the ApplicationException class in C#?','t',1
exec insertQuestion 4001,'The assignment operators cannot be overloaded','t',1
exec insertQuestion 4001,'We can use reserved keywords as identifiers in C#?','f',1
exec insertQuestion 4001,'Value type variables in C# are derived from the class System.ValueType?','t',1
exec insertQuestion 4001,'Every reference type gets mapped to a type in Common Type System','f',1
exec insertQuestion 4001,'Value types are always created on the heap','f',1
exec insertQuestion 4001,'Mapping of every value type to a type in Common Type System facilitates Interoperability in C#.NET','t',1
exec insertQuestion 4001,'Which of the following is correct about C#?','d',2,'A - It is component oriented.','B - It can be compiled on a variety of computer platforms.','C - It is a part of .Net Framework.','D - All of the above.'
exec insertQuestion 4001,'Value type variables in C# are derived from the class SystemValueType?','a',2,'A- true','B- false'
exec insertQuestion 4001,'Which of the following converts a type to a 64-bit integer in C#?','a',2,'A - ToInt64','B - ToSbyte','C - ToSingle','D - ToInt32'
exec insertQuestion 4001,'Which of the following operator determines whether an object is of a certain type in C#?','b',2,'A - ?:','B - is','C - as','D - *'
exec insertQuestion 4001,'Which of the following statements is correct about encapsulation?','d',2,'A - Encapsulation is defined as the process of enclosing one or more items within a physical or logical package.','B - Encapsulation, in object oriented programming methodology, prevents access to implementation details.','C - Abstraction allows making relevant information visible and encapsulation enables a programmer to implement the desired level of abstraction.','D - All of the above.'
exec insertQuestion 4001,'Which of the following is correct about nullable types in C#?','d',2,'A - C# provides a special data types, the nullable types, to which you can assign normal range of values as well as null values.','B - You can assign true, false, or null in a Nullable<bool> variable.','C - You can store any value from -2,147,483,648 to 2,147,483,647 or null in a Nullable<Int32> variable.','D - All of the above.'
exec insertQuestion 4001,'Which of the following is the correct about class member variables?','c',2,'A - Member variables are the attributes of an object (from design perspective) and they are kept private to implement encapsulation.','B - These private variables can only be accessed using the public member functions.','C - Both of the above.','D - None of the above.'
exec insertQuestion 4001,'Function overloading is a kind of static polymorphism.','a',2,'A- true','B- false'
exec insertQuestion 4001,'Which of the following preprocessor directive allows you to undefine a symbol in C#?','b',2,'A - define','B - undef','C - region','D - endregion'
exec insertQuestion 4001,'Which of the following preprocessor directive allows generating a level one warning from a specific location in your code in C#?','a',2,'A - warning','B - region','C - line','D - error'

GO
--select * from Questions
--select * from Question_Choices



use ITI_Examination

--select * from Student

--delete from Department
--delete from Instructor

--select * from Department

--select * from Instructor

insert into Department (dept_Name) values('Mobile Native')
GO
insert into Instructor values('ahmed', 'mohamed', 5000, 'Eng', 301)
GO
update Department set mngr_Id = 2001, mngr_HireDate = GETDATE() where dept_Name = 'Mobile Native'
GO
insert into Department (dept_Name) values('Mobile CrossPlatform')
Go
insert into Instructor values('Mohamed', 'Nasser', 4000, 'Eng', 302)
Go
update Department set mngr_Id = 2002, mngr_HireDate = GETDATE() where dept_Name = 'Mobile CrossPlatform'
Go
insert into Department (dept_Name) values('Architect')
Go
insert into Instructor values('Ahmed', 'Bahy', 6000, 'Eng', 303)
Go
update Department set mngr_Id = 2003, mngr_HireDate = GETDATE() where dept_Name = 'Architect'
GO
insert into Instructor values('Hany', 'Safwat', 7000, 'Master',302)
insert into Instructor values('Mohamed', 'Fawzy', 4000, 'Eng',303)
insert into Instructor values('Osama', 'Mohsen', 3000, 'Master',302)
insert into Instructor values('Alla', 'Youssef', 8000, 'Master',301)

GO

--select * from Student

insert into Student (std_Fname, std_Lname, std_DOB,std_Address, std_Mobile,dept_No) values
	('Antoin', 'Ashraf', '1997-09-25','Giza','02536987456',301),
	('Ahmed', 'Osama', '1997-09-25','Giza','02536987456',302),
	('Eman', 'Hosam', '1997-09-25','Giza','02536987456',303),
	('Mai', 'Zakaria', '1997-09-25','Giza','02536987456',301),
	('Rawan', 'Shishtawy', '1997-09-25','Giza','02536987456',302)

GO

--select * from Course

--select * from Course_Topics

insert into Course_Topics values (4001, 'Loops')
insert into Course_Topics values (4001, 'If Statments')
insert into Course_Topics values (4001, 'Exceptions')
insert into Course_Topics values (4001, 'Threads')
insert into Course_Topics values (4003, 'Select Statment')
insert into Course_Topics values (4003, 'Create Statment')
insert into Course_Topics values (4003, 'Select Condition')
insert into Course_Topics values (4003, 'joins')
GO

insert into Instructor_Course values 
	(2001,4001),
	(2001,4003),
	(2004,4001),
	(2003,4001),
	(2006,4003),
	(2006,4001),
	(2007,4003)

GO

--select * from Student

insert into Student_Course values
	(10001,4001,NULL),
	(10001,4003, NULL),
	(10002,4001,NULL),
	(10002,4003, NULL),
	(10003,4001,NULL),
	(10003,4003, NULL),
	(10004,4001,NULL),
	(10004,4003, NULL),
	(10005,4001,NULL),
	(10005,4003, NULL)

GO





use ITI_Examination
GO

--SP that inserts instructors
--it uses tables (instructors)
create procedure insertInstructor (@dept_No smallint,
                                   @Fname varchar(20),
                                   @Lname varchar(20),
								   @Salary int,
								   @Degree varchar(50)= null)
as
begin
	begin try
	if(@Fname like '%[0-9]%' or @Lname like '%[0-9]%')
	begin
		select 'Names can not contain numbers' as 'Error'
	end
	else
	begin
		if exists (select * from Department where dept_No = @dept_No)
	    begin
			insert into Instructor
			values (@Fname,@Lname,@Salary,@Degree,@dept_No)
		end
		else
			select 'This departmen number does NOT exist' as 'Error'
	end
	end try
	begin catch
		select 'Error in inserting data' as 'Error'
	end catch
end
GO
--exec insertInstructor 301,'ahmed','osama',2000,'test'
GO
--SP that selects instructors
--it uses tables (instructors)
create procedure selectInstructor (@id smallint)
as
begin
	begin try
		if exists (select * from Instructor where inst_Id = @id)
			begin
				select inst_Id as 'Instructor ID',inst_Fname as 'First Name', inst_Lname as 'Last Name',inst_Salary as 'Salary',
				inst_Degree as 'Degree', dept_No as 'Department Number'
				from Instructor
				where inst_Id = @id
			end
        else
		select 'This instructor ID does NOT exist' as 'Error'
	end try 
	begin catch
		select 'Error' as 'Error'
	end catch
end
GO
--exec selectInstructor 2001
GO

--SP that updates instructors
--it uses tables (instructors)
create procedure updateInstructor (@id smallint,
                                   @Fname varchar(20),
                                   @Lname varchar(20),
								   @Salary int,
                                   @dept_No smallint,
								   @Degree varchar(50))
as 
begin
	begin try
	if(@Fname like '%[0-9]%' or @Lname like '%[0-9]%')
	begin
		select 'Names can not contain numbers' as 'Error'
	end
	if exists (select * from Instructor where inst_Id = @id)
	begin
	   update Instructor
		set dept_No=@dept_No,inst_Fname=@Fname,inst_Lname=@Lname,inst_Salary=@Salary,inst_Degree=@Degree
		where inst_Id=@id
	end
	else
		select 'This instructor ID does NOT exist' as 'Error'
	end try 
	begin catch
		select 'Error in updating data' as 'Error'
	end catch
end
GO
--exec updateInstructor 2013,'ahmed','osama',4000,303,'tt'
--exec selectInstructor 2013

--SP that deletes instructors
--it uses tables (instructors)
create procedure deleteInstructor (@id smallint)
as 
begin
	begin try
	if exists (select * from Instructor where inst_Id = @id)
	begin
		delete from Instructor
		where inst_Id=@id
		declare @max smallint
        select @max=max(inst_Id)from Instructor
		DBCC CHECKIDENT ('Instructor', RESEED, @max)
	end
	else
	begin
		select 'This instructor ID does NOT exist' as 'Error'
	end
	end try 
	begin catch
		select 'Error in deleting instructor' as 'Error'
	end catch
end
GO
--exec deleteInstructor 2018
GO

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>	Instructor_Course sp's	<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<--
--SP that inserts instructors and courses
--it uses tables (instructors and courses)
create procedure insertInstructorCourse (@inst_Id smallint,
	                                     @crs_Code smallint)
as 
begin
	begin try
	if exists (select * from Instructor where inst_Id = @inst_Id)
	begin
		if exists (select * from Course where crs_Code = @crs_Code)
		begin
			if exists (select * from Instructor_Course where inst_Id=@inst_Id AND crs_Code=@crs_Code)
			begin
				insert into Instructor_Course
				values (@inst_Id,@crs_Code)	
			end
			else
				select 'Duplicated data' as 'Error'
		end
		else
			select 'This course code does NOT exist' as 'Error'
	end
	else
		select 'This instructor ID does NOT exist' as 'Error'
	end try 
	begin catch
		select 'Error in inserting data' as 'Error'
	end catch
end
GO
--exec insertInstructorCourse 20007,4003

--SP that selects from instructors and courses
GO
create procedure selectInstructorCourse (@inst_Id smallint)
as
begin
	begin try
		if exists (select * from Instructor_Course where inst_Id=@inst_Id)
			begin
				select inst_Id as 'Instructor ID', crs_Code as 'Course ID'
				from Instructor_Course
				where inst_Id=@inst_Id
			end
		 else
		select 'This instructor ID does NOT exist' as 'Error'
	end try 
	begin catch
		select 'Error' as 'Error'
	end catch
end
GO
--exec selectInstructorCourse 2006

--SP that updates instructors and courses
--it uses tables (instructors and courses)
GO
create procedure updateInstructorCourse (@old_inst_Id smallint,
										 @new_inst_Id smallint,
									     @crs_Code smallint)
as 
begin
	begin try
	if exists (select * from Instructor_Course where inst_Id=@old_inst_Id)
	begin
		if exists (select * from Instructor where inst_Id=@new_inst_Id)
		begin
			if exists (select * from Course where crs_Code = @crs_Code)
			begin
				update Instructor_Course
				set inst_Id=@new_inst_Id
				where inst_Id=@old_inst_Id 
				AND crs_Code=@crs_Code
			end
			else
				select 'This course code does NOT exist' as 'Error'
		end
		else
			select 'This new instructor ID does NOT exist' as 'Error'
	end
	else
		select 'This old instructor ID does NOT exist' as 'Error'
	end try 
	begin catch
		select 'Error in updating data' as 'Error'
	end catch
end
GO
--exec updateInstructorCourse 2007,2013,4002
--exec selectInstructorCourse 2007
--SP that deletes instructors and courses
--it uses tables (instructors and courses)
GO
create procedure deleteInstructorCourse (@inst_Id smallint,
										 @crs_Code smallint)
as 
begin
	begin try
	if exists (select * from Instructor_Course where inst_Id=@inst_Id AND crs_Code=@crs_Code)
	begin
		delete from Instructor_Course
		where inst_Id=@inst_Id AND crs_Code=@crs_Code
	end
	else
	begin
		select 'These data do NOT exist' as 'Error'
	end
	end try 
	begin catch
		select 'Erro in deleting data' as 'Error'
	end catch
end
GO
--exec insertInstructorCourse 2007,4001
--exec selectInstructorCourse 2007

use ITI_Examination

GO

insert into Student (std_Fname, std_Lname, std_DOB,std_Address, std_Mobile,dept_No) values
	('Esraa', 'Ahmed', '1998-06-19','Cairo','12547896325',303),
	('Mona', 'Mohamed', '1997-04-18','Naser City','74859632154',301),
	('Mohamed', 'Ahmed', '1994-12-16','Maadi','25413698753',302),
	('Youhanna', 'Essam', '1999-11-17','Cairo','25632147896',303),
	('Mina', 'Samwel', '1997-02-27','Giza','74821925847',301),
	('Mohamed', 'tawfik', '1998-08-29','Sohag','85963215247',302),
	('Mohamed', 'Taha', '1995-09-16','Alex','74852136951',303)

GO

insert into Course_Topics values (4002, 'Install CodeBlocks')
insert into Course_Topics values (4002, 'Loops')
insert into Course_Topics values (4002, 'Pointers')
insert into Course_Topics values (4002, 'Struct')

insert into Course_Topics values (4004, 'Stored Proc')
insert into Course_Topics values (4004, 'Functions')
insert into Course_Topics values (4004, 'Triggers')
insert into Course_Topics values (4004, 'Conditions')

insert into Course_Topics values (4005, 'HTML5')
insert into Course_Topics values (4005, 'CSS3')
insert into Course_Topics values (4005, 'JS')
insert into Course_Topics values (4005, 'Jquery')

insert into Course_Topics values (4006, 'Loops')
insert into Course_Topics values (4006, 'Functions')
insert into Course_Topics values (4006, 'Documnet Object')
insert into Course_Topics values (4006, 'OOP')

insert into Course_Topics values (4007, 'Linked List')
insert into Course_Topics values (4007, 'Linked Stack')
insert into Course_Topics values (4007, 'Linked Queue')
insert into Course_Topics values (4007, 'Tree')

GO

--select * from Instructor
--select * from Course

insert into Instructor_Course values 
	(2002,4001),
	(2001,4002),
	(2003,4003),
	(2004,4004),
	(2005,4005),
	(2006,4006),
	(2007,4007),
	(2005,4001),
	(2006,4002),
	(2002,4003),
	(2001,4004),
	(2003,4005),
	(2007,4006),
	(2005,4007)

GO






use ITI_Examination
GO
--Select * from Course

---Select sp----
--drop proc selectCourse
GO
create proc selectCourse(@code smallint)
AS 
BEGIN TRY
   if exists(Select * from Course where crs_Code=@code)
        Select crs_Code as 'courseNum',crs_Name as 'courseName',crs_Duration as 'courseduration' from Course where crs_Code = @code
  else
      Select CONCAT( 'Course: ',@code,' does not exist') AS 'Error Message'

END TRY
BEGIN CATCH
  
      Select 'ERROR!!' AS 'Error Message'
END CATCH
GO
--exec selectCourse 4006
--exec selectCourse 4008

---Insert sp----
--drop proc insertCourse
GO
create proc insertCourse(@name varchar(50),@duration tinyint)
AS 
BEGIN TRY
   Insert into Course values (@name,@duration)
END TRY
BEGIN CATCH
   Select 'ERROR!!' AS 'Error Message'
END CATCH
GO
--exec insertCourse 'Responsive Web Design',32

---Update sp---
--drop proc updateCourse
GO
create proc updateCourse(@code smallint,@name varchar(50),@duration tinyint)
AS 
BEGIN TRY
  if exists(Select * from Course where crs_Code=@code)
      Update Course set crs_Name =@name,crs_Duration=@duration where crs_Code=@code
  else
      Select CONCAT( 'Course:',@code,' does not exist')  AS 'Error Message'
END TRY
BEGIN CATCH
   Select 'ERROR!!'  AS 'Error Message'
END CATCH
GO
--exec updateCourse 4008,'Responsive Web Design',25
---Delete sp---
--drop proc deleteCourse
GO
create proc deleteCourse(@code smallint)
AS 
BEGIN TRY
    if exists(Select * from Course where crs_Code=@code)
       BEGIN 
			 Delete from Course where crs_Code=@code
			 declare @max smallint
             select @max=max(crs_Code)from Course
			 DBCC CHECKIDENT ('Course', RESEED, @max)

		END 
	 else
        Select CONCAT( 'Course:',@code,' does not exist')  AS 'Error Message'
END TRY
BEGIN CATCH
   Select 'ERROR!!'  AS 'Error Message'
END CATCH
GO

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>	Course_Topics sp's	<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<--

--Select * from Course
--Select * from Course_Topics

---Select sp----
--drop proc selectCourseTopics
GO
create proc selectCourseTopics(@code smallint)
AS 
BEGIN TRY
 if exists(Select * from Course_Topics where crs_Code = @code)
        Select crs_Code AS 'CourseNum',topic_name AS 'Topics' from Course_Topics where crs_Code = @code
  else
      Select CONCAT( 'Course with code ',@code,' does not exist') AS 'Error Message'
  
END TRY
BEGIN CATCH
   Select 'ERROR!!' AS 'Error Message'
END CATCH
GO
--exec selectCourseTopics 4003


--Insert sp---
--drop proc insertCourseTopics
GO
create proc insertCourseTopics(@code smallint, @tpname varchar(50))
AS 
BEGIN TRY
    if exists(Select * from Course where crs_Code=@code)
	  if not exists(Select * from Course_Topics where crs_Code=@code and topic_name=@tpname)
          Insert into Course_Topics values(@code,@tpname)
	   else
	      Select 'Duplicate data' AS 'Error Message'
	else
	    Select CONCAT( 'Course Number: ',@code,' does not exist') AS 'Error Message'
END TRY
BEGIN CATCH
   Select 'ERROR!!' AS 'Error Message'
END CATCH
GO
--exec insertCourseTopics 4008,'Bootstrap'/*>>ERROR FK CONSTRAINT*/
--exec insertCourseTopics 4004,'Stored Procedures & Triggers'

---Update sp--
--drop proc updateCourseTopics
GO
create proc updateCourseTopics(@code smallint,@oldtpname varchar(50),@newtpname varchar(50))
AS 
BEGIN TRY
   
 if exists(Select * from Course_Topics where crs_Code = @code)
    if exists(Select * from Course_Topics where crs_Code=@code and topic_name=@oldtpname)
		if exists(Select * from Course_Topics where crs_Code=@code and topic_name=@newtpname)
			select CONCAT( 'Topic: ',@newtpname,' with Course Code: ',@code,' already exist') AS 'Error Message'
		else
			Update Course_Topics set topic_name=@newtpname  where crs_Code=@code and topic_name=@oldtpname
	else 
	   Select CONCAT( 'No such Topic: ',@oldtpname,' with Course Code: ',@code) AS 'Error Message'
 else
       Select CONCAT( 'Course Number: ',@code,' does not exist') AS 'Error Message'
END TRY
BEGIN CATCH
   Select 'ERROR!!' AS 'Error Message'
END CATCH

GO
--exec updateCourseTopics 4008,'jquery','Advanced JQuery'
--exec updateCourseTopics 4003,'Create Statment','Create & Alter Tables'

--Delete sp---
--drop proc deleteCourseTopics
GO
create proc deleteCourseTopics(@code smallint,@tpname varchar(50))
AS 
BEGIN TRY
   
 if exists(Select * from Course_Topics where crs_Code = @code and topic_name=@tpname)
     Delete from Course_Topics where crs_Code=@code  and topic_name=@tpname
  else
      Select CONCAT( 'No such Topic with Course Code ',@code) AS 'Error Message'
END TRY
BEGIN CATCH
   Select 'ERROR!!' AS 'Error Message'
END CATCH
GO
--exec deleteCourseTopics 4004,'Stored Procedures & Triggers'


use ITI_Examination
GO
--Select * from Student_Course

----Select---
--drop proc selectStudentCourse
GO
create proc selectStudentCourse(@stdID smallint)
AS
BEGIN TRY
	if exists(select * from Student where std_Id = @stdID)
		if exists(Select * from Student_Course where std_Id = @stdID)
			Select std_Id as 'studentID',crs_Code as 'studentCourse',grade as 'studentGrade' from Student_Course where std_Id = @stdID
	  else
		  Select CONCAT( 'No Enrolled Courses for Student: ',@stdID) As 'Error Message'
	else
		select CONCAT('This Student: ',@stdID,' does not exist') As 'Error Message'
END TRY
BEGIN CATCH
   Select 'ERROR!!' As 'Error Message'
END CATCH
GO
--exec selectStudentCourse 10003
--exec selectStudentCourse 10006
--Insert---
--drop proc insertStudentCourse
GO
create proc insertStudentCourse(@stdID smallint,@code smallint)
AS
BEGIN TRY
  if exists(Select * from Student where std_Id=@stdID)
    if exists(Select * from Course where crs_Code=@code)
	   if not exists(Select * from Student_Course where crs_Code=@code and std_Id=@stdID)
                 Insert into Student_Course (std_Id,crs_Code)
				 values (@stdID,@code)
		else
		    Select 'Duplicated data' as 'Error Message'
	else
	    Select CONCAT( 'Course: ',@code,' does not exist') as 'Error Message'
  else
    Select CONCAT( 'Student: ',@stdID,' does not exist') as 'Error Message'
END TRY
BEGIN CATCH
   Select 'ERROR!!' as 'Error Message'
END CATCH
GO

---Select * from Student
---Select * from Course
---Select * from Student_Course
--exec insertStudentCourse 10006,4001,'A'-- ERROR FK Constraint
--exec insertStudentCourse  10003,4001,'A' --ERROR PK DUPLIACTION
--exec insertStudentCourse  10003,4002,'A' 

--Delete--
--drop proc deleteStudentCourse
GO
create proc deleteStudentCourse(@stdID smallint,@crsCode smallint)
AS
BEGIN TRY
	if exists(select * from Student where std_Id = @stdID)
		if exists(select * from Course where crs_Code = @crsCode)
			if exists(Select * from Student_Course where std_Id=@stdID and crs_Code=@crsCode)
				Delete from Student_Course where std_Id=@stdID and crs_Code=@crsCode 
			else 
				Select CONCAT( 'Student: ',@stdID,' has not been enrolled in Course (Code#:',@crsCode,')') AS 'Error Message'
		else
			Select CONCAT( 'Course code:',@crsCode,' does not exist') AS 'Error Message'
	else
		Select CONCAT( 'Student: ',@stdID,' does not exist') AS 'Error Message'
END TRY
BEGIN CATCH
   Select 'ERROR!!' AS 'Error Message'
END CATCH

--exec deleteStudentCourse 10003,4002
GO
--Update--
--drop proc updateStudentCourseGrade
create proc updateStudentCourseGrade(@stdID smallint,@crsCode smallint,@grade decimal(5,2))
AS
BEGIN TRY
	if exists(select * from Student where std_Id = @stdID)
		if exists(Select * from Course where crs_Code = @crsCode)
			if exists(Select * from Student_Course where std_Id=@stdID and crs_Code=@crsCode)
				Update Student_Course set grade=@grade  where std_Id=@stdID and crs_Code=@crsCode
			else
				Select CONCAT( 'Student: ',@stdID,' has not been enrolled in Course (Code#:',@crsCode,')')  AS 'Error Message'
		else 
			Select CONCAT( 'Course code:',@crsCode,' does not exist') AS 'Error Message'
	else
		Select CONCAT( 'Student: ',@stdID,' does not exist') AS 'Error Message'
END TRY
BEGIN CATCH
   Select 'ERROR!!'  AS 'Error Message'
END CATCH
GO
--exec updateStudentCourseGrade 10006,4002,'B'
--exec updateStudentCourseGrade 10003,4004,'B'
--exec updateStudentCourseGrade 10003,4002,'B'--
----
USE ITI_Examination
GO

--select * from Department

--select sp
--drop proc selectDepartment
Go
create proc selectDepartment	(@No smallint)
as
begin
	begin try
		if exists(select * from Department where dept_Name = @No)
			select dept_No as 'Department Number' ,dept_Name as 'Name', mngr_Id as 'Manager Id', mngr_HireDate as 'Manager Hire Date'
			from Department
			where dept_No = @No
		else
			select 'This department number does NOT exist' as 'Error'
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end
GO

--insert sp
--drop proc insertDepartment
GO
create proc insertDepartment	(@name varchar(50),
								@mngr_id smallint,
								@mngr_HireDate date)
as
begin
	begin try
		insert into Department
		values (@name,@mngr_id,@mngr_HireDate)
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end
GO

--exec insertDepartment 'new department', 2004, '1-1-2020'

--update sp
--drop proc updateDepartment
Go
create proc updateDepartment	(@no smallint,
								@name varchar(50),
								@mngr_id smallint,
								@mngr_hiredate date)
as
begin
	begin try
		if exists (select * from Department where dept_No = @no)
		begin
			update Department
			set dept_Name = @name, mngr_Id = @mngr_id, mngr_HireDate = @mngr_hiredate
			where dept_No = @no
		end
		else
			select 'This department number does NOT exist' as 'Error' 
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end
GO

--exec updateDepartment 306,'new department',2007,'1-1-2019'

--delete sp
--drop proc deleteDepartment
GO
create proc deleteDepartment	(@no smallint)
as
begin
	begin try
		if exists (select * from Department where dept_No = @no)
			delete from Department
			where dept_No = @no
		else
			select 'This department number does NOT exist' as 'Error'
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end
GO
--exec deleteDepartment 306


use ITI_Examination
GO

--------------------Student Table--------------------


--insert
GO
create proc insertStudent
	(@Fname varchar(20),@Lname varchar(20),@DateOB date,
	@Address varchar(250),@MobileNumber varchar(20),@deptNumber smallint)
as
begin
	begin try
		if((@Fname is null) or (@Lname is null) or (@Address is null) or (@deptNumber is null))
			select 'some required data are missing';
		else if(@MobileNumber like '%[^0-9.]%')
			select 'Only numbers Allowed for phone Numebr';
		else if(@deptNumber not in (select dept_No from Department))
			select 'You entered invaled department Number';
		else
		begin
			insert into Student values (@Fname, @Lname, @DateOB, @Address, @MobileNumber, @deptNumber)
		end
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end

GO

--update
--------------------SP update for all 
GO
create proc updateStudent(@student_Id smallint, @Fname varchar(20), @Lname varchar(20), 
	@DateOB date, @Address varchar(250), @mobileNumber varchar(20), @deptNumber smallint)
as begin
	begin try
		if(@student_Id not in (select std_Id from Student))
			select 'no student with that ID' as 'Error';
		else if((@Fname is null) or (@Lname is null) or (@Address is null) or (@deptNumber is null))
			select 'some required data is missing' as 'Error';
		else if(@MobileNumber like '%[^0-9.]%')
			select 'Only numbers Allowed for phone Numebr' as 'Error';
		else if(@deptNumber not in (select dept_No from Department))
			select 'You entered invaled department Number' as 'Error';
		else
		begin
			update Student set std_Fname = @Fname, std_Lname = @Lname, 
				std_DOB = @DateOB, std_Address = @Address, std_Mobile = @mobileNumber, dept_No = @deptNumber
				where std_Id = @student_Id
		end
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end

GO

create proc updateStudentDepartment (@student_Id smallint, @newDeptNumber smallint)
as begin 
	begin try
		if(@newDeptNumber not in (select dept_No from Department))
			select 'You entered invaled department Number';
		else if (@student_Id not in (select std_Id from Student))
			select 'ID you entered does not exist';
		else begin
			update Student set dept_No = @newDeptNumber where std_Id = @student_Id
		end
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end

GO

create proc updateStudentMobile(@student_Id smallint, @newMobileNumber varchar(20))
as begin 
	begin try
		if(@newMobileNumber like '%[^0-9.]%')
			select 'Only numbers Allowed for phone Numebr';
		else if (@student_Id not in (select std_Id from Student))
			select 'ID you entered does not exist';
		else begin
			update Student set std_Mobile = @newMobileNumber where std_Id = @student_Id
		end
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end

GO

create proc updateStudentAddress (@student_Id smallint, @NewAddress varchar(250))
as begin
	begin try
		if (@student_Id not in (select std_Id from Student))
			select 'ID you entered does not exist';
		else if(@NewAddress like '%[^0-9.]%')
			update Student set std_Address = @NewAddress where std_Id = @student_Id
		else
			select 'Enter A valid Address'
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end

GO

create proc updateStudentDOB (@student_Id smallint, @newDOB date)
as begin
	begin try
		if (@student_Id not in (select std_Id from Student))
			select 'ID you entered does not exist';
		else
			update Student set std_DOB = @newDOB where std_Id = @student_Id
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end

GO

create proc updateStudentName 
	(@student_Id smallint, @newFname varchar(20), @newLname varchar(20))
as begin
	begin try
		if((@newFname like '%[0-9]%') or (@newLname like '%[0-9]%'))
			select 'Name must not contain any number'
		else if (@student_Id not in (select std_Id from Student))
			select 'ID you entered does not exist';
		else
			update Student set std_Fname = @newFname,std_Lname = @newLname where std_Id = @student_Id
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end

GO

--delete
create proc deleteStudent (@student_Id smallint)
as begin
	begin try
		if (@student_Id not in (select std_Id from Student))
			select 'ID you entered does not exist';
		else
			delete from Student where std_Id = @student_Id
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end

GO

create proc deleteStudentByName_AND_DOB (@Fname varchar(20), @Lname varchar(20), @BirthDate date)
as begin
	begin try
		declare @countRows tinyint;
		select @countRows = count(*) from Student where std_Fname = @Fname and std_Lname = @Lname and std_DOB = @BirthDate

		if(@countRows = 0)
			select 'no student with this data';
		else
			delete from Student where (std_Fname = @Fname and std_Lname = @Lname and std_DOB = @BirthDate)
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end

GO

--select
create proc selectAllStudents
as begin
	begin try
		select * from Student
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end

GO

create proc selectStudent (@student_Id smallint)
as begin
	begin try
		if (@student_Id not in (select std_Id from Student))
			select 'ID you entered does not exist';
		else
			select * from Student where std_Id = @student_Id
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end

GO

/*
create proc selectStudentsByDepartment(@DeptNumber smallint)
as begin
	if (@DeptNumber not in (select dept_No from Department))
		select 'Department number you entered does not exist';
	else
		select * from Student where dept_No = @DeptNumber
end

GO
*/

--------------------StudentAnswers Table--------------------

--update
GO
create proc updateStudentAnswer (@studID smallint, @examNumber smallint, @questionNumber smallint, @studAnswer varchar(1))
as begin
	begin try
		declare @examExists tinyint;

		select @examExists = COUNT(*) from Student_Answers where std_Id = @studID and 
			exam_No = @examNumber and quest_No = @questionNumber;

		if(@examExists = 0)
			select 'no exam with this data' as 'Error';
		else begin
			declare @questScore tinyint;
			declare @modelAnswer varchar(1);
			select @modelAnswer = quest_ModelAnswer from Questions where quest_No = @questionNumber;
			if( @modelAnswer = @studAnswer )
				select @questScore = quest_Mark from Questions where quest_No = @questionNumber;
			else
				select @questScore = 0;

			update Student_Answers set std_Answer = @studAnswer, score = @questScore
			where std_Id = @studID and exam_No = @examNumber and quest_No = @questionNumber;
		end
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end
GO
--insert
--drop proc insertStduentAnswers
GO
--True or false answers before MCQ answers

--select
GO
create proc selectQuestStudAnswer ( @studID smallint, @examNumber smallint, @questionNumber smallint )
as begin
	begin try
		select * from Student_Answers where std_Id = @studID and exam_No = @examNumber and quest_No = @questionNumber;
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end
GO

GO
--delete
create proc deleteStudentAnswer (@studID smallint, @examNumber smallint, @questionNumber smallint)
as begin
	begin try
		declare @examExists tinyint;

		select @examExists = COUNT(*) from Student_Answers where std_Id = @studID and 
			exam_No = @examNumber and quest_No = @questionNumber;

		if(@examExists = 0)
			select 'no exam with this data';
		else
			delete from Student_Answers where std_Id = @studID and 
				exam_No = @examNumber and quest_No = @questionNumber;
	end try
	begin catch
		select 'Error' as 'Error'
	end catch
end

GO



use ITI_Examination
go

create trigger selectInsertedStudent
on student
after insert
as
	select concat('You have entered a student with ID: ',std_Id) as 'Message' from inserted
go
create trigger selectInsertedDepartment
on Department
after insert
as
	select concat('You have entered a department with number: ',dept_No) as 'Message' from inserted

go
create trigger selectInsertedInstructor
on instructor
after insert
as
	select concat('You have entered an instructor with ID: ',inst_Id) as 'Message' from inserted

go
create trigger selectInsertedCourse
on course
after insert
as
	select concat('You have entered a course with ID: ',crs_Code) as 'Message' from inserted

go
create trigger selectInsertedQuestion
on questions
after insert
as
	select concat('You have entered a question with number: ',quest_No) as 'Message' from inserted

go
create trigger selectInsertedExam
on Exam
after insert
as
	select concat('You have entered an exam with number: ',exam_No) as 'Message' from inserted

GO
create trigger preventDeleteExam
on Exam
instead of delete
	as 
	select 'You are not allowed to delete' as 'Error Message'

GO
CREATE TRIGGER DoNotDropTables 
ON DATABASE
FOR DROP_TABLE
AS
  print  'Cannot drop tables!' 
  RollBack;

GO
USE ITI_Examination
GO

--select * from Exam

--drop proc selectExam
GO
create procedure selectExam (@examNo smallint)
as
begin
	begin try
		if exists (select * from Exam where exam_No = @examNo)
			begin
				select exam_No as 'Exam Number',exam_Date as 'Exam Date', total_Marks as 'Total Marks',
				exam_Duration as 'Exam Duration', crs_Code as 'Course Code'
				from Exam
				where exam_No = @examNo
			end
        else
		select 'This exam number does not exist' as 'Error'
	end try 
	begin catch
		select 'Error' as 'Error'
	end catch
end
GO
-- exec selectExam 1
------------------------------------------
--drop proc updateExam
GO
create procedure updateExam (
				@examNo smallint
				,@examDate datetime
				,@examDuration smallint
		)
as 
begin
	begin try
	if exists (select * from Exam where exam_No = @examNo)
	begin
	   UPDATE Exam
		SET exam_Date = @examDate, exam_Duration = @examDuration
		WHERE exam_No = @examNo;
	end
	else
		select 'This exam number does not exist' as 'Error'
	end try 
	begin catch
		select 'Error in updating data' as 'Error'
	end catch
end
GO
--exec updateExam 20, '3-3-2003', 330
-- select * from exam



------------------------------------------
--drop proc deleteExam

GO
create procedure deleteExam (@examNo smallint)
as 
begin
	begin try
	if exists (select * from Exam where exam_No = @examNo)
	begin
		DELETE FROM Exam WHERE exam_No = @examNo;
		declare @max smallint
        select @max=max(exam_No)from Exam
		DBCC CHECKIDENT ('Exam', RESEED, @max)
	end
	else
	begin
		select 'This exam number does not exist' as 'Error'
	end
	end try 
	begin catch
		select 'Error in deleting exam' as 'Error'
	end catch
end
GO


--exec deleteExam 20
--select * from Exam_Questions

-------------------------------------------
--EXAM_QUESTIONS--
use ITI_Examination

--select * from Exam_Questions
--drop proc selectExamQuestions
GO
create procedure selectExamQuestions (@examNo smallint)
as
begin
	begin try
		if exists (select * from Exam_Questions where exam_No = @examNo)
			begin
				select exam_No as 'Exam Number',eq.quest_No as 'Question Number'
				from Exam_Questions  eq
				inner join Questions q
				on eq.quest_No = q.quest_No
				where exam_No = @examNo
				order by quest_Type desc
			end
        else
		select 'This exam number does not exist' as 'Error'
	end try 
	begin catch
		select 'Error' as 'Error'
	end catch
end

-- exec selectExamQuestions 1

------------------------------------------



-------------------------------------
--EXAM GENERATOR--
GO
--drop proc ExamGeneration

--select concat(char(10),std_Fname),std_Lname from Student

GO
create proc ExamGeneration
(
		@crsCode smallint
		,@mcqNo tinyint
		,@tfNo tinyint
		,@examDate datetime
		,@examDuration smallint = 60
)
as
begin
	begin try
		if exists(select * from Course where crs_Code = @crsCode)
		begin
			if @mcqNo + @tfNo = 10
			begin
				insert into Exam (exam_Date, exam_Duration, crs_Code)
				values(@examDate, @examDuration, @crsCode)

				declare @max smallint 
				Select @max= max(exam_No) from Exam
			
				insert into Exam_Questions(exam_No, quest_No)
				select * from (
					select @max as exam_No, quest_No
					from  
						(select *, ROW_NUMBER() over( partition by quest_Type order by newID() desc ) as rn
						from Questions where crs_Code = @crsCode and quest_Type = 'TorF') as newTable
						where rn < @tfNo+1
				
						union

						select @max as exam_No, quest_No
						from  
						(select *, ROW_NUMBER() over( partition by quest_Type order by newID() desc ) as rn
						from Questions where crs_Code = @crsCode and quest_Type = 'MCQ') as newTable
						where rn < @mcqNo+1
						) as newT
			
					declare @totalMarks smallint;
					select @totalMarks = sum(quest_Mark) from Exam_Questions as e
					inner join Questions as q
					on e.quest_No = q.quest_No
					where exam_No = @max

					UPDATE Exam
					SET total_Marks = @totalMarks
					WHERE exam_No = @max;

				end
				else
					select 'Exam must contain 10 questions only' as Error
		end
		else
			select 'This course code does not exist' as Error
	end try 
	begin catch
		select 'Error'
	end catch
end
GO

--exec examGenerator 4003, 4,6, '2-2-2002', 130 

--select * from Exam

----------------------------------------
use ITI_Examination
go

--drop proc ExamAnswers

go
create proc ExamAnswers (@studID smallint, @examNumber smallint, 
	@answer1 varchar(1),@answer2 varchar(1),@answer3 varchar(1),
	@answer4 varchar(1),@answer5 varchar(1),@answer6 varchar(1),
	@answer7 varchar(1),@answer8 varchar(1),@answer9 varchar(1),
	@answer10 varchar(1))
as begin
begin try
	if exists(select*from Student_Answers where std_Id = @studID and exam_No=@examNumber)
		select 'Duplicate data' as Error
	if( @studID not in (select std_Id from Student) )
		select 'Student does not exist' as Error;
	else if ( @examNumber not in (select exam_No from Exam) )
		select 'Exam does not exist' as Error;
	else begin
		declare @course_Code smallint;
		select @course_Code = crs_Code from Exam where exam_No = @examNumber;
		if( @studID not in ( select std_Id from Student_Course where crs_Code = @course_Code ) )
			select 'Student is not taking this course' as Error;
		else begin 
			
			declare @questionsNumbers table(questionID smallint, rowNumber tinyint identity(1,1));
			insert into @questionsNumbers 
			select eq.quest_No 
			from Exam_Questions eq
			inner join Questions q
				on eq.quest_No = q.quest_No
			where exam_No = @examNumber
			order by q.quest_Type desc

			insert into Student_Answers (std_Id, exam_No, quest_No)
			select @studID, exam_No , eq.quest_No 
			from Exam_Questions  eq
			inner join Questions q
				on eq.quest_No = q.quest_No
			where exam_No = @examNumber
			order by q.quest_Type desc
			
			declare @questID smallint;
			
			select @questID = questionID from @questionsNumbers where rowNumber = 1
			exec updateStudentAnswer @studID, @examNumber, @questID, @answer1
			select @questID = questionID from @questionsNumbers where rowNumber = 2
			exec updateStudentAnswer @studID, @examNumber, @questID, @answer2
			select @questID = questionID from @questionsNumbers where rowNumber = 3
			exec updateStudentAnswer @studID, @examNumber, @questID, @answer3
			select @questID = questionID from @questionsNumbers where rowNumber = 4
			exec updateStudentAnswer @studID, @examNumber, @questID, @answer4
			select @questID = questionID from @questionsNumbers where rowNumber = 5
			exec updateStudentAnswer @studID, @examNumber, @questID, @answer5
			select @questID = questionID from @questionsNumbers where rowNumber = 6
			exec updateStudentAnswer @studID, @examNumber, @questID, @answer6
			select @questID = questionID from @questionsNumbers where rowNumber = 7
			exec updateStudentAnswer @studID, @examNumber, @questID, @answer7
			select @questID = questionID from @questionsNumbers where rowNumber = 8
			exec updateStudentAnswer @studID, @examNumber, @questID, @answer8
			select @questID = questionID from @questionsNumbers where rowNumber = 9
			exec updateStudentAnswer @studID, @examNumber, @questID, @answer9
			select @questID = questionID from @questionsNumbers where rowNumber = 10
			exec updateStudentAnswer @studID, @examNumber, @questID, @answer10

		end
	end
end try
begin catch
	select 'Error' as Error
end catch
end
GO

/*
select qc.quest_Type from Exam_Questions e
inner join Questions qc
on e.quest_No = qc.quest_No
order by quest_Type

delete from student_Answers

select * from Exam_Questions
select * from Questions
select * from Student_Answers

select SA.*, Q.quest_ModelAnswer from Student_Answers SA inner join Questions Q on Q.quest_No = SA.quest_No order by quest_Type desc

exec ExamAnswers 10004, 1, 'a','a','a','a','a','t','t','t','t','t';

exec ExamAnswers 10001, 1, 't','t','t','t','t','a','a','a','a','a';

insert into Exam (exam_Date, exam_Duration, crs_Code) values (GETDATE(), 120, 4001)
*/
/*select * from Student_Course where crs_Code=4003
exec ExamAnswers 10002, 1, 'f','t','t','f','t','b','a','c','d','a';*/
/*select * from Student_Answers where std_id=10004
select * from Course
exec ExamCorrection 3,10004*/
use ITI_Examination
GO

--drop proc examCorrection

GO
create procedure ExamCorrection (@exam_no smallint,
                                  @id smallint)
as 
declare @score smallint=0 ,@total smallint, @crs_no smallint
begin
	begin try
		if exists (select * from Student_Answers sa where exam_No=@exam_no AND sa.std_Id=@id)
		begin
			select @score=sum(score) from Student_Answers where std_Id=@id

			--to call update student course procedure to update the grade
			select @crs_no=crs_Code from Exam where exam_No=@exam_no

			update Student_Course set grade =(select (@score*100.00)/total_Marks from Exam where exam_No=@exam_no)
			where std_Id=@id and crs_Code = @crs_no
		
		end
		else
			select 'Does not exist' as 'Error'
	end try
	begin catch
		select 'This data does not exist' as 'Error'
	end catch
end
Go


use ITI_Examination
GO
--drop proc GetStudentInfoByDeptNo
create procedure GetStudentInfoByDeptNo @dept_no smallint
as
begin
begin try
select s.std_Id as 'Student ID',s.std_Fname as 'Student First Name',s.std_Lname as 'Student Last name',
s.std_Address as 'Student Address', s.std_Mobile as 'Student Mobile', s.std_DOB as 'Student Birthdate',
d.dept_Name as'Dept Name'
from Student s inner join Department d on s.dept_No=d.dept_No
where s.dept_No=@dept_no
end try
begin catch
select 'No department found with this id' as 'Error'
end catch
end
GO


--exec GetStudentInfoByDeptNo 301

--drop proc GetInstructorCourses 
create procedure GetInstructorCourses  @inst_id smallint
as
begin
begin try
	select c.crs_Name as 'Course Name', COUNT(sc.std_Id) as 'Number of Students',
	Concat(i.inst_Fname,' ',i.inst_Lname) as Name
	from Instructor i inner join Instructor_Course ic 
	on i.inst_Id=ic.inst_Id
	inner join Course c
	on ic.crs_Code=c.crs_Code
	inner join Student_Course sc
	on sc.crs_Code=c.crs_Code
	where i.inst_Id=@inst_id
	group by c.crs_Name, i.inst_Fname, i.inst_Lname
end try
begin catch
select 'No instructor found with this id' as 'Error'
end catch
end
GO

--exec GetInstructorCourses 2001
use ITI_Examination
GO
create proc GetCourseTopics
(
@courseID smallint
)
as
begin
	begin try
		select c.crs_Name as 'Course Name', topic_name as 'Topic Name'
		from Course_Topics ct inner join Course c
		on ct.crs_Code=c.crs_Code
		where ct.crs_Code = @courseID
	end try
	begin catch
		select 'No Course found with this id' as Error
	end catch
end
GO

--exec GetCourseTopics 4001
use ITI_Examination
GO

--drop proc GetStudentsGrades
create proc GetStudentsGrades
(
@studentID smallint
)
as
begin
	begin try

		select std_Fname+' ' + std_Lname as 'Student Name', Course.crs_Name as 'Course Name',
				grade = case 
					when grade<60 then 'F'
					when grade<65 then 'D'
					when grade<75 then 'C'
					when grade<85 then 'B'
					else 'A'
					end
		from Student
		inner join Student_Course
		on Student.std_Id = Student_Course.std_Id and Student.std_Id = @studentID
		inner join Course
		on Student_Course.crs_Code = Course.crs_Code
	end try
	begin catch
		select 'No Student found with this id' as 'Error'
	end catch
end
GO

--exec GetStudentsGrades 10001

exec GetCourseTopics 4001

--
-----
use ITI_Examination
GO

--drop proc PrintExam

GO
create proc PrintExam (@examNo smallint)--, @crsName varchar(50)out ,@examDuration smallint out)
as
begin
	try
	    if not exists(Select * from Exam_Questions where exam_No=@examNo )
		  select 'This Exam number does not exist' as Error
	  else
       begin try
	        /*Select exam_Duration AS ExamDuration,CONCAT(crs_Name,' Final Exam') AS CourseName from Exam E
			inner join Course C on C.crs_Code=E.crs_Code where exam_No=@examNo
			--Select @examDuration,@crsName*/
			declare @result	table (qno smallint primary key identity(1,1),body varchar(250), qtype varchar(10),
			examDuration smallint,crsName varchar(50),examDate datetime)
		    declare @examDuration smallint ,@crsName varchar(50),@examDate datetime
			
			Select @examDuration=exam_Duration,@examDate=exam_Date,@crsName=CONCAT(crs_Name,' Final Exam') from Exam E
		    inner join Course C on C.crs_Code=E.crs_Code where exam_No=@examNo
			declare quest_cursor cursor
				for
					select eq.quest_No--,q.quest_Type
					from Exam_Questions eq
					inner join Questions q
						on eq.quest_No = q.quest_No and exam_No = @examNo
					--group by eq.quest_No, q.quest_Type
					order by q.quest_Type desc
				for read only

				declare @questNo smallint,@counter smallint
				Set @counter=1;
				open quest_cursor
					fetch quest_cursor into @questNo--, @questType
					begin
						while @@FETCH_STATUS = 0
						begin
						   
							insert into @result
							select _body, _Type,_Duration,_CourseName,_Date from
								(
								select 1 as dummy, CONCAT('Q',@counter,'. ',q.quest_Body) AS _body, q.quest_Type as _Type,
								@examDuration AS _Duration,@crsName AS _CourseName,@examDate AS _Date
									from Questions q
									where q.quest_No = @questNo
								union
								select 2,qc.choice_Body,'MCQ',
								@examDuration AS _Duration,@crsName AS _CourseName,@examDate AS _Date
									from Question_Choices qc
									where qc.quest_No = @questNo
								
								) as newt
							fetch quest_cursor into @questNo--, @questType
							SET @counter=@counter+1;
						end
					end
				close quest_cursor
			deallocate quest_cursor
			
			select r.qtype, r.body,r.crsName,r.examDuration,r.examDate from @result r
		end try
		begin catch
		select 'Error' as Error
	  end catch
	 
		end try
		begin catch
		select 'Error' as Error
	  end catch
	
	
GO


--exec PrintExam 5,10,
/*Select * from Exam
declare @examDuration smallint,@crsName varchar(50)
exec PrintExam 1,@examDuration,@crsName
Select @examDuration =exam_Duration,@crsName=crs_Name from Exam E
inner join Course C on C.crs_Code=E.crs_Code where exam_No=1
Select @examDuration,@crsName*/--
-----
use ITI_Examination
GO

--drop proc PrintExamWithStudAns

GO
create proc PrintExamWithStudAns (@examNo smallint,@stdID smallint)--, @crsName varchar(50)out ,@examDuration smallint out)
as
begin
	try
	    if not exists(Select * from Student_Answers where exam_No=@examNo and std_Id=@stdID )
		  select 'This Exam has no answers for this student' as Error
	  else
       begin try
	        /*Select exam_Duration AS ExamDuration,CONCAT(crs_Name,' Final Exam') AS CourseName from Exam E
			inner join Course C on C.crs_Code=E.crs_Code where exam_No=@examNo
			--Select @examDuration,@crsName*/
			declare @result	table (qno smallint primary key identity(1,1),body varchar(250), qtype varchar(10),
			examDuration smallint,crsName varchar(50),stdName varchar(40),deptName varchar(50),examDate datetime)
		    declare @examDuration smallint ,@crsName varchar(50),@examDate datetime,@studName varchar(40),@stdDept varchar(50)
			Select @examDuration=exam_Duration,@examDate=exam_Date,@crsName=CONCAT(crs_Name,' Final Exam')
			from Exam E inner join Course C on C.crs_Code=E.crs_Code
			where exam_No=@examNo

		    Select 	@studName=CONCAT(std_Fname,' ',std_Lname) from Student S 	where   S.std_Id=@stdID
			Select @stdDept = dept_Name from Department D inner join Student S on D.dept_No=S.dept_No
			where S.std_Id = @stdID

			declare quest_cursor cursor
				for
					select sa.quest_No--,q.quest_Type
					from Student_Answers sa
					inner join Questions q
						on sa.quest_No = q.quest_No 
						where  sa.exam_No = @examNo
					and sa.std_Id=@stdID 
					order by q.quest_Type desc
				for read only

				declare @questNo smallint,@counter smallint
				Set @counter=1;
				open quest_cursor
					fetch quest_cursor into @questNo--, @questType
					begin
						while @@FETCH_STATUS = 0
						begin
						   
							insert into @result
							select _body, _Type,_Duration,_CourseName, _StudentName,_StudentDeptName, _Date from
								(
								select 1 as dummy, CONCAT('Q',@counter,'. ',q.quest_Body) AS _body, q.quest_Type as _Type,
								@examDuration AS _Duration,@crsName AS _CourseName,@studName AS _StudentName,@stdDept
								 AS _StudentDeptName,@examDate AS _Date
									from Questions q
									where q.quest_No = @questNo
								union

								 select 3 , CONCAT('Model Answer: ',upper(q.quest_ModelAnswer)) as _body ,q.quest_Type as _Type,
								@examDuration AS _Duration,@crsName AS _CourseName,@studName AS _StudentName,@stdDept
								 AS _StudentDeptName,@examDate AS _Date
								 from Questions q
									where q.quest_No = @questNo
								
								 
								 union 

								 select 4 , CONCAT('Student Answer: ',upper(SA.std_Answer)) as _body,q.quest_Type as _Type,
								@examDuration AS _Duration,@crsName AS _CourseName,@studName AS _StudentName,
								@stdDept AS _StudentDeptName,@examDate AS _Date
								 from Student_Answers SA
									 inner join Questions q
									on sa.quest_No = @questNo
									where SA.std_Id = @stdID and SA.exam_No = @examNo  and q.quest_No=@questNo

								 union

								select 2,qc.choice_Body,'MCQ',
								@examDuration AS _Duration,@crsName AS _CourseName,@studName AS _StudentName,@stdDept
								 AS _StudentDeptName,@examDate AS _Date
									from Question_Choices qc
									where qc.quest_No = @questNo
								
								) as newt
							fetch quest_cursor into @questNo--, @questType
							SET @counter=@counter+1;
						end
					end
				close quest_cursor
			deallocate quest_cursor
			
			select r.qtype, r.body,r.crsName,r.examDuration,r.stdName,r.deptName,r.examDate from @result r
		end try
		begin catch
		select 'Error' as Error
	  end catch
	 end try
	 begin catch
		select 'Error' as Error
	  end catch
	 
		--else
			--select 'This Exam number does not exist' as Error
	
	

GO


--exec PrintExamWithStudAns 5,10001
/*Select * from Student_Answers
Select exam_Duration,exam_Date,CONCAT(crs_Name,' Final Exam')
		 from Exam E
		    inner join Course C on C.crs_Code=E.crs_Code
			where exam_No = 5
Select 	CONCAT(std_Fname,' ',std_Lname) AS StdName
			from Student S 
			where   S.std_Id=10001*/


			
select sa.quest_No--,q.quest_Type
					from Student_Answers sa
					inner join Questions q
						on sa.quest_No = q.quest_No 
						where  sa.exam_No = 5
					and sa.std_Id=10001 
					--group by eq.quest_No, q.quest_Type
					order by q.quest_Type desc

					Select  dept_Name from Department D inner join Student S on D.dept_No=S.dept_No
			where S.std_Id = 10001--
----
use ITI_Examination
GO
---
/*
SELECT concat(SPECIFIC_NAME, char(10),'ahmed')
FROM ITI_Examination.INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE = 'PROCEDURE'
order by SPECIFIC_NAME
*/


EXEC sp_addextendedproperty 'MS_Description','Delete a specific course by passing its code.
Deleting a course will delete its topics and its questions.','schema', dbo, 'PROCEDURE','deleteCourse'
EXEC sp_addextendedproperty 'MS_Description','Delete a topic by passing the course code and the topic name.','schema', dbo, 'PROCEDURE','deleteCourseTopics'
EXEC sp_addextendedproperty 'MS_Description','Delete a department by passing its number.
You can not delete a department that has instructors assigned to it.','schema', dbo, 'PROCEDURE','deleteDepartment'
EXEC sp_addextendedproperty 'MS_Description','Delete an exam by passing its number.
You can not delete an exam that students have answered.','schema', dbo, 'PROCEDURE','deleteExam'
EXEC sp_addextendedproperty 'MS_Description','Delete an instructor by passing his/her ID.
Deleting an instructor will delete the courses he teach.','schema', dbo, 'PROCEDURE','deleteInstructor'
EXEC sp_addextendedproperty 'MS_Description','Delete a Course by passing its number and the ID of the instructor.','schema', dbo, 'PROCEDURE','deleteInstructorCourse'
EXEC sp_addextendedproperty 'MS_Description','Delete a question by passing its number.
You can not delete a question that is used in any exam.','schema', dbo, 'PROCEDURE','deleteQuestion'
EXEC sp_addextendedproperty 'MS_Description','Delete a Student by passing his/her ID.','schema', dbo, 'PROCEDURE','deleteStudent'
EXEC sp_addextendedproperty 'MS_Description','Delete a student answer by passing its number and the ID of the student.','schema', dbo, 'PROCEDURE','deleteStudentAnswer'
EXEC sp_addextendedproperty 'MS_Description','Delete a student by passing his/her firstname, lastname and his date of birth.','schema', dbo, 'PROCEDURE','deleteStudentByName_AND_DOB'
EXEC sp_addextendedproperty 'MS_Description','Delete a Course from by passing its code and the student ID.','schema', dbo, 'PROCEDURE','deleteStudentCourse'
EXEC sp_addextendedproperty 'MS_Description','Insert a new course.
It takes 2 parameters (course name and course duration in hours)','schema', dbo, 'PROCEDURE','insertCourse'
EXEC sp_addextendedproperty 'MS_Description','Insert a topic of a course.
It takes 2 parameters (course code and the topic)','schema', dbo, 'PROCEDURE','insertCourseTopics'
EXEC sp_addextendedproperty 'MS_Description','Insert a new department.
It takes 3 parameters (department name, its manager ID and his/her hiring date)','schema', dbo, 'PROCEDURE','insertDepartment'
EXEC sp_addextendedproperty 'MS_Description','Insert a new instructor.
It takes 5 parameters (instructor firstname, lastname, salary, degree and the department he/she is assigned to)','schema', dbo, 'PROCEDURE','insertInstructor'
EXEC sp_addextendedproperty 'MS_Description','Assign an instructor to teach a specific course.
Ic takes 2 parameters (instructor ID and the course code)','schema', dbo, 'PROCEDURE','insertInstructorCourse'
EXEC sp_addextendedproperty 'MS_Description','Insert a new question.
It takes 5 parameters (question body, its model answer,  irs mark, type of the question MCQ or TorF and the course code that the question belongs to)','schema', dbo, 'PROCEDURE','insertQuestion'
EXEC sp_addextendedproperty 'MS_Description','Insert a new student.
It takes 6 parameters (student firstname, 
lastname, 
date of birth, 
address, 
mobile number and 
department number that the student belongs to)','schema', dbo, 'PROCEDURE','insertStudent'
EXEC sp_addextendedproperty 'MS_Description','Insert a course of a student.
Ic takes 2 parameters (student code and the cours)','schema', dbo, 'PROCEDURE','insertStudentCourse'
EXEC sp_addextendedproperty 'MS_Description','Retrieve the information of all students.','schema', dbo, 'PROCEDURE','selectAllStudents'
EXEC sp_addextendedproperty 'MS_Description','Retrieve a specific course by passing its code.','schema', dbo, 'PROCEDURE','selectCourse'
EXEC sp_addextendedproperty 'MS_Description','Retrieve the topics of a course by passing its code.','schema', dbo, 'PROCEDURE','selectCourseTopics'
EXEC sp_addextendedproperty 'MS_Description','Retrieve a department data by passing its number.','schema', dbo, 'PROCEDURE','selectDepartment'
EXEC sp_addextendedproperty 'MS_Description','Retrieve the data of an exam by passing its number.','schema', dbo, 'PROCEDURE','selectExam'
EXEC sp_addextendedproperty 'MS_Description','Retrieve the questions in an exam by passing its number.','schema', dbo, 'PROCEDURE','selectExamQuestions'
EXEC sp_addextendedproperty 'MS_Description','Retrieve the information of instructor by passing his/her ID.','schema', dbo, 'PROCEDURE','selectInstructor'
EXEC sp_addextendedproperty 'MS_Description','Retrieve all the courses that is beeing taught by an instructor by passing his/her ID.','schema', dbo, 'PROCEDURE','selectInstructorCourse'
EXEC sp_addextendedproperty 'MS_Description','Retrieve the data of a question by passing its number.','schema', dbo, 'PROCEDURE','selectQuestion'
EXEC sp_addextendedproperty 'MS_Description','Retrieve an answer of a question by passing the ID of the student, exam number and the question number.','schema', dbo, 'PROCEDURE','selectQuestStudAnswer'
EXEC sp_addextendedproperty 'MS_Description','Retrieve the information of a student by passing his/her ID.','schema', dbo, 'PROCEDURE','selectStudent'
EXEC sp_addextendedproperty 'MS_Description','Retrieve all the courses that the student enrolled in by passing his/her ID.','schema', dbo, 'PROCEDURE','selectStudentCourse'
EXEC sp_addextendedproperty 'MS_Description','Update the data of a course.','schema', dbo, 'PROCEDURE','updateCourse'
EXEC sp_addextendedproperty 'MS_Description','Update a topic name of a course.','schema', dbo, 'PROCEDURE','updateCourseTopics'
EXEC sp_addextendedproperty 'MS_Description','Update the data of a department.','schema', dbo, 'PROCEDURE','updateDepartment'
EXEC sp_addextendedproperty 'MS_Description','Update the data of an exam.','schema', dbo, 'PROCEDURE','updateExam'
--EXEC sp_addextendedproperty 'MS_Description','Update the total mark of an exam.','schema', dbo, 'PROCEDURE','updateExamTotalMarks'
EXEC sp_addextendedproperty 'MS_Description','Update the information of an instructor.','schema', dbo, 'PROCEDURE','updateInstructor'
EXEC sp_addextendedproperty 'MS_Description','Update the instructor who is teaching the course.','schema', dbo, 'PROCEDURE','updateInstructorCourse'
EXEC sp_addextendedproperty 'MS_Description','Update the data of a question.','schema', dbo, 'PROCEDURE','updateQuestion'
EXEC sp_addextendedproperty 'MS_Description','Update a choice of a question.','schema', dbo, 'PROCEDURE','updateQuestionChoices'
EXEC sp_addextendedproperty 'MS_Description','Update the information of a student.','schema', dbo, 'PROCEDURE','updateStudent'
EXEC sp_addextendedproperty 'MS_Description','Update the address of a student.','schema', dbo, 'PROCEDURE','updateStudentAddress'
EXEC sp_addextendedproperty 'MS_Description','Update the student answer on a question in an exam.','schema', dbo, 'PROCEDURE','updateStudentAnswer'
EXEC sp_addextendedproperty 'MS_Description','Update the grade of the student in a course.','schema', dbo, 'PROCEDURE','updateStudentCourseGrade'
EXEC sp_addextendedproperty 'MS_Description','Update the department of the student.','schema', dbo, 'PROCEDURE','updateStudentDepartment'
EXEC sp_addextendedproperty 'MS_Description','Update the date of birth of the student.','schema', dbo, 'PROCEDURE','updateStudentDOB'
EXEC sp_addextendedproperty 'MS_Description','Update the mobile number of the student.','schema', dbo, 'PROCEDURE','updateStudentMobile'
EXEC sp_addextendedproperty 'MS_Description','Update the name of the student.','schema', dbo, 'PROCEDURE','updateStudentName'

--EXEC sp_dropextendedproperty 'MS_Description', 'schema', dbo, 'PROCEDURE', ''

EXEC sp_addextendedproperty 'MS_Description','To print an exam.
		(for crystal report)','schema', dbo, 'PROCEDURE','PrintExam'
EXEC sp_addextendedproperty 'MS_Description','To get a course name and its all topics by passing the course code.
		(for crystal report)','schema', dbo, 'PROCEDURE','GetCourseTopics'
EXEC sp_addextendedproperty 'MS_Description','To get the name of the student, names of his/her courses and his/her grades in each course.
		(for crystal report)','schema', dbo, 'PROCEDURE','GetStudentsGrades'
EXEC sp_addextendedproperty 'MS_Description','To get all students info in a department
		(for crystal report).','schema', dbo, 'PROCEDURE','GetStudentInfoByDeptNo'
EXEC sp_addextendedproperty 'MS_Description','To get all courses taught by an instructor and the number of students per course.
		(for crystal report)','schema', dbo, 'PROCEDURE','GetInstructorCourses'
EXEC sp_addextendedproperty 'MS_Description','To print a student answers in a specific exam.
		(for crystal report)','schema', dbo, 'PROCEDURE','PrintExamWithStudAns'

EXEC sp_addextendedproperty 'MS_Description','This procedure calculates the sum of correct answers for a student in a specific exam then updates his/her grade.
It takes 2 parameters (exam number and student ID).','schema', dbo, 'PROCEDURE','ExamCorrection'
EXEC sp_addextendedproperty 'MS_Description','This procedures generates an exam by choosing random questions.
It takes 5 parameters (course code, number of MCQs, number of TorF questions, exam datetime, exam duration in minutes).','schema', dbo, 'PROCEDURE','ExamGeneration'
EXEC sp_addextendedproperty 'MS_Description','Insert a student answers in an exam.
It takes 12 parameters (stduent ID, exam number, 10 answers)','schema', dbo, 'PROCEDURE','ExamAnswers'
GO
