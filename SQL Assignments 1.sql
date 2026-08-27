CREATE DATABASE Company;--create database

USE Company;
--Create Department table
CREATE TABLE Departments(
Department_Id INT PRIMARY KEY,
Department_name VARCHAR(100)
);
--create location table
CREATE TABLE Location(
Location_id INT PRIMARY KEY,
Location_name VARCHAR(100)
);
--create Employee table
CREATE TABLE Employees(
Employee_id INT PRIMARY KEY,
Employee_name VARCHAR(100),
Gender ENUM ('M','F'),
Age INT ,
Hire_date DATE,
Designation VARCHAR(100),
Department_Id INT,
FOREIGN KEY (Department_Id) REFERENCES Departments(Department_Id),
Location_id INT,
FOREIGN KEY (Location_id) REFERENCES Location(Location_id),
Salary Decimal(10,2)
);

SELECT * FROM Departments; -- Display Departments table
SELECT * FROM Location;    -- Display Location table
SELECT * FROM Employees;  -- Display Employees table

ALTER TABLE Employees ADD Email VARCHAR(100);
ALTER TABLE Employees MODIFY Designation VARCHAR(200);

ALTER TABLE Employees DROP Age;
ALTER TABLE Employees RENAME COLUMN Hire_date TO Date_of_joining;

RENAME TABLE Departments TO Deparments_Info;

RENAME TABLE Location TO Locations;

TRUNCATE TABLE Employees;

DROP TABLE Employees;

DROP DATABASE Company;

DROP DATABASE IF EXISTS Company;

CREATE DATABASE Employee;
USE Employee;

CREATE TABLE Departments(
Department_Id INT PRIMARY KEY UNIQUE,
Department_name VARCHAR(100)
);

ALTER TABLE Departments
MODIFY Department_name VARCHAR(100) UNIQUE NOT NULL;

CREATE TABLE Location(
Location_id INT PRIMARY KEY AUTO_INCREMENT,
Location_name VARCHAR(50)UNIQUE NOT NULL
);

SELECT * FROM Location;  

CREATE TABLE Employees(
Employee_id INT PRIMARY KEY UNIQUE,
Employee_name VARCHAR(100) NOT NULL,
Gender CHAR(1) CHECK (Gender IN('M','F')),
Age INT CHECK (Age>18),
Hire_date DATE DEFAULT(CURRENT_DATE),
Designation VARCHAR(100),
Department_Id INT,
FOREIGN KEY (Department_Id) REFERENCES Departments(Department_Id),
Location_id INT,
FOREIGN KEY (Location_id) REFERENCES Location(Location_id),
Salary Decimal(10,2)
);
SELECT * FROM Employees;
SELECT * FROM Departments;
SELECT * FROM Location;  









