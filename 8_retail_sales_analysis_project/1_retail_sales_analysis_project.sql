

SELECT TOP 5 * FROM retail_sales

-- Data Preparation   
SELECT 
    COUNT(*) 
FROM retail_sales

-- Data Cleaning
SELECT * FROM retail_sales
WHERE transactions_id IS NULL

SELECT * FROM retail_sales
WHERE sale_date IS NULL


SELECT * FROM retail_sales
WHERE sale_time IS NULL

SELECT * FROM retail_sales
WHERE 
    transactions_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
    
-- 
DELETE FROM retail_sales
WHERE 
    transactions_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
    
-- Data Exploration

-- How many sales we have?
SELECT COUNT(*) as total_sale FROM retail_sales

-- How many uniuque customers we have ?

SELECT COUNT(DISTINCT customer_id) as total_sale FROM retail_sales



SELECT DISTINCT category FROM retail_sales


-- Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings

-- 🔹 Q.1.Write a SQL query to retrieve all columns for sales made on '2022-11-05'.

-- 🔹 Q.2. Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022.

-- 🔹 Q.3-Write a SQL query to calculate the total sales (total_sale) for each category.

-- 🔹 Q.4-Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

-- 🔹 Q.5-Write a SQL query to find all transactions where the total_sale is greater than 1000.

-- 🔹 Q.6-Write a SQL query to find the total number of transactions (transactions_id) made by each gender in each category.

-- 🔹 Q.7-Write a SQL query to calculate the average sale for each month and find the best-selling month in each year.

-- 🔹 Q.8-Write a SQL query to find the top 5 customers based on the highest total sales.

-- 🔹 Q.9-Write a SQL query to find the number of unique customers who purchased items from each category.

-- 🔹 Q.10-Write a SQL query to classify each shift (Morning, Afternoon, Evening) based on sale_time and count the number of orders in each shift.

-- 🔹 Q.11-Write a SQL query to find the total cost of goods sold (COGS) per category.

-- 🔹 Q.12-Write a SQL query to find the first and last transaction date from the dataset.

-- 🔹 Q.13-Write a SQL query to list all customers who made more than 1 purchase.

-- 🔹 Q.14-Write a SQL query to find the average quantity sold per transaction for each category.

-- 🔹 Q.15-Write a SQL query to get the sales summary (total sales, average sale, and transaction count) by gender.





 -- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';


-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

SELECT 
  *
FROM retail_sales
WHERE 
    category = 'Clothing'
    AND 
    FORMAT(sale_date, 'yyyy-MM') = '2022-11'
    AND
    quantity >= 4


-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT 
    category,
    SUM(total_sale) as net_sale,
    COUNT(*) as total_orders
FROM retail_sales
GROUP BY category

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT
    ROUND(AVG(age), 2) as avg_age
FROM retail_sales
WHERE category = 'Beauty'


-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT * FROM retail_sales
WHERE total_sale > 1000


-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT 
    category,
    gender,
    COUNT(*) as total_trans
FROM retail_sales
GROUP 
    BY 
    category,
    gender
ORDER BY 1


-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

SELECT 
    year,
    month,
    avg_sale
FROM 
(
    SELECT 
        YEAR(sale_date) AS year,
        MONTH(sale_date) AS month,
        AVG(total_sale) AS avg_sale,
        RANK() OVER (
            PARTITION BY YEAR(sale_date)
            ORDER BY AVG(total_sale) DESC
        ) AS rank
    FROM retail_sales
    GROUP BY YEAR(sale_date), MONTH(sale_date)
) AS t1
WHERE rank = 1;

    
-- ORDER BY 1, 3 DESC

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

SELECT TOP 5
    customer_id,
    SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.


SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM retail_sales
GROUP BY category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

WITH hourly_sale AS (
    SELECT *,
        CASE
            WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
            WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
    FROM retail_sales
)
SELECT 
    shift,
    COUNT(*) AS total_orders    
FROM hourly_sale
GROUP BY shift;

--Q.11: Find the total cost of goods sold (COGS) per category

SELECT 
    category,
    SUM(cogs) AS total_cogs
FROM retail_sales
GROUP BY category;

--Q.12: Find the first and last transaction date in the data

SELECT 
    MIN(sale_date) AS first_transaction_date,
    MAX(sale_date) AS last_transaction_date
FROM retail_sales;

--Q.13: List all customers who made more than 1 purchase

SELECT 
    customer_id
FROM retail_sales
GROUP BY customer_id
HAVING COUNT(*) > 1;

--Q.14: Find average quantity sold per transaction for each category

SELECT 
    category,
    AVG(quantity) AS avg_quantity_per_transaction
FROM retail_sales
GROUP BY category;

--Q.15: Get sales summary by gender (total_sales, avg_sale, transaction count)
SELECT 
    gender,
    SUM(total_sale) AS total_sales,
    AVG(total_sale) AS avg_sale,
    COUNT(*) AS transaction_count
FROM retail_sales
GROUP BY gender ;
-- End of project


