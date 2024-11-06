INSERT INTO Accounts (Name, Age, Major, Username, Password, Role)
VALUES
    ('Youssef', 20, 'CS', 'youssef', 'password123', 'Student'),
    ('Mohamed', 22, 'IT', 'mohamed', 'password456', 'Student'),
    ('Maher', 30, 'Admin', 'maher', 'adminpassword', 'Admin');

INSERT INTO Courses (Course_Name, Credit_Hours, Instructor_ID)
VALUES
    ('Database Systems', 3, 3),
    ('Software Engineering', 4, 3);

INSERT INTO StudentCourses (Student_ID, Course_ID, Grade)
VALUES
    (1, 1, 'A'),
    (2, 2, 'B');

SELECT ID AS Student_ID, Name AS Student_Name, Major, Age, Username
FROM Accounts
WHERE Role = 'Student';

SELECT c.Course_ID, c.Course_Name, c.Credit_Hours, c.Department, i.Name AS Instructor_Name
FROM Courses c
LEFT JOIN Accounts i ON c.Instructor_ID = i.ID;

SELECT c.Course_Name, sc.Grade
FROM StudentCourses sc
JOIN Courses c ON sc.Course_ID = c.Course_ID
WHERE sc.Student_ID = 1;

DELETE FROM Accounts WHERE ID = 1;

DELETE FROM StudentCourses WHERE Student_ID = 1;
