-- Facebook user growth from 2008 to 2021

SELECT max(yearly_users)-min(yearly_users)
FROM facebook_users

-- Facebook user percent growth 

SELECT MAX(yearly_users)/MIN(yearly_users)*100
FROM facebook_users

-- What percent of the total population is currently on facebook? (NOTE: global population as of 2021 was 7.9 Billion)

SELECT  (yearly_users/7900000000) *100 
FROM facebook_users
WHERE year = 2021

-- What was the yearly growth in percentage? 

WITH CTE as (
SELECT year, yearly_users,
row_number() OVER (order by year) AS rn1
FROM Facebook_users)
SELECT t1.year,t1.yearly_users, 
round(coalesce((t1.yearly_users-t2.yearly_users)*1.0/t2.yearly_users,0)*100,2) AS Growth_from_previous_year
FROM cte as t1
LEFT JOIN CTE as t2 ON t1.rn1= t2.rn1+1












 











