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

