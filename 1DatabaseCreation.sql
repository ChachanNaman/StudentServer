CREATE DATABASE student_management;
USE student_management;

CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(15),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE SET NULL
);

CREATE TABLE instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(15),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    credits INT NOT NULL,
    department_id INT,
    instructor_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
);

CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester VARCHAR(10),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks_obtained INT,
    total_marks INT,
    grade VARCHAR(5),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO departments (department_name) VALUES 
('Computer Science'), ('Mechanical Engineering'), ('Electrical Engineering'), ('Civil Engineering');

INSERT INTO instructors (name, email, phone, department_id) VALUES
('Dr. Amit Sharma', 'amit.sharma@mitwpu.edu.in', '9876543210', 1),
('Dr. Priya Kulkarni', 'priya.kulkarni@mitwpu.edu.in', '8765432109', 2),
('Dr. Rajesh Patil', 'rajesh.patil@mitwpu.edu.in', '7654321098', 3),
('Dr. Neha Joshi', 'neha.joshi@mitwpu.edu.in', '6543210987', 4);

INSERT INTO courses (course_name, credits, department_id, instructor_id) VALUES
('Data Structures', 4, 1, 1),
('Thermodynamics', 3, 2, 2),
('Circuit Analysis', 4, 3, 3),
('Structural Engineering', 3, 4, 4);

SHOW COLUMNS FROM enrollments;
ALTER TABLE enrollments MODIFY semester VARCHAR(20);
SHOW COLUMNS FROM enrollments;
ALTER TABLE enrollments MODIFY student_id INT;
ALTER TABLE enrollments MODIFY course_id INT;


ALTER TABLE enrollments
ADD CONSTRAINT fk_student_id FOREIGN KEY (student_id) REFERENCES students(student_id),
ADD CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES courses(course_id);

SHOW COLUMNS FROM enrollments;
SHOW COLUMNS FROM students;
SHOW COLUMNS FROM courses;


SHOW COLUMNS FROM students;


SELECT student_id FROM students;
INSERT INTO enrollments (student_id, course_id, semester) VALUES
(1032230024, 1, 'Sem 1'),
(1032230108, 2, 'Sem 1'),
(1032230152, 3, 'Sem 1'),
(1032230170, 4, 'Sem 1'),
(1032230187, 1, 'Sem 1');

INSERT INTO results (student_id, course_id, marks_obtained, total_marks, grade) VALUES
(1032230024, 1, 85, 100, 'A'),
(1032230108, 2, 78, 100, 'B'),
(1032230152, 3, 90, 100, 'A+'),
(1032230170, 4, 67, 100, 'C'),
(1032230187, 1, 80, 100, 'B+');

SELECT * FROM students;

SELECT * FROM courses;

SELECT e.enrollment_id, s.name AS student_name, c.course_name, e.semester 
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;

SELECT r.student_id, s.name, c.course_name, r.marks_obtained, r.total_marks, r.grade 
FROM results r
JOIN students s ON r.student_id = s.student_id
JOIN courses c ON r.course_id = c.course_id;








