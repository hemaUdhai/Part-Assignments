--  MySQL Assignment 2 - Querying Data
/* used employee database already created the previous assignmen 1,Tables,Relationship,constraints already created*/

USE Employee;

CREATE TABLE Departments(
Department_Id INT PRIMARY KEY UNIQUE,
Department_name VARCHAR(100)
);

INSERT INTO Departments(Department_Id, Department_name)/*inserted Departments details*/
VALUES
(101,'HR'),
(102,'Finance'),
(103, 'Marketing'),
(104, 'IT'),
(105,'Sales'),
(106,'Operations'),
(107, 'Administration'),
(108,'Procurement'),
(109,'Logistics'),
(110,'Customer Service'),
(111,'Accounting'),
(112,'Production'),
(113,'Quality Assurance');


CREATE TABLE Location(
Location_id INT PRIMARY KEY AUTO_INCREMENT,
Location_name VARCHAR(50)UNIQUE NOT NULL
);

INSERT INTO Location (Location_name,Location_id)/*inserted Locations details*/
VALUES
('Chennai',1),
('Mumbai', 2),
('Bangalore',3),
('Pune',4),
('Hyderabad',5);

SELECT * FROM Location;  

DROP TABLE Employees;

CREATE TABLE Employees(
Employee_id INT PRIMARY KEY UNIQUE,
Employee_name VARCHAR(100) NOT NULL,
Gender CHAR(1) CHECK (Gender IN('M','F')),
Age INT CHECK (Age>18),
Hire_date DATE DEFAULT(CURRENT_DATE),
Designation VARCHAR(100),
Salary Decimal(10,2),
Department_Id INT,
FOREIGN KEY (Department_Id) REFERENCES Departments(Department_Id),
Location_id INT,
FOREIGN KEY (Location_id) REFERENCES Location(Location_id));

INSERT INTO Employees (Employee_id,Employee_name,Gender,Age,Hire_date,Designation,Salary,Department_Id,Location_id)
VALUES
(1001,'Udhaya Kumar','M', 36,'2015-01-05','HR Manager',80000,101,1),
(1002, 'Priya Devi', 'F',28,'2016-05-15','Accounts Assistant',35000,102,2),
(1003,'Karthik','M',30,'2016-01-25','Marketing Executive',45000,103,1),
(1004,'Arun Kumar','M',35,'2015-05-16','Finance Manager',65000,102,3),
(1005,'Divya','F',28,'2016-08-20','HR Assistant',38000,101,3),
(1006, 'Ramya','F', 30,'2017-02-16','System Administrator',30000,104,5),
(1007,'Preethi Sharma','F',29,'2017-08-10','Sales Analyst',40000,105,2),
(1008,'Deepak','M',32,'2019-03-14','Operations Manager',50000,106,4),
(1009,'Gokul Gupta','M',40,'2015-05-10','Procurement Manager',85000,108,4),
(1010,'Aravind','M',32,'2019-06-03','Senior Accountant',55000,111,3),
(1011,'Sashwin','M',35,'2018-07-08','Warehouse Supervisor',25000,109,1),
(1012,'Santhi Priya', 'F',45,'2018-08-06','Brand Manager',53000,103,5),
(1013,'Deepika','F',29,'2016-10-07','IT Manager',60000,104,2),
(1014,'Shanu','F',27,'2017-09-14','Finance Executive',36000,102,1),
(1015,'Revathi Sing','F',33,'2018-06-09','Database Administrator',25000,104,2),
(1016,'Arjun Kapoor', 'M',28,'2016-03-25','QA Engineer',28000,113,2),
(1017,'Priyanka Despandae','F',38,'2016-03-19','Audit Associate',35000,111,4),
(1018,'Malar','F',37,'2015-04-17','Customer Support Specialist',29000,110,1),
(1019,'Mohana Priya','F',32,'2020-10-07','Administration Manager',45000,107,3),
(1020,'Nagaraj','M',30,'2018-08-11','Production Engineer',25000,112,1),
(1021,'Praven Benit','M',34,'2018-03-04','QA Manager',38000,113,4),
(1022,'Diya','F',28,'2019-11-15','Talent Acquisition Specialist',37000,101,2),
(1023,'Chandu','M',32,'2015-06-17','Sales Manager',52000,105,3),
(1024,'Sweatha Gupta','F',29,'2018-03-02','Financial Analyst',43000,102,4),
(1025,'Sunitha','F',31,'2019-12-06','Junior Accountant',32000,111,5),
(1026,'Pugal','M',37,'2018-12-07','Logistics Manager',51000,109,3),
(1027,'Ramesh','M',40,'2015-11-01','Customer Service Manager',57000,110,3),
(1028,'Jai Kumar','M',45,'2015-01-28','Vendor Manager',63000,108,5),
(1029,'Sharmi','F',33,'2016-04-10','Recruiter',48000,101,2),
(1030,'Keerthana','F',27,'2017-09-22','Digital Marketing Specialist',29000,103,3);

--Clause & Operators--

--1. DISTINCT VALUES:  /*Distinct used to show only unique value*/
SELECT DISTINCT Salary FROM Employees;

--  2. ALIAS (AS):  /*AS is used to give a temporary name to a column*/
SELECT 
Age AS Employee_Age,
Salary AS Employee_Salary
FROM Employees;

--3. WHERE CLAUSE & OPERATORS:
--  show the employees earning more than 50,000 joined before 2016

SELECT * FROM Employees
WHERE Salary>50000 AND hire_date < '2016-01-01'; /* WHERE CLAUSE is used to filter record based on a condition*/

-- there is no missing data	 in Designation

--  Sorting and Grouping Data:
--  1. ORDER BY:
SELECT * FROM Employees             /*order by used to sort the data, department id is sorted defaultly ascending(low to high) order*/
ORDER BY Department_Id ASC,Salary DESC; /* then sort the salary descending(high to low) order with in the department id*/

--  2. LIMIT:
--  Display the first 5 employees hired in the year 2018.

SELECT * FROM Employees                            /* select dates between */  
WHERE Hire_date BETWEEN '2018-01-01'AND '2018-12-31'
LIMIT 5;

--  3. AGGREGATE FUNCTIONS:
--  Calculate the sum of all salaries in the Finance department.

SELECT SUM(Salary) AS Total_Salary FROM Employees
WHERE Department_Id=102;    /*add(using aggregate SUM )salaries of all employee in finance department


--  Find the minimum age among all employees.
SELECT MIN(age)  AS Minimum_Age FROM Employees; /* found minimum age of all employee*/

--  Find the minimum age among all employees.
SELECT MIN(Age)  AS Minimum_Age FROM Employees; /* found minimum age of all employee*/

--  4. GROUP BY:
--  List the maximum salary for each location.

SELECT location_id, MAX(Salary)  FROM Employees
GROUP BY location_id;

--  Calculate the average salary for each designation containing the word 'Analyst'.

SELECT Designation,AVG(Salary) AS Average_Salary FROM Employees
WHERE Designation LIKE '%Analyst%'
GROUP BY Designation; /*groups employee by  the designation*/

-- 5. HAVING:
--  Find departments with less than 3 employees.

SELECT Department_id, count(*) FROM Employees
GROUP BY Department_id   /* groups employees by department_id*/
HAVING COUNT(*)<3;  /*having is used  because of aggregate functions (*)*/

-- Find locations with female employees whose average age is below 30.

SELECT location_id,AVG(Age) AS Average_Age, Gender FROM Employees
WHERE gender = 'F'
GROUP BY Location_id 
Having Average_Age<30;

SELECT * FROM Employees;
SELECT * FROM Departments;
SELECT * FROM Location;  


--  Joins:
--  1. INNER JOIN:

SELECT Employees.Employee_name,Employees.Designation,Departments.Department_name
FROM Employees
INNER JOIN Departments                /*it shows the  matching(employees with designation and their departments) record only*/
ON Employees.Department_id=Departments.Department_id;

--  2. LEFT JOIN:

SELECT COUNT(Employees.Employee_id) AS Total_employee,Departments.Department_id,Departments.Department_name 
FROM Departments                          /*count the number of employees in department*/
LEFT JOIN Employees                                  /*keeps all department*/
ON Departments.Department_id=Employees.Department_id
GROUP BY Departments.Department_id,Departments.Department_name;

--  3.RIGHT JOIN

SELECT Employees.Employee_name,Location.Location_name
FROM Employees
RIGHT JOIN Location                
ON Employees.Employee_id= Employees.Location_id;

--  4. CROSS JOIN

SELECT Departments.Department_name,Location.Location_name
FROM Departments
CROSS JOIN Location;


--  5. SELF JOIN:

SELECT
  e1.employee_name as Employee1,     --  e1 &e2 -two compies of same employee table
  e2.employee_name as Employee2, 
  e1.
  Department_Id
FROM
Employees e1
Join Employees e2
ON e1.Department_Id=e2.Department_Id --  finds employees in same department
AND e1.Employee_id < e2.Employee_id;

--  Windows function
--  Write a window function query to rank employees by salary using rank().
SELECT Employee_id,Salary,
RANK() OVER(ORDER BY Salary DESC ) AS Salary_Rank /*RANK() It is a window function used to calculate rank to each row based on a specific orders*/
FROM Employees;                                   /*OVER --look at all the rows and calculate the rank*/

/*Write a window function query to rank employees by salary within each department
using DENSE_RANK()*/

SELECT 
Employee_name,
Employee_id,
Department_Id,
Salary,
DENSE_RANK() OVER(PARTITION BY Department_id ORDER BY Salary DESC ) AS Salary_Rank
FROM Employees; 

  /*DENSE_RANK- rank in each group ,PARTITION divide into groups, separates employees by department and ranks each department separately.*/    

  --  Write a window function query, Running total salary by department
  
SELECT 
Employee_name,
Employee_id,
Department_id,
Salary,
SUM(Salary) OVER(PARTITION BY Department_id ORDER BY Salary DESC)AS Running_Total_Salary
FROM Employees;

SELECT * FROM Employees;
SELECT * FROM Departments;
SELECT * FROM Location;  




