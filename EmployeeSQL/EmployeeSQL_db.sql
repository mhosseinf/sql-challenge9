--- 1. Create a Departments Table
CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(255)
);

--- 2. Create a Titles Table

CREATE TABLE titles (
    title_id VARCHAR(255) PRIMARY KEY,
    title VARCHAR(255)
);

--- 3. Create a Employees Table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(255) REFERENCES titles(title_id),
    birth_date DATE,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    sex CHAR(1),
    hire_date DATE
);


--- 4. Create a Department Employees (dept_emp) Table
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(4),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


--- 5. Create a Department Managers (dept_manager) Table
CREATE TABLE dept_manager (
    dept_no VARCHAR(4),
    emp_no INT PRIMARY KEY,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


--- 6. Create a Salaries Table
CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary INT
);







