/* 
📘 Retail Analytics SQL Project 
Author: [Your Name]
Description: Exploratory, performance, and business insights using SQL Server.
*/

---------------------------------------------
-- 🔍 Section 1: Exploratory Data Analysis
---------------------------------------------
-- 1️⃣ Unique repair statuses
SELECT DISTINCT repair_status FROM warranty;

-- 2️⃣ Store names
SELECT DISTINCT store_name FROM stores;

-- 3️⃣ Category names
SELECT DISTINCT category_name FROM category;

-- 4️⃣ Product names
SELECT DISTINCT product_name FROM products;

-- 5️⃣ Total number of sales
SELECT COUNT(*) AS total_sales FROM sales;

SELECT SUM(s.quantity * p.price) AS total_sales_value
FROM sales s
JOIN products p ON s.product_id = p.product_id;


---------------------------------------------
-- ⚙️ Section 2: Performance Testing & Indexing
---------------------------------------------
-- 6️⃣ Product lookup
SELECT * FROM sales WHERE product_id = 310;

-- 7️⃣ Index for product ID
--CREATE INDEX sales_product_id ON sales(product_id);

-- 8️⃣ Statistics on product_id = 201
SET STATISTICS IO ON; SET STATISTICS TIME ON;
SELECT * FROM sales WHERE product_id = 201;
SET STATISTICS IO OFF; SET STATISTICS TIME OFF;

-- 9️⃣ Sales by store
SELECT * FROM sales WHERE store_id = 10;

-- 🔟 Sales on specific date
SELECT * FROM sales WHERE sale_date = '2020-04-18';

-- 1️⃣1️⃣ Sales with quantity > 2
SELECT * FROM sales WHERE quantity > 2;
---------------------------------------------
-- 📊 Section 3: Business Insights
---------------------------------------------
-- 1️⃣2️⃣ Number of stores by country
SELECT country, COUNT(store_id) AS total_stores
FROM stores GROUP BY country ORDER BY total_stores DESC;

-- 1️⃣3️⃣ Total units sold by store
SELECT store_id, SUM(quantity) AS total_units
FROM sales GROUP BY store_id ORDER BY total_units DESC;

-- 1️⃣4️⃣ December 2023 sales
SELECT COUNT(*) AS total_sales
FROM sales WHERE FORMAT(sale_date, 'yyyy-MM') = '2023-12';

-- 1️⃣5️⃣ Stores without warranty claims
SELECT COUNT(*) AS stores_without_claims
FROM stores
WHERE store_id NOT IN (
    SELECT DISTINCT s.store_id FROM sales s
    JOIN warranty w ON s.sale_id = w.sale_id
);

-- 1️⃣6️⃣ % of claims marked 'Warranty Void'
SELECT 
    ROUND(CAST(COUNT(*) AS FLOAT) * 100 / NULLIF((SELECT COUNT(*) FROM warranty), 0), 2)
    AS warranty_void_percentage
FROM warranty
WHERE repair_status = 'Warranty Void';

-- 1️⃣7️⃣ Best-selling store in the last year
SELECT TOP 1 store_id, SUM(quantity) AS total_units
FROM sales
WHERE sale_date >= DATEADD(YEAR, -1, GETDATE())
GROUP BY store_id
ORDER BY total_units DESC;

-- 1️⃣8️⃣ Unique products sold (last year)
SELECT COUNT(DISTINCT product_id) AS unique_products_sold
FROM sales
WHERE sale_date >= DATEADD(YEAR, -1, GETDATE());

-- 1️⃣9️⃣ Average price per category
SELECT c.category_name, ROUND(AVG(p.price), 2) AS avg_price
FROM category c
JOIN products p ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY avg_price DESC;

-- 2️⃣0️⃣ Warranty claims in 2024
SELECT COUNT(*) AS claims_in_2024
FROM warranty
WHERE YEAR(claim_date) = 2024;

-- 2️⃣1️⃣ Best selling weekday by store
WITH RankedDays AS (
    SELECT 
        store_id, DATENAME(WEEKDAY, sale_date) AS day_name,
        SUM(quantity) AS total_quantity,
        RANK() OVER (PARTITION BY store_id ORDER BY SUM(quantity) DESC) AS rnk
    FROM sales
    GROUP BY store_id, DATENAME(WEEKDAY, sale_date)
)
SELECT store_id, day_name, total_quantity
FROM RankedDays WHERE rnk = 1;

-- 2️⃣2️⃣ Revenue per country
SELECT st.country, SUM(p.price * s.quantity) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN stores st ON s.store_id = st.store_id
GROUP BY st.country
ORDER BY total_revenue DESC;

-- 2️⃣3️⃣ Top 3 best-selling products
SELECT TOP 3 p.product_name, SUM(s.quantity) AS total_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- 2️⃣4️⃣ Cities with no sales
SELECT store_name, city
FROM stores
WHERE store_id NOT IN (
    SELECT DISTINCT store_id FROM sales
);

-- 2️⃣5️⃣ Revenue by category (last 2 years)
SELECT c.category_name, SUM(p.price * s.quantity) AS total_category_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN category c ON p.category_id = c.category_id
WHERE s.sale_date >= DATEADD(YEAR, -2, GETDATE())
GROUP BY c.category_name
ORDER BY total_category_revenue DESC;

-- 2️⃣6️⃣ Monthly claim trend (this year)
SELECT FORMAT(claim_date, 'yyyy-MM') AS claim_month, COUNT(*) AS claims_count
FROM warranty
WHERE YEAR(claim_date) = YEAR(GETDATE())
GROUP BY FORMAT(claim_date, 'yyyy-MM')
ORDER BY claim_month;

-- 2️⃣7️⃣ Highest avg. sale value by store
SELECT TOP 1 s.store_id, AVG(p.price * s.quantity) AS avg_sale_value
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY s.store_id
ORDER BY avg_sale_value DESC;

-- 2️⃣8️⃣ Top 5 products with most warranty claims
SELECT TOP 5 p.product_name, COUNT(w.claim_id) AS total_claims
FROM warranty w
JOIN sales s ON w.sale_id = s.sale_id
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_claims DESC;

-- 2️⃣9️⃣ Highest sales month (last year)
SELECT TOP 1 FORMAT(sale_date, 'yyyy-MM') AS sale_month, SUM(quantity) AS total_units_sold
FROM sales
WHERE sale_date >= DATEADD(YEAR, -1, GETDATE())
GROUP BY FORMAT(sale_date, 'yyyy-MM')
ORDER BY total_units_sold DESC;


-- 2️⃣3️⃣ Stores with no warranty claims filed
SELECT COUNT(*) AS total_store
FROM stores
WHERE store_id NOT IN (
    SELECT DISTINCT s.store_id
    FROM sales AS s
    RIGHT JOIN warranty AS w
        ON s.sale_id = w.sale_id
);

-- 2️⃣4️⃣ % of claims marked "Rejected"
SELECT 
    ROUND(
        CAST(COUNT(claim_id) AS FLOAT) / NULLIF((SELECT COUNT(*) FROM warranty), 0) * 100, 2
    ) AS rejected_percentage
FROM warranty
WHERE repair_status = 'Rejected';

-- 2️⃣5️⃣ Store with highest total units sold in last year
-- 🏬 Store with Highest Total Units Sold in the Last Year
SELECT TOP 1 
    store_id, 
    SUM(quantity) AS total_units_sold
FROM sales
WHERE sale_date >= DATEADD(YEAR, -1, GETDATE())
GROUP BY store_id
ORDER BY total_units_sold DESC;


-- 2️⃣6️⃣ Unique products sold in the last year
-- 🛍️ Unique Products Sold in the Last Year
SELECT 
    COUNT(DISTINCT product_id) AS unique_products_sold
FROM sales
WHERE sale_date >= DATEADD(YEAR, -1, GETDATE());


-- 2️⃣7️⃣ Average price by product category 💰
-- 📦 Average Product Price by Category
SELECT 
    c.category_id, 
    c.category_name, 
    ROUND(AVG(p.price), 2) AS avg_price
FROM products p
JOIN category c ON p.category_id = c.category_id
GROUP BY c.category_id, c.category_name
ORDER BY avg_price DESC;


-- 2️⃣8️⃣ Warranty claims filed in 2024
SELECT COUNT(*) FROM warranty
WHERE EXTRACT(YEAR FROM claim_date) = 2024;

-- 2️⃣9️⃣ Best-selling weekday per store
-- 🧠 Uses RANK + weekday grouping for per-store insights
-- 📅  Best-Selling Weekday Per Store Based on Quantity Sold
SELECT store_id, day_name, total_quantity
FROM (
    SELECT 
        store_id, 
        DATENAME(WEEKDAY, sale_date) AS day_name, 
        SUM(quantity) AS total_quantity,
        RANK() OVER(PARTITION BY store_id ORDER BY SUM(quantity) DESC) AS rank
    FROM sales
    GROUP BY store_id, DATENAME(WEEKDAY, sale_date)
) AS t
WHERE rank = 1;


-- 3️⃣0️⃣ Least selling product per country/year
-- 🧠 Uses window function RANK() partitioned by year & country
WITH product_rank AS (
    SELECT 
        st.country, 
        EXTRACT(YEAR FROM sale_date) AS sale_year, 
        p.product_name, 
        SUM(quantity) AS total_unit_sold,
        RANK() OVER(
            PARTITION BY country, EXTRACT(YEAR FROM sale_date) 
            ORDER BY SUM(quantity)
        ) AS least_sold_product
    FROM products AS p
    JOIN sales AS s ON p.product_id = s.product_id
    JOIN stores AS st ON st.store_id = s.store_id
    GROUP BY st.country, EXTRACT(YEAR FROM sale_date), p.product_name
)
SELECT * FROM product_rank
WHERE least_sold_product = 1;

-- 3️⃣1️⃣ Claims filed within 180 days of product sale
SELECT COUNT(*) AS claims_within_180_days
FROM warranty AS w
LEFT JOIN sales AS s ON w.sale_id = s.sale_id
WHERE w.claim_date - s.sale_date > 0 
  AND w.claim_date - s.sale_date <= 180;

-- 3️⃣2️⃣ Warranty claims for products launched in last 2 years
-- 🧠 Filters by launch date and aggregates claims
-- 🛡️ Products Launched in Last 2 Years with Warranty Claims
SELECT 
    p.product_name,
    COUNT(w.claim_id) AS total_claims
FROM sales s
LEFT JOIN warranty w ON w.sale_id = s.sale_id
JOIN products p ON p.product_id = s.product_id
WHERE p.launch_date >= DATEADD(YEAR, -2, GETDATE())
GROUP BY p.product_name
HAVING COUNT(w.claim_id) > 0;


-- 3️⃣3️⃣ Months in last 3 years when US sales > 5,000
-- 🇺🇸 Monthly Sales Over 5,000 Units in USA (Last 3 Years)
SELECT 
    FORMAT(s.sale_date, 'MM-yyyy') AS month_year,
    SUM(s.quantity) AS total_sold
FROM sales s
JOIN stores st ON s.store_id = st.store_id
WHERE st.country = 'United States' 
  AND s.sale_date >= DATEADD(YEAR, -3, GETDATE())
GROUP BY FORMAT(s.sale_date, 'MM-yyyy')
HAVING SUM(s.quantity) > 5000
ORDER BY MIN(s.sale_date);  -- Ensures proper chronological ordering


-- 3️⃣4️⃣ Product category with most warranty claims (last 2 years)
-- 🛠️ Top Product Category by Warranty Claims (Last 2 Years)
SELECT TOP 1
    c.category_name,
    COUNT(w.claim_id) AS warranty_claims
FROM category c
JOIN products p ON c.category_id = p.category_id
JOIN sales s ON p.product_id = s.product_id
JOIN warranty w ON s.sale_id = w.sale_id
WHERE w.claim_date >= DATEADD(YEAR, -2, GETDATE())
GROUP BY c.category_name
ORDER BY warranty_claims DESC;

-- 3️⃣5️⃣ % chance of warranty claim per country
-- 🧠 Calculates risk by comparing total sold vs total claimed
SELECT 
    country,
    total_sold,
    total_claim,
    ROUND((total_claim::numeric / NULLIF(total_sold, 0)) * 100, 2) AS percentage_of_risk
FROM (
    SELECT
        st.country,
        SUM(s.quantity) AS total_sold,
        COUNT(w.claim_id) AS total_claim
    FROM stores AS st
    JOIN sales AS s ON s.store_id = st.store_id
    JOIN warranty AS w ON s.sale_id = w.sale_id
    GROUP BY st.country
) AS subquery
ORDER BY percentage_of_risk DESC;

-- 3️⃣6️⃣ YoY growth for each store
-- 🧠 LAG + windowing for comparative trend analysis
-- 📈 Year-over-Year Growth Ratio for Each Store
WITH yearly_sale AS (
    SELECT 
        st.store_id,
        st.store_name,
        YEAR(s.sale_date) AS year_of_sale,
        SUM(s.quantity * p.price) AS total_sale
    FROM stores st
    JOIN sales s ON s.store_id = st.store_id
    JOIN products p ON p.product_id = s.product_id
    GROUP BY st.store_id, st.store_name, YEAR(s.sale_date)
),
growth_ratio AS (
    SELECT 
        store_name,
        year_of_sale,
        total_sale,
        LAG(total_sale) OVER (PARTITION BY store_name ORDER BY year_of_sale) AS prev_sale
    FROM yearly_sale
)
SELECT
    store_name,
    year_of_sale,
    prev_sale,
    total_sale AS curr_sale,
    ROUND(
        CAST((total_sale - prev_sale) AS FLOAT) / NULLIF(CAST(prev_sale AS FLOAT), 0) * 100, 2
    ) AS growth_ratio_YOY
FROM growth_ratio
WHERE prev_sale IS NOT NULL
ORDER BY store_name, year_of_sale;


-- 3️⃣7️⃣ Claim % by price segment & category
-- 🧠 Great query for price sensitivity analysis!
SELECT 
    CASE 
        WHEN p.price < 500 THEN 'Low Cost'
        WHEN p.price BETWEEN 500 AND 1000 THEN 'Moderate Cost'
        ELSE 'High Cost'
    END AS price_segment,
    c.category_name,
    COUNT(w.claim_id) AS total_claims,
    COUNT(s.sale_id) AS total_sales,
    ROUND(
        CAST(COUNT(w.claim_id) AS FLOAT) / NULLIF(COUNT(s.sale_id), 0) * 100, 2
    ) AS claim_rate_percentage,
    ROUND(AVG(CAST(p.price AS FLOAT)), 2) AS avg_price_in_segment
FROM products AS p
JOIN sales AS s ON p.product_id = s.product_id
LEFT JOIN warranty AS w ON w.sale_id = s.sale_id
JOIN category AS c ON p.category_id = c.category_id
WHERE s.sale_date >= DATEADD(YEAR, -5, GETDATE())
GROUP BY 
    CASE 
        WHEN p.price < 500 THEN 'Low Cost'
        WHEN p.price BETWEEN 500 AND 1000 THEN 'Moderate Cost'
        ELSE 'High Cost'
    END,
    c.category_name
ORDER BY claim_rate_percentage DESC;

-- 3️⃣8️⃣ Store with highest % of completed claims
-- 🧠 Useful reliability metric for customer service
WITH claim_counts AS (
    SELECT
        s.store_id,
        COUNT(w.claim_id) AS total_repaired,
        SUM(CASE WHEN w.repair_status = 'Completed' THEN 1 ELSE 0 END) AS completed
    FROM sales AS s
    RIGHT JOIN warranty AS w ON s.sale_id = w.sale_id
    GROUP BY s.store_id
)
SELECT 
    store_id,
    total_repaired,
    completed,
    ROUND(completed::numeric / NULLIF(total_repaired, 0) * 100, 2) AS percentage_of_completed
FROM claim_counts
ORDER BY percentage_of_completed DESC;

-- 3️⃣9️⃣ Monthly running total of sales per store (last 4 years)
-- 🧠 Tracks monthly revenue and cumulative trend over time by store

WITH monthly_sales AS (
    SELECT
        s.store_id,
        YEAR(s.sale_date) AS sales_year,
        MONTH(s.sale_date) AS sales_month,
        SUM(p.price * s.quantity) AS total_sales
    FROM sales AS s
    JOIN products AS p ON s.product_id = p.product_id
    WHERE s.sale_date >= DATEADD(YEAR, -4, GETDATE())
    GROUP BY s.store_id, YEAR(s.sale_date), MONTH(s.sale_date)
)
SELECT
    store_id,
    sales_year,
    sales_month,
    total_sales,
    SUM(total_sales) OVER (
        PARTITION BY store_id 
        ORDER BY sales_year, sales_month
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM monthly_sales
ORDER BY store_id, sales_year, sales_month;
-- 4️⃣0️⃣ Warranty claims by product category (last 3 years)
-- 🧠 Analyzes warranty claims trends by product category

-- ✅ Category-wise Warranty Claim Completion Rate (Last 3 Years)
WITH category_claims AS (
    SELECT
        c.category_name,
        COUNT(w.claim_id) AS total_claims,
        SUM(CASE WHEN w.repair_status = 'Completed' THEN 1 ELSE 0 END) AS completed_claims
    FROM warranty w
    JOIN sales s ON w.sale_id = s.sale_id
    JOIN products p ON s.product_id = p.product_id
    JOIN category c ON p.category_id = c.category_id
    WHERE s.sale_date >= DATEADD(YEAR, -3, GETDATE())
    GROUP BY c.category_name
)
SELECT
    category_name,
    total_claims,
    completed_claims,
    ROUND(CAST(completed_claims AS FLOAT) / NULLIF(total_claims, 0) * 100, 2) AS completion_rate
FROM category_claims
ORDER BY completion_rate DESC;

-- 4️⃣1️⃣ Top 5 stores by average sales value (last year)
SELECT 
    st.country,
    SUM(s.quantity * p.price) AS total_revenue
FROM sales AS s
JOIN stores AS st ON s.store_id = st.store_id
JOIN products AS p ON s.product_id = p.product_id
GROUP BY st.country
ORDER BY total_revenue DESC;