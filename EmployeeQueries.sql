SELECT * FROM "Employees"
SELECT * FROM "Salaries";

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM "Employees" as emp
LEFT JOIN "Salaries" as sal
ON emp.emp_no = sal.emp_no
ORDER BY emp.emp_no

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, "hire-date"
FROM "Employees"
WHERE "hire-date" BETWEEN '1986-01-01'AND '1987-01-01'
ORDER BY "hire-date"

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT * FROM "Departments";
SELECT * FROM "Dept_Manager";

SELECT d.dept_no, d.dept_name, dm.emp_no, emp.last_name, emp.first_name
FROM "Departments" d
JOIN "Dept_Manager" dm
ON d.dept_no = dm.dept_no
JOIN "Employees" emp
ON dm.emp_no = emp.emp_no

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT * FROM "Dept_Emp";

SELECT emp.emp_no, emp.last_name, emp.first_name, d.dept_name
FROM "Employees" emp
JOIN "Dept_Emp" de
ON emp.emp_no=de.emp_no
JOIN "Departments" d
ON de.dept_no=d.dept_no
ORDER BY emp_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'


--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT * FROM "Departments";

SELECT emp.emp_no, emp.last_name, emp.first_name, d.dept_name
FROM "Employees" emp
JOIN "Dept_Emp" de
ON emp.emp_no = de.emp_no
JOIN "Departments" d
ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales'

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT * FROM "Departments";

SELECT emp.emp_no, emp.last_name, emp.first_name, d.dept_name
FROM "Employees" emp
JOIN "Dept_Emp" de
ON emp.emp_no = de.emp_no
JOIN "Departments" d
ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development'

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT (last_name) AS frequency 
FROM "Employees"
GROUP BY last_name
ORDER BY frequency DESC




