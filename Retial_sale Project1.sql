--SQL retail sale analysis
---Create table
Create table retai_sale(
	transactions_id int Primary key,
	sale_date date,
	sale_time Time,
	customer_id int,
	gender varchar (15),
	age int,
	category varchar (50),
	quantiy int,
	price_per_unit float,
	cogs float,
	total_sale float
)

Select * from retail_sale

Alter table retai_sale
rename to retail_sale

Select count (*) from retail_sale

--Check the null values

select * from retail_sale
Where transactions_id is null

select * from retail_sale
Where sale_date is null

select * from retail_sale
Where sale_time is null

select * from retail_sale
Where customer_id is null

select * from retail_sale
Where gender is null

select * from retail_sale
Where age is null
or 
category is null
or
quantiy is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null

--Dealing with null values

Delete from retail_sale
Where age is null
or 
category is null
or
quantiy is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null

--Data exploration

--How many sales we have?
select count (*) as total_sale from retail_sale

--How many unique customers do we have?

select count (distinct customer_id) from retail_sale

--How many unique category do we have?
Select count (distinct category) from retail_sale
Select distinct category from retail_sale

--Data analysis and business key problem
--1 write a sql query to retrieve all columns for sales made on '2022-11-05'

Select * from retail_sale where sale_date ='2022-11-05'

--2 write a sql query to retrieve all transcations where the category is 'clothing' and the quantity sold is more than 4 in the month of nov-2022

Select * from retail_sale
where category='Clothing' and quantiy >=4 and sale_date between '2022-11-01' and '2022-11-30'

--alternate solution

Select * from retail_sale
where category='Clothing' 
and to_char(sale_date, 'YYYY-MM')= '2022-11' 
and quantiy>=4

--3 write a sql query to calculate the total sales for each category

Select category,
Sum(total_sale) as net_sale
from retail_sale 
group by category


--4 write a sql query to find the ave age of customer who purchased items from the beauty category.

Select Round(avg (age),2)
from retail_sale
where category='Beauty'


--5 write a sql query to find all transcations where the total sales is greater than 1000

Select * from retail_sale
where total_sale >1000

--6 write a sql query to find the total number of transcatins made by each gender in each category.
 Select category, gender,
 count(*) as total_trans
 from retail_sale
 group by category, gender
 order by category
 
 

--7 write a sql query to calculate the ave sale for each month. find out the best selling month in each year.

Select * from (
select 
	extract (YEAR from sale_date) as Year,
	extract (month from sale_date) as month,
	avg (total_sale) as avg_sale,
	Rank () over(partition by extract (YEAR from sale_date) order by avg (total_sale)desc) as rank
	from retail_sale
	group by 1,2 ) as t1
	where rank =1

--8 write a sql query to find the top 5 customers based on the highest total sale.

Select customer_id,
sum(total_sale)
from retail_sale 
group by 1
order by 2 desc
limit 5
--9 write a sql query to find the number of unique customer who purchased items from each category.

Select category, 
count(distinct (Customer_id)) as Unique_cust
from retail_sale
group by 1


--10 write a sql query to create each shift and number of orders (example morning< 12, Afternoon between 12 and 17, evening > 17)
With hourly_sale
As
(
Select *,
 	Case
		when extract (hour from sale_time ) <12 then 'Morning'
		When extract (hour from sale_time) between 12 and 17 then 'Afternoon'
		Else 'Evening'
	End as shift
From retail_sale
)
Select shift, count (*) as total_hours
from hourly_sale
group by shift

---End of project. 
