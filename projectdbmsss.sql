CREATE DATABASE student_db;
USE student_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);
SELECT * FROM students;

