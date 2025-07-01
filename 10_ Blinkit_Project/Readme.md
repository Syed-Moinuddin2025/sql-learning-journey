# 🛒 Blinkit Sales Analysis - SQL Project

<div align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/4/4a/Blinkit_logo.svg" alt="Blinkit Logo" width="300" />
</div>

---

## 📌 Project Overview

This SQL-based analysis explores sales data from Blinkit, one of India’s leading online grocery delivery platforms. Using raw transactional data, we clean, transform, and analyze key performance indicators (KPIs) to gain actionable business insights.

---

## 🧠 Objectives

* ✅ Clean and prepare raw data for analysis
* 📊 Perform sales-based KPI analysis (total, average, ratings, etc.)
* 🗂️ Segment data by fat content, outlet type, year, item type
* 📍 Analyze outlet location and size performance
* 🔁 Use pivot tables and advanced SQL features

---

## 🧪 Dataset Information

Assumed table name: `blinkit_data`

**Sample Columns:**

* `Item_Identifier`
* `Item_Fat_Content`
* `Item_Type`
* `Outlet_Identifier`
* `Outlet_Establishment_Year`
* `Outlet_Size`
* `Outlet_Location_Type`
* `Outlet_Type`
* `Item_Visibility`
* `Rating`
* `Total_Sales`

---

## 🧾 Key KPIs Calculated

| KPI Category       | Metric                                              |
| ------------------ | --------------------------------------------------- |
| 🧼 Data Cleaning   | Standardize `Item_Fat_Content`                      |
| 💰 Sales           | Total Sales, Sales in Millions, Avg Sales           |
| 🎯 Performance     | No. of Items Sold, Avg Rating                       |
| 🍽️ By Fat Content | Sales, Avg, Count, Rating                           |
| 🛍️ By Item Type   | Sales performance by category                       |
| 🏬 By Outlet       | Location-based sales, size-wise %, year-wise trends |
| 📈 Advanced        | Pivot table, sales ranking, visibility impact       |

---

## 📁 Project Structure

blinkit_project/
├── blinkit_analysis_final.sql   -- Final SQL Script with all KPIs
└── README.md                    -- Project Overview & Documentation


```

---

## 🧠 Skills Practiced

* SQL Joins & Aggregations
* Pivot Tables
* Case Statements
* Ranking & Window Functions
* Data Cleaning & Normalization
* Business Analytics

---

## 📊 Sample Insights

* Low Fat items outperform Regular ones in total sales 💪
* Certain outlet types dominate overall revenue 🏬
* Visibility affects average sales: higher visibility = more sales 👀
* Newer outlets (established post-2010) perform better 📈

---

## 🛠️ Tools Used

* Microsoft SQL Server / Azure Data Studio
* Excel / CSV import (for data loading)
* VS Code / GitHub (for development)

---

## 🙋‍♂️ Created by

**Syed Moinuddin**
🔗 [@learn\_more-and-earn\_more-syed](https://youtube.com/@learn_more-and-earn_more-syed)
📂 GitHub: [SQL-Python-Learning-Journey](https://github.com/Syed-Moinuddin2025)

---

## 🚀 Next Steps

* [ ] Add Power BI Dashboard 📊
* [ ] Create interactive KPI filters 💡
* [ ] Add challenge questions and self-assessment 📘
