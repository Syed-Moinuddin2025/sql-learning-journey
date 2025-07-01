# 🛍️ Retail Sales SQL Analysis Project

This project is designed to help practice and showcase essential SQL skills using a simulated retail sales dataset. It contains a single table with various columns capturing customer transactions, and 15 real-world business questions answered through SQL queries.

---

## 📁 Folder Name

### 8_retail_sales_analysis_project

---

## 📦 Table: `retail_sales`

| Column Name     | Data Type      | Description                        |
|-----------------|----------------|------------------------------------|
| transaction_id  | INT            | Unique ID for each sale            |
| sale_date       | DATE           | Date of the transaction            |
| sale_time       | TIME           | Time of the transaction            |
| customer_id     | INT            | Customer’s unique ID               |
| gender          | VARCHAR(10)    | Gender of the customer             |
| age             | INT            | Age of the customer                |
| category        | VARCHAR(30)    | Product category                   |
| quantity        | INT            | Number of units sold               |
| price_per_unit  | DECIMAL(10,2)  | Price per unit of the item         |
| cogs            | DECIMAL(10,2)  | Cost of goods sold                 |
| total_sale      | DECIMAL(10,2)  | Total sales value                  |

---

## 🧠 SQL Learning Objectives

- Data filtering using `WHERE`, `HAVING`, and `BETWEEN`
- Aggregation functions: `SUM()`, `AVG()`, `COUNT()`
- Grouping and sorting using `GROUP BY`, `ORDER BY`
- Date and time functions: `YEAR()`, `MONTH()`, `DATEPART()`
- Window functions: `RANK()`, `ROW_NUMBER()`
- Shift classification using `CASE WHEN`

---

## 📋 SQL Questions (Q1–Q15)

### 🔹 Q1  

Retrieve all columns for sales made on `'2022-11-05'`.

### 🔹 Q2  

Retrieve transactions where category is `'Clothing'` and quantity > 10 in November 2022.

### 🔹 Q3  

Calculate total sales (`total_sale`) for each category.

### 🔹 Q4  

Find average age of customers who purchased items from the `'Beauty'` category.

### 🔹 Q5  

Find all transactions where `total_sale` is greater than 1000.

### 🔹 Q6  

Find total number of transactions by each gender in each category.

### 🔹 Q7  

Calculate average monthly sales and find best-selling month per year.

### 🔹 Q8  

Find top 5 customers based on highest total sales.

### 🔹 Q9  

Find number of unique customers per category.

### 🔹 Q10  

Classify orders by shift (`Morning`, `Afternoon`, `Evening`) and count orders in each shift.

### 🔹 Q11  

Find total COGS (cost of goods sold) per category.

### 🔹 Q12  

Get the first and last transaction date in the dataset.

### 🔹 Q13  

List customers who made more than one purchase.

### 🔹 Q14  

Find average quantity sold per transaction by category.

### 🔹 Q15  

Get sales summary (total sales, average sale, transaction count) by gender.

---

## 🛠️ How to Use

1. Run the `create_table.sql` script to create the table.
2. Insert sample data using `insert_sample_data.sql`.
3. Run queries from `retail_queries.sql` or copy from README.
4. Use Azure Data Studio, SQL Server Management Studio (SSMS), or VS Code with SQL extension.

---

## 📂 Suggested File Structure

8_retail_sales_analysis_project/
│
├── create_table_ insert_data.sql
├├── retail_queries.sql
├── README.md

---

## 📈 Skills You Will Strengthen

- SQL query writing
- Business problem solving
- Time-based and customer-based aggregations
- Creating shift-based reports
- Grouped and ranked reporting

---

## 👨‍💻 Author

**Syed Moinuddin**  
📺 YouTube: [@Learn_More-and-Earn_More](https://youtube.com/@learn_more-and-earn_more-syed)

---

🎯 **Practice. Analyze. Grow your SQL confidence!**

- Time-based and customer-based aggregations
- Creating shift-based reports
- Grouped and ranked reporting
