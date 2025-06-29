-- 01. Count customers from each country
SELECT country, COUNT(*) AS total_customers
FROM customers
GROUP BY country;

-- 02. Average score of customers by country
SELECT country, AVG(score) AS average_score
FROM customers
GROUP BY country;

-- 03. Total sales done by each customer
SELECT customer_id, SUM(sales) AS total_sales
FROM orders
GROUP BY customer_id;

-- 04. Number of orders placed by each customer
SELECT customer_id, COUNT(order_id) AS number_of_orders
FROM orders
GROUP BY customer_id;

-- 05. Minimum and maximum sales per customer
SELECT customer_id, MIN(sales) AS min_sale, MAX(sales) AS max_sale
FROM orders
GROUP BY customer_id;

-- 06. Total sales by year
SELECT YEAR(order_date) AS order_year, SUM(sales) AS total_sales
FROM orders
GROUP BY YEAR(order_date);

-- 07. Number of customers per score group (grouping by rounded hundreds)

SELECT (score / 100) * 100 AS score_range, COUNT(*) AS customer_count
FROM customers
GROUP BY (score / 100) * 100;

-- 08. Total orders and average sales by year and customer
SELECT YEAR(order_date) AS order_year, customer_id, COUNT(*) AS total_orders, AVG(sales) AS avg_sales
FROM orders
GROUP BY YEAR(order_date), customer_id;

-- 09. Count of countries with each customer name (to find duplicate names across countries)
SELECT first_name, COUNT(DISTINCT country) AS country_count
FROM customers
GROUP BY first_name;

-- 10. Find total score by country where total score is above 1000
SELECT country, SUM(score) AS total_score
FROM customers
GROUP BY country
HAVING SUM(score) > 1000;

-- 11. Count how many orders each customer made in 2022
SELECT customer_id, COUNT(*) AS orders_2022
FROM orders
WHERE YEAR(order_date) = 2022
GROUP BY customer_id;

-- 12. Total sales grouped by customer and order year
SELECT customer_id, YEAR(order_date) AS order_year, SUM(sales) AS yearly_sales
FROM orders
GROUP BY customer_id, YEAR(order_date);

Select country,
	sum(score)AS total_score
	From customers
	group by country