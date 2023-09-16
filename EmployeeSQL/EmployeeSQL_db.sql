--- 1. Create a Departments Table
CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(255)
);

SELECt * from departments;



--- 2. Create a Titles Table

CREATE TABLE titles (
    title_id VARCHAR(255) PRIMARY KEY,
    title VARCHAR(255)
);
-- DROP TABLE titles;
SELECt * from titles;


-- Step 1: Set the datestyle temporarily for the current session
SET datestyle TO 'ISO, MDY';

-- Step 2: Create the "employees" table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(255),
    birth_date DATE,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    sex CHAR(1),
    hire_date DATE,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

DROP TABLE employees;
SELECt * from employees;


--- 4. Create a Salaries Table
CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary INT
);

SELECt * from salaries;

--- 5. Create a Department Employees (dept_emp) Table
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(4),
    FOREIGN KEY (emp_no) REFERENCES salaries(emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


SELECt * from dept_emp;

--- 6. Create a Department Managers (dept_manager) Table
CREATE TABLE dept_manager (
    dept_no VARCHAR(4),
    emp_no INT PRIMARY KEY,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECt * from dept_manager;


