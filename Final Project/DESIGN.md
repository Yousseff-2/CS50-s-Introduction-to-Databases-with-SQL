# Design Document for Academic System Database

### By Youssef Mahmoud

**[Video Overview](<https://youtu.be/fRKC45_81L8?si=uGNmfqrpaBuoULWf>)**

---

## Project Overview

The **Academic System Database** is designed to manage data related to students, instructors, courses, and enrollments within an educational institution. The system will help administrators efficiently track student enrollments, instructor assignments, course offerings, and enrollment statuses.

## Purpose

The purpose of this database is to provide a streamlined way to manage academic information, including:

- Student and instructor accounts
- Course offerings and instructor assignments
- Student course enrollments and enrollment statuses
- Administrative oversight of user roles

By structuring data into entities like accounts, courses, student enrollments, and statuses, this database will give the institution a centralized system for managing essential academic information.

---

## Scope

The database will manage the following primary entities within the academic system:

1. **Accounts**: Users of the system, categorized as students, instructors, or admins.
2. **Courses**: Represents the academic offerings of the institution.
3. **Enrollments**: Tracks which students are enrolled in each course and their enrollment status.
4. **StudentCourses**: Maps students to the courses they are enrolled in.

---

## Entities and Relationships

### Entities

1. **Accounts**
   - `ID`: INT (Primary Key, Auto Increment)
   - `Name`: VARCHAR(255) (Not Null)
   - `Username`: VARCHAR(255) (Unique, Not Null)
   - `Password`: VARCHAR(255) (Not Null)
   - `Role`: ENUM('Student', 'Admin', 'Instructor') (Not Null)

2. **Courses**
   - `Course_ID`: INT (Primary Key, Auto Increment)
   - `Course_Name`: VARCHAR(255) (Not Null)
   - `Credit_Hours`: INT (Not Null, CHECK: `Credit_Hours > 0 AND Credit_Hours <= 6`)
   - `Instructor_ID`: INT (Foreign Key referencing `Accounts(ID)`)

3. **Enrollments**
   - `Enrollment_ID`: INT (Primary Key, Auto Increment)
   - `Student_ID`: INT (Foreign Key referencing `Accounts(ID)`)
   - `Course_ID`: INT (Foreign Key referencing `Courses(Course_ID)`)
   - `Status`: ENUM('Active', 'Completed', 'Dropped', 'Failed') (Default: 'Active')

4. **StudentCourses**
   - `StudentCourse_ID`: INT (Primary Key, Auto Increment)
   - `Student_ID`: INT (Foreign Key referencing `Accounts(ID)`)
   - `Course_ID`: INT (Foreign Key referencing `Courses(Course_ID)`)

---

### Relationships

- **Accounts** to **Courses**: One-to-Many (Each instructor can teach multiple courses).
- **Accounts** to **StudentCourses**: One-to-Many (Each student can be enrolled in multiple courses).
- **Courses** to **StudentCourses**: One-to-Many (Each course can have multiple enrolled students).
- **Enrollments**: Links students to courses, allowing multiple statuses to track progress.

### Entity Relationship Diagram (ERD)

![Academic System ERD](ERD.png)

The ERD illustrates these relationships between entities. Key points:

- Each instructor (account) can teach multiple courses, but each course is assigned to only one instructor.
- Each course can have multiple students enrolled, but each student is tracked as a unique entry.
- The enrollment table tracks the progress of each student within a course.

---

## Optimizations

1. **Indexes**:
   - Indexes on `Username` in the **Accounts** table for faster lookup.
   - Indexes on `Course_Name` in the **Courses** table to improve course search efficiency.
   - Index on `Status` in **Enrollments** to quickly filter by enrollment status.

2. **Constraints**:
   - Constraints are set for data integrity, such as a non-negative `Credit_Hours` value and predefined `Role` and `Status` values in the `Accounts` and `Enrollments` tables.

3. **Views**:
   - Views can be created to summarize data, such as a view showing active students per course or course loads for instructors.

---

## Limitations

1. **No Scheduling Features**:
   - This design does not handle course schedules, classroom assignments, or times.

2. **Basic Enrollment Tracking**:
   - Enrollment status is tracked, but no detailed tracking is available for grades or course completion dates.

3. **Limited User Roles**:
   - The database supports only three predefined user roles (Student, Admin, Instructor) and lacks role-based permissions beyond these categories.

4. **Security**:
   - Passwords are stored as plain text, which would require encryption in a production environment to ensure data security.
