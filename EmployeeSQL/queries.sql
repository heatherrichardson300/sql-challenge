--List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name, 
	e.gender, 
	s.salary
FROM 
	employees e
JOIN 
	salaries s 
ON 
	(e.emp_no = s.emp_no)

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
	first_name, 
	last_name, 
	hire_date
FROM 
	employees
WHERE 
	hire_date 
BETWEEN 
	'1986-01-01' AND '1986-12-31'
ORDER BY 
	hire_date ASC;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
	d.dept_no, 
	d.dept_name, 
	dm.emp_no, 
	e.last_name, 
	e.first_name
FROM 
	departments d
JOIN 
	dept_manager dm ON d.dept_no = dm.dept_no
JOIN 
	employees e ON dm.emp_no = e.emp_no
ORDER BY 
	d.dept_no;
	
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
	d.dept_no,
	de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM 
	departments d
JOIN 
	dept_emp de ON d.dept_no = de.dept_no
JOIN
	employees e ON de.emp_no = e.emp_no
ORDER BY
	d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT 
	first_name,
	last_name,
	gender
FROM
	employees
WHERE
	first_name = 'Hercules' AND
	last_name LIKE 'B%';
--List each employee in the Sales department, including their employee number, last name, and first name.

--Check department numbers and make note of Sales Department number
SELECT *
FROM departments

-- Sales department = d007

SELECT 
	de.emp_no,
	e.last_name,
	e.first_name
FROM 
	dept_emp de
JOIN
	employees e ON de.emp_no = e.emp_no
WHERE 
	dept_no = 'd007';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

--Check department numbers and make note of Sales and Development department numbers
SELECT *
FROM departments

-- Sales = d007
-- Development = d005

SELECT 
	de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM 
	departments d
JOIN
	dept_emp de ON d.dept_no = de.dept_no
JOIN
	employees e ON de.emp_no = e.emp_no
WHERE 
	d.dept_no IN ('d007', 'd005')
ORDER BY
	d.dept_name ASC;
	
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
	
SELECT 
	last_name,
	COUNT(*) AS name_frequency
FROM 
	employees
GROUP BY 
	last_name
ORDER BY 
   name_frequency DESC;