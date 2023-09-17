-- 1. Create a Departments Table
CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(255) NOT NULL
);
-- Display "departments" table
SELECT * from departments;


-- 2. Create a Titles Table
CREATE TABLE titles (
    title_id VARCHAR(255) PRIMARY KEY NOT NULL,
    title VARCHAR(255) NOT NULL
);

-- Display "Titles" table
SELECT * from titles;


-- Step 1: Set the datestyle temporarily for the current session
SET datestyle TO 'MDY';

-- Step 2: Create the "employees" table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);



-- Step3: Revert datestyle to 'ISO'
SET datestyle TO 'ISO, MDY';

-- Display "employees" table
SELECT * from employees;


-- 4. Create a Salaries Table
CREATE TABLE salaries (
    emp_no INT PRIMARY KEY NOT NULL,
    salary INT NOT NULL
);

-- Display "Salaries" table
SELECT * from salaries;


-- 5. Create a Department Employees (dept_emp) Table
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES salaries(emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


-- Display "Department Employees" (dept_emp) Table
SELECT * from dept_emp;

-- 6. Create a Department Managers (dept_manager) Table
CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT PRIMARY KEY NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Display "Department Managers" (dept_manager) Table
SELECT * from dept_manager;




