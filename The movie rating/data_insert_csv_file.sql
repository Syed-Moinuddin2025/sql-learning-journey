 TRUNCATE TABLE d_company;
 TRUNCATE TABLE movies;    

ALTER TABLE movies
DROP CONSTRAINT FK_d_company_id;

USE MovieRating;
GO

BULK INSERT d_company
FROM 'D:\SQL-Python_Journey\The movie rating\d_company_table.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

SELECT *
FROM d_company;     

IF OBJECT_ID('movies', 'U') IS NOT NULL
    DROP TABLE movies;
GO

-- ✅ Step 2: Create table
CREATE TABLE movies (
    id INT,
    movie_title VARCHAR(255),
    imdb_rating FLOAT,
    year_released INT,
    budget FLOAT,
    box_office FLOAT,
    d_company_id INT,
    language VARCHAR(255)
);

IF OBJECT_ID('movies', 'U') IS NOT NULL
    DROP TABLE movies;
GO

CREATE TABLE movies (
    id INT PRIMARY KEY,
    movie_title VARCHAR(200),
    imdb_rating DECIMAL(3,1),
    year_released INT,
    budget DECIMAL(10,2),
    box_office DECIMAL(10,2),
    d_company_id INT,
    language VARCHAR(100)
);
SELECT *
FROM movies;

BULK INSERT movies
FROM 'D:\SQL-Python_Journey\The movie rating\clean_movies_data_no_quotes.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

CREATE TABLE movies_temp (
    id VARCHAR(10),
    movie_title VARCHAR(255),
    imdb_rating VARCHAR(10),
    year_released VARCHAR(10),
    budget VARCHAR(20),
    box_office VARCHAR(20),
    d_company_id VARCHAR(10),
    language VARCHAR(255)
);

BULK INSERT movies_temp
FROM 'D:\SQL-Python_Journey\The movie rating\clean_movies_data_no_quotes.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT movies
FROM 'D:\SQL-Python_Journey\The movie rating\movies_data.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK,
    ERRORFILE = 'D:\SQL-Python_Journey\movie_errors.log'
);

CREATE TABLE movies_data (
    id INT,
    movie_title VARCHAR(255),
    year_released INT,
    budget FLOAT,
    box_office FLOAT,
    d_company_id INT,
    language VARCHAR(255),
    imdb_rating FLOAT
);

SELECT *
FROM movies_data;

BULK INSERT movies_data
FROM 'D:\SQL-Python_Journey\The movie rating\movies_data.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);