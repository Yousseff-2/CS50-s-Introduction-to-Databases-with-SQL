CREATE INDEX x
ON courses("department" , "number" , "semester" , "title");


CREATE INDEX y
ON satisfies("course_id");


CREATE INDEX c
ON enrollments("student_id")
