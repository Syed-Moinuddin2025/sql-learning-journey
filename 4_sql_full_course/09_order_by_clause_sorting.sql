-- ============================================================================
     -- ORDER BY with CUSTOMERS table -- ORDER BY with ORDERS table
-- ============================================================================


-- 01. Retrieve all customers and sort the results by the highest score first.
SELECT * 
FROM customers
ORDER BY score DESC

-- 02. Retrieve all customers and sort the results by the lowest score first --

SELECT * 
FROM customers
ORDER BY score ASC

-- 03 Retrieve all customers and sort the results by the country and then by the highest score. --

SELECT * 
FROM customers 
ORDER BY country ASC, score DESC

-- 04  Retrieve all customers and sort the results by the first_name and then by the highest score. --

SELECT * 
FROM customers
ORDER by first_name DESC,  score DESC

-- 1. Sort customers by score (ascending)
SELECT * FROM customers
ORDER BY score ASC;

-- 2. Sort customers by score (descending)
SELECT * FROM customers
ORDER BY score DESC;

-- 3. Sort customers alphabetically by first name
SELECT * FROM customers
ORDER BY first_name ASC;

-- 4. Sort customers by country, then by score descending
SELECT * FROM customers
ORDER BY country, score DESC;

-- 5. Sort customers by length of first name
SELECT * FROM customers
ORDER BY LEN(first_name);

-- 6. Sort customers by country in reverse alphabetical order
SELECT * FROM customers
ORDER BY country DESC;

-- 7. Sort orders by sales amount (ascending)
SELECT * FROM orders
ORDER BY sales ASC;

-- 8. Sort orders by sales amount (descending)
SELECT * FROM orders
ORDER BY sales DESC;

-- 9. Sort orders by order_date (oldest to newest)
SELECT * FROM orders
ORDER BY order_date ASC;

-- 10. Sort orders by order_date (newest to oldest)
SELECT * FROM orders
ORDER BY order_date DESC;

-- 11. Sort orders by customer_id, then sales descending
SELECT * FROM orders
ORDER BY customer_id, sales DESC;

-- 12. Filter orders with sales > 200, sorted by sales descending
SELECT * FROM orders
WHERE sales > 200
ORDER BY sales DESC;

-- 13. Sort only 2022 orders by order_date
SELECT * FROM orders
WHERE YEAR(order_date) = 2022
ORDER BY order_date ASC;
