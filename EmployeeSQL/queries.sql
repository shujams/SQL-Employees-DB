-- List the following details of each employee: employee number, last name, 
-- first name, gender, and salary.

SELECT emp.emp_no AS "employee number", 
	emp.last_name AS "last name",
	emp.first_name AS "first name",
	emp.gender,
	sal.salary AS "salary"
FROM employees AS emp
JOIN salaries AS sal
ON (emp.emp_no = sal.emp_no)
ORDER BY emp.emp_no;

-- List employees who were hired in 1986.

SELECT emp.emp_no AS "employee number", 
	emp.last_name AS "last name",
	emp.first_name AS "first name",
	emp.gender,
	emp.hire_date AS "hire date"
FROM employees AS emp
WHERE hire_date between '01/01/1986' and '12/31/1986 23:59:59'
ORDER BY emp.hire_date;

-- List the manager of each department with the following information: 
-- department number, department name, the manager’s employee number, 
-- last name, first name, and start and end employment dates.

SELECT dm.dept_no, dm.emp_no, d.dept_name,
	e.last_name, e.first_name, dm.from_date, 
	dm.to_date
FROM dept_manager AS dm
INNER JOIN departments AS d
ON (dm.dept_no = d.dept_no)
INNER JOIN employees AS e
ON (dm.emp_no = e.emp_no);

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT de.dept_no, d.dept_name, e.emp_no, 
	e.last_name, e.first_name
FROM dept_emp AS de
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
INNER JOIN employees AS e
ON (de.emp_no = e.emp_no)
ORDER BY e.emp_no;

-- List all employees whose first name is “Hercules” and last names begin with “B.”

SELECT first_name, last_name 
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.

SELECT d.dept_name, e.emp_no, 
	e.last_name, e.first_name
FROM dept_emp AS de
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
INNER JOIN employees AS e
ON (de.emp_no = e.emp_no)
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

SELECT d.dept_name, e.emp_no, 
	e.last_name, e.first_name
FROM dept_emp AS de
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
INNER JOIN employees AS e
ON (de.emp_no = e.emp_no)
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY d.dept_name;

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

SELECT last_name, COUNT(*) as count 
FROM employees 
GROUP BY last_name 
ORDER BY count DESC;

-- BONUS

SELECT t.emp_no, t.title, s.salary
FROM titles AS t
INNER JOIN salaries AS s
ON (t.emp_no = s.emp_no)
ORDER BY t.emp_no;

-- EPILOGUE

SELECT d.dept_name, e.emp_no, 
	e.last_name, e.first_name
FROM dept_emp AS de
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
INNER JOIN employees AS e
ON (de.emp_no = e.emp_no)
WHERE e.emp_no = 499942;
