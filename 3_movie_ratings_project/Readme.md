# 🎬 Project 3: Movie Ratings and Companies

## 📁 Overview

This project focuses on analyzing a dataset of movies and their associated production companies using SQL. The goal is to practice JOIN operations, filtering, sorting, aggregate functions, and data cleaning using real-world data scenarios.

---

## 🎯 Objectives

* Practice JOIN operations between movies and companies.
* Use filters and aggregate functions to analyze movie ratings.
* Clean and prepare data using UPDATE and ALTER queries.
* Handle NULL values and missing relationships.

---

## 🗂️ Tables Involved

### `movies`

Contains details of each movie such as:

* `id`
* `movie_title`
* `year_released`
* `imdb_rating`
* `language`
* `d_company_id` (Foreign Key)

### `d_company`

Contains production company details:

* `id`
* `company_name`

---

## 🧪 Sample Queries

### ✅ Basic Data Check

```sql
SELECT * FROM movies;
SELECT * FROM d_company;
```

### ✅ Filtering High-Rated Movies

```sql
SELECT * FROM movies WHERE imdb_rating > 8.0;

SELECT * FROM movies  
WHERE imdb_rating > 8.0  
ORDER BY imdb_rating DESC;
```

### ✅ Company-Wise Movie Count

```sql
SELECT d_company.company_name, COUNT(*) AS movie_count
FROM movies
JOIN d_company ON movies.d_company_id = d_company.id
GROUP BY d_company.company_name;
```

### ✅ Top 10 Movies with Company Name

```sql
SELECT TOP 10
    m.movie_title,
    d.company_name
FROM movies m
JOIN d_company d ON m.d_company_id = d.id;
```

### ✅ Top 20 Movies Sorted by Year

```sql
SELECT TOP 20
    m.id AS movie_id,
    m.movie_title,
    m.year_released,
    d.company_name,
    m.imdb_rating,
    m.language
FROM movies m
JOIN d_company d ON m.d_company_id = d.id
ORDER BY m.year_released;
```

---

## 🔧 Data Cleanup Queries

### ✅ Fix Company Names

```sql
UPDATE d_company SET company_name = 'DreamWorks Pictures' WHERE id = 21;
UPDATE d_company SET company_name = 'Focus Features' WHERE id = 22;
```

### ✅ Find Unlinked Company IDs

```sql
SELECT DISTINCT d_company_id
FROM movies
WHERE d_company_id NOT IN (SELECT id FROM d_company);

SELECT * FROM movies
WHERE d_company_id IS NULL;
```

### ✅ Add Foreign Key Constraint

```sql
ALTER TABLE movies
ADD CONSTRAINT fk_movies_d_company
FOREIGN KEY (d_company_id)
REFERENCES d_company(id);
```

---

## 📊 Grouping and Analysis

```sql
SELECT
    d.company_name,
    COUNT(m.id) AS movie_count
FROM d_company d
LEFT JOIN movies m ON m.d_company_id = d.id
GROUP BY d.company_name
ORDER BY movie_count DESC;
```

```sql
SELECT
    m.movie_title,
    dc.company_name
FROM movies m
JOIN d_company dc ON m.d_company_id = dc.id
WHERE dc.company_name IN ('Warner Bros.', 'Universal Pictures', '20th Century Fox');
```

---

## 🧰 Tools Used

* Microsoft SQL Server
* Azure Data Studio / SSMS
* CSV data import and transformation

---

## 📘 Status

✅ Completed: Table creation, import, cleaning, queries and grouping
🚧 Optional: Add report visualization or view creation

---

## 🙌 Contribute or Collaborate

If you’d like to enhance this project, raise a pull request or open an issue!

**GitHub:** [Syed-Moinuddin2025](https://github.com/Syed-Moinuddin2025)
