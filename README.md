# sql-challenge
SQL Homework # 9- Employee Database


## Background
Conduct research project on employees of the corporation from the 1980s and 1990s using six CSV files : employees, titles, salaries, dept_managers, dept_emp, and departments. Design tables that will hold data from the CSVs in SQL Database and answer questions about the data. 


## Data Modeling
Inspect CSV data and create ERD using quickdatabasediagrams - http://www.quickdatabasediagrams.com
![EmployeeERD_final](https://user-images.githubusercontent.com/94502554/155442173-be488131-17e1-4ddf-979d-4c8e36acc38f.png)

## Data Engineering
Used export of ProstgreSQL from quickdatabasediagrams to create table schemas and import CSVs:

CREATE TABLE "Employees" (
    "emp_no" INT   NOT NULL,
    "title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire-date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "Dept_Emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL
);

CREATE TABLE "Dept_Manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL
);

## Data Analysis
Answered some questions about the data:

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

SELECT d.dept_no, d.dept_name, dm.emp_no, emp.last_name, emp.first_name

FROM "Departments" d
JOIN "Dept_Manager" dm
ON d.dept_no = dm.dept_no
JOIN "Employees" emp
ON dm.emp_no = emp.emp_no

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

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

SELECT emp.emp_no, emp.last_name, emp.first_name, d.dept_name
FROM "Employees" emp
JOIN "Dept_Emp" de
ON emp.emp_no = de.emp_no
JOIN "Departments" d
ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales'

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

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

## Deeper Data Analysis on salary

Used Pandas to import SQL database to read tables, create dataframes, and graph salary by title
![AverageSalaryByTitleBarChart](https://user-images.githubusercontent.com/94502554/155443459-813658d3-d1a2-4f7c-ba52-fd4ab26c7278.png)

Lastly, created dataframe to plot histrogram to visualize average salary range for employees
![SalaryRangesforEmployees](https://user-images.githubusercontent.com/94502554/155443643-005aa6b6-f1bd-4f31-ae3a-f3f31fc687df.png)



