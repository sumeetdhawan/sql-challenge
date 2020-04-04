DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- create departments table
CREATE TABLE departments (
	dept_no varchar not null,
	dept_name varchar not null,
	primary key (dept_no)	
);

--import csv file and check data
SELECT * FROM departments;

-- create employees table
CREATE TABLE employees (
	emp_no integer not null,
	birth_date date not null,
	first_name varchar not null,
	last_name varchar not null,
	gender varchar(1) not null,
	hire_date date not null,
	primary key (emp_no)	
);

--import csv file and check data
SELECT * FROM employees;

-- create dept_emp table
CREATE TABLE dept_emp (
	emp_no integer not null,
	dept_no varchar not null, 
	from_date date not null,
	to_date date not null,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

--import csv file and check data
SELECT * FROM dept_emp;


-- create dept_manager table

CREATE TABLE dept_manager (
	dept_no varchar not null,
	emp_no integer not null,
	from_date date not null,
	to_date date not null,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

--import csv file and check data
SELECT * FROM dept_manager;

-- create titles table
CREATE TABLE titles (
	emp_no integer not null,
	title varchar not null,
	from_date date not null,
	to_date date not null,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--import csv file and check data
SELECT * FROM titles;

-- create salaries table
CREATE TABLE salaries (
	emp_no integer not null,
	salary integer not null,
	from_date date not null,
	to_date date not null,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--import csv file and check data
SELECT * FROM salaries;


-- 1) employees (employee number, last name, first name, gender), and salaries (salary)
SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary
FROM employees AS e
JOIN salaries AS s
  ON e.emp_no = s.emp_no
  order by e.emp_no;
  
-- 2) employees who were hired in 1986
SELECT * FROM employees  
 WHERE hire_date >= '1986-01-01' 
       and hire_date < '1987-01-01';
	   
-- 3) List the manager of each department with the following information: 
-- departments - department number, department name, 
-- dept_manager - the manager's employee number, 
-- employees - last name, first name, and start and end employment dates.
SELECT dept.dept_no, dept.dept_name, dm.emp_no, emp.last_name, emp.first_name, dm.from_date, dm.to_date 
FROM departments as dept
JOIN dept_manager AS dm
  ON dept.dept_no = dm.dept_no
JOIN employees AS emp
  ON dm.emp_no = emp.emp_no;
  
-- 4)List the department of each employee with the following information: 
-- employee number, last name, first name, and department name. 
SELECT de.emp_no, emp.last_name, emp.first_name, dept.dept_name 
FROM dept_emp as de
JOIN employees AS emp
  ON de.emp_no = emp.emp_no
JOIN departments as dept
  ON de.dept_no = dept.dept_no;
  
-- 5) List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name like 'B%';

-- 6) List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.
SELECT de.emp_no, emp.last_name, emp.first_name, dept.dept_name 
FROM dept_emp as de
JOIN employees AS emp
  ON de.emp_no = emp.emp_no
JOIN departments as dept
  ON de.dept_no = dept.dept_no
WHERE dept.dept_name = 'Sales';

-- 7) List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT de.emp_no, emp.last_name, emp.first_name, dept.dept_name 
FROM dept_emp as de
JOIN employees AS emp
  ON de.emp_no = emp.emp_no
JOIN departments as dept
  ON de.dept_no = dept.dept_no
WHERE dept.dept_name = 'Sales'
OR dept.dept_name = 'Development';

-- 8) In descending order, 
-- list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

SELECT last_name, count(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;


















