
----* [1] Create table syntax and insert data for employee1 table.----

CREATE TABLE employees1 (
  emp_id NUMBER PRIMARY KEY,
  first_name VARCHAR2(20),
  last_name VARCHAR2(20),
  salary NUMBER,
  joining_date DATE,
  department VARCHAR2(20)
);


  INSERT INTO employees1 VALUES
  (1, 'John', 'Abraham', 1000000, DATE '2013-01-01', 'Banking');

  INSERT INTO employees1 VALUES
  (2, 'Michael', 'Clarke', 800000, DATE '2013-01-01', 'Insurance');

  INSERT INTO employees1 VALUES
  (3, 'Roy', 'Thomas', 700000, DATE '2013-02-01', 'Banking');

  INSERT INTO employees1 VALUES
  (4, 'Tom', 'Jose', 600000, DATE '2013-02-01', 'Insurance');

  INSERT INTO employees1 VALUES
  (5, 'Jerry', 'Pinto', 650000, DATE '2013-02-01', 'Insurance');

  INSERT INTO employees1 VALUES
  (6, 'Philip', 'Mathew', 750000, DATE '2013-01-01', 'Services');

  ;

SELECT * FROM employees1;
DROP TABLE employees1;


----* [2] Create table syntax and insert data for incentives1 table.----

CREATE TABLE incentives1 (
  employee_ref_id NUMBER,
  incentive_date DATE,
  incentive_amount NUMBER
);



  INSERT INTO incentives1 VALUES
    (1, DATE '2013-02-01', 5000);

  INSERT INTO incentives1 VALUES
    (2, DATE '2013-02-01', 3000);

  INSERT INTO incentives1 VALUES
    (3, DATE '2013-02-01', 4000);

  INSERT INTO incentives1 VALUES
    (1, DATE '2013-01-01', 4500);

  INSERT INTO incentives1 VALUES
    (2, DATE '2013-01-01', 3500);

  ;

SELECT * FROM incentives1;
DROP TABLE incentives1;


----* [4]	Get First_Name,Last_Name from employee1 table----

SELECT first_name,last_name FROM employees1;


----* [5] Get First_Name from employee table using alias name “Employee Name”----

SELECT first_name AS "Employee Name",last_name,salary,joining_date,department FROM employees1;


----* [6]	Get First_Name from employee table in upper case----

SELECT emp_id,first_name, upper(first_name),last_name,salary,joining_date,department FROM employees1;


----* [7]	Select first 3 characters of FIRST_NAME from EMPLOYEE----

SELECT SUBSTR(first_name, 1, 3) AS first_3_chars FROM employees1;


----* [8]	Get position of 'o' in name 'John' from employee table----

SELECT INSTR(first_name, 'o') FROM employees1
WHERE first_name = 'John';


----* [9]	Get FIRST_NAME from employee table after removing white spaces from right side.----

SELECT RTRIM(first_name) FROM employees1;


----* [10]	Get First_Name from employee table after replacing 'o' with '$'----

SELECT REPLACE(first_name,'o','$') FROM employees1;


----* [11]	Get First_Name and Last_Name as single column from employee table separated by a '_'.----

SELECT first_name || '_' || last_name AS full_name FROM employees1;


----* [12]	Get FIRST_NAME, Joiningyear, Joining Month and Joining Date from employee table----

SELECT
  first_name,
  EXTRACT(YEAR  FROM joining_date) AS joining_year,
  TO_CHAR(joining_date, 'Month') AS joining_month,
  TO_CHAR(joining_date, 'DD') AS joining_date
FROM employees1;


----* [13]	Get all employee details from the employee table order by First_Name Ascending----

SELECT * FROM employees1 ORDER BY first_name asc;


----* [14]	Get all employee details from the employee table order by First_Name Ascending and Salary Descending----

SELECT * FROM employees1 ORDER BY first_name asc, salary desc;


----* [15]	Get employee details from employee table whose employee name is “John”----

SELECT * FROM employees1 WHERE first_name = 'John';


----* [16]	Get employee details from employee table whose employee name are “John” and “Roy”----

SELECT * FROM employees1 WHERE first_name IN ('John' , 'Roy');


----* [17]	Get employee details from employee table whose employee name are not “John” and “Roy”.----

SELECT * FROM employees1 WHERE first_name NOT IN ('John' , 'Roy');


----* [18]	Get employee details from employee table whose first name starts with 'J'.

SELECT * FROM employees1 WHERE first_name like 'J%';


----* 19.	Get employee details from employee table whose first name contains 'o'.

SELECT * FROM employees1 WHERE first_name like '%o%';


----* 20.	Get employee details from employee table whose first name ends with 'n'.

SELECT * FROM employees1 WHERE first_name like '%n';


----* 21.	Get employee details from employee table whose first name ends with 'n' and name contains 4 letters.

SELECT * FROM employees1 WHERE first_name like '___n';


----* 22.	Get employee details from employee table whose first name starts with 'J' and name contains 4 letters.

SELECT * FROM employees1 WHERE first_name like 'J___';


----* 23.	Get employee details from employee table who’s Salary greater than 600000.

SELECT * FROM employees1 WHERE salary > 600000;


----* 24.	Get employee details from employee table whose joining year is “2013”.

SELECT * FROM employees1 WHERE TO_CHAR(joining_date, 'YYYY') = '2013';

SELECT * FROM employees1 WHERE EXTRACT(YEAR FROM joining_date) = 2013;


----* 25.	Get employee details from employee table whose joining month is “January”.

SELECT * FROM employees1 WHERE TRIM(TO_CHAR(joining_date, 'MONTH')) = 'JANUARY';

SELECT * FROM employees1 WHERE EXTRACT(MONTH FROM joining_date) = 1;


----* 26.	Get employee details from employee table who joined before January 1st 2013.

SELECT * FROM employees1 WHERE joining_date < TO_DATE('01-01-2013', 'DD-MM-YYYY');


----* 27.	Get employee details from employee table who joined after January 31st.

SELECT * FROM employees1 WHERE joining_date > TO_DATE('01-01-2013', 'DD-MM-YYYY');
 

----* 28.	Get Joining Date and Time from employee table.

SELECT TO_CHAR(joining_date, 'DD-MON-YYYY HH24:MI:SS') AS joining_date_time FROM employees1;

SELECT TO_CHAR(joining_date,'DD-MON-YYYY HH24:MI:SS') FROM employees1;


----* 29.	Get Joining Date, Time including milliseconds from employee table.

SELECT TO_CHAR(joining_date,'DD-MON-YYYY HH24:MI:SS.FF3') FROM employees1;

SELECT TO_CHAR(CAST(joining_date AS TIMESTAMP),'DD-MON-YYYY HH24:MI:SS.FF3') AS joining_date_time FROM employees1;


----* 30.	Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table.

SELECT  e.emp_id,
        e.first_name,
        e.joining_date,
        i.incentive_date,
        (i.incentive_date - e.joining_date) AS date_difference
FROM employees1 e
JOIN incentives i
ON e.emp_id = i.employee_ref_id;


----* 31.	Get department, total salary with respect to a department from employee table.

SELECT e.emp_id,
       e.first_name,
       e.last_name,
       e.salary,
       e.joining_date,
       e.department,
       (e.salary + i.incentive_amount) AS Total_salary
FROM employees1 e
JOIN incentives i
ON e.emp_id = i.employee_ref_id;
___________________________________________________________________
SELECT e.emp_id,
       e.first_name,
       e.last_name,
       e.salary,
       e.joining_date,
       e.department,
       (e.salary + SUM(i.incentive_amount)) AS total_salary
FROM employees1 e
JOIN incentives i
ON e.emp_id = i.employee_ref_id
GROUP BY e.emp_id,
         e.first_name,
         e.last_name,
         e.salary,
         e.joining_date,
         e.department;
___________________________________________________________________
SELECT e.emp_id,
       e.first_name,
       e.last_name,
       e.salary,
       e.joining_date,
       e.department,
       (e.salary + NVL(SUM(i.incentive_amount),0)) AS total_salary
FROM employees1 e
LEFT JOIN incentives i
ON e.emp_id = i.employee_ref_id
GROUP BY e.emp_id,
         e.first_name,
         e.last_name,
         e.salary,
         e.joining_date,
         e.department
ORDER BY emp_id asc;
___________________________________________________________________________
SELECT e.emp_id,
       e.first_name,
       e.last_name,
       e.salary,
       e.joining_date,
       e.department,
       (e.salary + NVL(SUM(i.incentive_amount), 0)) AS total_salary 
FROM employees1 e
LEFT JOIN incentives i
ON e.emp_id = i.employee_ref_id
GROUP BY e.emp_id,
         e.first_name,
         e.last_name,
         e.salary,
         e.joining_date,
         e.department
ORDER BY total_salary desc;


----* 32.	Get department, total salary with respect to a department from employee table order by total salary descending.

SELECT e.emp_id,
       e.first_name,
       e.last_name,
       e.salary,
       e.joining_date,
       e.department,
       (e.salary + NVL(SUM(i.incentive_amount), 0)) AS total_salary 
FROM employees1 e
LEFT JOIN incentives i
ON e.emp_id = i.employee_ref_id
GROUP BY e.emp_id,
         e.first_name,
         e.last_name,
         e.salary,
         e.joining_date,
         e.department
ORDER BY total_salary desc;


----* 33.	Get department, no of employees in a department, total salary with respect to a department from employee table order by total salary descending.

SELECT department,
       COUNT(emp_id) AS no_of_employees,
       SUM(salary) AS total_salary
FROM employees1
GROUP BY department
ORDER BY total_salary desc;


----* 34.	Get department wise average salary from employee table order by salary ascending.

SELECT department,
       AVG(salary) AS avg_salary
FROM employees1
GROUP BY department
ORDER BY avg_salary asc;


----* 35.	Get department wise maximum salary from employee table order by salary ascending.

SELECT department,
       MAX(salary) as max_salary
FROM employees1
GROUP BY department
ORDER BY max_salary asc;


----* 36.	Get department wise minimum salary from employee table order by salary ascending.

SELECT department,
       MIN(salary) as min_salary
FROM employees1
GROUP BY department
ORDER BY min_salary asc;


----* 37.	Select no of employees joined with respect to year and month from employee table.

SELECT TO_CHAR(joining_date, 'YYYY') AS year,
       TO_CHAR(joining_date, 'MM')   AS month,
       COUNT(emp_id) AS no_of_employees
FROM employees1
GROUP BY TO_CHAR(joining_date, 'YYYY'),
         TO_CHAR(joining_date, 'MM')
ORDER BY year, month;
_____________________________________________________________________________________________
SELECT TO_CHAR(joining_date, 'YYYY') AS year,
       TO_CHAR(joining_date, 'MON')  AS month,
       COUNT(emp_id) AS no_of_employees
FROM employees1
GROUP BY TO_CHAR(joining_date, 'YYYY'),
         TO_CHAR(joining_date, 'MON')
ORDER BY year, month;


----* 38.	Select department,total salary with respect to a department from employee table
       -- where total salary greater than 800000 order by Total_Salary descending

SELECT department,
       SUM(salary) AS total_salary
FROM employees1
GROUP BY department
HAVING SUM(salary) > 800000
ORDER BY total_salary DESC;


----* 39.	Select employee details from employee table if data in incentive table.

SELECT DISTINCT e.emp_id,
       e.first_name,
       e.last_name,
       e.salary,
       e.joining_date,
       e.department
FROM employees1 e
JOIN incentives i
ON e.emp_id = i.employee_ref_id;


----* 40.	Select 20 % of salary from John, 10% of Salary for Roy and for other 15 % of salary from employee table.

SELECT emp_id,
       first_name,
       last_name,
       salary,
       CASE
         WHEN first_name = 'John' THEN salary * 0.20
         WHEN first_name = 'Roy' THEN salary * 0.10
         ELSE salary * 0.15
       END AS calculated_salary
FROM employees1;

    
----* 41.	Select Banking as 'Bank Dept', Insurance as 'Insurance Dept' and Services as    'Services Dept' from employee table.

SELECT emp_id,
       first_name,
       last_name,
       salary,
       CASE
           WHEN department = 'Banking'   THEN 'Bank Dept'
           WHEN department = 'Insurance' THEN 'Insurance Dept'
           WHEN department = 'Services'  THEN 'Services Dept'
       END AS department_name
FROM employees1;


----* 42.	Delete employee data from employee table who got incentives in incentive table.

DELETE FROM employees1 e
WHERE EXISTS (
      SELECT 1
      FROM incentives i
      WHERE i.employee_ref_id = e.emp_id
);

SELECT * fROM employees1
_________________________________________________________________________________________________
DELETE FROM employees1
WHERE emp_id IN (
      SELECT employee_ref_id
      FROM incentives
);

SELECT * fROM employees1

ROLLBACK;


----* 43.	Select first_name, incentive amount from employee and incentives table for those employees who have incentives.

SELECT e.first_name,
       i.incentive_amount
FROM employees1 e
JOIN incentives i
ON e.emp_id = i.employee_ref_id;
___________________________________________________________________________________________________________________________
SELECT e.first_name,
       SUM(i.incentive_amount) AS total_incentive
FROM employees1 e
JOIN incentives i
ON e.emp_id = i.employee_ref_id
GROUP BY e.first_name;


----* 44.	Select first_name, incentive amount from employee and incentives table for those
        --employees who have incentives and incentive amount greater than 3000

SELECT DISTINCT  e.first_name,
                 i.incentive_amount
FROM employees1 e
JOIN incentives i
ON e.emp_id = i.employee_ref_id
WHERE i.incentive_amount > 3000;
       

----* 45.	Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives.

SELECT DISTINCT e.first_name,
                i.incentive_amount
FROM employees1 e
LEFT JOIN incentives i
ON e.emp_id = i.employee_ref_id;


----* 46.	Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives and set incentive 
        --amount as 0 for those employees who didn't get incentives.
        
SELECT DISTINCT e.first_name,
       NVL(i.incentive_amount, 0) AS incentive_amount
FROM employees1 e
LEFT JOIN incentives i
ON e.emp_id = i.employee_ref_id;


----* 47.	Select first_name, incentive amount from employee and incentives table for all employees who got incentives using left join.

SELECT DISTINCT e.first_name,
                i.incentive_amount 
FROM employees1 e
LEFT JOIN incentives i
ON e.emp_id = i.employee_ref_id
WHERE incentive_amount is not null;


----* 48.	Select max incentive with respect to employee from employee and incentives table using sub query.

SELECT e.emp_id,
       e.first_name,
       MAX(i.incentive_amount) AS max_incentive
FROM employees1 e
LEFT JOIN incentives i
ON e.emp_id = i.employee_ref_id
GROUP BY e.emp_id, e.first_name
ORDER BY emp_id;
