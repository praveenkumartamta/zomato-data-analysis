CREATE TABLE zomato (
  Restaurant_Name varchar(40),
  Location varchar(20),
  City varchar(20),
  Cuisines varchar(30),
  Average_Cost_for_Two int,
  Currency varchar(5),
  Has_Table_Booking varchar(5),
  Has_Online_Delivery varchar(5),
  Aggregate_Rating decimal(10,1),
  Rating_Color varchar(20),
  Rating_Text varchar(30),
  Votes int,
  Restaurant_Type varchar(20),
  Address varchar(80),
  Phone_Number varchar(35),
  Price int,
  Quantity int,
  Sales int
);

copy zomato
from 'D:\Zomato clean data.csv'
delimiter ','
csv header


select * from zomato




--Top 5 most popular cuisines

select Cuisines , count(Restaurant_Name)as Restaurant_count
from zomato
group by Cuisines
order by Restaurant_count desc
limit 5



--Top Locations with most Restaurants

select Location , count(Restaurant_Name) as Total_Restaurant
from zomato
group by Location
order by  Total_Restaurant desc
limit 1



--Average cost for two per Location

select Location , round(avg(Average_cost_for_two),2) as avg_cost_for_two
from zomato
group by Location 
order by Avg_cost_for_two desc


-- Average Rating per Location

select Location , round(avg(Aggregate_rating),2) as avg_rating
from zomato
group by Location
order by avg_rating desc


--Correlation - like Analysis : High cost vs High Ratings

select Location ,round(avg(Average_cost_for_two),2) as avg_cost,
round(avg(Aggregate_rating),2) as avg_rating
from zomato
group by location 
order by avg_cost desc



--Restaurant Types with highest Average Rating


select Restaurant_type, round(avg(Aggregate_rating),2) as avg_rating
from zomato
group by Restaurant_type
order by avg_rating desc


--Online Delivery vs No Online Delivery (Percentage Analysis)


select Has_online_delivery ,
round(count(*)* 100.0/(select count(*)from zomato ),2) as percentage
from zomato
group by Has_online_delivery
order by percentage desc


 
--Table Booking Availability (Percentage Analysis)

select Has_table_booking as table_booking_stetus,
round(count(*) * 100.0 / (select count(*)from zomato),2)as percentage
from zomato
group by table_booking_stetus
order by  percentage desc


-- Most Reviewed Restaurants (by votes)

select Restaurant_Name ,Votes
from zomato
order by Votes desc
limit 10


--Rating Text Distribution (like 'Excellent','Good', etc)


select rating_text, count(*) as rating_count
from zomato
group by rating_text
order by rating_count desc


--Top Cuisine by Excellent Ratings

select cuisines , count(rating_text) as rating_count
from zomato
where rating_text = 'Excellent'
group by cuisines
order by rating_count desc
limit 1







