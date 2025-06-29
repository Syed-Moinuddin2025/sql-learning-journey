-- Rename the column first (uncomment the appropriate line for your DBMS):

-- For SQL Server:
EXEC sp_rename 'movies.rating', 'ratings', 'COLUMN';

-- For PostgreSQL or MySQL 8+:
--ALTER TABLE movies RENAME COLUMN imdb_rating TO rating;

-- Now run your queries after the column has been renamed:
SELECT * FROM movies;
SELECT * FROM movies WHERE imdb_rating > 8.0;

SELECT  * FROM movies  
WHERE imdb_rating > 8.0
ORDER BY imdb_rating DESC;

SELECT d_company.company_name, COUNT(*) AS movie_count
FROM movies
JOIN d_company ON movies.id = d_company.id
GROUP BY d_company.company_name;

UPDATE movies 
SET movie_title = 'The Professional (Léon)' 
WHERE id = 25;
 
ALTER TABLE movies
ADD CONSTRAINT fk_movies_d_company
FOREIGN KEY (d_company_id)
REFERENCES d_company(id);

-- For SQL Server:
EXEC sp_help 'movies';
EXEC sp_help 'd_company';

-- For MySQL:
-- DESCRIBE movies;
-- DESCRIBE d_company;

-- For PostgreSQL:
-- \d movies
-- \d d_company

-- ALTER TABLE movies
-- ALTER COLUMN d_company_id INT;

-- ALTER TABLE movies
-- ADD CONSTRAINT fk_movies_d_company
-- FOREIGN KEY (d_company_id)
-- REFERENCES d_company(id);



SELECT TOP 10
    m.movie_title,
    d.company_name
FROM movies m
JOIN d_company d ON m.d_company_id = d.id;

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

-- ALTER TABLE movies
-- ADD CONSTRAINT fk_movies_d_company
-- FOREIGN KEY (d_company_id)
-- REFERENCES d_company(id);


SELECT DISTINCT d_company_id
FROM movies
WHERE d_company_id NOT IN (SELECT id FROM d_company);

SELECT TOP 10
    m.movie_title,
    d.company_name
FROM movies m
JOIN d_company d ON m.d_company_id = d.id;

SELECT * FROM movies
WHERE d_company_id IS NULL; 

SELECT 
    d.company_name, 
    COUNT(m.id) AS movie_count
FROM d_company d
LEFT JOIN movies m ON m.d_company_id = d.id
GROUP BY d.company_name
ORDER BY movie_count DESC;

UPDATE d_company
SET company_name = 'DreamWorks Pictures'    
WHERE id = 21;
UPDATE d_company
SET company_name = 'Focus Features'    
WHERE id = 22;

SELECT id, company_name
FROM d_company
WHERE id BETWEEN 21 AND 50
ORDER BY id;
 
SELECT 
    d.company_name, 
    COUNT(m.id) AS movie_count  
FROM d_company d
LEFT JOIN movies m ON m.d_company_id = d.id 

SELECT
  m.movie_title,
  dc.company_name
FROM d_company dc
JOIN movies m
ON dc.id = m.d_company_id;