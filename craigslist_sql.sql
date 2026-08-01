-- This is just the challenge questions

-- Check each table
SELECT * FROM ads;
SELECT * FROM category;
SELECT * FROM expiration;
SELECT * FROM location;
SELECT * FROM save_ads;
SELECT * FROM users;



-- All ads in a given category

SELECT
	c.cat_name,
	COUNT(c.cat_name) AS num_ads
FROM ADS a
JOIN 
	category c
	USING (ad_id)
GROUP BY 
	c.cat_name;


-- Ads in a given location, sorted by post date

SELECT 
	a.ad_id,
	a.user_id,
	a.title,
	a.body,
	a.posting_date,
	l.city,
	l.state
FROM
	ADS a
JOIN
	LOCATION l
	USING (ad_id)
ORDER BY 
	a.posting_date;

-- All ads a specific user has saved

SELECT 
	u.first_name,
	u.last_name,
	a.title,
	a.body  
FROM 
	users u
JOIN 
	ads a
	USING (user_id);
	

-- The most active poster (user with the most ads)

WITH ad_counts AS (
	SELECT user_id, COUNT(*) AS num_posted_ads
	FROM ads a 
	GROUP BY user_id
)
SELECT 
	u.first_name,
	u.last_name,
	ac.num_posted_ads
FROM 
	users u
JOIN 
	ad_counts ac
	USING (user_id)
ORDER BY 
	ac.num_posted_ads DESC 
LIMIT 10;

-- The most popular category (most ads)

SELECT cat_name, COUNT(*) AS num_ads
FROM category
GROUP BY cat_name
ORDER BY num_ads DESC;


-- Analyzing trending by month

SELECT 
	TO_CHAR(posting_date, 'Mon') AS MONTH,  
	COUNT(*) num_ads
FROM ads
GROUP BY 
	TO_CHAR(posting_date, 'Mon'), 
	EXTRACT(MONTH FROM posting_date)
ORDER BY
	EXTRACT(MONTH FROM posting_date);

-- Updating posting_date in ads, for ad_id IN (5,6) for trending query test

UPDATE ADS
SET posting_date = '2023-05-15'
WHERE ad_id IN (5,6);

SELECT * FROM ads;
