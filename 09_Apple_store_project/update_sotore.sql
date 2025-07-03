SELECT store_id, store_name, city, country
FROM stores
WHERE country = 'India'
ORDER BY store_id 

SELECT city,store_id, country,store_name, COUNT(*) AS total_stores
FROM stores
GROUP BY country ,city,store_id,store_name
ORDER BY total_stores DESC ;


UPDATE stores
SET store_name = 'Apple Store  Dubai Mall' ,country = 'UAE' ,city = 'Dubai'
WHERE store_id =93;

UPDATE stores
SET
  store_name = CASE 
    WHEN store_id = 90 THEN 'Apple Store JeChangi_Airport'
    WHEN store_id = 91 THEN 'Apple Store Orchard Road'
    WHEN store_id = 92 THEN 'Apple StoreMarina Bay Sands'
     END,
  city = CASE 
    WHEN store_id = 90 THEN 'Singapore'
    WHEN store_id = 91 THEN 'Singapore'
    WHEN store_id = 92 THEN 'Singapore'
      END,
  country = 'Singapore'
WHERE store_id IN (90,91,92);


UPDATE stores
SET
  store_name = CASE 
    WHEN store_id = 81 THEN 'Apple Store Market Mall'
    WHEN store_id = 78 THEN 'Apple Store Yorkdale'
    WHEN store_id = 89 THEN 'Apple Store Sherway Gardens'
    WHEN store_id = 90 THEN 'Apple Store  Fairview'
    WHEN store_id = 71 THEN 'Apple Store Place Ste-Foy'
    WHEN store_id = 72 THEN 'Apple Store Masonville'
     END,
  city = CASE 
    WHEN store_id = 81 THEN 'Calgary'
    WHEN store_id = 78 THEN 'Toronto'
    WHEN store_id = 89 THEN 'Toronto'
    WHEN store_id = 90 THEN 'Toronto'
    WHEN store_id = 71 THEN 'Quebec City'
    WHEN store_id = 72 THEN 'London'
      END,
      country = 'Canada'
WHERE store_id IN (81,78,89,90,71,72);





UPDATE stores
SET country = 'United States'
WHERE country = 'USA';
 
SELECT DISTINCT country FROM stores;

SELECT * FROM stores,store_name,store_id
WHERE country = 'United states'

select  store_name,store_id,count(*) AS City from stores
WHERE country = 'United states'
GROUP BY store_name,store_id


SELECT city, COUNT(*) AS store_count
FROM stores
WHERE country = 'United States'
GROUP BY city
ORDER BY store_count DESC;
--

