--CREATE DATABASE MovieRating;


USE MovieRating;

IF NOT EXISTS (
    SELECT * FROM sys.tables WHERE name = 'd_company'
)
BEGIN
    CREATE TABLE d_company (
        id INT PRIMARY KEY,
        company_name VARCHAR(100) NOT NULL
    );
END

 INSERT INTO d_company(id,company_name)
 VALUES
 
 (1, 'Columbia Pictures'),
 (2,  'Paramoun Pictures'),
 (3, 'Warner Bros. Pictures'),
 (4, 'United Artists'),
 (5, 'Universal Pictures'),
 (6,'New Line Cinma'),
 (7,'Miramax Film'),
 (8, 'Produzioni Erepee Associate'),
 (9, 'Buena Vista'),
 (10, 'StudioCanal'),
 (11, '20th Century Fox'),
 (12, 'Metro-Goldwyn-Mayer'),
 (13, 'Sony Pictures Classics'),
 (14, 'DreamWorks Pictures'),
 (15, 'Focus Features'),
 (16, 'Lionsgate Films'),
 (17, 'A24 Films'),
 (18, 'Searchlight Pictures'),
 (19, 'Magnolia Pictures'),
 (20, 'IFC Films');

INSERT INTO d_company (id, company_name) VALUES
(21, 'Placeholder Company 21'),
(22, 'Placeholder Company 22'),
(23, 'Placeholder Company 23'),
(24, 'Placeholder Company 24'),
(25, 'Placeholder Company 25'),
(26, 'Placeholder Company 26'),
(27, 'Placeholder Company 27'),
(28, 'Placeholder Company 28'),
(29, 'Placeholder Company 29'),
(30, 'Placeholder Company 30'),
(31, 'Placeholder Company 31'),
(32, 'Placeholder Company 32'),
(33, 'Placeholder Company 33'),
(34, 'Placeholder Company 34'),
(35, 'Placeholder Company 35'),
(36, 'Placeholder Company 36'),
(37, 'Placeholder Company 37'),
(38, 'Placeholder Company 38'),
(39, 'Placeholder Company 39'),
(40, 'Placeholder Company 40'),
(41, 'Placeholder Company 41'),
(42, 'Placeholder Company 42'),
(43, 'Placeholder Company 43'),
(44, 'Placeholder Company 44'),
(45, 'Placeholder Company 45'),
(46, 'Placeholder Company 46'),
(47, 'Placeholder Company 47'),
(48, 'Placeholder Company 48'),
(49, 'Placeholder Company 49'),
(50, 'Placeholder Company 50');



SELECT  * FROM d_company;



