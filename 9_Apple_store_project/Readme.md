# 🍎 Apple Retail Store — SQL Analytics Project
<div align="center">
  <img src="https://raw.githubusercontent.com/Syed-Moinuddin2025/sql-learning-journey/main/images/image56.png" alt="SQL Learning Banner" width="800" height="auto">
</div>


Welcome to the **Apple Store SQL Analytics Project** — a complete SQL-based data analysis solution for retail business intelligence. This project simulates real-world operations of Apple retail stores and includes end-to-end SQL scripts, insights, and KPIs.

---

## 🧾 Project Overview

This project helps you practice real-world business analysis using SQL. The schema is designed around typical Apple store operations, including:

| Table      | Description                                     |
| ---------- | ----------------------------------------------- |
| `stores`   | Retail store metadata (location, name, country) |
| `category` | Product category info                           |
| `products` | Apple product details and pricing               |
| `sales`    | Store-level transaction records                 |
| `warranty` | Warranty claim history                          |

---

## 📁 Folder Structure

```bash
9_Apple_store_project/
├── 01_create_tables.sql              # Table structure
├── 02_insert_data.sql               # Sample data insert
├── 03_bulk_insert_csv.sql           # CSV import queries
├── 04_foreign_keys.sql              # FK constraints setup
├── 05_indexes.sql                   # Performance indexes
├── 06_analysis_queries.sql          # ✅ Original hand-crafted queries
├── 07_reference_queries_from_web.sql # Cleaned queries from external sources
└── README.md                         # 📘 You're here!
```

---

## 🔎 Highlights of Analysis Queries

### ✅ `06_analysis_queries.sql`

**Your original 18+ queries**, custom-built and organized:

📌 **Examples:**

* 🌍 Store count by country
* 🏪 Units sold per store
* 📅 December 2023 sales
* 🚫 Stores without warranty claims
* ⚠️ Percentage of 'Warranty Void' claims
* 🥇 Best selling store in last year
* 📦 Unique products sold last year
* 💵 Average category price
* 🛠 Warranty trends by month
* 📈 Revenue per country

And many more with advanced business logic (like RANK, CTEs, DATEADD).

---

### 🌐 `07_reference_queries_from_web.sql`

This file contains 20+ analytical problems collected from educational websites:

* 📊 Year-over-Year store growth
* 🔄 Warranty correlation by price segment
* 🥇 Best-selling day per store
* 💰 Monthly running revenue totals
* ⚖️ Warranty claim risk by country

Each query has been:

* Refined for SQL Server compatibility
* Annotated and organized by complexity

---

## 🎯 Skills You'll Practice

✅ SQL Server syntax (FORMAT, DATEADD, GETDATE, TOP)
✅ Joins: INNER, LEFT, RIGHT
✅ Window functions: `RANK()`, `LAG()`
✅ Subqueries and aggregations
✅ Performance indexing

---

## 🛠 Requirements

* ✅ SQL Server 2019+ / Azure Data Studio
* 🧩 CSV files (optional for bulk insert)
* 📜 Use `01_create_tables.sql` and `02_insert_data.sql` to get started

---

## 📌 What You Can Build On Top

🚀 Add dashboards in Power BI / Excel
📈 Build stored procedures for auto-reports
📤 Export output to CSV for management
🧩 Join with external device/feedback tables

---

## 🤝 Author & License

Developed with ❤️ by **Syed Moinuddin**
🔗 GitHub: [@Syed-Moinuddin2025](https://github.com/Syed-Moinuddin2025)
🔗 YouTube: [Learn More & Earn More](https://youtube.com/@learn_more-and-earn_more-syed)

Feel free to fork, adapt, and enhance for your portfolio and practice. 🚀

---

> “Great SQL analysts don’t just answer queries — they find better questions.” 💡
