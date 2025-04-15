create database Ola;
use Ola;
select * from bookings;

# 1. Retrieve all successful bookings:
create view Successful_Bookings as
select * from bookings 
where Booking_Status = 'Success';

select * from Successful_Bookings;


# 2. Find the average ride distance for each vehicle type:
create view Average_distance as
select Vehicle_Type, avg(Ride_Distance)
as Avg_Dist
from bookings 
group by Vehicle_Type;

select * from Average_distance; 


# 3. Get the total number of cancelled rides by customers:
create view Canceled_By_Customers as
select count(Booking_Status)
as Canceled_by_Customers
from bookings
where Booking_Status = 'Canceled by Customer';

select * from Canceled_By_Customers;

# 4. List the top 5 customers who booked the highest number of rides:
create view Top_5_Customers as
select Customer_Id, count(Booking_Id)
as Total_Rides
from bookings
group by Customer_Id
order by Total_Rides desc limit 5;

select * from Top_5_Customers;

# 5. Get the number of rides canceled by drivers due to personal and car-related issues:
create view cancelled_by_drivers_P_C_Issues as
select count(Canceled_Rides_by_Driver)
from bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from cancelled_by_drivers_P_C_Issues;


# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view Prime_Sedan_Rating as
select Vehicle_Type, 
max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from bookings
where Vehicle_Type = 'Prime Sedan'
group by Vehicle_Type;

 select * from Prime_Sedan_Rating;
 
 
# 7. Retrieve all rides where payment was made using UPI:
create view Payment_using_UPI as
select * from bookings 
where Payment_Method = 'UPI';

select * from Payment_using_UPI;


# 8. Find the average customer rating per vehicle type:
create view Avg_Cust_Rating as
select Vehicle_Type, 
avg(Customer_Rating) as Avg_Customer_Rating
from bookings
group by Vehicle_Type;

 select * from Avg_Cust_Rating;
 
 
# 9. Calculate the total booking value of rides completed successfully:
create view Total_Successful_Booking_Value as
select sum(Booking_Value) as Total_Successful_Value
from bookings
where Booking_Status = 'Success';

select * from Total_Successful_Booking_Value;


# 10. List all incomplete rides along with the reason:
create view All_Incomplete_Rides_along_with_reason as
select Booking_ID, Incomplete_Rides_Reason
from bookings 
where Incomplete_Rides = 'Yes';

select * from All_Incomplete_Rides_along_with_reason;