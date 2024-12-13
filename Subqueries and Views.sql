CREATE DATABASE Assignment8;

USE Assignment8;

CREATE TABLE Country (
Id INT PRIMARY KEY, 
Country_name VARCHAR(40), 
Population INT,
    Area FLOAT);

INSERT INTO Country (
Id, 
Country_name, 
Population, 
Area)
VALUES
(1, 'Japan', 123753041, 364555),
(2, 'Australia', 26713205, 26713205),
(3, 'Switzerland', 8921981, 39516),
(4, 'Russia', 144820423, 16376870),
(5, 'Canada', 39742430, 1943950),
(6, 'Ireland', 5255017, 68890),
(7, 'UK', 69138192, 241930),
(8, 'USA',345426571, 298170),
(9, 'Germany', 84552242, 348560),
(10, 'India', 1450935791, 2973190);

SELECT * FROM Country;

CREATE TABLE Persons (
Id INT PRIMARY KEY, 
Fname VARCHAR(60), 
Lname VARCHAR(60),
    Population INT, 
    Rating FLOAT, 
    Country_Id INT, 
    Country_name VARCHAR(60),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id));
    
    
    INSERT INTO Persons (
    Id, 
    Fname, 
    Lname, 
    Population, 
    Rating, 
    Country_Id, 
    Country_name) VALUES
(1, 'Frederick', 'Louis', 53429, 4.7,9, 'Germany'),
(2, 'Noah', 'Murphy', 1203, 4.2, 8, 'Ireland'),
(3, 'Robert', 'Jones', 64790, 3.3, 1,NULL),
(4, 'Margaret', 'Lawrence', 40639, 4.9, 6, 'Canada'),
(5, 'Isha', 'Sharma', 73698, 4.2, 1, 'India'),
(6, 'Robert', 'Walser', 2004, 3.9, 2, 'Switzerland'),
(7, 'Rose','Byrne', 10479, 4, 3, 'Australia'),
(8, 'Emma', 'Thompson', 69804, 4.9, 5, 'UK'),
(9, 'Christopher', 'Jones', 470, 3.4, 2, NULL),
(10, 'Richard', 'Ford', 83697, 4.6,5 ,'USA');

SELECT * FROM Persons;

SELECT Country_name, 
COUNT(*) AS Number_of_Persons
FROM Persons
GROUP BY Country_name;

SELECT Country_name, 
COUNT(*) AS Number_of_Persons
FROM Persons
GROUP BY Country_name
ORDER BY Number_of_Persons DESC;

SELECT Country_name, 
AVG(Rating) AS Avg_Rating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;

SELECT Country_name
FROM Persons
WHERE Rating = (SELECT Rating FROM Persons WHERE Country_name = 'USA'
);

SELECT Country_name, 
Population
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);

CREATE DATABASE Product;

USE Product;

CREATE TABLE Customer (Customer_Id INT PRIMARY KEY, 
First_name VARCHAR(40), 
Last_name VARCHAR(40),
    Email VARCHAR(100), 
    Phone_no VARCHAR(10), 
    Address VARCHAR(250), 
    City VARCHAR(100), 
    State VARCHAR(60),
    Zip_code VARCHAR(10),
    Country VARCHAR(80));
    
    INSERT INTO Customer (
    Customer_Id, 
    First_name, 
    Last_name, 
    Email, 
    Phone_no, 
    Address, 
    City, 
    State, 
    Zip_code, Country)
VALUES 
(1, 'James', 'Albert', 'jamesalbertsa@gmail.com', '9812037400', '123 Main Street', 'San francisco', 'California','94105', 'USA'),
(2, 'Frederick', 'Louis', 'louis.frederick@gmail.com', '9763108524', '456 Maple Avenue', 'Toronto', 'Ontario', 'M4B 1B3', 'Canada'),
(3, 'Robert', 'Jones', 'robert.jones@gmail.com', '8047962034', '654 Birch St', 'Houston', 'Texas', '77001', 'USA'),
(4, 'Christopher', 'Jones', 'christopher.jones@gmail.com', '7484963418', '90 Sydney Road', 'Melbourne', 'Victoria', '3000', 'Australia'),
(5, 'Emma', 'Thompson', 'emma.thompson@gmail.com', '5641238937', '456 Oak St', 'New York', 'New York', '10001', 'USA'),
(6, 'Rose', 'Byrne', 'rose.byrne@gmail.com', '7445612823','321 Cedar St', 'San Francisco', 'California', '94101', 'USA'),
(7, 'Richard', 'Ford', 'richard.ford@gmail.com', '8524597021', '543 Redwood St', 'London', 'England', 'SW1A 1AA', 'UK'),
(8, 'Isha', 'Sharma', 'isha.sharma@gmail.com', '9526722380', '34 MG Road', 'Mumbai', 'Maharashtra', '400001', 'India'),
(9, 'Henry', 'Thomas', 'henry.thomas@gmail.com', '9033312963', '321 Maple St', 'Chicago', 'Illinois', '60601', 'USA'),
(10, 'James', 'Wilson', 'james.wilson@gamil.com', '9824772210', '78 Oxford Road', 'London', 'Greater London', 'NW1 5ND', 'UK');

SELECT * FROM Customer;

CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email
FROM Customer;

SELECT * FROM customer_info;

CREATE VIEW US_Customers AS
SELECT * FROM Customer
WHERE Country = 'USA';

SELECT * FROM US_Customers;

CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email, Phone_no, State
FROM Customer;

SELECT * FROM Customer_details;

UPDATE Customer
SET Phone_no = '9650423978'
WHERE Customer_Id = 1; 

UPDATE Customer
SET Phone_no = '8836402877'
WHERE Customer_Id = 6;

SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer_details
GROUP BY State;

SELECT * 
FROM Customer_details
ORDER BY State ASC;