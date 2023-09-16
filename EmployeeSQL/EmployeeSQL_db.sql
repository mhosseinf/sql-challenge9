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

-- DROP TABLE employees;
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


-- Data Analysis
-- 1-List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.first_name,e.last_name,e.sex,s.salary
FROM employees AS e
INNER JOIN salaries AS s ON e.emp_no = s.emp_no;

-- 2-List the first name, last name, and hire date for the employees who were hired in 1986

-- Method I

SELECT e.first_name,e.last_name,e.hire_date
FROM employees AS e
WHERE hire_date BETWEEN DATE '1986-01-01' AND DATE '1986-12-31'

-- Method II

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

3-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT 
	d.dept_no AS department_number,
	d.dept_name AS department_name,
	e.emp_no AS employee_number, 
	e.last_name AS last_name,
	e.first_name AS first_name,	
	ti.title As employee_title
FROM
    dept_manager AS dm
INNER JOIN employees AS e ON e.emp_no = dm.emp_no
INNER JOIN departments AS d ON dm.dept_no = d.dept_no
INNER JOIN titles AS ti ON e.emp_title_id = ti.title_id;

