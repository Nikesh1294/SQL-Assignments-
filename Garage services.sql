

DROP TABLE employee

CREATE TABLE customer_details (
    cid           NUMBER(4),
    cname         VARCHAR2(50),
    cadd          VARCHAR2(30),
    c_contact     NUMBER(10),
    c_creditdays  NUMBER(3),
    cj_date       DATE,
    sex           VARCHAR2(10)
);

INSERT INTO customer_details
VALUES (1001, 'Cyona Blake', 'NEW YORK', 1235684, 20, TO_DATE('20-Jan-11','DD-MON-RR'), 'FEMALE');

INSERT INTO customer_details
VALUES (1002, 'JOHN SMITH', 'NEW JERSI', 1341684, 20, TO_DATE('21-Feb-11','DD-MON-RR'), 'MALE');

INSERT INTO customer_details
VALUES (1003, 'JORDAN WOOD', 'PRAG', 1805184, 20, TO_DATE('22-Mar-11','DD-MON-RR'), 'MALE');

INSERT INTO customer_details
VALUES (1004, 'CHRISTINA', 'MANHATTON', 1125684, 31, TO_DATE('23-Apr-13','DD-MON-RR'), 'FEMALE');

INSERT INTO customer_details
VALUES (1005, 'TOM HILL', 'LONDON', 1239284, 10, TO_DATE('25-Jun-15','DD-MON-RR'), 'MALE');

INSERT INTO customer_details
VALUES (1006, 'KAMILA JOSEF', 'PARISE', 124568, 9, TO_DATE('28-Jul-11','DD-MON-RR'), 'FEMALE');

INSERT INTO customer_details
VALUES (1007, 'ANDRU SYMON', 'TAXES', 125654, 15, TO_DATE('01-Apr-16','DD-MON-RR'), 'MALE');

INSERT INTO customer_details
VALUES (1008, 'SANJU SAMSUNG', 'NEW YORK', 12346341, 4, TO_DATE('20-Jan-16','DD-MON-RR'), 'MALE');

ALTER TABLE customer_details
ADD CONSTRAINT pk_customer_details PRIMARY KEY (cid);

_________________________________________________________________________________________________________________________

CREATE TABLE vendors (
    vid           NUMBER(4),
    vname         VARCHAR2(50),
    vadd          VARCHAR2(30),
    vcontact      NUMBER(10),
    vcreditdays   NUMBER(3),
    vj_date       DATE,
    CONSTRAINT pk_vendors PRIMARY KEY (vid)
);



INSERT INTO vendors
VALUES (2001, 'KIRAN PATIL', 'PUNE', 2053535, 20, TO_DATE('20-Jan-10','DD-MON-RR'));

INSERT INTO vendors
VALUES (2002, 'PRAKASH JAIN', 'MUMBAI', 2063564, 10, TO_DATE('05-Nov-11','DD-MON-RR'));

INSERT INTO vendors
VALUES (2003, 'SWAPNIL THETE', 'NASHIK', 2535352, 15, TO_DATE('18-Mar-10','DD-MON-RR'));

INSERT INTO vendors
VALUES (2004, 'AMOL SHENDE', 'SATARA', 23674776, 18, TO_DATE('07-Apr-15','DD-MON-RR'));

INSERT INTO vendors
VALUES (2005, 'KARAN SINTRE', 'BULDHANA', 256756, 30, TO_DATE('22-Apr-09','DD-MON-RR'));

INSERT INTO vendors
VALUES (2006, 'RAM KULKARNI', 'OSMANABAD', 20367454, 21, TO_DATE('09-Jul-10','DD-MON-RR'));

____________________________________________________________________________________________________________________________

CREATE TABLE employee (
    eid        NUMBER(4),
    ename      VARCHAR2(50),
    ejob       VARCHAR2(20),
    eadd       VARCHAR2(30),
    econtact   NUMBER(10),
    esal       NUMBER(6),
    edoj       DATE,
    edol       DATE,
    CONSTRAINT pk_employee PRIMARY KEY (eid)
);




INSERT INTO employee
VALUES (3001, 'STEVEN KING', 'PAINTER', 'NEW YORK', 10367454, 1200,
        TO_DATE('09-Jul-10','DD-MON-RR'), NULL);

INSERT INTO employee
VALUES (3002, 'DAVID AUSTIN', 'FITTER', 'MAN HATON', 10367434, 1100,
        TO_DATE('19-Aug-10','DD-MON-RR'), NULL);

INSERT INTO employee
VALUES (3003, 'BRUCE ERNST', 'MECHANIC', 'NEW JERCY', 10367264, 2200,
        TO_DATE('08-Sep-10','DD-MON-RR'), NULL);

INSERT INTO employee
VALUES (3004, 'LUIS POPP', 'MECHANIC', 'NEW JERCY', 10367264, 1700,
        TO_DATE('19-Oct-09','DD-MON-RR'),
        TO_DATE('06-Sep-10','DD-MON-RR'));

INSERT INTO employee
VALUES (3005, 'SHERI GOMES', 'FITTER', 'PARIS', 10327264, 1000,
        TO_DATE('19-Oct-09','DD-MON-RR'),
        TO_DATE('01-Aug-10','DD-MON-RR'));

INSERT INTO employee
VALUES (3000, 'JAMES PHILLIP', 'FITTER', 'PARIS', 10322264, NULL,
        TO_DATE('01-Jan-08','DD-MON-RR'), NULL);

_____________________________________________________________________________________________________________________________


CREATE TABLE sparepart (
    spid     NUMBER(4),
    spname   VARCHAR2(100),
    sprate   NUMBER(8),
    spunit   VARCHAR2(10),
    CONSTRAINT pk_sparepart PRIMARY KEY (spid)
);


INSERT INTO sparepart VALUES (4001, 'TWO WHEELER TUBE', 250, 'NOS');

INSERT INTO sparepart VALUES (4002, 'TWO WHEELER ENGINE OIL', 400, 'LTRS');

INSERT INTO sparepart VALUES (4003, 'FOUR WHEELER ENGINE OIL', 5000, 'LTRS');

INSERT INTO sparepart VALUES (4004, 'TWO WHEELER CARBORATOR', 680, 'NOS');

INSERT INTO sparepart VALUES (4005, 'TWO WHEELER CLUTCH WIRE', 129, 'MTRS');

INSERT INTO sparepart VALUES (4006, 'TWO WHEELER TAIL LIGHT', 100, 'NOS');

INSERT INTO sparepart VALUES (4007, 'TWO WHEELER INDICATORS', 150, 'NOS');

INSERT INTO sparepart VALUES (4008, 'FOUR WHEELER GASKIT', 1340, 'NOS');

INSERT INTO sparepart VALUES (4009, 'WHITE COLOUR', 340, 'LTRS');

INSERT INTO sparepart VALUES (4010, 'BLACK COLOUR', 240, 'LTRS');

INSERT INTO sparepart VALUES (4011, 'TWO WHEELER SIDE MIRROR', 250, 'NOS');

INSERT INTO sparepart VALUES (4012, 'FOUR WHEELER SIDE MIRROR', 450, 'NOS');

INSERT INTO sparepart VALUES (4013, 'TWO WHEELER SHOCKUP', 1320, 'PAIR');

INSERT INTO sparepart VALUES (4014, 'FOUR WHEELER BUMPER', 6000, 'NOS');

INSERT INTO sparepart VALUES (4015, 'FOUR WHEELER FRONT GLASS', 7000, 'PCS');




__________________________________________________________________________________________________________________

DROP TABLE purchase

CREATE TABLE purchase (
    pid        NUMBER(4),
    vid        NUMBER(4),
    spid       NUMBER(4),
    pqty       NUMBER(5),
    sprate     NUMBER(8,2),
    spgst      NUMBER(8,2),
    pdate      DATE,
    trancost   NUMBER(8,2),
    total      NUMBER(10,2),
    rcv_eid    NUMBER(4),

    CONSTRAINT pk_purchase PRIMARY KEY (pid),

    CONSTRAINT fk_purchase_vid
        FOREIGN KEY (vid) REFERENCES vendors(vid),

    CONSTRAINT fk_purchase_spid
        FOREIGN KEY (spid) REFERENCES sparepart(spid),

    CONSTRAINT fk_purchase_rcv_eid
        FOREIGN KEY (rcv_eid) REFERENCES employee(eid)
);




INSERT INTO purchase
VALUES (5001, 2001, 4001, 10, 250, 350, TO_DATE('01-Jan-11','DD-MON-RR'), 1300, 4150, 3001);

INSERT INTO purchase
VALUES (5002, 2002, 4002, 4, 400, 288, TO_DATE('02-Mar-11','DD-MON-RR'), 100, 1988, 3001);

INSERT INTO purchase
VALUES (5003, 2003, 4004, 8, 680, 761.6, TO_DATE('12-Jun-11','DD-MON-RR'), 50, 6251.6, 3003);

INSERT INTO purchase
VALUES (5004, 2004, 4005, 10, 129, 154.8, TO_DATE('22-Aug-11','DD-MON-RR'), 125, 1569.8, 3004);

INSERT INTO purchase
VALUES (5005, 2005, 4006, 20, 100, 300, TO_DATE('07-Sep-11','DD-MON-RR'), 20, 2320, 3003);

INSERT INTO purchase
VALUES (5006, 2006, 4007, 30, 150, 630, TO_DATE('12-Oct-11','DD-MON-RR'), 60, 5190, 3000);

INSERT INTO purchase
VALUES (5007, 2001, 4003, 20, 5000, 14000, TO_DATE('07-Sep-11','DD-MON-RR'), 1000, 115000, 3000);

INSERT INTO purchase
VALUES (5008, 2006, 4005, 1, 129, 15.48, TO_DATE('12-Oct-11','DD-MON-RR'), 50, 194.48, 3005);

INSERT INTO purchase
VALUES (5009, 2006, 4005, 1, 129, 15.48, TO_DATE('15-Oct-11','DD-MON-RR'), 50, 194.48, 3005);

INSERT INTO purchase
VALUES (5010, 2006, 4009, 5, 340, 238, TO_DATE('20-Oct-11','DD-MON-RR'), 0, 2938, 3005);




____________________________________________________________________________________________________________________________



DROP TABLE ser_det


CREATE TABLE ser_det (
    sid        NUMBER(4),
    cid        NUMBER(4),
    eid        NUMBER(4),
    spid       NUMBER(4),
    typ_veh    VARCHAR2(20),
    veh_no     VARCHAR2(20),
    typ_ser    VARCHAR2(30),
    ser_date   DATE,
    qty        NUMBER(5,2),
    sp_rate    NUMBER(8,2),
    sp_amt     NUMBER(10,2),
    sp_gst     NUMBER(8,2),
    ser_amt    NUMBER(10,2),
    comm       NUMBER(8,2),
    total      NUMBER(10,2),

    CONSTRAINT pk_ser_det PRIMARY KEY (sid),

    CONSTRAINT fk_serdet_cid
        FOREIGN KEY (cid) REFERENCES customer_details(cid),

    CONSTRAINT fk_serdet_eid
        FOREIGN KEY (eid) REFERENCES employee(eid),

    CONSTRAINT fk_serdet_spid
        FOREIGN KEY (spid) REFERENCES sparepart(spid)
);


SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name = 'CUSTOMER_DETAILS';



SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name = 'EMPLOYEE';


INSERT INTO ser_det
VALUES (6001, 1001, 3001, 4001, 'TWO WHEELER', 'MH15CA3228',
        'TUBE DAMAGED', TO_DATE('02-Jan-11','DD-MON-RR'),
        1, 250, 250, 35, 50, 0, 335);

INSERT INTO ser_det
VALUES (6002, 1002, 3002, 4002, 'TWO WHEELER', 'MH16U5713',
        'FULL SERVICING', TO_DATE('04-Mar-11','DD-MON-RR'),
        1, 400, 400, 52, 300, 50, 752);

INSERT INTO ser_det
VALUES (6003, 1003, 3004, 4005, 'TWO WHEELER', 'MH12PQ1313',
        'CLUTCH WIRE', TO_DATE('22-Aug-11','DD-MON-RR'),
        1, 129, 129, 0, 10, 0, 139);

INSERT INTO ser_det
VALUES (6004, 1002, 3002, 4002, 'TWO WHEELER', 'MH16U5713',
        'FULL SERVICING', TO_DATE('05-May-11','DD-MON-RR'),
        1, 400, 400, 52, 300, 50, 752);

INSERT INTO ser_det
VALUES (6005, 1004, 3001, 4009, 'TWO WHEELER', 'MH14PA335',
        'COLOR', TO_DATE('21-Oct-11','DD-MON-RR'),
        2.5, 340, 850, 119, 500, 150, 1469);

INSERT INTO ser_det
VALUES (6006, 1006, 3001, 4009, 'TWO WHEELER', 'MH12WE334',
        'COLOR', TO_DATE('01-Dec-11','DD-MON-RR'),
        2.5, 340, 850, 119, 500, 150, 1469);

INSERT INTO ser_det
VALUES (6007, 1007, 3001, 4001, 'FOUR WHEELER', 'MH17BB1345',
        'TUBE DAMAGED', TO_DATE('01-Jan-12','DD-MON-RR'),
        1, 250, 250, 35, 150, 0, 435);

select * from ser_det


______________________________________________________________________________________________________________________


---- Q.1 List all the customers serviced.

SELECT DISTINCT c.cid, 
                c.cname, 
                c.cadd, 
                c.c_contact
FROM customer_details c
JOIN ser_det s ON c.cid = s.cid;


---- Q.2 Customers who are not serviced. 

SELECT c.cid, 
       c.cname, 
       c.cadd, 
       c.c_contact,
       s.sid          -- Adding the Service ID column
FROM customer_details c
LEFT JOIN ser_det s ON c.cid = s.cid
WHERE s.sid IS NULL;


---- Q.3 Employees who have not received the commission.

select e.eid,
       e.ename,
       s.comm
 from employee e
 left join  ser_det s on e.eid=s.eid
 where s.eid is null or s.comm=0; 
 
 
---- Q.4 Name the employee who have maximum Commission. 

select distinct
     e.eid,
     e.ename,
     s.comm
from employee e join ser_det s on e.eid=s.eid
where s.comm=(select MAX(comm)from ser_det);


---- Q.5 Show employee name and minimum commission amount received by an employee. 
 
SELECT DISTINCT
     e.eid,
     e.ename,
     s.comm
from employee e join ser_det s on e.eid=s.eid
where s.comm=(select MIN(comm)from ser_det where comm>0);


---- Q.6 Display the Middle record from any table.

SELECT *
FROM (
    SELECT c.*,
           ROW_NUMBER() OVER (ORDER BY ROWID) rn,
           COUNT(*) OVER () cnt
    FROM customer_details c
)
WHERE rn = CEIL(cnt / 2);

---------------------------------------------------------------------
SELECT *
FROM (
    SELECT c.*,
           ROW_NUMBER() OVER (ORDER BY cid) rn,
           COUNT(*) OVER () cnt
    FROM customer_details c
)
WHERE rn = CEIL(cnt / 2);



---- Q.7 Display last 4 records of any table. 
SELECT * FROM customer_details
WHERE rownum <= 4
ORDER BY cid desc;


---- Q.8 Count the number of records without count function from any table.

SELECT MAX(ROWNUM) AS total_records 
FROM customer_details;

---- Q.9 Delete duplicate records from "Ser_det" table on cid.(note Please rollback after execution).

DELETE FROM ser_det a
WHERE rowid > (SELECT min(rowid) 
FROM ser_det b 
WHERE a.cid = b.cid);

rollback,

-------------------------------------------------------------------------

DELETE FROM ser_det
WHERE ROWID NOT IN 
(
      SELECT MIN(ROWID)
      FROM ser_det
      GROUP BY sid
);

rollback;



---- Q.10 Show the name of Customer who have paid maximum amount 

SELECT DISTINCT c.cid,
                c.cname,
                s.total
FROM customer_details c
LEFT JOIN ser_det s
ON c.cid = s.cid
WHERE s.total = (SELECT MAX(total) FROM ser_det); 


---- Q.11 Display Employees who are not currently working. 

select eid,ename,edol 
from employee 
where edol is not null; 
-------------------------------------------------

SELECT DISTINCT e.eid,
                e.ename
FROM employee e
LEFT JOIN ser_det s
ON e.eid = s.eid
WHERE s.eid is NULL; 


---- Q.12 How many customers serviced their two wheelers.
select * from ser_det

SELECT COUNT(DISTINCT cid) AS total_customers
FROM ser_det
WHERE typ_veh = 'two wheeler';

select count( distinct cid) as total_ cutomer from ser_det where typ_veh='TWO WHEELER';

---- Q.13 List the Purchased Items which are used for Customer Service with Unit of that Item. 

SELECT DISTINCT
       sp.spid,
       sp.spname,
       sp.spunit
FROM purchase p
JOIN ser_det s
  ON p.spid = s.spid
JOIN sparepart sp
  ON sp.spid = p.spid
ORDER BY spid asc;


---- Q.14 Customers who have Colored their vehicles. 


SELECT c.cid, 
       c.cname 
FROM customer_details c
JOIN ser_det s ON c.cid = s.cid
WHERE s.typ_ser = 'COLOR';


---- Q.15 Find the annual income of each employee inclusive of Commission 

SELECT DISTINCT e.eid,
                e.ename,
                e.esal,
                s.comm,
(e.esal +NVL(s.comm,0)) * 12 AS total_salary
FROM employee e
LEFT JOIN ser_det s
  ON e.eid = s.eid;


---- Q.16 Vendor Names who provides the engine oil. 

SELECT DISTINCT v.vid,
                v.vname
FROM vendors v
JOIN purchase p 
  ON v.vid = p.vid
     JOIN sparepart sp
       ON p.spid = sp.spid
WHERE sp.spname LIKE '%ENGINE OIL';


---- 17 Total Cost to purchase the Color and name the color purchased. 

SELECT s.spname, 
   SUM(p.total) AS total_cost
FROM sparepart s
JOIN purchase p ON s.spid = p.spid
WHERE LOWER(s.spname) LIKE '%colour%'
GROUP BY s.spname;


---- Q.18 Purchased Items which are not used in "Ser_det". 

SELECT spid, spname 
FROM sparepart
WHERE spid IN (SELECT spid FROM purchase)
  AND spid NOT IN (SELECT spid FROM ser_det);
------------------------------------------------------------------

SELECT sp.spname
FROM sparepart sp
WHERE EXISTS (select 1 from purchase p 
              where p.spid = sp.spid)
AND NOT EXISTS (select 1 from ser_det s 
                where s.spid = sp.spid ); 
                  
  
---- Q.19 Spare Parts Not Purchased but existing in Sparepart 

SELECT spid, 
       spname 
FROM sparepart
WHERE spid NOT IN (SELECT spid FROM purchase)
  AND spid  IN (SELECT spid FROM sparepart);


---- Q.20 Calculate the Profit/Loss of the Firm. consider one month salary of each employee for Calculation. 

SELECT revenue - (purchase_exp + salary_exp) AS net_profit_loss
FROM (
    SELECT 
        (SELECT SUM(total) FROM ser_det) AS revenue,
        (SELECT SUM(total) FROM purchase) AS purchase_exp,
        (SELECT SUM(NVL(esal, 0)) FROM employee) AS salary_exp
    FROM dual
);


---- Q.21 Specify the names of customers who have serviced their vehicles more than one time.

SELECT c.cname
FROM customer_details c
JOIN ser_det s
ON c.cid = s.cid
GROUP BY c.cname
HAVING COUNT (s.cid) > 1; 


---- Q.22 List the Items purchased from vendors locationwise. SELECT 

SELECT v.vadd AS location, 
       s.spname AS item_name, 
       p.pqty AS quantity
FROM vendors v
JOIN purchase p ON v.vid = p.vid
JOIN sparepart s ON p.spid = s.spid
ORDER BY v.vadd;


---- Q.23 Display count of two wheeler and four wheeler from ser_details 

SELECT typ_veh, 
COUNT(*) AS vehicle_count
FROM ser_det
GROUP BY typ_veh;


---- Q24 Display name of customers who paid highest SPGST and for which item 

SELECT * FROM
(
SELECT c.cname,
       s.spname,
       sd.sp_gst
FROM customer_details c
JOIN ser_det sd
  ON c.cid = sd.cid
JOIN sparepart s
  ON s.spid = sd.spid
ORDER BY sd.sp_gst desc
)
WHERE ROWNUM = 1; 


---- Q25 Display vendors name who have charged highest SPGST rate  for which item 

SELECT * FROM 
(
  SELECT v.vname,
         s.spname,
         p.spgst
  FROM vendors v
  JOIN purchase p
    ON v.vid = p.vid
  JOIN sparepart s
    ON s.spid = p.spid
  ORDER BY p.spgst desc
)
WHERE ROWNUM = 1;


---- Q26   list name of item and employee name who have received item 

SELECT s.spname AS item_name,
       e.ename AS empoyee_name 
FROM purchase p
JOIN sparepart s
  ON s.spid = p.spid
JOIN employee e
  ON e.eid = p.rcv_eid;


---- Q27 Display the Name and Vehicle Number of Customer who serviced 
       --his vehicle, And Name the Item used for Service, And specify the 
       --purchase date of that Item with his vendor and Item Unit and Location, 
       --And employee Name who serviced the vehicle. for Vehicle NUMBER 
       --"MH-14PA335".

SELECT c.cname AS customer_name,
       s.veh_no AS vehicle_number,    
       sp.spname AS item_used,
       p.pdate AS purchase_date,
       v.vname AS vendor_name,
       sp.spunit AS item_unit,
       v.vadd AS vendor_location,
       e.ename AS employee_name
FROM ser_det s 
JOIN customer_details c
  ON c.cid = s.cid
JOIN employee e
  ON e.eid = s.eid
JOIN sparepart sp
  ON s.spid = sp.spid
JOIN purchase p
  ON s.spid = p.spid
JOIN vendors v
  ON v.vid = p.vid
WHERE s.veh_no = 'MH14PA335';


---- Q28 who belong this vehicle  MH-14PA335" Display the customer name 

SELECT c.cname AS customer_name,
       s.veh_no
FROM customer_details c
JOIN ser_det s
  ON c.cid = s.cid
WHERE s.veh_no = 'MH14PA335';


---- Q29 Display the name of customer who belongs to New York and when 
       --he /she service their  vehicle on which date 

SELECT c.cname AS customer_name,
       s.veh_no
FROM customer_details c
JOIN ser_det s
  ON c.cid = s.cid
WHERE s.veh_no = 'MH14PA335';


---- Q 30 from whom we have purchased items having maximum cost?

SELECT * FROM
(
SELECT v.vname AS vendor_name,
       p.total AS maximum_cost
FROM vendors v
JOIN purchase p
  ON v.vid = p.vid
ORDER BY p.total desc  
)  
WHERE ROWNUM = 1; 


---- Q31 Display the names of employees who are not working as Mechanic 
    --and that employee done services 

SELECT DISTINCT e.ename, 
                e.eid,
                e.ejob
FROM employee e
JOIN ser_det s ON e.eid = s.eid
WHERE UPPER(e.ejob) != 'MECHANIC';


---- Q32 Display the various jobs along with total number of employees in 
       --each job. The output should contain only those jobs with more than two employees. 

SELECT  ejob, 
    COUNT(*) AS total_employees
FROM employee
GROUP BY ejob
HAVING COUNT(*) > 2;


---- Q33 Display the details of employees who done service  and give them 
      --rank according to their no. of services . 

SELECT e.eid,
       e.ename,
       e.ejob,
       COUNT(s.sid) AS total_services,
       RANK() OVER (ORDER BY COUNT(s.sid) DESC) AS service_rank
FROM employee e
JOIN ser_det s
    ON e.eid = s.eid
GROUP BY
    e.eid,
    e.ename,
    e.ejob;


---- Q 34 Display those employees who are working as Painter and fitter and 
       --who provide service and total count of service done by fitter and painter  

SELECT e.ejob, 
       e.ename, 
    COUNT(s.sid) AS service_count
FROM employee e
JOIN ser_det s ON e.eid = s.eid
WHERE UPPER(e.ejob) IN ('PAINTER', 'FITTER')
GROUP BY e.ejob, e.ename;


---- Q35 Display employee salary and as per highest  salary provide Grade 
      --to employee  

SELECT eid,
       ename,
       esal,
  CASE 
       WHEN esal >= 1500 THEN 'A'
       WHEN esal >= 1000 THEN 'B'
         ELSE 'C'
  END AS grade         
FROM employee
ORDER BY esal desc;


---- Q36  display the 4th record of emp table without using group by and rowid 

SELECT * FROM 
(
  SELECT e.*,
         ROWNUM rn
  FROM employee e
  ORDER BY eid
)
WHERE rn = 5;


---- Q37 Provide a commission 100 to employees who are not earning any commission. 

UPDATE ser_det 
SET comm = 100 
WHERE comm IS NULL or comm=0;

rollback;

---- Q38 write a query that totals no. of services  for each day and place the results in descending order 

SELECT 
    TO_CHAR(ser_date, 'DD-MON-YYYY') AS "Service Day", 
    COUNT(sid) AS total_services
FROM ser_det
GROUP BY ser_date
ORDER BY ser_date DESC;


---- Q39 Display the service details of those customer who belong from same city 

SELECT c.cname,
       c.cadd AS city,
       s.typ_veh,
       s.typ_ser,
       s.ser_date
FROM customer_details c
JOIN ser_det S
  ON c.cid = s.cid
WHERE c.cadd IN
(
      SELECT cadd
      FROM customer_details 
      GROUP BY cadd 
      HAVING COUNT (*) > 1
)
ORDER BY c.cadd, c.cname;
 

---- Q40 write a query join customers table to itself to find all pairs of 
      --customers service by a single employee 

SELECT DISTINCT 
    c1.cname AS Customer_A, 
    c2.cname AS Customer_B, 
    s1.eid AS Shared_Employee_ID
FROM ser_det s1, ser_det s2, customer_details c1, customer_details c2
WHERE s1.eid = s2.eid
AND s1.cid = c1.cid
AND s2.cid = c2.cid
AND s1.cid < s2.cid;

select * from customer_details


---- Q41 List each service number follow by name of the customer who made  that service 

SELECT DISTINCT s.sid,
                s.cid,
                c.cname
FROM ser_det s
JOIN customer_details c
  ON s.cid = c.cid
ORDER BY s.cid;


---- Q42 Write a query to get details of employee and provide rating on 
     --basis of  maximum services provide by employee  .Note (rating should 
      --be like A,B,C,D) 

SELECT DISTINCT e.eid,
                e.ename,
                e.ejob,
                e.eadd,
                COUNT (s.sid) AS total,
           CASE 
                WHEN COUNT (s.sid) >= 4 THEN 'A'
                WHEN COUNT (s.sid) = 2 THEN 'B'
                  ELSE 'C'
           END AS rating           
FROM employee e
LEFT JOIN ser_det s
       ON e.eid = s.eid
GROUP BY e.eid, e.ename, e.ejob, e.eadd
ORDER BY total desc;


---- Q43 Write a query to get maximum service amount of each customer 
      --with their customer details ? 

SELECT c.cid,
       c.cname,
       c.cadd,
       MAX(s.ser_amt) AS max_ser_amt
FROM customer_details c
JOIN ser_det s
  ON c.cid = s.cid
GROUP BY c.cid,
         c.cname,
         c.cadd  
ORDER BY max_ser_amt desc;


---- Q44 Get the details of customers with his total no of services ? 

SELECT c.cid,
       c.cname,
       c.cadd,
       COUNT (s.sid) AS total_services
FROM customer_details c
LEFT JOIN ser_det s
  ON c.cid = s.cid
GROUP BY c.cid,
         c.cname,
         c.cadd
ORDER BY total_services desc;

select * from ser_det

select * from employee


---- Q45 From which location sparpart purchased  with highest cost ? 

SELECT v.vadd AS location,
       p.total AS highest_cost,
       s.spname AS sparepart_name
FROM purchase p
JOIN vendors v
  ON p.vid = v.vid
JOIN sparepart s
  ON p.spid = s.spid
WHERE p.total = (SELECT MAX (total) FROM purchase);


---- 46 Get the details of employee with their service details who has salary 
      --is null 

SELECT e.eid,
       e.ename,
       e.ejob,
       e.eadd,
       e.esal,
       s.eid,
       s.typ_veh,
       s.veh_no,
       s.typ_ser,
       s.ser_date,
       s.ser_amt
FROM employee e
LEFT JOIN ser_det s
  ON e.eid = s.eid
WHERE e.esal IS NULL; 


---- Q47 find the sum of purchase location wise 

SELECT v.vadd AS location, 
   SUM(p.total) AS total_purchase_amount
FROM vendors v
JOIN purchase p ON v.vid = p.vid
GROUP BY v.vadd
ORDER BY total_purchase_amount DESC;


---- Q48 write a query sum of purchase amount in word location wise ? 

SELECT v.vadd AS location, 
   SUM(p.total) AS total_purchase_amount
FROM vendors v
JOIN purchase p ON v.vid = p.vid
GROUP BY v.vadd
ORDER BY total_purchase_amount DESC;


---- Q49 Has the customer who has spent the largest amount money has been give highest rating 

SELECT cid, 
       c_creditdays
FROM customer_details
WHERE c_creditdays = (
    SELECT MAX(c_creditdays)
    FROM customer_details
);

SELECT cid, 
       SUM(total) AS total_spent
FROM ser_det
GROUP BY cid
HAVING SUM(total) = (
    SELECT MAX(SUM(total))
    FROM ser_det
    GROUP BY cid
);



---- Q50 select the total amount in service for each customer for which 
    --the total is greater than the amount of the largest service amount in the table 

SELECT c.cname, 
   SUM(s.total) AS total_customer_spend
FROM customer_details c
JOIN ser_det s ON c.cid = s.cid
GROUP BY c.cid, c.cname
HAVING SUM(s.total) > (SELECT MAX(total) FROM ser_det);


---- 51  List the customer name and sparepart name used for their vehicle 
      --and  vehicle type 

SELECT c.cname AS customer_name, 
       sp.spname AS sparepart_name, 
       s.typ_veh AS vehicle_type
FROM ser_det s
JOIN customer_details c ON s.cid = c.cid
JOIN sparepart sp ON s.spid = sp.spid;


---- Q52 Write a query to get spname ,ename,cname quantity ,rate ,service 
      --amount for record exist in service table 

SELECT sp.spname, 
       e.ename, 
       c.cname, 
       s.qty, 
       sp.sprate, 
       s.ser_amt
FROM ser_det s
JOIN sparepart sp ON s.spid = sp.spid
JOIN employee e ON s.eid = e.eid
JOIN customer_details c ON s.cid = c.cid;


---- Q53 specify the vehicles owners who’s tube damaged. 

SELECT c.cname AS owner_name, 
       s.veh_no, 
       sp.spname AS part_replaced
FROM customer_details c
JOIN ser_det s ON c.cid = s.cid
JOIN sparepart sp ON s.spid = sp.spid
WHERE sp.spname = 'TWO WHEELER TUBE';


---- Q.54 Specify the details who have taken full service. 

SELECT c.cname, 
       s.veh_no, 
       s.ser_date, 
       s.typ_ser, 
       s.total
FROM ser_det s
JOIN customer_details c ON s.cid = c.cid
WHERE s.typ_ser = 'FULL SERVICING';


---- Q.55 Select the employees who have not worked yet and left the job. 

SELECT eid, 
       ename, 
       ejob, 
       edoj, 
       edol
FROM employee
WHERE edol IS NOT NULL
AND eid NOT IN (SELECT eid FROM ser_det);


---- Q.56  Select employee who have worked first ever. 

SELECT e.eid, 
       e.ename, 
       s.ser_date, 
       s.typ_ser
FROM employee e
JOIN ser_det s ON e.eid = s.eid
WHERE s.ser_date = (SELECT MIN(ser_date) FROM ser_det);


---- Q.57 Display all records falling in odd date 

SELECT * FROM ser_det 
WHERE MOD(TO_CHAR(ser_date, 'DD'), 2) <> 0;


---- .58 Display all records falling in even date 
SELECT * FROM ser_det 
WHERE MOD(TO_CHAR(ser_date, 'DD'), 2)= 0;


---- Q.59 Display the vendors whose material is not yet used. 

SELECT DISTINCT v.vid, 
                v.vname, 
                v.vadd
FROM vendors v
JOIN purchase p ON v.vid = p.vid
WHERE p.spid NOT IN (
    SELECT spid 
    FROM ser_det 
    WHERE spid IS NOT NULL
);


----Q.60 Difference between purchase date and used date of spare part.

SELECT p.pdate     AS purchase_date,
       sd.ser_date AS used_date,
       (sd.ser_date - p.pdate) AS days_difference
FROM purchase p
JOIN ser_det sd
  ON p.spid = sd.spid;
