DROP TABLE sales CASCADE;

CREATE TABLE sales(
    name VARCHAR(100) PRIMARY KEY,
    publisher VARCHAR(64),
    developer VARCHAR(64),
    year INT,
    platform_count NUMERIC(5,2),
    games_sold NUMERIC(5,2)
);

DROP TABLE reviews CASCADE;

CREATE TABLE reviews( 
    name VARCHAR(100) PRIMARY KEY,
    critic_score NUMERIC(5,2),
    user_score NUMERIC(5,2)
);

DROP TABLE top_critic_years CASCADE;

CREATE TABLE top_critic_years (
    year INT PRIMARY KEY,
    avg_critic_score NUMERIC(5, 2)  
);

DROP TABLE top_critic_years_gamecount CASCADE;

CREATE TABLE top_critic_years_gamecount (
    year INT PRIMARY KEY,
    avg_critic_score NUMERIC(5, 2),
    games_count INT  
);

DROP TABLE top_user_years_gamecount CASCADE;

CREATE TABLE top_user_years_gamecount (
    year INT PRIMARY KEY,
    avg_user_score NUMERIC(5, 2),
    games_count INT
);

Select * from reviews
Select * from sales
Select * from top_critic_years
Select * from top_critic_years_gamecount
Select * from top_user_years_gamecount