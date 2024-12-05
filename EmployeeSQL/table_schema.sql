-- Create Departments table
CREATE TABLE departments (
    dept_no VARCHAR(5) PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE
);

-- Create Titles table
CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR(50)
);

-- Create Employees table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(5),
    birth_date DATE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(1),
    hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Create Salaries table
CREATE TABLE salaries (
	emp_no INT,
    salary INT,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create Department Employees table
CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR(5),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create Department Managers table
CREATE TABLE dept_manager (
    dept_no VARCHAR(5),
	emp_no INT,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

