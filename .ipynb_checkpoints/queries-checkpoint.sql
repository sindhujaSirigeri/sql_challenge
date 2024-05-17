-- List the employee number, last name, first name, sex, 
-- and salary of each employee.
SELECT e.emp_no, 
	e.last_name, 
	e.first_name, 
	e.gender, 
	s.salary 
FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no
ORDER BY salary DESC;


-- List the first name, last name, and hire date for 
-- the employees who were hired in 1986.
SELECT emp_no,
	first_name,
	last_name,
	hire_date
FROM employees
WHERE hire_date BETWEEN '1986/1/1' AND '1986/12/31'
ORDER BY emp_no;


--List the manager of each department along with their department number, 
-- department name, employee number, last name, and first name.
SELECT d.dept_no,
	d.dept_name,
	e.emp_no, 
	e.last_name,
	e.first_name
FROM employees AS e
INNER JOIN dept_emp AS de 
	ON e.emp_no = de.emp_no
INNER JOIN departments AS d 
	ON d.dept_no = de.dept_no;
	
	
-- List the department number for each employee along with that employee’s 
-- employee number, last name, first name, and department name.
SELECT e.emp_no, 
	e.last_name, 
	e.first_name,
	d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de 
	ON e.emp_no = de.emp_no
INNER JOIN departments AS d 
	ON d.dept_no = de.dept_no;


--List first name, last name, and sex of each employee whose first name 
-- is Hercules and whose last name begins with the letter B
SELECT first_name,
	last_name, 
	gender
FROM employees
WHERE first_name = 'Hercules' 
		AND last_name LIKE 'B%';


-- List each employee in the Sales department, including their employee
-- number, last name, and first name.
SELECT e.emp_no, 
	e.last_name, 
	e.first_name,
	d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de 
	ON e.emp_no = de.emp_no
INNER JOIN departments AS d 
	ON d.dept_no = de.dept_no
WHERE d.dept_name IN ('Sales') 
ORDER BY emp_no;


-- List each employee in the Sales and Development departments, including their
-- employee number, last name, first name, and department name
SELECT e.emp_no, 
	e.last_name, 
	e.first_name, 
	d.dept_name 
FROM employees AS e
INNER JOIN dept_emp AS de
ON de.emp_no = e.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE dept_name IN ('Sales' , 'Development')
ORDER BY emp_no;


-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name)
SELECT last_name, 
COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;