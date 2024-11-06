DROP DATABASE IF EXISTS system;

CREATE DATABASE system;

USE system;

CREATE TABLE Accounts (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Role ENUM('Student', 'Admin', 'Instructor') NOT NULL,
    Username VARCHAR(255) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL
);

CREATE INDEX idx_username ON Accounts (Username);

CREATE TABLE Courses (
    Course_ID INT AUTO_INCREMENT PRIMARY KEY,
    Course_Name VARCHAR(255) NOT NULL,
    Instructor_ID INT NOT NULL,
    Credit_Hours INT NOT NULL CHECK (Credit_Hours > 0 AND Credit_Hours <= 6),
    CONSTRAINT fk_instructor FOREIGN KEY (Instructor_ID) REFERENCES Accounts(ID)
);

CREATE INDEX idx_course_name ON Courses (Course_Name);
CREATE INDEX idx_instructor_id ON Courses (Instructor_ID);

CREATE TABLE StudentCourses (
    StudentCourse_ID INT AUTO_INCREMENT PRIMARY KEY,
    Student_ID INT NOT NULL,
    Course_ID INT NOT NULL,
    FOREIGN KEY (Student_ID) REFERENCES Accounts(ID) ON DELETE CASCADE,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID) ON DELETE CASCADE
);

CREATE INDEX idx_student_course ON StudentCourses (Student_ID, Course_ID);

CREATE TABLE Enrollments (
    Enrollment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Student_ID INT NOT NULL,
    Course_ID INT NOT NULL,
    Status ENUM('Active', 'Completed', 'Dropped', 'Failed') DEFAULT 'Active',
    FOREIGN KEY (Student_ID) REFERENCES Accounts(ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

CREATE INDEX idx_enrollment_status ON Enrollments (Status);
