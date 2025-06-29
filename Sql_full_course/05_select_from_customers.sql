SELECT * 
FROM customers

SELECT * FROM orders

SELECT 
    first_name,
    country,
    score
FROM customers

UPDATE customers
SET country = 'Canada'
WHERE id = 18;

SELECT COUNT(DISTINCT country) AS country_count
FROM customers