-- 1. List all orders with customer names and countries
SELECT o.order_id, o.order_date, o.sales,
       c.first_name, c.country
FROM orders o
JOIN customers c ON o.customer_id = c.id
ORDER BY o.order_date;

-- 2. Show total sales per customer (with name), sorted by total sales DESC
SELECT c.first_name, c.country, SUM(o.sales) AS total_sales
FROM customers c
JOIN orders o ON o.customer_id = c.id
GROUP BY c.first_name, c.country
ORDER BY total_sales DESC;

-- 3. List all orders placed by customers from 'USA', sorted by sales DESC
SELECT o.order_id, o.order_date, o.sales, c.first_name
FROM orders o
JOIN customers c ON o.customer_id = c.id
WHERE c.country = 'USA'
ORDER BY o.sales DESC;

-- 4. Get customers who placed orders with sales > 250, sorted by score
SELECT DISTINCT c.first_name, c.country, c.score
FROM customers c
JOIN orders o ON o.customer_id = c.id
WHERE o.sales > 250
ORDER BY c.score DESC;

-- 5. Find all orders along with customer name and score, sorted by customer score then order_date
SELECT o.order_id, o.order_date, o.sales,
       c.first_name, c.score
FROM orders o
JOIN customers c ON o.customer_id = c.id
ORDER BY c.score DESC, o.order_date ASC;
