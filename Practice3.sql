/*1. Retrieve the names of all customers who have not updated their contact details.*/
select Name from Customer left join Customer_contact
on Customer.Customer_ID=Customer_contact.Customer_ID
where Customer_contact.Customer_ID is null;

/*2. Find the total number of drivers who have not taken any trips in the last year.*/
select count(Driver_ID) from Driver
where Driver_ID not in
(select Driver_ID from Trips
where year(Start_date_time) = year(now())-1);

/*3. List all trips that were completed in less than 30 minutes.*/
select Trip_ID,timestampdiff(minute,Start_date_time,End_date_time) as Trips_completed_in_30min from Trips
where Status='Completed' and timestampdiff(minute,Start_date_time,End_date_time)=30;

/*4. Retrieve the details of the trip with the highest fare.*/
select * from Trips
group by Trip_ID
order by Fare desc limit 1 ;

/*5. Insert a new payment mode into the PAYMENT_INFO table for 'Cryptocurrency'.*/
INSERT INTO Payment_info (Payment_ID, Payment_mode) 
VALUES
    (14, 'Cryptocurrency');

/*6. Update the rating of a driver given their DRIVER_ID.*/
update Driver
set Rating=3
where Driver_ID=2;

/*7. Delete a coupon from the COUPONS table given its VALUE.*/
delete from Coupons
where Value='25% Off';

/*8. Retrieve all drivers who have not updated their address details.*/
select Driver.Driver_ID from Driver left join Driver_address
on Driver.Driver_ID=Driver_address.Driver_ID
where Driver_address.Driver_ID is null;

/*9. Find the total number of trips taken in each city.*/
select City,count(Trip_ID) from Trips
join Customer_address
on Trips.Customer_ID=Customer_address.Customer_ID
group by City;

/*10. List all trips that started and ended in the same city.*/
select Trip_ID from Trips
where Start_location=End_location;

/*11. Retrieve the names of all customers who have taken trips with a fare less than 100.*/
select Name from Customer
where Customer_ID in
(select Customer_ID from Trips
where Fare<100);

/*12. Insert a new entry into the CUSTOMER table for a customer without a rating.*/
INSERT INTO Customer (Customer_ID, Name, Email, DOB) 
VALUES
    (9, 'John Doe', 'john@example.com', '1990-05-15');

/*13. Update the email of a customer given their EMAIL.*/
update Customer
set Email='lever@example.com'
where Email is null;

/*14. Delete a driver from the DRIVER table who has not taken any trips.*/
delete from Driver
where Driver_ID not in
(select Driver_ID from Trips);

/*15. Retrieve all trips that were paid using 'Net Banking'.*/
select Trip_ID from Trips
where Payment_mode='Net Banking';

/*16. Find the average distance covered in trips completed by a specific vehicle.*/
select avg(Distance) from Trips
where Vehicle_ID=3;

/*17. List all vehicles that have been used in trips with a fare greater than 1000.*/
select Vehicle_ID from Vehicle
where Vehicle_ID in
(select Vehicle_ID from Trips
where Fare>1000);

/*18. Retrieve the details of the first trip taken.*/
select * from Trips
group by Trip_ID
order by Start_date_time limit 1;

/*19. Insert a new contact for a customer into the CUSTOMER_CONTACT table.*/
INSERT INTO Customer_Contact (Customer_contact_ID, Customer_ID, Contact)
VALUES
    (8, 1, 1234567890);

/*20. Update the color of a vehicle given its model.*/
update Vehicle
set Color='Black'
where Model='Mercedes Benz';

/*21. Delete a driver’s address from the DRIVER_ADDRESS table given their PINCODE.*/
delete from Driver_address
where Pincode=700001;

/*22. Retrieve all trips that have a fare between 500 and 1000.*/
select Trip_ID from Trips
where Fare between 500 and 1000;

/*23. Find the total number of customers who have a rating of 4 or higher.*/
select count(Customer_ID) as Total_Customer from Customer
where Rating>=4;

/*24. List all trips that started from a specific city and ended in another city.*/
select Trip_ID from Trips
where Start_location='City Center' and End_location='Airport';

/*25. Retrieve the names and email addresses of all customers who have a rating less than 3.*/
select Name,Email from Customer
where Rating<3;

/*26. Insert a new address into the CUSTOMER_ADDRESS table for a customer who lives in 'Pune'.*/
INSERT INTO Customer_address (Customer_address_ID, Customer_ID, Address_line1, Address_line2, Address_line3, Landmark, Pincode, City, State)
VALUES
    (7, 1, '123, Main Street', 'Apartment 101', 'Near Park', 'Opposite XYZ School', 560001, 'Pune', 'Maharashtra');

/*27. Update the start date of a coupon given its VALUE.*/
update Coupons
set Start_date='2023-05-15'
where Value='10% Off';

/*28. Delete a customer’s contact from the CUSTOMER_CONTACT table given their contact number.*/
delete from Customer_contact
where contact=7890123456;

/*29. Retrieve all customers who live in 'Delhi' and have a rating greater than 5.*/
select Customer.Customer_ID from Customer
join Customer_address
on Customer.Customer_ID=Customer_address.Customer_ID
where City='Delhi' and Rating>5;

/*30. Find the total fare collected by each driver in the last month.*/
select Trips.Driver_ID,sum(Fare) from Trips
join Driver
on Trips.Driver_ID=Driver.Driver_ID
where month(End_date_time)=month(now())-1 and year(End_date_time)=year(now())
group by Trips.Driver_ID;

/*31. List all trips that ended at a specific landmark.*/
select Trip_ID from Trips
join Customer_address
on Trips.Customer_ID=Customer_address.Customer_ID
where Landmark='Opposite XYZ School'
group by Trip_ID;

/*32. Retrieve the names of all drivers who have taken trips with a distance greater than 20 KM.*/
select Name from Driver
where Driver_ID in
(select Driver_ID from Trips where Distance>20);

/*33. Insert a new entry into the PAYMENT_INFO table for 'PayPal'.*/
insert INTO Payment_info (Payment_ID, Payment_mode) 
VALUES
    (13, 'PayPal');


/*34. Update the model and color of a vehicle given its VEHICLE_ID.*/
update Vehicle
set Model='Renault Kwid',Color='Blue'
where Vehicle_ID=3;

/*35. Delete a driver’s address from the DRIVER_ADDRESS table given their CITY.*/
delete from Driver_address
where City='Pune';

/*36. Retrieve all trips that started in 'Bangalore' and ended in 'Chennai'.*/
select Trip_ID from Trips
where Start_location='Bangalore' and End_location='Chennai';

/*37. Find the total number of trips taken by each vehicle in the last month.*/
select Vehicle_ID,count(Trip_ID) from Trips
where month(End_date_time)=month(now())-1 and year(End_date_time)=year(now())
group by Vehicle_ID; 

/*38. List all trips that used a specific payment mode and coupon.*/
select Trip_ID from Trips
where Payment_mode='Credit card' and Coupon_ID=2;

/*39. Retrieve the names of all customers who have taken more than 5 trips in the last year.*/
select Name from Customer join Trips
on Customer.Customer_ID=Trips.Customer_ID
group by Name 
having count(Trip_ID)>5;

/*40. Insert a new driver into the DRIVER table for a driver without an email address.*/
INSERT INTO Driver (Driver_ID, Name, DOB, Rating) 
VALUES
    (9, 'Michael Jackson', '1985-07-20', 4);

/*41. Update the email of a customer given their NAME and new email address.*/
update Customer
set Email='john@example.com'
where Name='John Doe';

/*42. Delete a customer from the CUSTOMER table who has not updated their contact details.*/
delete from Customer_contact 
where Customer_ID is null;

/*43. Retrieve all trips that ended in 'Hyderabad' and used 'UPI'.*/
select Trip_ID from Trips
where End_location='Hydrabad' and Payment_mode='UPI';

/*44. Find the average fare for trips taken by drivers who have a rating less than 4.*/
select avg(Fare) from Trips join Driver
on Trips.Driver_ID=Driver.Driver_ID
where Rating<4;

/*45. List all vehicles that have traveled less than 50,000 KM and were manufactured after 2018.*/
select Vehicle_ID from Vehicle
where KM<50000 and Year(Year)>2018;

/*46. Retrieve the details of all trips taken by customers who live in 'Pune'.*/
select * from Trips join Customer_address
on Trips.Customer_ID=Customer_address.Customer_ID
where City='Pune';

/*47. Insert a new address into the CUSTOMER_ADDRESS table for a customer who lives in 'Kolkata'.*/
insert INTO Customer_address (Customer_address_ID, Customer_ID, Address_line1, Address_line2, Address_line3, Landmark, Pincode, City, State)
VALUES
    (6, 1, '123, Main Street', 'Apartment 101', 'Near Park', 'Opposite XYZ School', 560001, 'Kolkata', 'West Bengal');

/*48. Update the contact number of a customer given their CUSTOMER_CONTACT_ID.*/
update Customer_contact
set contact=9876543210
where Customer_contact_ID=7;

/*49. Delete a driver’s contact from the DRIVER_CONTACT table given their contact number.*/
delete from Driver_contact
where contact=6543210987;

/*50. Retrieve all trips that have an OTP starting with '123'.*/
select Trip_ID from Trips
where OTP like '123%';

/*51. Find the total fare collected for all trips taken by a specific customer.*/
select sum(Fare) from Trips
where Customer_ID=3;

/*52. List all customers who have a contact number ending in '5678'.*/
select Customer_ID from Customer_contact
where contact like '%5678';

/*53. Retrieve the details of the first trip taken by a specific driver.*/
select * from Trips
where Driver_ID=1
group by Trip_ID
order by End_date_time limit 1;

/*54. Insert a new payment mode into the PAYMENT_INFO table for 'Apple Pay'.*/
INSERT INTO Payment_info (Payment_ID, Payment_mode) 
VALUES
    (12, 'Apple Pay');

/*55. Update the rating of a driver given their NAME.*/
update Driver
set Rating=5
where Name='Michael Johnson';

/*56. Delete a customer’s address from the CUSTOMER_ADDRESS table given their ADDRESS_LINE1.*/
delete from Customer_address
where Address_line1='222, Cedar Street';

/*57. Retrieve all trips that were completed successfully and used a specific payment mode.*/
select Trip_ID from Trips
where Status='Completed' and Payment_mode='Credit card';

/*58. Find the average distance covered in trips taken by a specific customer.*/
select avg(Distance) from Trips
where Customer_ID=3;

/*59. List all drivers who have a contact number starting with '98765'.*/
select Driver_ID from Driver_contact
where contact like '98765%';

/*60. Retrieve the details of the most recent trip taken by a specific customer.*/
select * from Trips
where Customer_ID=1
group by Trip_ID
order by End_date_time desc limit 1;

/*61. Insert a new entry into the DRIVER_ADDRESS table for a driver who lives in 'Pune'.*/
INSERT INTO Driver_Address (Driver_address_ID, Driver_ID, Address_line1, Address_line2, Address_line3, Landmark, Pincode, City, State)
VALUES
    (6, 1, '123 Main St', 'Apt 1', NULL, 'Near Park', 110001, 'Pune', 'Maharashtra');

/*62. Update the model of a vehicle given its model and new model name.*/
update Vehicle
set Model='Volkswagen Vento'
where Model='Honda Civic';

/*63. Delete a customer’s address from the CUSTOMER_ADDRESS table given their CUSTOMER_ID.*/
delete from Customer_address
where Customer_ID=1;

/*64. Retrieve all trips that started in 'Hyderabad' and ended in 'Bangalore'.*/
select Trip_id from Trips
where Start_location='Hydrabad' and End_location='Bangalore';

/*65. Find the total number of trips taken by each driver in the last year.*/
select Driver_ID,count(Trip_ID) from Trips
where year(Start_date_time)=year(now())-1
group by Driver_ID;

/*66. List all trips that used a specific payment mode and have a fare greater than 500.*/
select Trip_ID from Trips
where Payment_mode='Credit card' and Fare>500;

/*67. Retrieve the names of all customers who have taken more than 10 trips in the last month.*/
select Name from Customer
join Trips
on Customer.Customer_ID=Trips.Customer_ID
where month(End_date_time)=month(now())-1 and year(End_date_time)=year(now())
group by Name 
having count(Trip_ID)>10;

/*68. Insert a new contact into the CUSTOMER_CONTACT table for a customer without a contact number.*/
INSERT INTO Customer_Contact (Customer_contact_ID, Customer_ID)
VALUES
    (7, 5);

/*69. Update the start and end date of a coupon given its COUPON_ID.*/
update Coupons
set Start_date='2021-06-03'
where Coupon_ID=3;

/*70. Delete a driver’s address from the DRIVER_ADDRESS table given their CITY and STATE.*/
delete from Driver_address
where City='New Delhi' and state='Delhi';

/*71. Retrieve all trips that have a fare less than 500 and used 'Credit Card'.*/
select Trip_ID from Trips
where Fare<500 and Payment_mode='Credit card';

/*72. Find the total fare collected for all trips taken by drivers who have a rating greater than 4.*/
select sum(fare) from Trips
join Driver
on Trips.Driver_ID=Driver.Driver_ID
where Rating>4;

/*73. List all customers who live in 'Mumbai' and have a rating greater than 4.*/
select Customer.Customer_ID from Customer
join Customer_address
on Customer.Customer_ID=Customer_address.Customer_ID
where City='Mumbai' and Rating>4;

/*74. Retrieve the details of all trips taken by drivers who have a rating less than 3.*/
select * from Trips
join Driver
on Trips.Driver_ID=Driver.Driver_ID
where Rating<3;

/*75. Insert a new entry into the PAYMENT_INFO table for 'Google Pay'.*/
INSERT INTO Payment_info (Payment_ID, Payment_mode) 
VALUES
    (11, 'Google Pay');

/*76. Update the email of a driver given their EMAIL and new email address.*/
update Driver
set Email='do@example.com'
where Email='dona@example.com';

/*77. Delete a customer’s address from the CUSTOMER_ADDRESS table given their PINCODE and CITY.*/
delete from Customer_address
where Pincode=700001 and City='Kolkata';

/*78. Retrieve all trips that started and ended on the same day.*/
select Trip_ID from Trips
where day(Start_date_time)=day(End_date_time);

/*79. Find the total number of trips taken by each customer in the last year.*/
select Customer_ID,count(Trip_ID) from Trips
where year(End_date_time)=year(now())-1
group by Customer_ID;

/*80. List all drivers who have not taken any trips in the last month.*/
select Driver_ID from Driver
where Driver_ID not in
(select Driver_ID from Trips
where month(now())-1 and year(now()));

/*81. Retrieve the details of the trip with the lowest fare.*/
select * from Trips
group by Trip_ID
order by Fare
limit 1;

/*82. Insert a new address into the DRIVER_ADDRESS table for a driver who lives in 'Hyderabad'.*/
INSERT INTO Driver_Address (Driver_address_ID, Driver_ID, Address_line1, Address_line2, Address_line3, Landmark, Pincode, City, State)
VALUES
    (11, 1, '123 Main St', 'Apt 1', NULL, 'Near Park', 110001, 'Hydrabad', 'Telangana');

/*83. Update the rating of a customer given their NAME and new rating.*/
update Customer
set Rating=5
where Name='John Doe';

/*84. Delete a customer’s contact from the CUSTOMER_CONTACT table given their CUSTOMER_ID and contact number.*/
delete from Customer_contact
where Customer_ID=5 and contact=8901234567;

/*85. Retrieve all trips that were paid using 'Google Pay'.*/
select Trip_ID from Trips
where Payment_mode='Google Pay';

/*86. Find the average fare for trips taken by customers who live in 'Delhi'.*/
select avg(Fare) from Trips
join Customer_address
on Trips.Customer_ID=Customer_address.Customer_ID
where City='Delhi';

/*87. List all vehicles that have traveled more than 100,000 KM and were manufactured before 2015.*/
select Model from Vehicle
where KM>100000 and year(Year)<2015;

/*88. Retrieve the details of all trips taken by customers who live in 'Chennai'.*/
select Trips.* from Trips
left join Customer_address
on Trips.Customer_ID=Customer_address.Customer_ID
where City='Chennai';

/*89. Insert a new address into the DRIVER_ADDRESS table for a driver who lives in 'Delhi'.*/
INSERT INTO Driver_Address (Driver_address_ID, Driver_ID, Address_line1, Address_line2, Address_line3, Landmark, Pincode, City, State)
VALUES
    (10, 1, '123 Main St', 'Apt 1', NULL, 'Near Park', 110001, 'New Delhi', 'Delhi');

/*90. Update the contact number of a driver given their DRIVER_CONTACT_ID and new contact number.*/
update Driver_contact
set contact=7543210987
where Driver_contact_ID=3;

/*91. Delete a customer’s address from the CUSTOMER_ADDRESS table given their CITY and STATE.*/
delete from Customer_address
where City='Goa' and State='Goa';

/*92. Retrieve all trips that used a specific coupon and have a fare less than 1000.*/
select Trips.Trip_ID
from Trips join Customer
on Trips.Customer_ID=Customer.Customer_ID
where Coupon_ID=2 and Fare<1000;

/*93. Find the total fare collected for all trips taken by customers who have a rating less than 3.*/
select sum(Fare) from Trips
join Customer
on Trips.Customer_ID=Customer.Customer_ID
where Rating<3;

/*94. List all customers who have a contact number starting with '12345'.*/
select Name from Customer
join Customer_contact
on Customer.Customer_ID=Customer_contact.Customer_ID
where contact like '12345%';

/*95. Retrieve the details of the most recent trip taken by a specific driver.*/
select Trips.* from Trips
left join Driver
on Trips.Driver_ID=Driver.Driver_ID
where Trips.Driver_ID=1
order by End_date_time desc
limit 1;

/*96. Insert a new entry into the PAYMENT_INFO table for 'Samsung Pay'.*/
INSERT INTO Payment_info (Payment_ID, Payment_mode) 
VALUES
    (10, 'Samsung Pay');


/*97. Update the year and category of a vehicle given its VEHICLE_ID and new details.*/
update Vehicle
set Year='2022-03-02', Category='Hatchback'
where Vehicle_ID=7;

/*98. Delete a driver’s address from the DRIVER_ADDRESS table given their ADDRESS_LINE1 and PINCODE.*/
delete from Driver_address
where Address_line1='789 Broadway' and Pincode=560001;

/*99. Retrieve all trips that ended in 'Delhi' and were completed in less than an hour.*/
select Trip_ID
from Trips join Customer_address
on Trips.Customer_ID=Customer_address.Customer_ID
where City='Delhi' and timestampdiff(hour,Start_date_time,End_date_time)<1;

/*100. Find the total fare collected for all trips taken by customers who have taken more than 5 trips.*/
select Customer_ID,sum(Fare) from Trips
group by Customer_ID
having count(Trip_ID)>5;

select * from Trips;
select * from Customer_address;

/* abs(timestampdiff(day,now(),Start_date_time))<=30
or
month(Date sub(now(),interval 30 day)) or month(Date add(now(),interval 15 day))*/

/* set foreign_key_checks=0
set foreign_key_checks=1*/
select * from vehicle;