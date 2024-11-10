/* Create following tables in SQL Schema with appropriate class and write the unit test case for the 
Transport Management application.*/
--creating a database
create database TransportManagement
--navigating to the database
use TransportManagement
--creating vehicles table
create table Vehicles(
VehicleID INT IDENTITY(1,1) PRIMARY KEY,
Model VARCHAR(50),
Capacity DECIMAL(10,2),
Type VARCHAR(50),
Status VARCHAR(50)
)
--creating route table
create table Routess(
RouteID INT IDENTITY(1,1) PRIMARY KEY,
StartDestination VARCHAR(255),
EndDestination VARCHAR(255),
Distance DECIMAL(10, 2)
)
--creating trips table
create table Trips(
TripID INT IDENTITY(1,1) PRIMARY KEY,
VehicleID INT FOREIGN KEY REFERENCES Vehicles(VehicleID),
RouteID INT FOREIGN KEY REFERENCES Routess(RouteID),
DepartureDate DATETIME,
ArrivalDate DATETIME,
Status VARCHAR(50),
TripType VARCHAR(50) DEFAULT 'Freight',
MaxPassengers INT
)
--creating passenger table
create table Passengers(
PassengerID INT IDENTITY(1,1) PRIMARY KEY,
FirstName VARCHAR(255),
gender VARCHAR(255),
age INT,
Email VARCHAR(255) UNIQUE,
PhoneNumber VARCHAR(50)
)
--creating bookings table
create table Bookings(
BookingId int identity PRIMARY KEY,
TripID int FOREIGN KEY REFERENCES Trips (TripID),
PassengerID INT FOREIGN KEY REFERENCES Passengers (PassengerID),
BookingDate DATETIME,
[status] VARCHAR (50) ,
)
insert into Vehicles values('ab100',50,'Van','Available'),('cd101',60,'Bus','Maintenance'),('ef102',80,'Truck','On Trip')
insert into Routess values('chennai','coimbatore',100),('bangalore','coimbatore',150),('bangalore','chennai',180)
insert into Trips values(1,1,'2024-09-10','2024-09-20','scheduled','passenger',50),(2,2,'2023-10-11','2023-10-22','cancelled','passenger',66)
insert into Passengers values('raja','male',35,'raja@gmail.com','11112222'),('rani','female',30,'rani@gmail.com','33334444')
insert into Bookings values(2,2,'2024-07-07','confirmed'),(3,1,'2024-08-08','cancelled')

