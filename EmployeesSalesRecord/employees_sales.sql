SELECT first_name
FROM employees;

SELECT first_name,
     last_name
FROM employees;

SELECT
  first_name,
  last_name,
  salary
FROM employees
WHERE salary > 3800;


SELECT
  first_name,
  last_name
FROM employees
WHERE first_name = 'Luca';

SELECT
  first_name,
  last_name
FROM employees
ORDER BY last_name;

SELECT
  first_name,
  last_name
FROM employees
ORDER BY last_name DESC;

SELECT
  first_name,
  last_name,
  salary
FROM employees
ORDER BY salary DESC, last_name ASC;

SELECT
  first_name,
  last_name,
  salary
FROM employees
WHERE salary > 5000 OR salary < 3000;

ALTER TABLE employees
ALTER COLUMN salary DECIMAL(10, 2);

SELECT
  employee_id,
  q1_2022 + q2_2022 AS h1_2022
FROM quarterly_sales;

SELECT
  department,
  SUM(salary) AS total_salaries
FROM employees
GROUP BY department;

SELECT
  department,
  COUNT(*) AS employees_by_department
FROM employees
GROUP BY department;

SELECT
  department,                              -- Grouping column
  ROUND(AVG(salary), 2) AS average_salary  -- Aggregate function with rounding
FROM employees
GROUP BY department;

SELECT
  department,
  CAST(ROUND(AVG(salary), 2) AS DECIMAL(10,2)) AS average_salary
FROM employees
GROUP BY department;

SELECT
  department,
  MIN(salary) AS minimum_salary
FROM employees
GROUP BY department;

SELECT
  department,
  MAX(salary) AS maximum_salary
FROM employees
GROUP BY department;

SELECT
  department,
  MIN(salary) AS minimum_salary,
  MAX(salary) AS maximum_salary
FROM employees
GROUP BY department;

SELECT
  e.id,
  e.first_name,
  e.last_name,
  qs.q1_2022 + qs.q2_2022 + qs.q3_2022 + qs.q4_2022 AS total_sales_2022
FROM employees e
JOIN quarterly_sales qs
  ON e.id = qs.employee_id;

SELECT
  e.id,
  e.first_name,
  e.last_name,
  qs.q1_2022 + qs.q2_2022 + qs.q3_2022 + qs.q4_2022 AS total_sales_2022
  FROM employees e
JOIN quarterly_sales qs
  ON e.id = qs.employee_id;

  EXEC sp_rename 'quarterly_sales', 'sales';
GO

SELECT * FROM sales;

SELECT TOP 5 * FROM sales;