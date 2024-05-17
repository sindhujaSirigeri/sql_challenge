DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;


DROP TABLE IF EXISTS departments CASCADE;
-- Create departments table
CREATE TABLE departments (
    dept_no VARCHAR(30) PRIMARY KEY,
    dept_name VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS titles CASCADE;
-- Create titles table
CREATE TABLE titles (
    title_id VARCHAR(30) PRIMARY KEY,
    title VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS employees CASCADE;
-- Create employees table
CREATE TABLE employees (
     emp_no INT PRIMARY KEY,
     emp_title_id VARCHAR(30) NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR(30) NOT NULL,
     last_name VARCHAR(30) NOT NULL,
     gender VARCHAR(30) NOT NULL,
     hire_date DATE NOT NULL,
     FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);


DROP TABLE IF EXISTS dept_emp CASCADE;
-- Create department employee junction table
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
    dept_no VARCHAR(30) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


DROP TABLE IF EXISTS dept_manager CASCADE;
-- Create department manager junction table
CREATE TABLE dept_manager (
    dept_no VARCHAR(30) NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

DROP TABLE IF EXISTS salaries CASCADE;
-- Create salaries table
CREATE TABLE salaries (
    emp_no INT NOT NULL PRIMARY KEY,
    salary VARCHAR(30) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


-- SELECT * FROM departments;
-- SELECT * FROM dept_emp;
-- SELECT * FROM dept_manager;
-- SELECT * FROM employees;
-- SELECT * FROM titles;
-- SELECT * FROM salaries;

-- import departments data to tables
copy departments from 'C:\sql_challenge\data\departments.csv' DELIMITER ',' CSV HEADER;

copy dept_emp from 'C:\sql_challenge\data\dept_emp.csv' DELIMITER ',' CSV HEADER;

copy dept_manager from 'C:\sql_challenge\data\dept_manager.csv' DELIMITER ',' CSV HEADER;

copy employees from 'C:\sql_challenge\data\employees.csv' DELIMITER ',' CSV HEADER;

copy salaries from 'C:\sql_challenge\data\salaries.csv' DELIMITER ',' CSV HEADER;

copy titles from 'C:\sql_challenge\data\titles.csv' DELIMITER ',' CSV HEADER;
