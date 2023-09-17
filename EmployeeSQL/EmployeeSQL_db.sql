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
INNER JOIN titles AS ti ON e.emp_title_id = ti.title_id
ORDER BY d.dept_no DESC;


-- 4-List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT 
	dm.dept_no AS department_number,
    e.emp_no AS employee_number,
    e.last_name AS last_name,
	e.first_name AS first_name,
	d.dept_name AS department_name
FROM
    dept_manager AS dm
INNER JOIN employees AS e ON e.emp_no = dm.emp_no
INNER JOIN departments AS d ON dm.dept_no = d.dept_no;


--5- List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT 
	e.first_name AS first_name,
    e.last_name AS last_name,
	e.sex AS employee_sex
	
FROM
    employees AS e
WHERE first_name='Hercules' AND last_name LIKE 'B%';

-- 6-List each employee in the Sales department, including their employee number, last name, and first name.

SELECT 
	e.emp_no AS employee_number,
	e.last_name AS last_name,
	e.first_name AS first_name,
	d.dept_name AS department_name
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no
WHERE  d.dept_name = 'Sales';


--7-List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
	e.emp_no AS employee_number,
	e.last_name AS last_name,
	e.first_name AS first_name,
	d.dept_name AS department_name
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no
WHERE  d.dept_name = 'Sales' OR d.dept_name = 'Development';

--8-List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
    last_name,
    COUNT(*) AS frequency_count
FROM employees
GROUP BY last_name 
ORDER BY frequency_count DESC, last_name;




