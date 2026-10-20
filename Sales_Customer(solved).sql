----SALES CUSTOMER----

CREATE TABLE Salespeople (
    Snum   INT PRIMARY KEY,
    Sname  VARCHAR(50),
    City   VARCHAR(50),
    Comm   DECIMAL(4,2)
);

INSERT INTO Salespeople VALUES (1001, 'Peel',     'London',     0.12);
INSERT INTO Salespeople VALUES (1002, 'Serres',   'San Jose',   0.13);
INSERT INTO Salespeople VALUES (1004, 'Monika',   'London',     0.11);
INSERT INTO Salespeople VALUES (1007, 'Rifkin',   'Barcelona',  0.15);
INSERT INTO Salespeople VALUES (1003, 'Axelrod',  'New York',   0.10);
INSERT INTO Salespeople VALUES (1005, 'Franc',    'London',     0.26);

SELECT * FROM salespeople
________________________________________________________________________________________________________

CREATE TABLE customers1 (
    Cnum   INT PRIMARY KEY,
    Cname  VARCHAR(50),
    City   VARCHAR(50),
    Rating INT,
    Snum   INT,
    CONSTRAINT fk_customers1_salespeople
    FOREIGN KEY (Snum) REFERENCES Salespeople(Snum)
);

INSERT INTO Customers1 VALUES (2001, 'Hoffman',  'London',   100, 1001);
INSERT INTO Customers1 VALUES (2002, 'Giovanni', 'Rome',     200, 1003);
INSERT INTO Customers1 VALUES (2003, 'Liu',      'San Jose', 200, 1002);
INSERT INTO Customers1 VALUES (2004, 'Grass',    'Berlin',   300, 1002);
INSERT INTO Customers1 VALUES (2006, 'Clemens',  'London',   100, 1001);
INSERT INTO Customers1 VALUES (2008, 'Cisneros', 'San Jose', 300, 1007);
INSERT INTO Customers1 VALUES (2007, 'Pereira',  'Rome',     100, 1004);

SELECT * FROM customers1

_________________________________________________________________________________________________________________

CREATE TABLE Orders (
    Onum  INT PRIMARY KEY,
    Amt   DECIMAL(10,2),
    Odate TIMESTAMP,
    Cnum  INT,
    Snum  INT,
    CONSTRAINT fk_orders_customers
        FOREIGN KEY (Cnum) REFERENCES Customers1(Cnum),
    CONSTRAINT fk_orders_salespeople
        FOREIGN KEY (Snum) REFERENCES Salespeople(Snum)
);

INSERT INTO Orders VALUES (3001, 18.69, TO_TIMESTAMP('1996-10-03 12:30:00','YYYY-MM-DD HH24:MI:SS'), 2008, 1007);
INSERT INTO Orders VALUES (3003, 767.19, TO_TIMESTAMP('1996-10-03 13:45:00','YYYY-MM-DD HH24:MI:SS'), 2001, 1001);
INSERT INTO Orders VALUES (3002, 1900.10, TO_TIMESTAMP('1996-10-03 12:05:00','YYYY-MM-DD HH24:MI:SS'), 2007, 1004);
INSERT INTO Orders VALUES (3005, 5160.45, TO_TIMESTAMP('1996-10-03 14:00:00','YYYY-MM-DD HH24:MI:SS'), 2003, 1002);
INSERT INTO Orders VALUES (3006, 1098.16, TO_TIMESTAMP('1996-10-03 13:37:00','YYYY-MM-DD HH24:MI:SS'), 2008, 1007);
INSERT INTO Orders VALUES (3009, 1713.23, TO_TIMESTAMP('1996-10-04 15:21:00','YYYY-MM-DD HH24:MI:SS'), 2002, 1003);
INSERT INTO Orders VALUES (3007, 75.75, TO_TIMESTAMP('1996-10-04 16:02:00','YYYY-MM-DD HH24:MI:SS'), 2002, 1003);
INSERT INTO Orders VALUES (3008, 4723.00, TO_TIMESTAMP('1996-10-05 12:07:00','YYYY-MM-DD HH24:MI:SS'), 2006, 1001);
INSERT INTO Orders VALUES (3010, 1309.95, TO_TIMESTAMP('1996-10-06 13:12:00','YYYY-MM-DD HH24:MI:SS'), 2004, 1002);
INSERT INTO Orders VALUES (3011, 9891.88, TO_TIMESTAMP('1996-10-06 13:09:00','YYYY-MM-DD HH24:MI:SS'), 2006, 1001);
INSERT INTO Orders VALUES (3012, 3455.78, TO_TIMESTAMP('1996-10-04 15:21:00','YYYY-MM-DD HH24:MI:SS'), 2002, 1003);
INSERT INTO Orders VALUES (3013, 1245.98, TO_TIMESTAMP('1996-10-04 16:32:00','YYYY-MM-DD HH24:MI:SS'), 2002, 1003);
INSERT INTO Orders VALUES (3014, 3721.53, TO_TIMESTAMP('1996-10-05 12:45:00','YYYY-MM-DD HH24:MI:SS'), 2006, 1001);
INSERT INTO Orders VALUES (3015, 734.50, TO_TIMESTAMP('1996-10-06 13:16:00','YYYY-MM-DD HH24:MI:SS'), 2004, 1002);
INSERT INTO Orders VALUES (3016, 1729.67, TO_TIMESTAMP('1996-10-06 13:07:00','YYYY-MM-DD HH24:MI:SS'), 2006, 1001);


SELECT * FROM ORDERS
_____________________________________________________________________________________________________________


---- 1.	List all customers with a rating of 100.

SELECT cnum,
       cname,
       city,
       rating,
       snum
FROM customers1
WHERE rating = 100;


---- 2.	Find all records in the Customer table with NULL values in the city column.

SELECT * FROM customers1
WHERE city IS NULL;


---- 3.	Find the largest order taken by each salesperson on each date.

SELECT Snum,
    TRUNC(Odate) AS order_date,
    MAX(Amt) AS largest_order
FROM Orders
GROUP BY
    Snum,
    TRUNC(Odate)
ORDER BY
    Snum,
    order_date;
__________________________________________________________________________

SELECT s.Sname,
    TRUNC(o.Odate) AS order_date,
    MAX(o.Amt) AS largest_order
FROM Orders o
JOIN Salespeople s ON o.Snum = s.Snum
GROUP BY
    s.Sname,
    TRUNC(o.Odate)
ORDER BY
    s.Sname,
    order_date;


---- 4.	Arrange the Orders table by descending customer number.

SELECT * FROM orders
ORDER BY cnum desc;


---- 5.	Find which salespeople currently have orders in the Orders table.

SELECT DISTINCT s.snum,
                s.sname
FROM salespeople s
JOIN orders o
ON s.snum = o.snum
ORDER BY snum;


---- 6.	List names of all customers matched with the salespeople serving them.

SELECT c.Cname  AS customer_name,
       s.Sname  AS salesperson_name
FROM Customers1 c
JOIN Salespeople s
  ON c.Snum = s.Snum;


---- 7.	Find the names and numbers of all salespeople who had more than one customer.

SELECT s.Snum,
       s.Sname
FROM Salespeople s
JOIN Customers1 c
  ON s.Snum = c.Snum
GROUP BY
    s.Snum,
    s.Sname
HAVING COUNT(c.Cnum) > 1;
_________________________________________________________________________________________

SELECT s.Snum,
       s.Sname,
       c.Cname AS customer_name
FROM Salespeople s
JOIN Customers1 c
  ON s.Snum = c.Snum
WHERE s.Snum IN (
    SELECT Snum
    FROM Customers1
    GROUP BY Snum
    HAVING COUNT(*) > 1
)
ORDER BY
    s.Snum,
    c.Cname;


---- 8.	Count the orders of each of the salespeople and output the results in descending order.

SELECT s.snum,
       s.sname,
       COUNT(o.onum) AS number_of_orders
FROM salespeople s
JOIN orders o
ON s.snum = o.snum
GROUP BY s.snum,
         s.sname
ORDER BY number_of_orders desc;


---- 9.	List the Customer table if and only if one or more of the customers in the Customer tables are located in San Jose.

SELECT * FROM Customers1 c
WHERE EXISTS (
    SELECT 1
    FROM Customers1
    WHERE City = 'San Jose'
);



---- 10. Match salespeople to customers according to what city they lived in.

SELECT s.sname AS salesperson_name,
       c.cname AS customer_name, 
       s.city
FROM salespeople s
JOIN customers1 c
ON s.city = c.city;

SELECT
    s.Sname AS salesperson_name,
    c.Cname AS customer_name,
    s.City
FROM Salespeople s
JOIN Customers1 c
  ON s.City = c.City;


---- 11.	Find the largest order taken by each salesperson.

SELECT s.snum,
       s.sname,
       MAX(o.amt) AS largest_order
FROM salespeople s
JOIN orders o
ON s.snum = o.snum
GROUP BY s.snum,
         s.sname
ORDER BY largest_order desc; 


---- 12.	Find customers in San Jose who has a rating above 200.

SELECT * FROM customers1
WHERE City = 'San Jose'
  AND Rating > 200;


---- 13.	List the names and commissions of all salespeople in London.

SELECT sname, comm
FROM Salespeople
WHERE city = 'London';


---- 14.	List all the orders of salesperson Monika from the Orders table.

SELECT o.Onum,
       o.Amt,
       o.Odate,
       o.Cnum,
       o.Snum
FROM Orders o
JOIN Salespeople s
    ON o.Snum = s.Snum
WHERE s.Sname = 'Monika';


---- 15.	Find all customers with orders on October 3.

SELECT DISTINCT
    c.Cnum,
    c.Cname,
    c.City
FROM Orders o
JOIN Customers1 c
    ON o.Cnum = c.Cnum
WHERE TRUNC(o.Odate) = DATE '1996-10-03';


---- 16.	Give the sums of the amounts from the orders table, grouped by date

SELECT TRUNC(Odate) AS order_date,
       SUM(Amt) AS total_amount
FROM Orders
GROUP BY TRUNC(Odate)
ORDER BY order_date;


---- 17.	Eliminating all those dates where the SUM was not at least 2000.00 above the MAX amount.

SELECT TRUNC(Odate) AS order_date,
       SUM(Amt)     AS total_amount,
       MAX(Amt)     AS max_amount
FROM Orders
GROUP BY TRUNC(Odate)
HAVING SUM(Amt) >= MAX(Amt) + 2000
ORDER BY order_date;


---- 18.	Select all orders that had amounts that were greater than at least one of the orders from October 6.

SELECT * FROM Orders
WHERE Amt > ANY (
    SELECT Amt
    FROM Orders
    WHERE TRUNC(Odate) = DATE '1996-10-06'
);



---- 19.	Write a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300.

SELECT * FROM Salespeople s
WHERE EXISTS (
    SELECT 1
    FROM Customers1 c
    WHERE c.Snum = s.Snum
      AND c.Rating = 300
);


---- 20.	Find all pairs of customers having the same rating.

SELECT Rating, COUNT(*)
FROM Customers1
GROUP BY Rating
HAVING COUNT(*) > 1;

SELECT c1.Cnum   AS customer1_id,
       c1.Cname  AS customer1_name,
       c2.Cnum   AS customer2_id,
       c2.Cname  AS customer2_name,
       c1.Rating
FROM Customers1 c1
JOIN Customers1 c2
  ON c1.Rating = c2.Rating
 AND c1.Cnum < c2.Cnum;
 
 
 ---- 21.	Find all customers with CNUM, 1000 above the SNUM of Serres.
 
SELECT * FROM Customers1
WHERE Cnum = (
    SELECT Snum + 1000
    FROM Salespeople
    WHERE Sname = 'Serres'
);


---- 22. Give the salespeople’s commissions as percentage instead of decimal numbers.

SELECT Snum, 
       Sname, 
       Comm * 100 AS commission_percent
FROM Salespeople;


---- 23. Find the largest order taken by each salesperson on each date, eliminating those MAX orders, which are less than $3000.00 in value.

SELECT Snum, 
       TRUNC(Odate) odate, 
       MAX(Amt) max_amt
FROM Orders
GROUP BY Snum, TRUNC(Odate)
HAVING MAX(Amt) >= 3000;


---- 24. List the largest orders on October 3, for each salesperson.

SELECT Snum, 
       MAX(Amt) max_amt
FROM Orders
WHERE TRUNC(Odate) = DATE '1996-10-03'
GROUP BY Snum;


---- 25. Find all customers located in cities where Serres (SNUM 1002) has customers.

SELECT * FROM Customers1
WHERE City IN (
    SELECT City
    FROM Customers1
    WHERE Snum = 1002
);


---- 26. Select all customers with a rating above 200.00.

SELECT * FROM Customers1
WHERE Rating > 200;


---- 27. Count the number of salespeople currently listing orders in the Orders table.

SELECT COUNT(DISTINCT Snum)
FROM Orders;


---- 28. Write a query that produces all customers serviced by salespeople with a commission above 12%. Output the customer’s name and the salesperson‘s rate of commission.

SELECT c.Cname,
       s.Comm
FROM Customers1 c
JOIN Salespeople s ON c.Snum = s.Snum
WHERE s.Comm > 0.12;


---- 29. Find salespeople who have multiple customers.

SELECT Snum
FROM Customers1
GROUP BY Snum
HAVING COUNT(*) > 1;


---- 30. Find salespeople with customers located in their city.

SELECT DISTINCT s.*
FROM Salespeople s
JOIN Customers1 c
  ON s.Snum = c.Snum
 AND s.City = c.City;


---- 31. Find all salespeople whose name starts with ‘P’ and the fourth character is ‘L’.

SELECT * FROM Salespeople
WHERE Sname LIKE 'P__l';


---- 32. Write a query that uses a sub query to obtain all orders for the customer named ‘Cisneros’. Assume you do not know his customer number.

SELECT * FROM Orders
WHERE Cnum = (
    SELECT Cnum
    FROM Customers1
    WHERE Cname = 'Cisneros'
);


---- 33. Find the largest orders for ‘Serres’ and ‘Rifkin’.

SELECT s.Sname, 
       MAX(o.Amt) max_amt
FROM Orders o
JOIN Salespeople s ON o.Snum = s.Snum
WHERE s.Sname IN ('Serres', 'Rifkin')
GROUP BY s.Sname;


---- 34. Extract the Salespeople table in the following order: SNUM, SNAME, COMMISSION, CITY.

SELECT Snum, Sname, Comm, City
FROM Salespeople;


---- 35. Select all customers whose names fall in between ‘A’ and ‘G’ alphabetical range.

SELECT *
FROM Customers1
WHERE Cname BETWEEN 'A' AND 'G';


---- 36. Select all the possible combinations of customers that you can assign.

SELECT c1.Cname, c2.Cname
FROM Customers1 c1
CROSS JOIN Customers1 c2;


---- 37. Select all orders that are greater than the average for October 4.

SELECT * FROM Orders
WHERE Amt > (
    SELECT AVG(Amt)
    FROM Orders
    WHERE TRUNC(Odate) = DATE '1996-10-04'
);


---- 38. Write a select command using a correlated sub query that selects the names and numbers of all customers with ratings equal to the maximum for their city.

SELECT Cnum, 
       Cname
FROM Customers1 c
WHERE Rating = (
    SELECT MAX(Rating)
    FROM Customers1
    WHERE City = c.City
);


---- 39. Write a query that totals the orders for each day and places the results in descending order.

SELECT TRUNC(Odate) odate, 
       SUM(Amt) total
FROM Orders
GROUP BY TRUNC(Odate)
ORDER BY total DESC;


---- 40. Write a select command that produces the rating followed by the name of each customer in San Jose.

SELECT Rating, 
       Cname
FROM Customers1
WHERE City = 'San Jose';


---- 41. Find all orders with amounts smaller than any amount for a customer in San Jose.

SELECT * FROM Orders
WHERE Amt < ANY (
    SELECT o.Amt
    FROM Orders o
    JOIN Customers1 c ON o.Cnum = c.Cnum
    WHERE c.City = 'San Jose'
);


---- 42. Find all orders with above average amounts for their customers.

SELECT * FROM Orders o
WHERE Amt > (
    SELECT AVG(Amt)
    FROM Orders
    WHERE Cnum = o.Cnum
);


---- 43. Write a query that selects the highest rating in each city.

SELECT City, 
MAX(Rating)
FROM Customers1
GROUP BY City;


---- 44. Write a query that calculates the amount of the salesperson’s commission on order by a customer with a rating above 100.00.

SELECT o.Onum, 
       o.Amt * 
       s.Comm AS commission
FROM Orders o
JOIN Customers1 c ON o.Cnum = c.Cnum
JOIN Salespeople s ON o.Snum = s.Snum
WHERE c.Rating > 100;


---- 45. Count the customers with rating above San Jose’s average.

SELECT COUNT(*)
FROM Customers1
WHERE Rating > (
    SELECT AVG(Rating)
    FROM Customers1
    WHERE City = 'San Jose'
);


---- 46. Write a query that produces all pairs of salespeople with themselves as well as duplicate rows with the order reversed.

SELECT s1.Sname, s2.Sname
FROM Salespeople s1
CROSS JOIN Salespeople s2;


---- 47. Find all salespeople that are located in either Barcelona or London.

SELECT * FROM Salespeople
WHERE City IN ('Barcelona', 'London');


---- 48. Find all salespeople with only one customer.

SELECT Snum
FROM Customers1
GROUP BY Snum
HAVING COUNT(*) = 1;


---- 49. Write a query that joins the Customer table to itself to find all pairs of customers served by a single salesperson.

SELECT c1.Cname, c2.Cname
FROM Customers1 c1
JOIN Customers1 c2
  ON c1.Snum = c2.Snum
 AND c1.Cnum < c2.Cnum;


---- 50. Write a query that will give you all orders for more than $1000.00.

SELECT * FROM Orders
WHERE Amt > 1000;


---- 51. Write a query that lists each order number followed by the name of the customer who made that order.

SELECT o.Onum,
       c.Cname
FROM Orders o
JOIN Customers1 c ON o.Cnum = c.Cnum;


---- 52. Write 2 queries that select all salespeople (by name and number) who have customers in their cities who they do not service, one using a join and one a correlated subquery. Which solution is more elegant?

SELECT DISTINCT s.Sname
FROM Salespeople s
JOIN Customers1 c
  ON s.City = c.City
WHERE s.Snum <> c.Snum;
_______________________________________________________________________
SELECT *
FROM Salespeople s
WHERE EXISTS (
    SELECT 1
    FROM Customers1 c
    WHERE c.City = s.City
      AND c.Snum <> s.Snum
);


---- 53. Write a query that selects all customers whose ratings are equal than ANY (in the SQL sense) of Serres.

SELECT * FROM Customers1
WHERE Rating = ANY (
    SELECT Rating
    FROM Customers1
    WHERE Snum = 1002
);



---- 54. Write2 queries that will produce all orders taken on October3 or October 4.

SELECT * FROM Orders
WHERE TRUNC(Odate) IN (DATE '1996-10-03', DATE '1996-10-04');
______________________________________________________________________________

SELECT * FROM Orders
WHERE TRUNC(Odate) = DATE '1996-10-03'
   OR TRUNC(Odate) = DATE '1996-10-04';


---- 55. Write a query that produces all pairs of orders by a given customer. Name that customer and eliminate duplicates.

SELECT o1.Onum, 
       o2.Onum, 
       o1.Cnum
FROM Orders o1
JOIN Orders o2
  ON o1.Cnum = o2.Cnum
 AND o1.Onum < o2.Onum;


---- 56. Find only those customers whose ratings are higher than every customer in Rome.

SELECT * FROM Customers1
WHERE Rating > ALL (
    SELECT Rating
    FROM Customers1
    WHERE City = 'Rome'
);


---- 57. Write a query on the customers table whose output will exclude all customers with a rating < = 100.00, unless they are located in Rome.

SELECT * FROM Customers1
WHERE Rating > 100
   OR City = 'Rome';


---- 58. Find all rows from the Customer table for which the salesperson number is 1001.

SELECT * FROM Customers
WHERE Snum = 1001;


---- 59. Find the total amount in Orders for each salesperson for which this total is greater than the amount of the largest order in the table.

SELECT Snum, 
       SUM(Amt)
FROM Orders
GROUP BY Snum
HAVING SUM(Amt) > (
    SELECT MAX(Amt)
    FROM Orders
);


---- 60. Write a query that selects all orders that have Zeroes or NULL in the Amount field.

SELECT * FROM Orders
WHERE Amt = 0 OR Amt IS NULL;


---- 61. Produce all combinations of salespeople and customer names such that the former precedes 
--the latter alphabetically, and the latter has a rating of less than 200.

SELECT s.Sname, 
       c.Cname
FROM Salespeople s
JOIN Customers1 c
  ON s.Sname < c.Cname
WHERE c.Rating < 200;


---- 62. List all salespeople’s names and the commission they have earned.

SELECT s.Sname, 
       SUM(o.Amt * s.Comm) commission
FROM Salespeople s
JOIN Orders o ON s.Snum = o.Snum
GROUP BY s.Sname;


---- 63. Write a query that produces the names and cities of all customers with the same rating as 
--Hoffman. Write the query using Hoffman’s CNUM rather than his rating, so that it would still be 
--usable if his rating changed.

SELECT Cname, 
       City
FROM Customers1
WHERE Rating = (
    SELECT Rating
    FROM Customers1
    WHERE Cnum = (
        SELECT Cnum FROM Customers1 WHERE Cname = 'Hoffman'
    )
);


---- 64. Find all salespeople for whom there are customers that follow them in alphabetical order.

SELECT DISTINCT s.Sname
FROM Salespeople s
JOIN Customers1 c
  ON c.Cname > s.Sname;


---- 65. Write a query that produces the names and ratings of all customers of all who have above 
--average orders.

SELECT DISTINCT c.Cname, c.Rating
FROM Customers1 c
JOIN Orders o ON c.Cnum = o.Cnum
WHERE o.Amt > (SELECT AVG(Amt) FROM Orders);


---- 66. Find the sum of all purchases from the Orders table.

SELECT SUM(Amt)
FROM Orders;


---- 67. Write a select command that produces the order number, amount, and date for all rows in the Order table.

SELECT Onum, Amt, Odate
FROM Orders;


---- 68. Count the number of not null rating fields in the Customer table including duplicates.

SELECT COUNT(Rating)
FROM Customers1;


---- 69. Write a query that gives the names of both the salesperson and the customer for each 
--order after the order number.

SELECT o.Onum, s.Sname, c.Cname
FROM Orders o
JOIN Salespeople s ON o.Snum = s.Snum
JOIN Customers1 c ON o.Cnum = c.Cnum;


---- 70. List the commissions of all salespeople servicing customers in London.

SELECT DISTINCT s.Comm
FROM Salespeople s
JOIN Customers1 c ON s.Snum = c.Snum
WHERE c.City = 'London';


---- 71. Write a query using ANY or ALL that will find all salespeople who have no customers 
--located in their city.

SELECT * FROM Salespeople s
WHERE s.City <> ALL (
    SELECT City
    FROM Customers1
    WHERE Snum = s.Snum
);


---- 72. Write a query using the EXISTS operator that selects all salespeople with customers located
-- in their cities who are not assigned to them.

SELECT * FROM Salespeople s
WHERE EXISTS (
    SELECT 1
    FROM Customers1 c
    WHERE c.City = s.City
      AND c.Snum <> s.Snum
);


---- 73. Write a query that selects all customers serviced by Peel or Monika.

SELECT c.*
FROM Customers1 c
JOIN Salespeople s ON c.Snum = s.Snum
WHERE s.Sname IN ('Peel', 'Monika');


---- 74. Count the number of salespeople registering orders for each day. (If a salesperson has 
--more than one order on a given day, he or she should be counted only once.).

SELECT TRUNC(Odate), COUNT(DISTINCT Snum)
FROM Orders
GROUP BY TRUNC(Odate);


---- 75. Find all orders attributed to salespeople in London.

SELECT o.*
FROM Orders o
JOIN Salespeople s ON o.Snum = s.Snum
WHERE s.City = 'London';


---- 76. Find all orders by customers not located in the same cities as their salespeople.

SELECT o.*
FROM Orders o
JOIN Customers1 c ON o.Cnum = c.Cnum
JOIN Salespeople s ON o.Snum = s.Snum
WHERE c.City <> s.City;


---- 77. Find all salespeople who have customers with more than one current order.

SELECT DISTINCT s.*
FROM Salespeople s
JOIN Orders o ON s.Snum = o.Snum
GROUP BY s.Snum, s.Sname, s.City, s.Comm
HAVING COUNT(o.Onum) > 1;


---- 78. Write a query that extracts from the Customer table every customer assigned to a salesperson who currently has at least one other customer (besides the customer being selected) with orders in the Orders table.

SELECT DISTINCT c.*
FROM Customers1 c
WHERE EXISTS (
    SELECT 1
    FROM Customers1 c2
    JOIN Orders o ON c2.Cnum = o.Cnum
    WHERE c2.Snum = c.Snum
      AND c2.Cnum <> c.Cnum
);


---- 79. Write a query that selects all customers whose name begins with ‘C’.

SELECT * FROM Customers1
WHERE Cname LIKE 'C%';


---- 80. Write a query on the Customers table that will find the highest rating in each city. Put the output in this form:  for the city (city) the highest rating is : (rating).

SELECT 'For the city ' || City ||
       ' the highest rating is : ' || MAX(Rating) AS result
FROM Customers1
GROUP BY City;


---- 81. Write a query that will produce the Snum values of all salespeople with orders currently in the Orders table without any repeats.

SELECT DISTINCT Snum
FROM Orders;


---- 82. Write a query that lists customers in descending order of rating. Output the rating field first, followed by the customers’ names and numbers.

SELECT Rating, Cname, Cnum
FROM Customers
ORDER BY Rating DESC;


---- 83. Find the average commission for salespeople in London.

SELECT AVG(Comm)
FROM Salespeople
WHERE City = 'London';


---- 84. Find all orders credited to the same salesperson that services Hoffman.

SELECT * FROM Orders
WHERE Snum = (
    SELECT Snum
    FROM Customers1
    WHERE Cname = 'Hoffman'
);


---- 85. Find all salespeople whose commission is in between 0.10 and 0.12 both inclusive.

SELECT * FROM Salespeople
WHERE Comm BETWEEN 0.10 AND 0.12;


---- 86. Write a query that will give you the names and cities of all salespeople in London with 
--commission above 0.10

SELECT Sname, City
FROM Salespeople
WHERE City = 'London'
  AND Comm > 0.10;


---- 87. What will be the output from the following query? 
        SELECT * FROM ORDERS 
        WHERE (AMT < 1000 OR NOT (ODATE = 10/03/1996 AND CNUM > 2003));
        
SELECT * FROM Orders
WHERE (Amt < 1000
   OR NOT (TRUNC(Odate) = DATE '1996-10-03' AND Cnum > 2003));

1 3001  18.69 03-OCT-96 12.30.00.000000 PM  2008  1007
2 3003  767.19  03-OCT-96 01.45.00.000000 PM  2001  1001
3 3005  5160.45 03-OCT-96 02.00.00.000000 PM  2003  1002
4 3009  1713.23 04-OCT-96 03.21.00.000000 PM  2002  1003
5 3007  75.75 04-OCT-96 04.02.00.000000 PM  2002  1003
6 3008  4723.00 05-OCT-96 12.07.00.000000 PM  2006  1001
7 3010  1309.95 06-OCT-96 01.12.00.000000 PM  2004  1002
8 3011  9891.88 06-OCT-96 01.09.00.000000 PM  2006  1001
9 3012  3455.78 04-OCT-96 03.21.00.000000 PM  2002  1003
10  3013  1245.98 04-OCT-96 04.32.00.000000 PM  2002  1003
11  3014  3721.53 05-OCT-96 12.45.00.000000 PM  2006  1001
12  3015  734.50  06-OCT-96 01.16.00.000000 PM  2004  1002
13  3016  1729.67 06-OCT-96 01.07.00.000000 PM  2006  1001

        
        
---- 88. Write a query that selects each customer’s smallest order.

SELECT Cnum, MIN(Amt) AS smallest_order
FROM Orders
GROUP BY Cnum;


---- 89. Write a query that selects the first customer in alphabetical order whose name begins with
-- ‘G’.

SELECT *
FROM (
    SELECT *
    FROM Customers1
    WHERE Cname LIKE 'G%'
    ORDER BY Cname
)
WHERE ROWNUM = 1;



---- 90. Write a query that counts the number of different not NULL city values in the Customers 
--table.

SELECT COUNT(DISTINCT City)
FROM Customers1
WHERE City IS NOT NULL;


---- 91. Find the average amount from the Orders table.

SELECT AVG(Amt)
FROM Orders;


---- 92. What would be the output from the following query?
        SELECT*FROM ORDERS WHERE NOT  (Odate =10/03/1996 OR Snum>1006) AND amt. >=1500);
        
SELECT * FROM Orders
WHERE NOT (TRUNC(Odate) = DATE '1996-10-03'
        OR Snum > 1006)
  AND Amt >= 1500;
 
ONUM  AMT     ODATE                         CNUM  SNUM  
3009  1713.23 04-OCT-96 03.21.00.000000 PM  2002  1003
3008  4723.00 05-OCT-96 12.07.00.000000 PM  2006  1001
3011  9891.88 06-OCT-96 01.09.00.000000 PM  2006  1001
3012  3455.78 04-OCT-96 03.21.00.000000 PM  2002  1003
3014  3721.53 05-OCT-96 12.45.00.000000 PM  2006  1001
3016  1729.67 06-OCT-96 01.07.00.000000 PM  2006  1001
       
        
---- 93. Find all customers who are not located in San Jose & whose rating is above 200.

SELECT * FROM Customers1
WHERE City <> 'San Jose'
  AND Rating > 200;


---- 94. Give a simpler way to write this query:
        SELECT Snum, Sname, city, Comm FROM salespeople WHERE (Comm>0.12 and Comm <0.14);
        
SELECT * FROM Salespeople
WHERE Comm BETWEEN 0.12 AND 0.14;
        
        
---- 95. Evaluate the following query:
        --SELECT * FROM orders WHERE NOT ((Odate = 10/03/1996 AND Snum>1002) OR amt>2000);
        
SELECT * FROM Orders
WHERE NOT ((TRUNC(Odate) = DATE '1996-10-03' AND Snum > 1002)
        OR Amt > 2000);

        
---- 96. Which salespeople attend to customers not in the city they have been assigned to?

SELECT DISTINCT s.*
FROM Salespeople s
JOIN Customers1 c ON s.Snum = c.Snum
WHERE s.City <> c.City;


---- 97. Which salespeople get commission greater than 0.11 and serving customers rated less than 250?

SELECT DISTINCT s.*
FROM Salespeople s
JOIN Customers1 c ON s.Snum = c.Snum
WHERE s.Comm > 0.11
  AND c.Rating < 250;


---- 98. Which salespeople have been assigned to the same city but get different commission 
--percentages?

SELECT s1.Sname, s2.Sname, s1.City
FROM Salespeople s1
JOIN Salespeople s2
  ON s1.City = s2.City
 AND s1.Comm <> s2.Comm
 AND s1.Snum < s2.Snum;


---- 99. Which salesperson has earned the most by way of commission?

SELECT s.Sname
FROM Salespeople s
JOIN Orders o ON s.Snum = o.Snum
GROUP BY s.Sname
HAVING SUM(o.Amt * s.Comm) = (
    SELECT MAX(SUM(o.Amt * s.Comm))
    FROM Orders o
    JOIN Salespeople s ON o.Snum = s.Snum
    GROUP BY s.Sname
);


---- 100.  Does the customer who has placed the maximum number of orders have the maximum rating?

SELECT
    CASE
        WHEN MAX(c_max_orders.rating) = MAX(c_max_rating.rating)
        THEN 'YES'
        ELSE 'NO'
    END AS result
FROM (
    SELECT c.rating
    FROM customers1 c
    JOIN orders o ON c.cnum = o.cnum
    GROUP BY c.cnum, c.rating
    HAVING COUNT(*) = (
        SELECT MAX(COUNT(*))
        FROM orders
        GROUP BY cnum
    )
) c_max_orders
CROSS JOIN (
    SELECT rating
    FROM customers1
) c_max_rating;



--------------------------------------------------------------------------------------------------

SELECT 
    c.cname, 
    c.rating, 
    COUNT(o.onum) AS order_count,
    CASE 
        WHEN c.rating = (SELECT MAX(rating) FROM customers1) THEN 'YES'
        ELSE 'NO'
    END AS is_max_rating
FROM customers1 c
JOIN orders o USING(cnum)
GROUP BY c.cname, c.rating
HAVING COUNT(o.onum) = (
    SELECT MAX(cnt) 
    FROM (SELECT COUNT(*) as cnt FROM orders GROUP BY cnum)
);
 

---- 101.  Has the customer who has spent the largest amount of money been given the highest rating?

SELECT
    CASE
        WHEN c.rating = (SELECT MAX(rating) FROM customers1)
        THEN 'YES'
        ELSE 'NO'
    END AS highest_rating
FROM customers1 c
WHERE c.cnum = (
    SELECT cnum
    FROM orders
    GROUP BY cnum
    HAVING SUM(amt) = (
        SELECT MAX(total_amt)
        FROM (
            SELECT SUM(amt) AS total_amt
            FROM orders
            GROUP BY cnum
        )
    )
);


---- 102.  List all customers in descending order of customer rating.

SELECT * FROM Customers1
ORDER BY Rating DESC;


---- 103.  On which days has Hoffman placed orders?

SELECT DISTINCT TRUNC(Odate)
FROM Orders
WHERE Cnum = (
    SELECT Cnum FROM Customers WHERE Cname = 'Hoffman'
);


---- 104.  Do all salespeople have different commissions?

SELECT COUNT(*) = COUNT(DISTINCT Comm)
FROM Salespeople;

SELECT CASE
         WHEN COUNT(*) = COUNT(DISTINCT Comm)
         THEN 'YES'
         ELSE 'NO'
       END AS result
FROM Salespeople;


---- 105.  Which salespeople have no orders between 10/03/1996 and 10/05/1996?

SELECT * FROM Salespeople s
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.Snum = s.Snum
      AND TRUNC(Odate)
          BETWEEN DATE '1996-10-03' AND DATE '1996-10-05'
);


---- 106.  How many salespersons have succeeded in getting orders?

SELECT COUNT(DISTINCT Snum)
FROM Orders;


---- 107.  How many customers have placed orders?

SELECT COUNT(DISTINCT Cnum)
FROM Orders;


---- 108.  On which date has each salesperson booked an order of maximum value?

SELECT Snum, TRUNC(Odate)
FROM Orders o
WHERE Amt = (
    SELECT MAX(Amt)
    FROM Orders
    WHERE Snum = o.Snum
);


---- 109.  Who is the most successful salesperson?

SELECT Snum
FROM Orders
GROUP BY Snum
HAVING SUM(Amt) = (
    SELECT MAX(SUM(Amt))
    FROM Orders
    GROUP BY Snum
);


---- 110.  Who is the worst customer with respect to the company?

SELECT Cnum
FROM Orders
GROUP BY Cnum
HAVING SUM(Amt) = (
    SELECT MIN(SUM(Amt))
    FROM Orders
    GROUP BY Cnum
);


---- 111.  Are all customers not having placed orders greater than 200 totally been serviced by salesperson Peel or Serres?

SELECT * FROM Customers1
WHERE Rating <= 200
  AND Snum IN (
      SELECT Snum FROM Salespeople
      WHERE Sname IN ('Peel','Serres')
  );


---- 112.  Which customers have the same rating?

SELECT c1.Cname, c2.Cname, c1.Rating
FROM Customers1 c1
JOIN Customers1 c2
  ON c1.Rating = c2.Rating
 AND c1.Cnum < c2.Cnum;


---- 113.  Find all orders greater than the average for October 4th.

SELECT * FROM Orders
WHERE Amt > (
    SELECT AVG(Amt)
    FROM Orders
    WHERE TRUNC(Odate) = DATE '1996-10-04'
);


---- 114.  Which customers have above average orders?

SELECT DISTINCT c.*
FROM Customers1 c
JOIN Orders o ON c.Cnum = o.Cnum
WHERE o.Amt > (SELECT AVG(Amt) FROM Orders);


---- 115.  List all customers with ratings above San Jose’s average.

SELECT * FROM Customers1
WHERE Rating > (
    SELECT AVG(Rating)
    FROM Customers
    WHERE City = 'San Jose'
);


---- 116.  Select the total amount in orders for each salesperson for which the total is greater than the amount of the largest order in the table.

SELECT Snum, SUM(Amt)
FROM Orders
GROUP BY Snum
HAVING SUM(Amt) > (SELECT MAX(Amt) FROM Orders);


---- 117.  Give names and numbers of all salesperson that have more than one customer.

SELECT Snum, COUNT(*)
FROM Customers1
GROUP BY Snum
HAVING COUNT(*) > 1;


---- 118.  Select all salesperson by name and numbers who have customers in their city whom they don’s the service.

SELECT DISTINCT s.*
FROM Salespeople s
JOIN Customers1 c
  ON s.City = c.City
WHERE s.Snum <> c.Snum;


---- 119.  Which customers’ rating should be lowered?

SELECT c.cname,
       c.rating,
       SUM(o.amt) AS total_spent
FROM customers1 c
LEFT JOIN orders o ON c.cnum = o.cnum
GROUP BY c.cnum, c.cname, c.rating
ORDER BY rating DESC, total_spent ASC;


---- 120.  Is there a case for assigning a salesperson to Berlin?

SELECT * FROM Customers1
WHERE City = 'Berlin';


---- 121.  Is there any evidence linking the performance of a salesperson to commission that he or she is being paid?

SELECT s.sname,
       s.comm,
    COUNT(o.onum) AS total_orders,
    SUM(o.amt) AS total_sales
FROM salespeople s
LEFT JOIN orders o ON s.snum = o.snum
GROUP BY s.snum, s.sname, s.comm
ORDER BY s.sname;


---- 122.  Dose the total amount in orders by customer in Rome and London exceeds the commission paid to salesperson in London and New York by more than 5 times?

SELECT SUM(o.amt) AS total_orders_amount
FROM orders o
JOIN customers1 c ON o.cnum = c.cnum
WHERE c.city IN ('Rome', 'London');

SELECT SUM(o.amt * s.comm) AS total_commission_paid
FROM salespeople s
JOIN orders o ON s.snum = o.snum
WHERE s.city IN ('London', 'New York');


---- 123.  Which is the date, order number, amt and city for each salesperson (byname) for   the maximum order he has obtained?

SELECT s.sname AS salesperson,
       o.onum AS order_number,
       o.amt,
       o.odate AS order_date,
       c.city AS customer_city
FROM orders o
JOIN salespeople s ON o.snum = s.snum
JOIN customers1 c ON o.cnum = c.cnum
WHERE (o.snum, o.amt) IN (
    SELECT snum, MAX(amt)
    FROM orders
    GROUP BY snum
)
ORDER BY s.sname;


---- 124.  Which salesperson(s) should be fired?

SELECT s.sname AS salesperson,
       COUNT(o.onum) AS total_orders,
       SUM(o.amt) AS total_sales,
       s.comm AS commission
FROM salespeople s
LEFT JOIN orders o ON s.snum = o.snum
GROUP BY s.snum, s.sname, s.comm
ORDER BY total_sales ASC;


---- 125.  What is the total income for the company? 

SELECT SUM(Amt)
FROM Orders;


