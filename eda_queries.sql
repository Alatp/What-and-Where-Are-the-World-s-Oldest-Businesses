-- Q1
SELECT MAX(year_founded) AS newest, MIN(year_founded) AS oldest 
FROM businesses
-- Q2
SELECT COUNT(*)
FROM businesses
WHERE year_founded < 1000
-- Q3
SELECT business 
FROM businesses
WHERE year_founded < 1000
ORDER BY year_founded 
-- Q4
SELECT b.business, b.year_founded, b.country_code, c.category
FROM businesses as b JOIN categories as c 
ON b.category_code = c.category_code
WHERE b.year_founded < 1000
ORDER BY b.year_founded
-- Q5
SELECT category, COUNT(*) AS n
FROM categories
GROUP BY category
ORDER BY n DESC
LIMIT 10 
-- Q6
SELECT b.year_founded AS oldest, c.continent
FROM businesses as b JOIN countries as c 
ON b.country_code = c.country_code
GROUP BY c.continent, b.year_founded 
ORDER BY b.year_founded
-- Q7
SELECT * FROM 
(SELECT * 
FROM businesses JOIN countries
ON businesses.country_code = countries.country_code) AS intermediate
JOIN categories ON categories.category_code = intermediate.category_code


-- Q8
WITH whole_table as (SELECT * FROM 
	(SELECT * 
	FROM businesses JOIN countries
	ON businesses.country_code = countries.country_code) AS intermediate
	JOIN categories ON categories.category_code = intermediate.category_code) 

SELECT continent, COUNT(*)
FROM whole_table
GROUP BY continent

-- Q9 
WITH whole_table as (SELECT * FROM 
	(SELECT * 
	FROM businesses JOIN countries
	ON businesses.country_code = countries.country_code) AS intermediate
	JOIN categories ON categories.category_code = intermediate.category_code) 

SELECT continent, COUNT(*) as c 
FROM whole_table
GROUP BY continent
HAVING c > 5
ORDER BY c DESC









