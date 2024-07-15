

create database mydb;
use mydb;

-- 1. Creating table


DESC employees;

-- Insert the following data

INSERT INTO employees VALUES
(101,'Raju','Manager','Loan'),
(102,'Raju','Cashier','Cash'),
(103,'Paul','Associate','Loan'),
(104,'Alex','Accountant','Account'),
(105,'Victor','Associate','Deposit');

INSERT INTO employees(name,design,dept) VALUES
('Raju','Manager','Loan');

SELECT * FROM employees;

-- EX: 02
-- 1. Display the data
SELECT * FROM employees WHERE dept='Loan';
SELECT * FROM employees WHERE emp_id=101;
SELECT emp_id,name FROM employees WHERE emp_id=101;

-- 2. Update the following data
UPDATE employees SET dept='IT' WHERE emp_id=104;

-- 3. Delete the data
DELETE FROM employees WHERE emp_id=102;

-- ===========STRING FUNCTIONS=============
SELECT * FROM employees;
SELECT CONCAT('Hey', 'Buddy');

-- !!! Restructuring the table!!! --
-- Adding fname and lname column as well as removing the existing name colummn

-- Dropping name field 
ALTER TABLE employees
DROP COLUMN name;

-- Adding fname and lname
ALTER TABLE employees
ADD COLUMN fname VARCHAR(50) NOT NULL AFTER emp_id,
ADD COLUMN lname VARCHAR(50) NOT NULL AFTER fname;

-- Inserting data within fname and lname
UPDATE employees SET fname = 'John', lname = 'Doe' WHERE emp_id = 101;
UPDATE employees SET fname = 'Jane', lname = 'Smith' WHERE emp_id = 103;
UPDATE employees SET fname = 'Alice', lname = 'Johnson' WHERE emp_id = 104;
UPDATE employees SET fname = 'Bob', lname = 'Brown' WHERE emp_id = 105;
UPDATE employees SET fname = 'Charlie', lname = 'Black' WHERE emp_id = 106;

-- Combining fname and lname from employees table using CONCAT()
SELECT emp_id, CONCAT(fname,lname) FROM employees;

-- CONCAT_WS Function
SELECT CONCAT_WS('-','HI','HELLO');
SELECT CONCAT_WS('-','HI','HELLO','JIM','LUCI');

-- Using CONCAT ON employees table
SELECT CONCAT_WS(':',emp_id,fname,design) FROM employees;

-- SUBSTRING Function
SELECT SUBSTRING('Hello Buddy',1,4); -- Hell
SELECT SUBSTRING('Hello Buddy',6); -- Buddy
SELECT SUBSTRING('Hello Buddy, Wassup Raju',-4); -- Raju

-- EX: 03
-- Task1
SELECT * FROM employees;
SELECT CONCAT_WS(':',emp_id,fname,design,dept) FROM employees;

-- Task2
SELECT CONCAT_WS(':',emp_id,CONCAT(fname,' ',lname),design,dept) FROM employees;

-- Task3
SELECT CONCAT_WS(':',emp_id,fname,UPPER(design),dept) FROM employees WHERE emp_id = 101;

-- Task4
SELECT CONCAT(LEFT(dept,1),emp_id),fname FROM employees;

-- EX: 04
select * from employees;

-- Restructuring the table to perform operations
ALTER TABLE employees
ADD COLUMN salary DECIMAL(10,2) AFTER dept;

UPDATE employees SET salary = 50000 WHERE emp_id = 101;
UPDATE employees SET salary = 45000 WHERE emp_id = 103;
UPDATE employees SET salary = 40000 WHERE emp_id = 104;
UPDATE employees SET salary = 35000 WHERE emp_id = 105;
UPDATE employees SET salary = 60000 WHERE emp_id = 106;

INSERT INTO employees VALUES(107,'Dane','lane','Account','finance',80000);

-- Task 1
-- Find different type of departments in database?
SELECT DISTINCT dept FROM employees;

-- Task 2
-- Display records with High-low salary
SELECT * FROM employees 
ORDER BY salary DESC;

-- Task 3
-- How to see only top 3 records from a table?
SELECT * FROM employees
LIMIT 3;

-- Task 4
-- Show records where first name starts with letter 'A'
SELECT * FROM employees 
WHERE fname LIKE "A%";

-- Task 5
-- Show records where length of the lname is 4 characters
SELECT * FROM employees 
WHERE lname LIKE "____";

-- =======GROUP BY =======
use mydb;
-- Tell me the num of employees who are working in various departments
SELECT design, COUNT(emp_id) FROM employees GROUP BY design;

-- USING SUBQUERIES --
-- Get the name details of employee having maximum salary
SELECT emp_id, fname, salary FROM employees
WHERE
salary = (SELECT MAX(salary) FROM employees);

-- Give me the sum of salary of each dept
SELECT dept,SUM(salary) AS TotalSalary FROM employees GROUP BY(dept);

-- EX: 05

-- Task 1
-- Find total no. of employees in database
SELECT COUNT(emp_id) AS Total_Employees FROM employees;

-- Task 2
-- Find no. of employees in each department
SELECT dept,COUNT(emp_id) FROM employees GROUP BY(dept);

-- Task 3
-- Find lowest salary paying
SELECT MIN(salary) from employees;

-- getting the details of employee with min salary
SELECT * FROM employees
WHERE salary = (SELECT MIN(salary) from employees);

-- Task 4
-- Find highest salary paying
SELECT MAX(salary) FROM employees;

-- getting the details of employee with min salary
SELECT * FROM employees
WHERE salary=(SELECT MAX(salary) FROM employees);

-- Task 5
-- Find total salary paying in Loan department
SELECT dept,SUM(salary) FROM employees WHERE dept='Loan';

-- Task 6
-- Average salary paying in each department
SELECT dept,AVG(salary) AS average_salary FROM employees GROUP BY(dept);

-- =====DATETIME =====
CREATE TABLE person(jd DATE,jt TIME,jdt DATETIME);

INSERT INTO person VALUES('2024-12-22','00:00:30','2024-12-22 00:00:30');
INSERT INTO person VALUES('2024:12:22','00:00:30','2024-12-22 00:00:30'); -- Using : instead of -

-- Using DATETIME Functions to store the values
INSERT INTO person VALUES(CURDATE(),CURTIME(),NOW());

-- USING DAYNAME
SELECT DAYNAME(CURDATE());

-- USING DAYOFMONTH
SELECT DAYOFMONTH(CURDATE());

-- USING DAYOFWEEK
SELECT DAYOFWEEK(CURDATE());

SELECT MONTHNAME(CURDATE());
SELECT YEAR(CURDATE());
SELECT DAYNAME(CURDATE());

SELECT * FROM person;

-- =====DATETIME Functions=====

SELECT DATE_FORMAT(NOW(),'%d/%m/%y');

SELECT DATE_FORMAT(NOW(),'%D %a');

-- performing operations on tables
 SELECT jdt, DATE_FORMAT(jdt,'%D %a at %k') FROM person;
 
 SELECT DATEDIFF('2024-05-01','2024-04-01'); -- it returns the no. of days
 
 SELECT DATE_ADD('2024-05-01', INTERVAL 1 YEAR);
 
 SELECT TIMEDIFF('20:00:00','18:00:00');
 
 -- =====DEFAULT AND ON UPDATE TIMESTAMP=====
 
 CREATE TABLE blogs(
 blog VARCHAR(50),
 ct DATETIME DEFAULT CURRENT_TIMESTAMP,
 ut DATETIME ON UPDATE CURRENT_TIMESTAMP
 );
 
 DESC blogs;
 
 INSERT INTO blogs(blog) VALUES('This is my first blog content');
 SELECT * FROM blogs;
 
 UPDATE blogs SET blog='This is an update within my first blog';

-- EX: 06

-- Task 1
-- print the current time(HH:MM:SS)
SELECT CURRENT_TIME();

-- Task 2
-- print the current date(yyyy-mm-dd)
SELECT(CURRENT_DATE());

-- Task 3
-- print current day of the week
SELECT(DAYNAME(NOW()));

-- Task 4
-- what is the use case of CHAR database?
-- ==> When we want to store fixed length char values 

-- Task 5
-- which datatype can be used to store value 123.456?
-- ==> Decimal, float, double

-- Task 6
-- display date in format
-- dd:mm:yyyy
-- April 22nd at 22:00:00
SELECT DATE_FORMAT(NOW(),'%d:%m:%Y');
SELECT DATE_FORMAT(NOW(),'%M %D at %T');

 -- ===== IN AND NOT IN =====
 -- It is very useful when we want to get series of values
 SELECT * FROM employees
 WHERE dept IN('Loan','IT','Deposit');

 SELECT * FROM employees
 WHERE dept NOT IN('Loan','IT','Deposit');
 
 -- Gen Task : Find employees whose salary is more than 40000 and less than 65000
 -- 1st method:
 SELECT * FROM employees
 WHERE
 salary>=40000 AND salary <= 65000;
 
  -- 2nd method:
  SELECT * FROM employees
  WHERE
  salary BETWEEN 40000 AND 65000;
  
  -- Advanced Concepts
  
  -- CASE ==> It is used when we want to add some condition and to perform any operations by inserting an column
  
  SELECT fname,salary,
  CASE
  WHEN salary>=40000 THEN 'Higher Salary'
  ELSE 'Low Salary'
  END
  AS 'Salary Category'
  FROM employees;
  
  -- Inserting multiple cases
  SELECT fname,salary,
  CASE
  WHEN salary>=50000 THEN 'Higher Salary'
  WHEN salary>=40000 
  AND salary <50000 THEN 'Mid Salary'
  ELSE 'Low Salary'
  END AS 'Salary Category'
  FROM employees;
  
  -- Check whether there are any null values inside jd column
  SELECT * FROM person
  WHERE jd IS NULL;
  
  -- NOT LIKE
  SELECT * FROM employees 
  WHERE fname NOT LIKE 'A%';
  
  -- EX: 07
  
  -- Task 1
  -- Find employees whose salary are between 30000 to 40000
  SELECT * FROM employees WHERE salary BETWEEN 30000 AND 40000;

  -- Task 2
  -- Find employees whose first name starts with 'B' or 'D'  
  SELECT * FROM employees WHERE fname LIKE 'B%' OR fname LIKE 'D%';
    
  -- Task 3
  -- Find employees whose salary=45000 and department should be 'Loan'
  SELECT * FROM employees WHERE salary=45000 AND dept='Loan';
  
  -- Task 4
  -- Find employees from following designation 
  -- Manager, lead and Associate
  SELECT * FROM employees WHERE design IN('Manager','Lead','Associate');
  
  -- Task 5
  -- calculate the salary in dollars column using the existing table
  SELECT fname,salary,
  CASE
  WHEN salary!=0 THEN salary/80
  END AS 'Salary in $'
  FROM employees;
  
  -- CONSTRAINTS(UNIQUE, CHECK)
  CREATE TABLE contact(mob VARCHAR(15) UNIQUE CHECK(LENGTH(mob)>=10));
  INSERT INTO contact VALUES(1234567890);-- INSERTING VALID DATA
  INSERT INTO contact VALUES(134567890); -- INSERTING INVALID DATA
  INSERT INTO contact VALUES(1234567890); -- INSERTING DUPLICATE DATA
  
  -- NAMED CONSTRAINT
  CREATE TABLE contacts(
  name VARCHAR(50),
  mob VARCHAR(15) UNIQUE,
  CONSTRAINT mob_less_than_10_digits CHECK (LENGTH(mob)>=10)
  );
  
   INSERT INTO contacts VALUES('AAA',134567890); -- INSERTING INVALID DATA
  
  