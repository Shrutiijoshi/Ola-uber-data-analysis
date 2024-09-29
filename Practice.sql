create database ola_uber;

use ola_uber;

create table Customer
( Customer_ID int primary key,
Name varchar(20),
Email varchar(20),
DOB date,
Rating int);

create table Driver
( Driver_ID int primary key,
Name varchar(20),
Email varchar(20),
DOB date,
Rating int);

create table Payment_info
( Payment_ID int primary key,
Payment_mode varchar(20));

create table Vehicle
( Vehicle_ID int primary key,
Model varchar(20),
Category varchar(20),
Year date,
Color varchar(20),
KM int);

create table Coupons
( Coupon_ID int primary key,
Text varchar(20) unique,
Value varchar(20),
Validity int,
Start_date date);

create table Trips
( Trip_ID int primary key,
Customer_ID int,
Driver_ID int,
Vehicle_ID int,
Payment_ID int,
Fare int,
Status varchar(20),
Distance int,
Start_location varchar(20),
End_location varchar(20),
Start_date_time datetime,
End_date_time datetime,
Coupon_ID int,
Payment_mode varchar(20),
OTP int,
foreign key (Customer_ID) references Customer(Customer_ID),
foreign key (Driver_ID) references Driver(Driver_ID),
foreign key (Vehicle_ID) references Vehicle(Vehicle_ID),
foreign key (Coupon_ID) references Coupons(Coupon_ID),
foreign key (Payment_ID) references Payment_info(Payment_ID)
);

create table Customer_address
( Customer_address_ID int primary key,
Customer_ID int,
Address_line1 varchar(50) not null,
Address_line2 varchar(50),
Address_line3 varchar(50),
Landmark varchar(20),
Pincode int,
City varchar(20),
State enum('Andhra Pradesh','Arunachal Pradesh','Assam','Bihar',
'Chhasttisgarh','Goa','Gujarat','Haryana','Himachal Pradesh','Jharkhand',
'Karnataka','Kerala','Madhya Pradesh','Maharashtra','Manipur',
'Meghalaya','Mizoram','Nagaland','Odisha','Punjab','Rajasthan',
'Sikkim','TamilNadu','Telangana','Tripura','Uttar Pradesh','Uttarakhand',
'West Bengal','Andaman and Nicobar','Islands','Chandigarh','Dadra and
Nagar Haveli and Daman and Diu','Lakshadweep','Delhi','Puducherry',
'Jammu and Kashmir','Ladakh'),
foreign key (Customer_ID) references Customer(Customer_ID)
);

create table Customer_Contact
(Customer_contact_ID int primary key,
Customer_ID int,
Contact bigint,
foreign key (Customer_ID) references Customer(Customer_ID)
);

create table Driver_Contact
(Driver_contact_ID int primary key,
Driver_ID int,
Contact bigint,
foreign key (Driver_ID) references Driver(Driver_ID)
);

create table Driver_Address
(Driver_address_ID int primary key,
Driver_ID int,
Address_line1 varchar(50) not null,
Address_line2 varchar(50),
Address_line3 varchar(50),
Landmark varchar(20),
Pincode int,
City varchar(20),
State enum('Andhra Pradesh','Arunachal Pradesh','Assam','Bihar',
'Chhasttisgarh','Goa','Gujarat','Haryana','Himachal Pradesh','Jharkhand',
'Karnataka','Kerala','Madhya Pradesh','Maharashtra','Manipur',
'Meghalaya','Mizoram','Nagaland','Odisha','Punjab','Rajasthan',
'Sikkim','TamilNadu','Telangana','Tripura','Uttar Pradesh','Uttarakhand',
'West Bengal','Andaman and Nicobar','Islands','Chandigarh','Dadra and
Nagar Haveli and Daman and Diu','Lakshadweep','Delhi','Puducherry',
'Jammu and Kashmir','Ladakh'),
foreign key (Driver_ID) references Driver(Driver_ID)
);

INSERT INTO Customer (Customer_ID, Name, Email, DOB, Rating) 
VALUES
    (1, 'John Doe', 'john@example.com', '1990-05-15', 4),
    (2, 'Jane Smith', 'jane@example.com', '1985-08-25', 5),
    (3, 'Michael Johnson', 'michael@example.com', '1982-11-10', 3),
    (4, 'Emily Brown', 'emily@example.com', '1995-03-02', 5),
    (5, 'David Wilson', 'david@example.com', '1978-09-18', 4);
    
INSERT INTO Driver (Driver_ID, Name, Email, DOB, Rating) 
VALUES
    (1, 'Michael Johnson', 'mi_drive@example.com', '1985-07-20', 4),
    (2, 'Emily Brown', 'em_drive@example.com', '1990-04-12', 5),
    (3, 'David Wilson', 'da_drive@example.com', '1983-09-05', 3),
    (4, 'Sarah Davis', 'sa_drive@example.com', '1992-01-30', 4),
    (5, 'Ryan Miller', 'ry_drive@example.com', '1988-11-15', 5);

INSERT INTO Payment_info (Payment_ID, Payment_mode) 
VALUES
    (1, 'Credit Card'),
    (2, 'Debit Card'),
    (3, 'UPI'),
    (4, 'Wallet'),
    (5, 'Cash');
    
INSERT INTO Vehicle (Vehicle_ID, Model, Category, Year, Color, KM) 
VALUES
    (1, 'Toyota Camry', 'Sedan', '2020-01-01', 'Black', 15000),
    (2, 'Honda Civic', 'Sedan', '2019-05-01', 'White', 20000),
    (3, 'Hyundai i20', 'Hatchback', '2018-08-01', 'Red', 18000),
    (4, 'Ford EcoSport', 'SUV', '2017-03-01', 'Silver', 25000),
    (5, 'Maruti Swift', 'Hatchback', '2019-11-01', 'Blue', 22000);
    
INSERT INTO Coupons (Coupon_ID, Text, Value, Validity, Start_date) 
VALUES
    (1, 'SUMMER20', '20% Off', 30, '2024-06-01'),
    (2, 'FIRSTRIDE', '50 Rs Off', 15, '2024-07-01'),
    (3, 'FREERIDE', 'Free Ride', 1, '2024-07-04'),
    (4, 'SAVE10', '10% Off', 45, '2024-05-15'),
    (5, 'HOLIDAY50', '50 Rs Off', 20, '2024-07-10');
    
INSERT INTO Trips (Trip_ID, Customer_ID, Driver_ID, Vehicle_ID, Payment_ID, Fare, Status, Distance, Start_location, End_location, Start_date_time, End_date_time, Coupon_ID, Payment_mode, OTP) 
VALUES
    (1, 1, 1, 1, 1, 300, 'Completed', 15, 'City Center', 'Airport', '2024-07-01 10:00:00', '2024-07-01 10:30:00', NULL, 'Credit Card', 1234),
    (2, 2, 2, 2, 2, 250, 'Completed', 12, 'Shopping Mall', 'Residential Area', '2024-07-02 15:00:00', '2024-07-02 15:30:00', 1, 'Debit Card', 4321),
    (3, 3, 3, 3, 3, 400, 'Cancelled', 20, 'Office Complex', 'Restaurant', '2024-07-03 12:00:00', NULL, NULL, 'Cash', 5678),
    (4, 4, 4, 4, 4, 350, 'Completed', 18, 'Suburb', 'City Center', '2024-07-04 09:00:00', '2024-07-04 09:45:00', 2, 'UPI', 7890),
    (5, 5, 5, 5, 5, 280, 'Completed', 10, 'Park', 'Museum', '2024-07-05 17:00:00', '2024-07-05 17:15:00', NULL, 'Wallet', 6543);

INSERT INTO Customer_address (Customer_address_ID, Customer_ID, Address_line1, Address_line2, Address_line3, Landmark, Pincode, City, State)
VALUES
    (1, 1, '123, Main Street', 'Apartment 101', 'Near Park', 'Opposite XYZ School', 560001, 'Bangalore', 'Karnataka'),
    (2, 2, '456, Elm Street', NULL, NULL, 'Near ABC Mall', 400001, 'Mumbai', 'Maharashtra'),
    (3, 3, '789, Oak Street', 'Flat B2', 'Behind Church', 'Near DEF Market', 700001, 'Kolkata', 'West Bengal'),
    (4, 4, '101, Pine Street', 'Unit 5', NULL, 'Near GHI Hospital', 110001, 'Delhi', 'Delhi'),
    (5, 5, '222, Cedar Street', NULL, NULL, 'Near JKL Park', 600001, 'Chennai', 'TamilNadu');

INSERT INTO Customer_Contact (Customer_contact_ID, Customer_ID, Contact)
VALUES
    (1, 1, 1234567890),
    (2, 2, 9876543210),
    (3, 3, 8765432109),
    (4, 4, 7890123456),
    (5, 5, 8901234567);
    
INSERT INTO Driver_Contact (Driver_contact_ID, Driver_ID, Contact)
VALUES
    (1, 1, 9876543210),
    (2, 2, 8765432109),
    (3, 3, 7654321098),
    (4, 4, 6543210987),
    (5, 5, 5432109876);
    
INSERT INTO Driver_Address (Driver_address_ID, Driver_ID, Address_line1, Address_line2, Address_line3, Landmark, Pincode, City, State)
VALUES
    (1, 1, '123 Main St', 'Apt 1', NULL, 'Near Park', 110001, 'New Delhi', 'Delhi'),
    (2, 2, '456 Market St', 'Suite 200', NULL, 'Opposite Mall', 400001, 'Mumbai', 'Maharashtra'),
    (3, 3, '789 Broadway', NULL, NULL, 'Near Temple', 560001, 'Bangalore', 'Karnataka'),
    (4, 4, '101 High St', NULL, NULL, 'Next to Bank', 600001, 'Chennai', 'TamilNadu'),
    (5, 5, '202 Hill Rd', 'Floor 3', 'Building B', 'Near School', 700001, 'Kolkata', 'West Bengal');

-- Insert a new customer into the CUSTOMER table.
INSERT INTO Customer (Customer_ID, Name, Email, DOB, Rating)
VALUES (6, 'John Doe', 'johndoe@example.com', '1990-01-01', 5);

-- 2.	Update the email of a customer given their CUSTOMER_ID.
update Customer
set Email='johndoe@example.com'
where Customer_ID=1;

-- 3
delete from Driver
where Driver_ID=5;

-- 4
select * from Customer
where Rating>4;

-- 5
select Name,Trips.Customer_ID,count(Trip_ID) as Total_trips
 from Trips join Customer
 on Trips.Customer_ID=Customer.Customer_ID
 where Trips.Customer_ID=3;

-- 6
select * from Vehicle
where Category='SUV';

-- 7
select * from Trips
where Coupon_ID=2;

-- 8 
select Name,Trips.Driver_ID,count(Trip_ID)
from Trips join Driver
on Trips.Driver_ID=Driver.Driver_ID
group by Trips.Driver_ID;

-- 9
INSERT INTO Payment_info (Payment_ID, Payment_mode)
VALUES (6, 'Credit Card');

-- 10
update Vehicle
set Model='SUV'
where Vehicle_ID=5;

-- 11
delete from Coupons
where Coupon_ID=1;

-- 12
select * from Driver
where Rating<3;

-- 13
select Name,Trips.Driver_ID,sum(Fare)
from Trips join Driver
on Trips.Driver_ID=Driver.Driver_ID
where Trips.Driver_ID=2;
 
-- 14
select Name,Trips.Customer_ID,count(Trip_ID)
from Trips join Customer
on Trips.Customer_ID=Customer.Customer_ID
group by Trips.Customer_ID
having count(Trip_ID)>5; 

-- 15
select * from Customer_contact
where Customer_ID=2;

-- 16
INSERT INTO Customer_address (Customer_address_ID, Customer_ID, Address_line1, Address_line2, Address_line3, Landmark, Pincode, City, State)
VALUES (6, 1, '456 Elm St', 'Apt 5', NULL, 'Near Library', 500081, 'Hyderabad', 'Telangana');
  
-- 17
update Driver_address
set Landmark='Near Park'
where Driver_address_ID=5;

-- 18
delete Address_line1 from Driver_address
where Driver_address_ID=4;

-- 19 
select * from Trips
where Start_location='Shopping Mall';

-- 20
select avg(Rating)
 from Driver;
 
 -- 21
 INSERT INTO Driver (Driver_ID, Name, Email, DOB, Rating) 
VALUES
    (6, 'Olivia Thompson', 'ol_drive@example.com', '1995-06-25', 5);
    
-- 22
update Customer_address
set State='Karnataka'
where Customer_address_ID=1;

-- 23
delete from Customer_contact
where Customer_contact_ID=2;

-- 24
select * from Trips
where Payment_mode='cash'; 

-- 25
select sum(Distance)
from Trips; 

-- 26
select Driver.Driver_ID,Name 
from Driver left join Trips
on Driver.Driver_ID=Trips.Driver_ID
where Trips.Driver_ID is null;

-- 27
select * from Vehicle
where  year>2015;

-- 28
INSERT INTO Coupons (Coupon_ID, Text, Value, Validity, Start_date) 
VALUES
    (6, 'WINTER25', '25% Off', 60, '2024-08-01');

-- 29
update Coupons
set Validity=65
where Coupon_ID=6;

-- 30
delete from Vehicle
where Vehicle_ID=2;

-- 31
select Customer_ID,Name  
from Customer
where DOB>1990;

-- 32
select City,count(Customer_ID)
from Customer_address
group by City;

-- 33
select * from Trips
where Status='Completed';

-- 34
select Email
from Driver;

-- 35
INSERT INTO Driver_Contact (Driver_contact_ID, Driver_ID, Contact)
VALUES
    (6, 6, 4321098765);
    
-- 36
update Customer_address
set City='Pune'
where  Customer_address_ID=2;

-- 37
delete from Trips
where Trip_ID=2;

-- 38
select * from Trips
where End_location= 'Restaurant';

-- 39
select max(Fare)
from Trips
limit 1;

-- 40
select * from Customer
where Rating=5;   

-- 41
select * from Trips
where year(Start_date_time)='2024'; 

-- 42
INSERT INTO Trips (Trip_ID, Customer_ID, Driver_ID, Vehicle_ID, Payment_ID, Fare, Status, Distance, Start_location, End_location, Start_date_time, End_date_time, Coupon_ID, Payment_mode, OTP) 
VALUES
    (7, 2, 2, 2, 2, 300, 'Cancelled', 15, 'City Center', 'Airport', '2024-07-01 10:00:00', '2024-07-01 10:30:00', NULL, 'Credit Card', 1234);

-- 43
update Trips
set Start_location='Dmart'
where Trip_ID=1;

-- 44
delete from Payment_info
where Payment_ID=2;

-- 45
select * from Driver
where DOB<1980;

-- 46
select Trips.Vehicle_ID,Model,count(Trip_ID)
from Trips join Vehicle
on Trips.Vehicle_ID=Vehicle.Vehicle_ID
group by Vehicle_ID;
  
-- 47
select * from Vehicle
where KM>100000;

-- 48
select Name from Customer; 

-- 49
INSERT INTO Driver_Address (Driver_address_ID, Driver_ID, Address_line1, Address_line2, Address_line3, Landmark, Pincode, City, State)
VALUES
    (6, 2, '123 Main St', 'Apt 1', NULL, 'Near Park', 110001, 'New Delhi', 'Delhi');

-- 50
update Vehicle
set Color= 'Royal Blue'
where Vehicle_ID=3; 

-- 51
delete from Driver_contact
where Driver_contact_ID=2;

-- 52
select * from Trips
where Coupon_ID=2;

-- 53
select State,count(Driver_ID) as Total_drivers
from Driver_address
group by State;

-- 54
select * from Trips
where Status='Cancelled';

-- 55
select * from Driver_contact;

-- 56
INSERT INTO Customer_Contact (Customer_contact_ID, Customer_ID, Contact)
VALUES
    (6, 1, 4234567890);
    
-- 57
update Customer_address
set Pincode=560011
where Customer_address_ID=1;

-- 58
delete from Customer_address
where Customer_address_ID=1;

-- 59
select * from Trips
where Fare>500;

-- 60
select avg(Fare)
from trips;

-- 61
select Customer_ID,Name
from Customer
where Customer_ID not in
(select Customer_ID from Trips);

-- 62
select * from Vehicle
where Model='SUV';

-- 63
INSERT INTO Vehicle (Vehicle_ID, Model, Category, Year, Color, KM) 
VALUES
    (8, 'Toyota Camry', 'SUV', '2021-02-01', 'Blue', 20000);
   
-- 64
update Vehicle
set Category='SUV'
where Vehicle_ID=1;

-- 65
delete from Customer
where Customer_ID=3;

-- 66
select * from Trips
join Driver_address
on Trips.Driver_ID=Driver_address.Driver_ID
where Driver_address.City='Pune';

-- 67
select Payment_mode,count(Trip_ID)
from Trips
group by Payment_mode;

-- 68
select Name from Driver
where Rating>=4;

-- 69
select Email from Customer;

-- 70
INSERT INTO Trips (Trip_ID, Customer_ID, Driver_ID, Vehicle_ID, Payment_ID, Fare, Status, Distance, Start_location, End_location, Start_date_time, End_date_time, Coupon_ID, Payment_mode, OTP) 
VALUES
    (6, 1, 1, 1, 1, 300, 'Completed', 15, 'City Center', 'Airport', '2024-07-01 10:00:00', '2024-07-01 10:30:00', NULL, 'Credit Card', 1234);

-- 71
update Trips
set End_location='City center'
where Trip_ID=1; 

-- 72
delete from Driver_address
where Driver_address_ID=1;

-- 73
select * from Trips
where Distance>50;

-- 74
select avg(Rating)
from Customer;

-- 75
select * from Trips
where Start_location=End_location;

-- 76
select * from Customer_contact       
where Contact=8765432109;

-- 77
INSERT INTO Customer (Customer_ID, Name, Email, DOB, Rating) 
VALUES
    (7, 'Taylor Doe', 'doe@example.com', '1992-06-15', 4);

-- 78
update Driver
set Rating=4
where Driver_ID=3;

-- 79
delete from Trips
where Trip_ID=4;

-- 80
select Driver.Name
from Driver join Driver_address
on Driver.Driver_ID=Driver_address.Driver_ID
where State='Maharashtra';

-- 81
select Payment_mode,sum(Fare)
from Trips
group by Payment_mode;

-- 82
select Model
from Vehicle
where Color='Black'; 

-- 83
select * from Trips
join Driver
on Trips.Driver_ID=Driver.Driver_ID
where Driver.Name='Michael Johnson';

-- 84
INSERT INTO Coupons (Coupon_ID, Text, Value, Validity, Start_date) 
VALUES
    (7, 'MONSOON30', '30% Off', 40, '2024-04-01');

-- 85
update Coupons
set Start_date='2024-06-02'
where Coupon_ID=1;

-- 86
delete from Vehicle
where Vehicle_ID=1;

-- 87
select Name from
Customer join Customer_address
on Customer.Customer_ID=Customer_address.Customer_ID
where City='Kolkata';

-- 88
select Name,count(Trip_ID) as Total_trips
from Customer join Trips
on Customer.Customer_ID=Trips.Customer_ID
group by Name;

-- 89
select * from Trips
where Payment_mode='Credit card';

-- 90
select Name from Driver;

-- 91
INSERT INTO Driver (Driver_ID, Name, Email, DOB, Rating) 
VALUES
    (7, 'Donald Johnson', 'donald@example.com', '1986-08-20', 4);

-- 92
update Customer
set Email='john@example.com'
where Customer_ID=1;   

-- 93
delete from Customer_contact
where Customer_contact_ID=2;

-- 94
select *,timestampdiff(minute,Start_date_time,End_date_time) as Time_range from Trips
where timestampdiff(minute,Start_date_time,End_date_time)=15;

-- 95
select avg(Distance)
from Trips;

-- 96
select Name,count(Trip_ID)
from Driver join Trips
on Driver.Driver_ID=Trips.Driver_ID
group by Name
having count(Trip_ID)>10;

-- 97
select * from Trips
join Vehicle
on Trips.Vehicle_ID=Vehicle.Vehicle_ID
where Model='SUV';  

-- 98
INSERT INTO Vehicle (Vehicle_ID, Model, Category, Year, Color, KM) 
VALUES
    (6, 'Hyundai i20', 'Sedan', '2020-01-01', 'Black', 25000);

-- 99
update Vehicle
set year='2023-01-01'
where Vehicle_ID=1;

-- 100
delete from Driver
where Driver_ID=1;

-- 101
select Name from Trips
join Coupons
on  Trips.Coupon_ID=Coupons.Coupon_ID
join Customer
on Trips.Customer_ID=Customer.Customer_ID
where Text='SUMMER20';

-- 102
select Model,count(Trip_ID)
from Trips join Vehicle
on Trips.Vehicle_ID=Vehicle.Vehicle_ID
where year='2023-01-01'
group by Model;

-- 103
select Name
from Customer join Trips
on Customer.Customer_ID=Trips.Customer_ID
where Start_location='Dmart' or End_location='City center';

-- 104
select * from Customer_contact
left join Trips on Customer_contact.Customer_ID=Trips.Customer_ID
where Trips.Customer_ID is null;

-- 105
INSERT INTO Driver_Contact (Driver_contact_ID, Driver_ID, Contact)
VALUES
    (7, 5, 9896543210);

-- 106
update Driver_address
set Address_line1='790 Broadway'
where Driver_address_ID=2;

-- 107
delete from Customer_address
where Customer_address_ID=2;

-- 108
select * from trips
where Start_location='Dmart' and End_location='City center';   

-- 109
select count(Customer_ID)
from Customer
where Rating<3;

-- 110
select * from Trips
where Status='Completed' and Fare>1000;

-- 111
select * from Vehicle
where KM<50000;

-- 112
INSERT INTO Payment_info (Payment_ID, Payment_mode)
VALUES (7, 'QR code payment');

-- 113
update Coupons
set Validity=5
where Coupon_ID=3;

-- 114
delete from Customer
where Customer_ID=3;

-- 115
select * from Trips
where Payment_mode='Debit card' and Coupon_ID=1;  

delimiter $$
create procedure process_record(inout data varchar(1000))
begin
declare done int default false;
declare N varchar(50);
declare E varchar(100);
declare D date;
declare R int;
declare cur cursor for select Name,Email,DOB,Rating from Customer;
declare continue handler for not found set done=true;
set data='';
open cur;
read_loop:Loop
fetch cur into N,E,D,R;
if done then
leave read_loop;
end if;
set data=concat(data,N,',',E,',',D,',',R,',,');
end loop;
close cur;
end $$
delimiter ;
drop procedure process_record;
set @abc='';
call process_record(@abc);
select @abc;



