# sql-challenge9

The folder of the SQL challenge has 4 files 
1- Employee_table_schematas
this script sets up several related tables in a database, including department information, employee titles, employee details, salaries, department assignments, and department managers. It also defines constraints and relationships between these tables. The displayed contents at various points in the script may be used for verification during the setup process.

2-EmployeeSQL_db
These SQL queries collectively provide insights into the employee database, including employee information, department assignments, manager details, and name frequencies. Each query serves a specific analytical purpose and can help understand the data within the database.

3-ERD of the tables
The ERD illustrates how these tables are related, with lines connecting related columns based on their foreign key relationships. It provides a clear visual representation of the database structure and helps understand how data is organised and connected within the database.

4-Jupyter_version_data_anlysis
The provided code is a series of data manipulation operations using the Pandas library in Python. It reads data from the same CSV files as above (department information, employee titles, employee details, salaries, department assignments, and department managers) and creates a data frame for each, then performs various similar analyses as query 2 on the data, and displays the results. Each step is documented with comments, making it clear what each part of the code does.



Challenges:

1-I encountered an issue while importing data from the Employee CSV file because the date formats in that file (hiring date and birth date) were formatted as MDY, which didn't match the SQL date style. As a result, I received the following error message: "date/time field value out of range: '07/25/1953'. Perhaps you need a different 'date style' setting."

To resolve this issue, I attempted the following actions:

1-1)Temporarily Set the Datestyle to 'MDY' Before Importing Employee Data:

I used the SQL command SET datestyle TO 'MDY'; to temporarily set the datestyle to 'MDY' for the current session. This matched the date format in the CSV file and allowed the data to be imported correctly. and after successfully importing the employee data, I attempted to revert the datestyle to 'ISO' using the command SET datestyle TO 'ISO, MDY'. However, it appears that this change didn't work as expected.

1-2) After the unsuccessful attempt to revert the SQL date style, I explored an alternative approach to resolve the date format issue. I decided to modify the date formats in the columns (hiring date and birth date) of the CSV file using Excel. Specifically, I converted the date formats from MDY to DMY within the Excel file. This adjustment allowed me to import the data into SQL successfully.

However, upon further query during office hours, I became aware that modifying the supplied CSV file was not permitted. Therefore, this alternative action was considered unsuccessful as it did not align with the data integrity guidelines.

1-3) Finally, I successfully resolved the issue by using the following code:
SET datestyle = 'SQL,MDY'
This SQL command sets the date style for the current session in a PostgreSQL database.



Challenge 2:
The next challenge was defining the Entity-Relationship Diagram (ERD) for a database with foreign, primary, and composite keys. This task had a direct impact on the priority of importing data. To overcome this challenge, I utilised QuickDBD and have included a screenshot for reference. Here's a summary of how I defined the ERD for key relationships:

2-1) Departments Table (departments):
Attributes:
dept_no (Primary Key, VARCHAR(4)): Represents the unique department number.
dept_name (VARCHAR(255)): Represents the department's name.


2-2) Titles Table (titles):

Attributes:
title_id (Primary Key, VARCHAR(255)): Represents the unique title ID for job titles.
title (VARCHAR(255)): Represents the job title.


2-3) Employees Table (employees):

Attributes:

emp_no (Primary Key, INT): Represents the unique employee number.
emp_title_id (VARCHAR(255)): References the "titles" table for the employee's title ID.
birth_date (DATE): Represents the employee's birth date.
first_name (VARCHAR(255)): Represents the employee's first name.
last_name (VARCHAR(255)): Represents the employee's last name.
sex (CHAR(1)): Indicates the employee's gender (e.g., 'M' for male, 'F' for female).
hire_date (DATE): Represents the date of the employee's hire.

Relationships:

The emp_title_id column establishes a foreign key relationship with the title_id column in the "titles" table.


2-4) Salaries Table (salaries):

Attributes:

emp_no (Primary Key, INT): Represents the unique employee number.
salary (INT): Represents the employee's salary.
Relationships:

The emp_no column establishes a foreign key relationship with the emp_no column in the "employees" table.


2-5) Department Employees Table (dept_emp):

Attributes:

emp_no (INT): Represents the employee number.
dept_no (VARCHAR(4)): Represents the department number.

Relationships:

The emp_no column establishes foreign key relationships with both the emp_no column in the "salaries" and "employees" tables.
The dept_no column establishes a foreign key relationship with the dept_no column in the "departments" table.


2-6) Department Managers Table (dept_manager):

Attributes:

dept_no (VARCHAR(4)): Represents the department number.
emp_no (Primary Key, INT): Represents the unique employee number.

Relationships:

The dept_no column establishes a foreign key relationship with the dept_no column in the "departments" table.



I'd like to emphasise that I could create a composite key combining dept_no and emp_no in the Department Managers Table (dept_manager) and Department Employees Table (dept_emp). However, after implementing this, I found that it didn't significantly simplify or improve the simplicity of queries. As a result, I decided not to use this composite key.
