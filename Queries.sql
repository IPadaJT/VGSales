-- Question 1: Find the top 15 best selling games of all time. 
SELECT * FROM sales
ORDER BY games_sold DESC
LIMIT 15;
-- This query selects all information about the 15 titles with 
-- the highest games_sold (copies in millions)

--First, let's make sure our tables are clean by checking for nulls
--There shouldn't be since we were thorough with pandas but just in case
SELECT COUNT(sales.game)
FROM sales
LEFT JOIN reviews
ON sales.game=reviews.game
WHERE critic_score IS NULL AND
user_score IS NULL;
-- This query joins our two tables on game titles and removes any titles that are missing both review scores

--Question 2: Find the top 10 years with the highest average critic scores.
-- Additionally, find the number of games produced in those years
CREATE VIEW "Top Critic Years Initial" AS
SELECT s.year, 
ROUND(AVG(critic_score),2) as avg_critic_score
FROM sales as s
INNER JOIN reviews as r
ON s.game=r.game
GROUP BY year
ORDER BY avg_critic_score DESC
LIMIT 10; 
-- This query joins on our primary key and creates a view labeled "Top Critic Years Initial"
-- However, the years 1982, 1992, 1994 seem fishy. They are all 9.0 scores as an average which might indicate a low number of games that year

-- Run the same query but adding a condition games_count that must be greater than 4. 
CREATE VIEW "Top Critic Years GameCount" AS
SELECT s.year, 
ROUND(AVG(critic_score),2) AS avg_critic_score,
COUNT (s.game) AS games_count
FROM sales AS s
INNER JOIN reviews AS r
ON s.game = r.game
GROUP BY year
HAVING COUNT(s.game) > 4
ORDER BY avg_critic_score DESC
LIMIT 10;

-- The results are much different. Avg scores are lower but the years are mainly between 1999-2010 and 2019-2020

--Question 3: Find the top 10 years with the highest average user scores.
-- Additionally, find the number of games produced in those years
CREATE VIEW "Top User Years GameCount" AS
SELECT s.year, 
AVG(user_score) AS avg_user_score,
COUNT(s.game) AS games_count
FROM sales AS s
INNER JOIN reviews AS r
ON s.game = r.game
GROUP BY year
HAVING COUNT(year) > 4
ORDER BY avg_user_score DESC
LIMIT 10;
-- Same approach as with the critic scores. 
-- Similar spread of years between 99-10 but only 2020 shows up in the back end of this table

--Question 4: Which years had highest average scores from both groups
-- Additionally, how many games produced
CREATE VIEW "Top Years Final" AS
SELECT 
c.year,
c.avg_critic_score as critic_score,
u.avg_user_score as user_score,
c.games_count as gamecount
FROM
top_critic_years_gamecount as c
JOIN
top_user_years_gamecount as u 
ON c.year=u.year;

SELECT * FROM "Top Years Final"
-- This step involves creating new tables in the database based off the views we've queried beforehand.
-- I've joined them and specified a gamecount from only one of the tables since they're the same on both sides
-- Based on the results, it looks like 2006-2008 was a high volume, high-scoring time. 

--Question 5: Number of games sold (in millions) each of those top years
CREATE VIEW "Top Sales Volume" AS
SELECT year,
SUM(games_sold) AS total_games_sold
FROM sales
WHERE year IN (SELECT year 
FROM top_critic_years_gamecount
INNER JOIN top_user_years_gamecount
USING (year))
GROUP BY year
ORDER BY total_games_sold DESC;

Select * from "Top Sales Volume"
-- 2006-2008 seems to have been a bright time for video games. 
-- There were positive scores from both critics and users at this time. In addition, sales from that 3 year span combined is higher than the next 6 best-selling years.