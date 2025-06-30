create database travel;
use travel;

-- Q1- create Customers table

create table customers (
CustomerID int primary key,
Name varchar (100),
email varchar (100),
phone varchar (20),
country varchar(50)
);

-- Q2- create trips table 

create table trips(
TripID int PRIMARY KEY,
Destination varchar(100),
StartDate Date,
EndDate Date,
Price Decimal(10,2),
IsInternational BIT
);

-- Q3 Create table Bookings table
 Create table bookings (
 BookingID INT Primary KEY,
 CustomerID INT,
 TripID INT,
 BookingDate date,
 NumPeople int,
 foreign key (CustomerID) references Customers(CustomerID),
 foreign key (TripID) references Trips(TripID)
 );

Select* from customers