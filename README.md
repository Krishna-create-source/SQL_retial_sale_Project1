Project Overview
Language Used: SQL

Platform: Local/Cloud SQL environments (e.g., PostgreSQL)

Learning Outcome: Data cleaning, transformation, aggregation, business reporting with SQL

📌 Objectives
Clean and validate raw sales data

Explore key metrics such as sales, customers, and product categories

Solve real business problems using SQL queries

Segment and analyze data by time, gender, and categories

🧩 Key Features
Table Creation & Data Import: Define and initialize retail_sale table

Null Checks: Validate missing values and clean the dataset

Sales Metrics:

Total sales count

Unique customers and product categories

Business Problem Solving:

Daily and category-wise sales breakdown

Monthly trend analysis

Top performing customers

Time-of-day (shift-based) order distribution

📊 Example Queries
Top 5 customers by revenue

Category-wise unique customer count

Monthly average sales and best-selling month

Morning vs. Afternoon vs. Evening order comparison

🧹 Data Cleaning Steps
Removed rows with null values in critical columns like age, category, quantity, etc.

Standardized table name from retai_sale to retail_sale

📆 Time Analysis Logic
Used the SQL EXTRACT() function and CASE statements to:

Segment sales by shift (Morning, Afternoon, Evening)

Analyze best-performing months

🚀 Tools & Skills Gained
SQL DDL and DML commands

Aggregate functions: SUM(), AVG(), COUNT(), GROUP BY

Window functions: RANK() OVER()

Conditional logic with CASE

CTEs (WITH clause) for structured queries

📜 How to Use
Load the SQL script in your database environment.

Run each section incrementally to observe results.

Modify queries to test additional scenarios.

✅ Status
✅ Completed
