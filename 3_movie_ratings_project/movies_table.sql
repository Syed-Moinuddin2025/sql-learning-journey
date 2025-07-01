IF OBJECT_ID('movies', 'U') IS NOT NULL
    DROP TABLE movies;

CREATE TABLE movies (
    id INT PRIMARY KEY,
    movie_title VARCHAR(200) NOT NULL,
    imdb_rating DECIMAL(3,1),
    year_released INT,
    budget DECIMAL(10,2),
    box_office DECIMAL(10,2),
    d_company_id INT,
    language VARCHAR(100),

    --CONSTRAINT FK_d_company_id FOREIGN KEY (d_company_id)
      --  REFERENCES d_company(id)
);

INSERT INTO movies (id, movie_title, imdb_rating, year_released, budget, box_office, d_company_id, language) VALUES
(1, 'The Shawshank Redemption', 9.2, 1994, 25.00, 73.30, 1, 'English'),
(2, 'The Godfather', 9.2, 1972, 7.20, 291.00, 2, 'English'),
(3, 'The Dark Knight', 9.0, 2008, 185.00, 1006.00, 3, 'English'),
(4, 'The Godfather Part II', 9.0, 1974, 13.00, 93.00, 2, 'English, Sicilian'),
(5, '12 Angry Men', 9.0, 1957, 0.34, 2.00, 4, 'English'),
(6, 'Schindler''s List', 8.9, 1993, 22.00, 322.20, 5, 'English, German, Yiddish'),
(7, 'The Lord of the Rings: The Return of the King', 8.9, 2003, 94.00, 1146.00, 6, 'English'),
(8, 'Pulp Fiction', 8.8, 1994, 8.50, 213.90, 7, 'English'),
(9, 'The Fellowship of the Ring', 8.8, 2001, 93.00, 898.20, 6, 'English'),
(10, 'The Good, the Bad and the Ugly', 8.8, 1966, 1.20, 38.90, 8, 'English, Italian, Spanish'),
(11, 'Forrest Gump', 8.8, 1994, 55.00, 678.20, 9, 'English'),
(12, 'Fight Club', 8.8, 1999, 63.00, 100.90, 10, 'English'),
(13, 'Inception', 8.7, 2010, 160.00, 836.80, 11, 'English'),
(14, 'The Lord of the Rings: The Two Towers', 8.7, 2002, 94.00, 926.30, 6, 'English'),
(15, 'Star Wars: Episode V - The Empire Strikes Back', 8.7, 1980, 18.00, 538.40, 12, 'English'),
(16, 'The Matrix', 8.7, 1999, 63.00, 463.50, 13, 'English'),
(17, 'Goodfellas', 8.7, 1990, 25.00, 46.80, 14, 'English'),
(18, 'One Flew Over the Cuckoo''s Nest', 8.7, 1975, 3.00, 108.70, 15, 'English'),
(19, 'Se7en', 8.6, 1995, 33.00, 327.30, 16, 'English'),
(20, 'City of God', 8.6, 2002, 3.30, 30.60, 17, 'Portuguese'),
(21, 'The Silence of the Lambs', 8.6, 1991, 19.00, 272.70, 18, 'English'),
(22, 'It''s a Wonderful Life', 8.6, 1946, 3.18, 3.30, 19, 'English'),
(23, 'Life Is Beautiful', 8.6, 1997, 20.00, 229.20, 20, 'Italian'),
(24, 'The Usual Suspects', 8.5, 1995, 6.00, 34.50, 21, 'English'),
(25, 'Léon: The Professional', 8.5, 1994, 16.00, 45.90, 22, 'French'),
(26, 'Spirited Away', 8.5, 2001, 15.00, 395.80, 23, 'Japanese'),
(27, 'Saving Private Ryan', 8.5, 1998, 98.00, 482.30, 24, 'English'),
(28, 'Interstellar', 8.5, 2014, 165.00, 677.40, 25,'English'),
(29,'Parasite',8.6 ,2019 ,11.40 ,263.20 ,26,'Korean'),
(30,'The Green Mile',8.6 ,1999 ,60.00 ,286.80 ,27,'English'),
(31,'The Departed',8.5 ,2006 ,90.00 ,291.50 ,28,'English'),
(32,'Whiplash',8.5 ,2014 ,3.30 ,49.50 ,29,'English'),
(33,'Gladiator',8.5 ,2000 ,103.00 ,457.60 ,30,'English'),
(34,'The Prestige',8.5 ,2006 ,40.00 ,109.70 ,31,'English'),
(35,'The Lion King',8.5 ,1994 ,45.00 ,968.50 ,32,'English'),
(36,'Back to the Future',8.5 ,1985 ,19.00 ,381.10 ,33,'English'),
(37,'American History X',8.5 ,1998 ,20.00 ,23.90 ,34,'English'),
(38,'The Pianist',8.5 ,2002 ,35.00 ,120.10 ,35,'Polish, French, English'),
(39,'Terminator 2: Judgment Day',8.5, 1991, 102.00, 520.80, 36, 'English'),
(40,'The Intouchables',8.5, 2011, 11.50, 426.60, 37, 'French'),
(41,'The Dark Knight Rises',8.4, 2012, 230.00, 1081.00, 3, 'English'),
(42,'Memento',8.4, 2000, 9.00, 39.70, 38, 'English'),
(43,'Apocalypse Now',8.4, 1979, 31.50, 150.00, 39, 'English'),
(44,'Alien',8.4, 1979, 11.00, 104.90, 40, 'English'),
(45,'The Great Dictator',8.4, 1940, 1.50, 5.00, 41, 'English'),
(46,'Cinema Paradiso',8.4, 1988, 5.00, 71.20, 42, 'Italian'),
(47,'Grave of the Fireflies',8.5 ,1988 ,3.00 ,5.00 ,43,'Japanese'),
(48,'Once Upon a Time in the West',8.5 ,1968 ,5.50 ,5.30 ,44,'English'),
(49,'Modern Times',8.5 ,1936 ,1.50 ,0.30 ,45,'English'),
(50,'The Lives of Others',8.4 ,2006 ,2.00 ,77.70 ,46,'German');
 

 SELECT * FROM movies;

 SELECT * FROM movies ORDER BY imdb_rating DESC;