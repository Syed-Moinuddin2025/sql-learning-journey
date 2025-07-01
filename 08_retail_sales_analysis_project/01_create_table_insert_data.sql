-- SQL Retail Sales Analysis - P1
CREATE DATABASE sql_project_p1;


-- Create TABLE
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales
            (
                transactions_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );




--insert_sample_data.sql via import wizard .csv file.
-- Importing data into retail_sales table
-- in Azure data studio goto database -> import wizard

-- or use BULK INSERT command   

-- Import data from retail_sales.csv file into retail_sales table

BULK INSERT retail_sales
FROM 'D:\sql_python_mastery\sql_journey\8_retail_sales_analysis_project\retail_sales.csv'
WITH
(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    CODEPAGE = '65001', -- UTF-8 encoding
    DATAFILETYPE = 'char'
);  
-- Check if the data is imported correctly

SELECT * FROM retail_sales

