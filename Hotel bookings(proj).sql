create database Hotel_Bookings ;

-- 2) to find the information about the table
desc `hotel bookings`;
select * from `hotel bookings`;

-- 3) to display the first 10 records
select * from `hotel bookings` limit 10 ;

-- 4) to display the last 10 records
select * from `hotel bookings` order by arrival_date_year desc limit 10;

-- 5) to find the total number of records
select count(*) from `hotel bookings`;

-- 6) to find the null values count from the table.
select count(*) from `hotel bookings` where agent is null  ;
select count(*) from `hotel bookings` where company is null  ;

-- 7) to find all the unique records from the table
select distinct * from `hotel bookings`;

-- 8) Find the total count of the unique records from the table.
select count(*) from (select distinct * from `hotel bookings` as u1) as count_of_unique_val;

-- 9) to find the average lead_time based on the country
select country,avg(lead_time) from `hotel bookings` group by country ;

-- 10) What is the most common market segment in the hotel bookings dataset, and how many bookings belong to this segment?
select distinct(market_segment) , count(market_segment) as `count of market segment` from `hotel bookings` 
group by market_segment order by `count of market segment` desc LIMIT 1;

-- 11) What is the total number of bookings that were canceled and that were not canceled in the hotel bookings dataset?
select (select count(*) from `hotel bookings` where reservation_status = 'Canceled') as Bookings_Cancelled, 
(select count(*) from `hotel bookings` where reservation_status = 'Check-Out') as Bookings_Not_Cancelled ;

-- 12) Which hotel has the highest number of bookings in the dataset, and how many bookings were made for this hotel?
select distinct(hotel),count(hotel) as `No of Hotel Bookings` from `hotel bookings` 
group by hotel order by `No of Hotel Bookings` desc LIMIT 1;

-- 13) What is the distribution of hotel bookings between cancellations and non-cancellations
 select 
 (SELECT COUNT(*) FROM `hotel bookings`) as Bookings,
 (select count(*) from `hotel bookings` where reservation_status = 'Canceled') as Cancelled,
 (select Bookings *100.0 / Cancelled)
 AS percentage,
 (select count(*) from hotelbookings where is_canceled = 0) as Cancelled2,
 (select count(*) from hotelbookings where is_canceled = 1) as not_Cancelled,
 (select round(Cancelled2 *100.0 / Bookings,2))as percentage_of_cancellation,
 (select round(not_Cancelled2 *100.0 / Bookings,2)) as percentage_of_non_cancellations;
 
 -- 14) display the records from all the hotel bookings made through the direct market segment.
select * from `hotel bookings` where market_segment = 'Direct';

-- 15) display the records where the lead_time is above 250 and below 500
select * from `hotel bookings` where lead_time >200 and lead_time < 500; 
