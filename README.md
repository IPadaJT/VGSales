# VGSales
A case study on the video game industry involving the use of Python, pandas, and SQL. 

# Introduction

# Questions 

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
2. What are the top 10 years with the highest average critic score?
3. What are the top 10 years with the highest average user score?
4. What years had the highest average scoresa from both groups?
5. What was the number of games sold in each of those years from Question 4?

# Data Viz
# Conclusions
