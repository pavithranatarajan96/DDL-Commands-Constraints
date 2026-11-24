-- 1. Create Database
CREATE DATABASE IF NOT EXISTS employee;
USE employee;

-- creating department table --
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- creating location table --
CREATE TABLE Location (
    location_id INT PRIMARY KEY,
    location_name VARCHAR(30)
);

-- creating employees table --
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    gender ENUM('M', 'F'),
    age INT(100),
    hire_date DATE,
    designation VARCHAR(100),
    salary DECIMAL(10,2),
    department_id INT,
    location_id INT,
    
    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

-- 2. ALTER operations
ALTER TABLE Employees
ADD COLUMN email VARCHAR(150);

ALTER TABLE Employees
MODIFY COLUMN designation VARCHAR(200);

ALTER TABLE Employees
DROP COLUMN age;

ALTER TABLE Employees
RENAME COLUMN hire_date TO date_of_joining;

-- 3. Rename tables
RENAME TABLE Departments TO Departments_Info;
RENAME TABLE Location TO Locations;

-- 4. TRUNCATE Employees table
TRUNCATE TABLE Employees;

-- 5. Drop Employees table and then the employee database
DROP TABLE Employees;
DROP DATABASE employee;

-- RECREATE DATABASE WITH CONSTRAINTS

DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;

-- Departments table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

-- Locations table:
CREATE TABLE Location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(100) NOT NULL UNIQUE
);

-- employee table:
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    gender ENUM('M','F') NOT NULL,
    age INT NOT NULL,
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(200),
    salary DECIMAL(10,2),

    department_id INT,
    location_id INT,

    CHECK (age >= 18),

    FOREIGN KEY (department_id)
    REFERENCES Departments(department_id),

    FOREIGN KEY (location_id)
    REFERENCES Location(location_id)
);
