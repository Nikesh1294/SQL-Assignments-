---- Q1: Write a query to display the Full name only those employees whose first name start with ‘S’ character.
 --Employee_id Full Name Salary  Hire_date
 --100 S.King  24000 6/17/2003
 --116 S.Baida 2900  12/24/2005
 --117 S.Tobias  2800  7/24/2005
 --123 S.Vollman 6500  10/10/2005
 --128 S.Markle  2200  3/8/2008
 --138 S.Stiles  3200  10/26/2005
 --161 S.Sewall  7000  11/3/2006

SELECT * FROM employees_info
CREATE TABLE employees_info (
    employee_id     NUMBER(5) PRIMARY KEY,
    full_name       VARCHAR2(50),
    salary          NUMBER(8,2),
    hire_date       DATE
);


INSERT INTO employees_info VALUES (100, 'S.King',    24000, DATE '2003-06-17');
INSERT INTO employees_info VALUES (116, 'S.Baida',    2900, DATE '2005-12-24');
INSERT INTO employees_info VALUES (117, 'S.Tobias',   2800, DATE '2005-07-24');
INSERT INTO employees_info VALUES (123, 'S.Vollman',  6500, DATE '2005-10-10');
INSERT INTO employees_info VALUES (128, 'S.Markle',   2200, DATE '2008-03-08');
INSERT INTO employees_info VALUES (138, 'S.Stiles',   3200, DATE '2005-10-26');
INSERT INTO employees_info VALUES (161, 'S.Sewall',   7000, DATE '2006-11-03');


SELECT employee_id,(substr(first_name,1,1))||'.'||last_name Full_Name,salary,hire_date
FROM employees
WHERE first_name like 'S%';

SELECT full_name
FROM employees_info
WHERE full_name LIKE 'S.%';



---- Q2. Find the highest, lowest, sum, and average salary of all employees. Label the columns Maximum
  --,Minimum, Sum, and Average, respectively. Round your results to the nearest whole number. 

SELECT round(max(salary)) highest,
round(min(salary)) lowest,
round(sum(salary)) sum,
round(avg(salary)) avg
FROM employees;



---- Q3. Display following output .
--Employee Details
--------------------------------------------------------------------------------------
--King earns $24,000.00 monthly but wants $72,000.00.
--Kochhar earns $20,000.00 monthly but wants $60,000.00.
--De Haan earns $17,000.00 monthly but wants $51,000.00.
--Hunold earns $9,000.00 monthly but wants $27,000.00.
--Ernst earns $6,000.00 monthly but wants $18,000.00.
--Austin earns $4,800.00 monthly but wants $14,400.00.

CREATE TABLE employee_details2 (
    employee_name VARCHAR2(30),
    monthly_salary NUMBER(10,2),
    desired_salary NUMBER(10,2)
);

INSERT INTO employee_details2 VALUES ('King',     24000, 72000);
INSERT INTO employee_details2 VALUES ('Kochhar',  20000, 60000);
INSERT INTO employee_details2 VALUES ('De Haan',  17000, 51000);
INSERT INTO employee_details2 VALUES ('Hunold',    9000, 27000);
INSERT INTO employee_details2 VALUES ('Ernst',     6000, 18000);
INSERT INTO employee_details2 VALUES ('Austin',    4800, 14400);

SELECT * FROM employee_details2

SELECT employee_name||' '||'earns'||to_char(monthly_salary,'$99999.00')||' '||'but wants'||' '||(to_char(desired_salary*3,'$99999.00'))
FROM employee_details2;

SELECT last_name||' '||'earns'||to_char(salary,'$99999.00')||' '||'but wants'||' '||(to_char(salary*3,'$99999.00'))
FROM employees;

SELECT
    full_name || ' earns $' ||
    TO_CHAR(salary, 'FM99,999,999.00') ||
    ' monthly but wants $' ||
    TO_CHAR(salary * 3, 'FM99,999,999.00') || '.' 
    AS employee_details
FROM employees_info;



---- Q4. Determine the number of managers without listing them. Label the column  Number of Managers Hint: Use the MANAGER_ID column to determine the number of managers. 

SELECT count(manager_id) number_of_managers
FROM employees;

SELECT COUNT(DISTINCT manager_id) AS "Number of Managers"
FROM employees
WHERE manager_id IS NOT NULL;



---- Q5. Find the difference between the highest and lowest salaries. Label the column DIFFERENCE

SELECT max(salary)-min(salary) difference
FROM employees;



---- Q6. Display how many employees joined in each month
--Hint: Grouping by month and count the employees .use TO_CHAR functions also

SELECT to_char(hire_date,'Month')month,count(employee_id)
FROM employees_info
group by to_char(hire_date,'Month')
order by month;

SELECT
    TO_CHAR(hire_date, 'Month') AS month,
    COUNT(*) AS total_employees
FROM employees_info
GROUP BY TO_CHAR(hire_date, 'Month');



---- Q7. Display employee id , full name of employees and their hire date only those employees that has greater than 10 year experience in company.

SELECT employee_id,full_name Full_name,hire_date
FROM employees_info
WHERE (to_char(hire_date)<sysdate-365*10);



--- Q8. Write a query to multipley  salary to commission and calculate the average salary of employees.
--Hint: Commission column contain null values

CREATE TABLE employees8 (
    employee_id NUMBER(5) PRIMARY KEY,
    full_name   VARCHAR2(30),
    salary      NUMBER(8,2),
    hire_date   DATE,
    commission  NUMBER(8,2)  
);

INSERT INTO employees8 VALUES (100, 'S.King',    24000, DATE '2003-06-17', NULL);
INSERT INTO employees8 VALUES (116, 'S.Baida',    2900, DATE '2005-12-24', NULL);
INSERT INTO employees8 VALUES (117, 'S.Tobias',   2800, DATE '2005-07-24', NULL);
INSERT INTO employees8 VALUES (123, 'S.Vollman',  6500, DATE '2005-10-10', NULL);
INSERT INTO employees8 VALUES (128, 'S.Markle',   2200, DATE '2008-03-08', NULL);
INSERT INTO employees8 VALUES (138, 'S.Stiles',   3200, DATE '2005-10-26', NULL);
INSERT INTO employees8 VALUES (161, 'S.Sewall',   7000, DATE '2006-11-03', NULL);

SELECT * FROM employees8

SELECT AVG(salary * NVL(commission, 0)) AS avg_salary
FROM employees8;

SELECT
    employee_id,
    full_name,
    salary,
    commission,
    salary * NVL(commission, 0) AS salary_commission
FROM employees8;

SELECT
    employee_id,
    full_name,
    salary,
    commission,
    salary * NVL(commission, 1) AS salary_commission
FROM employees8;

SELECT AVG(salary) AS avg_salary
FROM employees8;

SELECT ROUND(AVG(salary), 2) AS avg_salary
FROM employees8;



---- Q9.Write a query to display department_id and number of manager under the particular department exclude the null department.
--Hint: Grouping on department id

SELECT department_id,count(manager_id)
FROM departments
WHERE department_id is not null
group by department_id;



---- Q10.Display job title and number of employees working those job and number of manager they perform job.

--Job Title   Employees Managers
--Accountant  5 1
--Accounting Manager  1 1
--Administration Assistant  1 1
--Administration Vice President 2 1
--Finance Manager 1 1
--Human Resources Representative  1 1
--Marketing Manager 1 1
--Sales Representative  30  5
--hipping Clerk  20  5
--Stock Clerk 20  5

CREATE TABLE job10 (
    job_title   VARCHAR2(40),
    employees   NUMBER(5),
    managers    NUMBER(5)
);

INSERT INTO job10 VALUES ('Accountant', 5, 1);
INSERT INTO job10 VALUES ('Accounting Manager', 1, 1);
INSERT INTO job10 VALUES ('Administration Assistant', 1, 1);
INSERT INTO job10 VALUES ('Administration Vice President', 2, 1);
INSERT INTO job10 VALUES ('Finance Manager', 1, 1);
INSERT INTO job10 VALUES ('Human Resources Representative', 1, 1);
INSERT INTO job10 VALUES ('Marketing Manager', 1, 1);
INSERT INTO job10 VALUES ('Sales Representative', 30, 5);
INSERT INTO job10 VALUES ('Shipping Clerk', 20, 5);
INSERT INTO job10 VALUES ('Stock Clerk', 20, 5);

SELECT * FROM job10

SELECT
    j.job_title                     AS job_title,
    COUNT(e.employee_id)            AS employees,
    COUNT(DISTINCT e.manager_id)    AS managers
FROM employees_info e
JOIN job10 j
    ON e.job_id = j.job_id
GROUP BY j.job_title
ORDER BY j.job_title;


---- Q11. Display employee full name and pad both side asterisk sing 10 time . Example 
--Employee Details
--**********Ellen Abel**********
--**********Sundar Ande**********
--**********Mozhe Atkinson**********
--**********David Austin**********
--**********Hermann Baer**********
--**********Shelli Baida**********
--**********Amit Banda**********
--**********Elizabeth Bates**********

SELECT
    RPAD(
        LPAD(first_name || ' ' || last_name,
             LENGTH(first_name || ' ' || last_name) + 10,
             '*'),
        LENGTH(first_name || ' ' || last_name) + 20,
        '*'
    ) AS employee_details
FROM employees;



---- Q12. Display following output. (Hint: Use Months_between Function)
--Employee Id Last _name  Weeks Months  Year
--100 King  24  166 14
--101 Kochhar 20  139 12
--102 De Haan 28  195 16
--103 Hunold  19  136 11
--104 Ernst 17  119 10
--105 Austin  20  142 12

DROP TABLE employees10
CREATE TABLE employees12 (
    employee_id NUMBER(5) PRIMARY KEY,
    last_name   VARCHAR2(20),
    weeks       NUMBER(5),
    months      NUMBER(5),
    years       NUMBER(5)
);

INSERT INTO employees12 VALUES (100, 'King',    24, 166, 14);
INSERT INTO employees12 VALUES (101, 'Kochhar', 20, 139, 12);
INSERT INTO employees12 VALUES (102, 'De Haan', 28, 195, 16);
INSERT INTO employees12 VALUES (103, 'Hunold',  19, 136, 11);
INSERT INTO employees12 VALUES (104, 'Ernst',   17, 119, 10);
INSERT INTO employees12 VALUES (105, 'Austin',  20, 142, 12);

SELECT * FROM employees12


