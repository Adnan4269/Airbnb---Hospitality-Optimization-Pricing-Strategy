show databases;
create database airbnb;
use airbnb;

#Q1 Import Data from both the .CSV files to create tables, Listings and Booking Details.
show tables;
select * from listings;
select * from booking_details;

#Q2 show names from Listings table
select name from booking_details;

#Q3 show total listings from the listings table
select count(id) from booking_details;

#Q4 show total listing_id from the booking_details table
select count(listing_id) from listings;

#Q5 show host ids from listings table
select host_id from booking_details;

#Q6 show all unique host name from listings table
select distinct host_name from booking_details;

#Q7 show all unique neighbourhood_group from listings table
select distinct neighbourhood_group  from booking_details;

#Q8 show all unique neighbourhood from listings table
select distinct neighbourhood  from booking_details;

#Q9 show unique room_type from listings tables
select distinct room_type from booking_details;

#Q10 show all values of Brooklyn & Manhattan from listings tables
select * from booking_details where neighbourhood_group in ('Brooklyn','Manhattan');

#Q11 show maximum price from booking_details table
select max(price) from listings;

#Q12 show minimum price fron booking_details table
select min(price) from listings; 

#Q13 show average price from booking_details table
select avg(price) from listings;

#Q14 show minimum value of  minimum_nights from booking_details table
select min(minimum_nights) from listings;

#Q15 show maximum value of minimum_nights from booking_details table
select max(minimum_nights) from listings;

#Q16 show average availability_365 
select avg(availability_365) from listings;

#Q17 show id , availability_365 and all availability_365 values greater than 300
select listing_id , availability_365 from listings where availability_365 >300;

#Q18 show count of id where price is in between 300 to 400
select count(listing_id) from listings where price between 300 and 400;

#Q19 show count of id  where minimum_nights spend is less than 5
select count(listing_id) from listings where minimum_nights <5;

#Q20 show count where minimum_nights spend is greater than 100
select count(listing_id) from listings where minimum_nights >100;

#Q21 show all data of listings & booking_details
select * from booking_details inner join listings on booking_details.id = listings.listing_id;

#Q22 show host name and price 
select booking_details.host_name , listings.price 
from booking_details inner join listings on booking_details.id = listings.listing_id;

#Q23 show room_type and price
select  booking_details.room_type,listings.price 
from booking_details inner join listings on booking_details.id = listings.listing_id;

#Q24 show neighbourhood_group & minimum_nights spend
select  booking_details.neighbourhood_group ,listings.minimum_nights 
from booking_details inner join listings on booking_details.id = listings.listing_id;

#Q25 show neighbourhood & availability_365
select  booking_details.neighbourhood ,listings.availability_365 
from booking_details inner join listings on booking_details.id = listings.listing_id;

#Q26 show total price by neighbourhood_group
select  booking_details.neighbourhood_group, sum(listings.price) Total_price 
from booking_details inner join listings on booking_details.id = listings.listing_id 
group by booking_details.neighbourhood_group;

#Q27 show maximum price by neighbourhood_group
select  booking_details.neighbourhood_group,max(listings.price) max_price  
from booking_details inner join listings on booking_details.id = listings.listing_id
group by booking_details.neighbourhood_group;

#Q28 show maximum night spend by neighbourhood_group
select  booking_details.neighbourhood_group, max(listings.minimum_nights) Max_night
from booking_details inner join listings on booking_details.id = listings.listing_id 
group by booking_details.neighbourhood_group;

#Q29 show maximum reviews_per_month spend by neighbourhood
select  booking_details.neighbourhood ,max(listings.reviews_per_month) max_review  
from booking_details inner join listings on booking_details.id = listings.listing_id 
group by booking_details.neighbourhood;

#Q30 show maximum price by room type
select  booking_details.room_type ,max(listings.price)max_price  
from booking_details inner join listings on booking_details.id = listings.listing_id 
group by booking_details.room_type;

#Q31 show average number_of_reviews by room_type
select  booking_details.room_type ,avg(listings.number_of_reviews) Average_no_reviews
from booking_details inner join listings on booking_details.id = listings.listing_id 
group by booking_details.room_type;

#Q32 show average price by room type
select  booking_details.room_type ,avg(listings.price) average_price 
from booking_details inner join listings on booking_details.id = listings.listing_id
group by booking_details.room_type;

#Q33 show average night spend by room type
select  booking_details.room_type ,avg(listings.minimum_nights) average_nights 
from booking_details inner join listings on booking_details.id = listings.listing_id
group by booking_details.room_type;

#Q34 show average price by room type but average price is less than 100
select  booking_details.room_type ,avg(listings.price) average_price 
from booking_details inner join listings on booking_details.id = listings.listing_id  
group by booking_details.room_type having average_price <100 ;

#Q35 show average night by neighbourhood and average_nights is greater than 5
select booking_details.neighbourhood , avg(listings.minimum_nights) average_nights 
from booking_details inner join listings on booking_details.id = listings.listing_id 
group by booking_details.neighbourhood having average_nights > 5;

#Q36 show all data from booking_details where price is greater than 200 using sub-query.
select * from booking_details where id in (select id from listings where Price  > 200);

#Q37 show all values from listings table where host id is 314941 using sub-query.
select * from listings where listing_id in ( select listing_id from booking_details where host_id = 314941);

#Q38 show all pairs of id having the same host id, each pair coming once only.
select distinct l1.id , l1.host_id from booking_details l1, booking_details l2
where  l1.host_id = l2.host_id and l1.id  <> l2.id  order by host_id;

#Q39 show fetch all records that have the term cozy in name 
select * from booking_details where name like '%cozy%'

#Q40 show price, host id, neighbourhood_group of manhattan neighbourhood_group
select n1.id , n1.host_name , n1.neighbourhood_group ,n2.price 
from booking_details n1 inner join listings n2 on n1.id = n2.listing_id
where n1.neighbourhood_group ='Manhattan'


#Q41 show id , host name, neighbourhood and price but only for Upper West Side & Williamsburg neighbourhood, also make sure price is greater than 100
select n1.id , n1.host_name , n1.neighbourhood ,n2.price 
from booking_details n1 inner join listings n2 on n1.id = n2.listing_id
where n1.neighbourhood in ('Upper West Side','Williamsburg') and n2.price >100;

#Q42 show id , host name, neighbourhood and price for host name Elise and neighbourhood is Bedford-Stuyvesant
select n1.id , n1.host_name , n1.neighbourhood, n2.price 
from booking_details n1 inner join listings n2 on n1.id = n2.listing_id
where n1.host_name = 'Elise' and n1.neighbourhood = 'Bedford-Stuyvesant'; 

#Q43 show host_name, availability_365,minimum_nights only for 100+ availability_365 and minimum_nights
select n1.id , n1.host_name ,n2.availability_365, n2.minimum_nights 
from booking_details n1 inner join listings n2 on n1.id = n2.listing_id
where n2.availability_365  >100 and n2.minimum_nights > 100;

#Q44 show to fetch id , host_name , number_of_reviews, and reviews_per_month but show only that records where number of reviews are 500+ and review per month is 5+
select n1.id , n1.host_name ,n2.number_of_reviews,n2.reviews_per_month
from booking_details n1 inner join listings n2 on n1.id = n2.listing_id
where n2.number_of_reviews  >500 and n2.reviews_per_month > 5;

#Q45 show neighbourhood_group which have  most  total number of review 
select n1.neighbourhood_group, sum(n2.number_of_reviews) Total_review
from booking_details n1 inner join listings n2 on n1.id = n2.listing_id
group by n1.neighbourhood_group order by Total_review desc limit 1;

#Q46 show host name which have most cheaper total price 
select n1.host_name, sum(n2.price) Total_price
from booking_details n1 inner join listings n2 on n1.id = n2.listing_id
group by n1.host_name order by Total_price asc limit 1;


#Q47 show host name which have most costly total price 
select n1.host_name, sum(n2.price) Total_price
from booking_details n1 inner join listings n2 on n1.id = n2.Listing_id
group by n1.host_name order by Total_price desc limit 1;

#Q48 show host name which have max price using sub-query
select n1.host_name ,n2.price
from booking_details n1 inner join listings n2 on n1.id = n2.listing_id
where n2.price in (select max(price) from listings);

#Q49 show neighbourhood_group where price is less than 100
select n1.neighbourhood_group , n2.price 
from booking_details n1 inner join listings n2 on n1.id = n2.listing_id
where n1.id in (select id from listings where price <100);

select * from booking_details;

#Q50 show max price, average availability_365 for each room type and order in ascending by maximum price
select n1.room_type ,n1.neighbourhood_group , max(n2.price)maximum_price , avg(n2.availability_365) average
from booking_details n1 inner join listings n2 on n1.id = n2.listing_id
group by n1.room_type, n1.neighbourhood_group order by maximum_price asc;


















