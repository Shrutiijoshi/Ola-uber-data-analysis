/*1	Retrieve the names of all drivers who live in 'Mumbai'.*/
select Name 
from Driver join Driver_address
on Driver.Driver_ID=Driver_address.Driver_ID
where City='Mumbai';

/*2	Find the total number of customers in each state.*/
select State,count(Customer.Customer_ID)
from Customer join Customer_address
on Customer.Customer_ID=Customer_address.Customer_ID
group by State;

/*3	List all trips that started and ended in different cities.*/
select Trip_ID,Start_location,End_location
from Trips
where Start_location <> End_location;

/*4	Retrieve the details of the longest trip taken by distance.*/
select * from Trips
group by Trip_ID
order by Distance desc
limit 1;

/*5	Insert a new driver contact into the DRIVER_CONTACT table.*/
INSERT INTO Driver_Contact (Driver_contact_ID, Driver_ID, Contact)
VALUES
    (6, 2, 9974523119);

/*6	Update the rating of a customer given their CUSTOMER_ID.*/
update Customer
set Rating=4
where Customer_ID=3;

/*7	Delete a coupon from the COUPONS table given its TEXT.*/
delete from Coupons
where Text='WEDDING20';

/*8	Retrieve all customers who have not updated their contact details.*/
select Customer.Customer_ID from Customer
left join Customer_contact 
on Customer.Customer_ID=Customer_contact.Customer_ID
where Customer_contact.Customer_ID is null;

/*9	Find the total number of trips taken in each month of the current year.*/
select month(Start_date_time) as Month, count(Trip_ID)
from Trips
where year(Start_date_time)=year(current_date())
group by Month
order by Month;

/*10	List all drivers who have taken trips with a fare greater than 1000.*/
select Name 
from Driver join Trips
on Driver.Driver_ID=Trips.Driver_ID
where Fare>1000;

/*11	Retrieve the names of all customers who live in 'Delhi'.*/
select Name 
from Customer join Customer_address
on Customer.Customer_ID=Customer_address.Customer_ID
where City='Delhi';

/*12	Insert a new entry into the CUSTOMER table for a customer without an email address.*/
INSERT INTO Customer (Customer_ID, Name, DOB, Rating)
VALUES (8, 'John lever', '1990-01-01', 5);


/*13	Update the email of a driver given their DRIVER_ID.*/
update Driver
set Email='dona@example.com'
where Driver_ID=7;

/*14	Delete a customer from the CUSTOMER table who has not taken any trips.*/
select Customer_ID from Customer
where Customer_ID not in
(select Customer_ID from Trips);

/*15	Retrieve all trips that were paid using 'Credit Card'.*/
select Trip_ID
from Trips
where Payment_mode='Credit card';

/*16	Find the average fare for trips completed by a specific driver.*/
select avg(Fare)
from Trips join Driver
on Trips.Driver_ID=Driver.Driver_ID
where Status='Completed' and Trips.Driver_ID=1;

/*17	List all vehicles that have not been used in any trips.*/
select Vehicle_ID,Model
from Vehicle
where Vehicle.Vehicle_ID not in
(Select Trips.Vehicle_ID
from Trips);

/*18	Retrieve the details of the most recent trip taken.*/
select * from Trips
order by Start_date_time desc
limit 1;

/*19	Insert a new address for a driver into the DRIVER_ADDRESS table.*/
INSERT INTO Driver_Address (Driver_address_ID, Driver_ID, Address_line1, Address_line2, Address_line3, Landmark, Pincode, City, State)
VALUES
    (9, 1, '123 Main St', 'Apt 1', NULL, 'Near Park', 110001, 'New Delhi', 'Delhi');


/*20	Update the category of a vehicle given its model.*/
update Vehicle
set Category='GLE class'
where Model='Mercedes Benz';

/*21	Delete a customer’s contact from the CUSTOMER_CONTACT table given their contact number.*/
delete from Customer_contact
where Contact=6237567090;

/*22	Retrieve all trips that have a distance less than 10 KM.*/
select Trip_ID from Trips
where Distance<10;

/*23	Find the total number of customers who have a rating of 3 or higher.*/
select count(Customer_ID)
from Customer
where Rating>=3;

/*24	List all drivers who have a contact number starting with '987'.*/
select Name
from Driver join Driver_contact
on Driver.Driver_ID=Driver_contact.Driver_ID
where Contact like '987%';

/*25	Retrieve the details of all trips taken during a specific month.*/
select * from Trips
where month(Start_date_time)=07;

/*26	Insert a new coupon into the COUPONS table with a specific start date.*/
INSERT INTO Coupons (Coupon_ID, Text, Value, Validity, Start_date) 
VALUES
    (9, 'WEDDING20', '20% Off', 30, '2021-06-01');


/*27	Update the start date of a coupon given its TEXT.*/
update Coupons
set Start_date='2022-07-11'
where Text='SUMMER20';

/*28	Delete a vehicle from the VEHICLE table that has traveled more than 200,000 KM.*/
delete from Vehicle
where KM>200000;

/*29	Retrieve all customers who live in 'Chennai' and have a rating greater than 4.*/
select Name 
from Customer join Customer_address
on Customer.Customer_ID=Customer_address.Customer_ID
where City='Chennai' and Rating>4;

/*30	Find the total fare collected for all trips using a specific vehicle.*/
select sum(Fare)
from Trips join Vehicle
on Trips.Vehicle_ID=Vehicle.Vehicle_ID
where Model='SUV';

/*31	List all trips that started from a specific landmark.*/
select Trip_ID from
Trips join Customer_address
on Trips.Customer_ID=Customer_address.Customer_ID
where Landmark='Near Library'
group by Trips.Trip_ID;

/*32	Retrieve the names and email addresses of all drivers who have a rating of 5.*/
select Name,Email
from Driver
where Rating=5;

/*33	Insert a new entry into the PAYMENT_INFO table for 'Digital Wallet'.*/
INSERT INTO Payment_info (Payment_ID, Payment_mode) 
VALUES
    (9, 'Digital Wallet');

/*34	Update the model and category of a vehicle given its VEHICLE_ID.*/
update Vehicle
set Model='Mercedes Benz',Category='Class A'
where Vehicle_ID=8;

/*35	Delete a customer’s address from the CUSTOMER_ADDRESS table given their PINCODE.*/
delete from Customer_address
where Pincode=110001;

/*36	Retrieve all trips that ended in 'Bangalore' and used a specific payment mode.*/
select * from Trips
join Customer_address
on Trips.Customer_ID=Customer_address.Customer_ID
where City='Bangalore' and Payment_mode='Credit card';

/*37	Find the total number of trips taken by customers who have a rating less than 3.*/
select count(Trip_ID)
from Trips join Customer
on Trips.Customer_ID=Customer.Customer_ID
where Rating<3;

/*38	List all drivers who have an address in 'Pune'.*/
select * from
Driver join Driver_address
on Driver.Driver_ID=Driver_address.Driver_ID
where City='Pune';

/*39	Retrieve the details of all trips taken by a specific customer within a date range.*/
select * from Trips
where Start_date_time between '2024-07-01 00:00:00' and '2024-07-25 23:59:59' and Customer_ID=1;


/*40	Insert a new trip into the TRIPS table with a specific coupon.*/
INSERT INTO Trips (Trip_ID, Customer_ID, Driver_ID, Vehicle_ID, Payment_ID, Fare, Status, Distance, Start_location, End_location, Start_date_time, End_date_time, Coupon_ID, Payment_mode, OTP) 
VALUES
    (8, 1, 1, 1, 1, 300, 'Completed', 15, 'City Center', 'Airport', '2024-07-01 10:00:00', '2024-07-01 10:30:00', 2, 'Credit Card', 1234);

/*41	Update the end date and time of a trip given its TRIP_ID.*/
update Trips
set End_date_time='2024-07-02 11:00:00'
where Trip_ID=1;

/*42	Delete a payment mode from the PAYMENT_INFO table that is no longer used.*/
delete from Payment_info
where Payment_mode='Cash';

/*43	Retrieve all trips that have an OTP ending in '1234'.*/
select * from Trips
where OTP like "%1234";

/*44	Find the average distance covered by trips in a specific year.*/
select avg(Distance)
from Trips
where Year(Start_date_time)=2024;

/*45	List all customers who have not updated their address details.*/
select Customer.Customer_ID from Customer
left join Customer_address
on Customer.Customer_ID=Customer_address.Customer_ID
where Customer_address.Customer_ID is null;

/*46	Retrieve the details of all vehicles that are 'Red' and have traveled less than 50,000 KM.*/
select * from Vehicle
where Color='Red' and KM<50000;

/*47	Insert a new customer address into the CUSTOMER_ADDRESS table for a customer who lives in 'Goa'.*/
INSERT INTO Customer_address (Customer_address_ID, Customer_ID, Address_line1, Address_line2, Address_line3, Landmark, Pincode, City, State)
VALUES
    (8, 1, '123, Main Street', 'Apartment 101', 'Near Park', 'Opposite XYZ School', 560001, 'Goa', 'Goa');

/*48	Update the contact number of a driver given their DRIVER_CONTACT_ID.*/
update Driver_contact
set contact=8432109876
where Driver_contact_ID=5;

/*49	Delete a customer from the CUSTOMER table who has a rating less than 2.*/
delete from Customer
where Rating<2;

/*50	Retrieve all trips that were completed within the last month.*/
select * from Trips
where month(End_date_time)=month(now())-1 and year(End_date_time)=year(now()) and Status='completed';

/*51	Find the total fare collected by each driver in a specific month.*/
select sum(fare),Name 
from Driver join Trips
on Driver.Driver_ID=Trips.Driver_ID
where month(Start_date_time)=07
group by Name;

/*52	List all vehicles that are 'SUV' and were manufactured in '2020'.*/
select Model
from Vehicle
where Category='SUV' and Year=2020;

/*53	Retrieve the names of all customers who have taken a trip with a fare greater than 500.*/
select Name 
from Customer join Trips
on Customer.Customer_ID=Trips.Customer_ID
where Fare>500;

/*54	Insert a new address for a customer into the CUSTOMER_ADDRESS table for a customer who lives in 'Delhi'.*/
INSERT INTO Customer_address (Customer_address_ID, Customer_ID, Address_line1, Address_line2, Address_line3, Landmark, Pincode, City, State)
VALUES
    (7, 1, '123, Main Street', 'Apartment 101', 'Near Park', 'Opposite XYZ School', 110001, 'New Delhi', 'Delhi');


/*55	Update the start and end location of a trip given its TRIP_ID.*/
update Trips
set Start_location='Baner',End_location='Hinjewadi'
where Trip_ID=1;

/*56	Delete a driver’s contact from the DRIVER_CONTACT table given their contact number.*/
delete from Driver_contact
where contact=4321098765;

/*57	Retrieve all trips that started and ended on the same date.*/
select * from Trips
where date(Start_date_time)=date(End_date_time);

/*58	Find the total number of trips taken by each customer in a specific month.*/
select Name,count(Trip_ID)
from Customer join Trips
on Customer.Customer_ID=Trips.Customer_ID
where month(Start_date_time)=07
group by Name;

/*59	List all drivers who have taken more than 5 trips in the last week.*/
select Driver.Driver_ID from Driver
join Trips
on Driver.Driver_ID=Trips.Driver_ID
where week(Start_date_time)=week(now()-1) and year(Start_date_time)=year(now())
group by Driver.Driver_ID
having count(Trip_ID)>5;

/*60	Retrieve the details of all trips taken by a specific driver within a date range.*/
select * from Trips
where Start_date_time between '2024-06-10 00:00:00' and '2024-06-25 23:59:59' and Driver_ID=3;

/*61	Insert a new driver address into the DRIVER_ADDRESS table for a driver who lives in 'Kolkata'.*/
INSERT INTO Driver_Address (Driver_address_ID, Driver_ID, Address_line1, Address_line2, Address_line3, Landmark, Pincode, City, State)
VALUES
    (8, 3, '123 Main St', 'Apt 1', NULL, 'Near Park', 110031, 'Kolkata', 'West Bengal');

/*62	Update the model of a vehicle given its VEHICLE_ID and new model name.*/
update Vehicle
set Model='Sedan'
where Vehicle_ID=3;

/*63	Delete a customer’s address from the CUSTOMER_ADDRESS table given their CITY.*/
delete from Customer_address
where City='Bangalore';

/*64	Retrieve all trips that used a specific coupon and payment mode.*/
select * from Trips
where Coupon_ID=2 and Payment_mode='UPI';

/*65	Find the average rating of customers who have taken more than 10 trips.*/
select Customer.Customer_ID,avg(Rating)
from Customer join Trips
on Customer.Customer_ID=Trips.Customer_ID
group by Customer_ID
having count(Trip_ID)>10;

/*66	List all drivers who have not updated their address details.*/
SELECT Driver.Driver_ID
FROM driver left join Driver_address
on driver.Driver_ID=Driver_address.Driver_ID
WHERE Driver_address.Driver_ID IS NULL;

/*67	Retrieve the details of all trips taken by customers who live in 'Hyderabad'.*/
select * from 
Trips join Customer_address
on Trips.Customer_ID=Customer_address.Customer_ID
where City='Hydrabad';

/*68	Insert a new entry into the CUSTOMER_CONTACT table for a customer with a specific contact number.*/
INSERT INTO Customer_Contact (Customer_contact_ID, Customer_ID, Contact)
VALUES
    (6, 4, 6237567090);

/*69	Update the start date of a coupon given its COUPON_ID and new start date.*/
update Coupons
set Start_date='2023-07-01'
where Coupon_ID=2;

/*70	Delete a vehicle from the VEHICLE table given its model and color.*/
delete from Vehicle
where Model='SUV' and Color='Black';

/*71	Retrieve all customers who live in 'Bangalore' and have a rating less than 3.*/
select * from
Customer join Customer_address
on Customer.Customer_ID=Customer_address.Customer_ID
where City='Bangalore' and Rating<3;

/*72	Find the total fare collected for all trips completed in a specific year.*/
select sum(fare) from Trips
where Year(End_date_time)='2024';

/*73	List all trips that started from a specific location and ended in 'Mumbai'.*/
select * from Trips
where Start_location='Park' and End_location='Museum';

/*74	Retrieve the names and contact numbers of all drivers who have a rating less than 4.*/
select Name,Contact
from Customer join Customer_contact
on Customer.Customer_ID=Customer_contact.Customer_ID
where Rating<4;

/*75	Insert a new payment mode into the PAYMENT_INFO table for 'UPI'.*/
INSERT INTO Payment_info (Payment_ID, Payment_mode) 
VALUES
    (8, 'UPI');

/*76	Update the year and color of a vehicle given its VEHICLE_ID.*/
update Vehicle
set Year='2022-04-06', Color='Silver'
where Vehicle_ID=2;

/*77	Delete a customer’s contact from the CUSTOMER_CONTACT table given their CUSTOMER_ID and contact number.*/
delete from Customer_contact
where Customer_ID=2;

/*78	Retrieve all trips that ended in 'Pune' and were completed successfully.*/
select * from
Trips join Customer_address
on Trips.Customer_ID=Customer_address.Customer_ID
where City='Pune' and Status='Completed';

/*79	Find the total number of trips taken by customers who live in 'Delhi'.*/
select count(Trip_ID)
from Customer join Trips
on Customer.Customer_ID=Trips.Customer_ID
join Customer_address
on Customer.Customer_ID=Customer_address.Customer_ID
where City='Delhi';

/*80	List all drivers who have taken trips that started and ended in different cities.*/
select Name 
from Driver join Trips
on Driver.Driver_ID=Trips.Driver_ID
where Start_location='Office Complex' and End_location='Restaurant';

/*81	Retrieve the details of the shortest trip taken by distance.*/
select * from Trips
group by Trip_ID
order by Distance
limit 1;


/*82	Insert a new entry into the DRIVER table for a driver who was born in '1995'.*/
INSERT INTO Driver (Driver_ID, Name, Email, DOB, Rating) 
VALUES
    (8, 'Michael Jackson', 'mi_jack@example.com', '1995-07-25', 4);

/*83	Update the email of a customer given their NAME.*/
update Customer
set Email='smith@example.com'
where Name='Jane Smith';

/*84	Delete a customer from the CUSTOMER table who has a rating of 1.*/
delete from Customer
where Rating=1;

/*85	Retrieve all trips that were paid using 'Debit Card'.*/
select * from Trips 
where Payment_mode='Debit card';

/*86	Find the average fare for trips taken by customers who live in 'Mumbai'.*/
select Name,avg(Fare)
from Customer join Trips
on Customer.Customer_ID=Trips.Customer_ID
join Customer_address
on Customer.Customer_ID=Customer_address.Customer_ID
where City='Mumbai'
group by Name;

/*87	List all vehicles that have been used in more than 20 trips.*/
select Model
from Vehicle join Trips
on Vehicle.Vehicle_ID=Trips.Vehicle_ID
group by Model
having count(Trip_ID)>20;

/*88	Retrieve the details of the first trip taken by a specific customer.*/
select *
from Customer join Trips
on Customer.Customer_ID=trips.Customer_ID
order by Trip_ID 
limit 1;

/*89	Insert a new address for a driver into the DRIVER_ADDRESS table for a driver who lives in 'Chennai'.*/
INSERT INTO Driver_Address (Driver_address_ID, Driver_ID, Address_line1, Address_line2, Address_line3, Landmark, Pincode, City, State)
VALUES
    (7, 2, '123 Park', 'Apt 4', NULL, 'Near City center', 120001, 'New Delhi', 'Delhi');

/*90	Update the category of a vehicle given its model and new category.*/
update Vehicle
set Category='Sedan'
where Model='Toyota Camry';

/*91	Delete a customer’s contact from the CUSTOMER_CONTACT table given their CUSTOMER_ID.*/
delete from Customer_contact
where Customer_ID=1;

/*92	Retrieve all trips that have a fare between 100 and 500.*/
select * from Trips
where fare between 100 and 500;

/*93	Find the total number of customers who have not taken any trips in the last month.*/
select count(Customer.Customer_ID)
from Customer left join Trips
on Customer.Customer_ID=Trips.Customer_ID
where month(Start_date_time)=month(now()-1);


/*94	List all drivers who have a contact number ending in '1234'.*/
select Name 
from Driver join Driver_contact
on Driver.Driver_ID=Driver_contact.Driver_ID
where contact like '%1234';

/*95	Retrieve the details of all trips taken in a specific month and year.*/
select * from trips
where month(Start_date_time)=07 and year(Start_date_time)=2024;

/*96	Insert a new coupon into the COUPONS table with a specific value and validity.*/
INSERT INTO Coupons (Coupon_ID, Text, Value, Validity, Start_date) 
VALUES
    (8, 'SUMMER50', '40% Off', 20, '2020-06-01');

/*97	Update the validity of a coupon given its TEXT and new validity period.*/
update Coupons
set Validity='10'
where Text='FREERIDE';

/*98	Delete a vehicle from the VEHICLE table that has a specific color and year.*/
delete from Vehicle
where Color='Black' and Year='2023-01-01';

/*99	Retrieve all customers who live in 'Hyderabad' and have taken more than 3 trips.*/
 select Name from Customer 
 join Trips
 on Customer.Customer_ID=Trips.Customer_ID
 join Customer_address
 on Customer.Customer_ID=Customer_address.Customer_ID
 where City='Hydrabad'
 group by Name 
 having count(Trip_ID)>3;

/*100	Find the total fare collected for all trips that used a specific payment mode and coupon.*/
select sum(Fare) from Trips
where Payment_mode='Credit card' and Coupon_ID=1;
