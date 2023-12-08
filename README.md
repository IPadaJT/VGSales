# VGSales
An analysis on the video game industry involving the use of Python, pandas, and SQL. Data Viz using PivotCharts in MS Excel.

# Introduction
From my earliest memories, I've loved playing video games. I've grown up playing video games but since becoming mainstream I feel like video games have changed. Nowadays, video games is a huge industry and business. The gaming market is projected to be worth $380+ billion by 2028 according to data from [Mordor Intelligence](https://www.mordorintelligence.com/industry-reports/global-gaming-market). Given the pressure for developers and major publishers to release the next big game, has the quality of video games increased in the eyes of the target audience? This project is meant to derive insights and discover what has happened throughout the gaming industry. 

# Goals 
The goal of this case study is to understand if the quality of video games has increased over time and find the period of time where video games were highly popular and successful. To do so, I have the following questions I would like to find the answer to: 
1. What are the top 15 best-selling titles of all time?
2. What are the top 10 years with the highest average critic score?
3. What are the top 10 years with the highest average user score?
4. What years had the highest average scoresa from both groups?
5. What was the number of games sold in each of those years from Question 4?

# Datasource
This datasource was originally from kaggle [here](https://www.kaggle.com/datasets/holmjason2/videogamedata/)
Which involved 13,000 rows of data about video game titles ranging from 1977 to mid 2020. 

# Cleaning with pandas/Python
This is found under the Jupyter Notebook file CleaningData.ipynb
This involved looking for null/duplicate values within the dataset. 
For any rows with null values, I dropped the row.
But for rows with duplicate values (i.e. duplicate video game titles), I took a sum of the number of platforms and games sold per title using a groupby function.
I knew I wanted to get this into a relational database like SQL so I split the data into a reviews table and sales table with a primary key of Name for the video game title.
These two tables were exported as csv files for import into postgres

# SQL Setup
With the exported csv files created, I needed to make tables in my database to import the data into. 
The structure for my tables can be found under the DataTables.sql file for reference.
The highlights include: Two Initial Tables named "reviews" and "sales" with a primary key of "Name"
As my analysis continued, I created tables to hold my SQL queries as: Top_Critic_Years, Top_Critic_Years_GameCount, Top_User_Years_GameCount

# SQL Queries
Once my tables were ready and data imported, I began looking for the answers to my questions as seen under the Queries.sql file.
These involved joining my tables, making calculations within SQL and creating views to derive insights into the video game industry.

# SQL Answers/Findings
The resulting queries for my questions were saved as csv files under the SQL_Answers folder.
Feel free to explore the csv files for the answers or take a look at some of the viz below. 
1. What are the top 15 best-selling titles of all time?
  The #1 game was Wii Sports with 82 million copies sold
2. What are the top 10 years with the highest average critic score?
  The years for this, once adjusted for years with few produced games, showed that 1999 throughout the early 2000s were huge hits with critics. 
3. What are the top 10 years with the highest average user score?
  A similar trend was noticed with users when adjusting for those same years where there were less than 5 games produced
4. What years had the highest average scores from both groups?
   2001, 2020, 2004 were the highest scores in this category. But when examining those with the highest number of games produced, it showed a 3 year span from 2006-2008. 
5. What was the number of games sold in each of those years from Question 4?
  In that 3 year span, over 200 million copies of video games sold. 

# Data Viz
Best Selling Games

![image](https://github.com/IPadaJT/VGSales/assets/117694350/ce3acc2c-6a01-470f-9a9c-f1a02d29cad2)

Best Selling Years

![image](https://github.com/IPadaJT/VGSales/assets/117694350/5e8be9aa-f4e9-45a9-9ea8-f03ec953f2a7)

Top Years for Critics and Users

![image](https://github.com/IPadaJT/VGSales/assets/117694350/ac4ca76c-3605-43e4-93fa-040c18801991)



# Conclusions
Based on the results of this case study it would seem that despite the gaming industry having more money than ever, people aren't as pleased with the quality of games than they were in the past. With that being said, there are several assumptions being made in my analysis that should be addressed. The limitations of this data are that the scores pulled from both critics and users was sourced from the same source Metacritic which introduces a bias because it's not a complete represantation of the audience. The results of the analysis may be different depending on the source of the scores. In addition, there is the assumption that developers make games with the same timeline and process since the inception of the industry. Production of a video game is a multifaceted and collaborative effort which the numbers can not encapsulate. Identifying similarities between the video games and identifying trends in design of the top games could provide more insight on why more recent years of video games don't rate as highly as the early 2000s. 

With all that being said, I do think the data can help as a starting point for trying to further identify and gain more insight into why video games were so popular in the early 2000s. Perhaps a return to how things were during that peak of video game history can be derived by combining the results of this analysis with an analysis of the attributes of the video games of that era. 
