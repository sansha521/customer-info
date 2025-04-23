create database cust_info;
 
use cust_info; 
 
CREATE TABLE cust_prop ( 
    t_id     BIGINT NOT NULL COMMENT 'UNIQUE TRANSACTION ID', 
    t_date   DATETIME NOT NULL COMMENT 'TRANSACTION DATE', 
    t_amount BIGINT NOT NULL COMMENT 'TRANSACTION AMOUNT', 
    t_type   VARCHAR(10) NOT NULL COMMENT 'TRANSACTION TYPE - PURCHASE OR SALE', 
    cust_id  INT NOT NULL, 
    prop_id  BIGINT NOT NULL 
); 
 
 
ALTER TABLE cust_prop ADD CONSTRAINT cust_prop_pk PRIMARY KEY ( t_id ); 
 
  
CREATE TABLE customer ( 
    cust_id        INT NOT NULL COMMENT 'PRIMARY KEY OF THE CUSTOMER ID', 
    cust_type      VARCHAR(10) NOT NULL COMMENT 'TYPE OF THE CUSTOMER :CORPORATE OR 
INDIVIDUAL', 
    cust_comp_name VARCHAR(20) COMMENT 'COMPANY NAME', 
    cust_fname     VARCHAR(15) COMMENT 'FIRST NAME OF THE CUSTOMER', 
    cust_lname     VARCHAR(15) COMMENT 'CUSTOMER LAST NAME', 
    cust_staddr    VARCHAR(30) NOT NULL COMMENT 'STREET ADDRESS  OF THE CUSTOMER', 
    cust_state     VARCHAR(10) NOT NULL COMMENT 'STATE OF THE HOUSE', 
    cust_city      VARCHAR(10) NOT NULL COMMENT 'CITY OF THE CUSTOMER', 
    cust_zip       VARCHAR(5) NOT NULL COMMENT 'ZIPCODE' 
); 
 
 
 
ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( cust_id ); 
 
  
CREATE TABLE prop_type ( 
 
    type_id   BIGINT NOT NULL COMMENT 'UNIQUE  PROPERTY ID', 
    prop_type VARCHAR(20) NOT NULL COMMENT 'TYPE OF THE PROPERTY' 
); 
 
 
ALTER TABLE prop_type ADD CONSTRAINT prop_type_pk PRIMARY KEY ( type_id ); 
 
  
CREATE TABLE property ( 
    prop_id     BIGINT NOT NULL COMMENT 'UNIQUE PROPERTY ID', 
    prop_staddr VARCHAR(20) NOT NULL COMMENT ' PROPERTY STREET ADDRESS', 
    prop_city   VARCHAR(20) NOT NULL COMMENT ' PROPERTY CITY', 
    prop_state  VARCHAR(20) NOT NULL COMMENT ' PROPERTY STATE', 
    prop_zip    VARCHAR(5) NOT NULL COMMENT ' PROPERTY ZIPCODE', 
    prop_year   SMALLINT NOT NULL COMMENT ' YEAR THE  PROPERTY WAS BUILT', 
    prop_price  DECIMAL(20) NOT NULL COMMENT ' PROPERTY PRICE', 
    type_id     BIGINT 
); 
 
 
ALTER TABLE property ADD CONSTRAINT property_pk PRIMARY KEY ( prop_id ); 
 
ALTER TABLE cust_prop 
    ADD CONSTRAINT cust_prop_customer_fk FOREIGN KEY ( cust_id ) 
        REFERENCES customer ( cust_id ); 
 
ALTER TABLE cust_prop 
    ADD CONSTRAINT cust_prop_property_fk FOREIGN KEY ( prop_id ) 
        REFERENCES property ( prop_id ); 
 
ALTER TABLE property 
    ADD CONSTRAINT property_prop_type_fk FOREIGN KEY ( type_id ) 
        REFERENCES prop_type ( type_id ); 
 
 
INSERT INTO prop_type (type_id,prop_type) 
VALUES (1,'Resident'); 
 
 
INSERT INTO prop_type (type_id,prop_type) 
VALUES (2,'Commercial'); 
 
 
INSERT INTO prop_type (type_id,prop_type) 
VALUES (3,'ytartment'); 
INSERT INTO prop_type (type_id,prop_type) 
VALUES (4,'House'); 
INSERT INTO prop_type (type_id,prop_type) 
VALUES (5,'Condo'); 
INSERT INTO prop_type (type_id,prop_type) 
VALUES (6,'SingleFamily'); 
INSERT INTO prop_type (type_id,prop_type) 
VALUES (7,'MultiFamily'); 
INSERT INTO prop_type (type_id,prop_type) 
VALUES (8,'MobileHouse'); 
INSERT INTO prop_type (type_id,prop_type) 
VALUES (9,'Townhouse'); 
INSERT INTO prop_type (type_id,prop_type) 
VALUES (10,'Farmhouse'); 
INSERT INTO property(prop_id,prop_staddr,prop_state,prop_city,prop_zip,prop_year,prop_price,type_id) 
VALUES(1,'5Y','New York','Brooklyn',11205,1876,2000000,3); 
INSERT INTO property(prop_id,prop_staddr,prop_state,prop_city,prop_zip,prop_year,prop_price,type_id) 
VALUES(2,'34F','New York','Manhattan',10005,1954,10000000,9); 
INSERT INTO property(prop_id,prop_staddr,prop_state,prop_city,prop_zip,prop_year,prop_price,type_id) 
VALUES(3,'45gh','Texas','Dallas',29109,2015,115000,6); 
INSERT INTO property(prop_id,prop_staddr,prop_state,prop_city,prop_zip,prop_year,prop_price,type_id) 
VALUES(4,'5Y','California','Irvine',34981,2000,6700000,5); 
INSERT INTO property(prop_id,prop_staddr,prop_state,prop_city,prop_zip,prop_year,prop_price,type_id) 
VALUES(5,'R67','Phoenix','Arizona',67192,1999,2780000,7); 
INSERT INTO property(prop_id,prop_staddr,prop_state,prop_city,prop_zip,prop_year,prop_price,type_id) 
VALUES(6,'79SD','Texas','Austin',28761,1965,560000,5); 
INSERT INTO property(prop_id,prop_staddr,prop_state,prop_city,prop_zip,prop_year,prop_price,type_id) 
VALUES(7,'Greenwich','New York','Manhattan',10001,2015,9900000,8); 
INSERT INTO property(prop_id,prop_staddr,prop_state,prop_city,prop_zip,prop_year,prop_price,type_id) 
VALUES(8,'Chelsea','New York','Manhattan',10007,2016,8500000,2); 
INSERT INTO property(prop_id,prop_staddr,prop_state,prop_city,prop_zip,prop_year,prop_price,type_id) 
VALUES(9,'Johnson st','Massachusetts','Boston',57801,1978,4500000,3); 
INSERT INTO property(prop_id,prop_staddr,prop_state,prop_city,prop_zip,prop_year,prop_price,type_id) 
VALUES(10,'Financial Dt','Chicago','Illinois',76183,1856,8900000,1); 
INSERT INTO customer 
(cust_id,cust_type,cust_comp_name,cust_fname,cust_lname,cust_staddr,cust_state,cust_city,cust_zip) 
VALUES (1,'individual', ','adam','lee','23H','new york','brooklyn',11209); 
INSERT INTO customer 
(cust_id,cust_type,cust_comp_name,cust_fname,cust_lname,cust_staddr,cust_state,cust_city,cust_zip) 
VALUES (2,'individual', ','Mathew','Thomas','56G','Texas','Dallas',28201); 
INSERT INTO customer 
(cust_id,cust_type,cust_comp_name,cust_fname,cust_lname,cust_staddr,cust_state,cust_city,cust_zip) 
VALUES (3,'Corporate','Moxo.inc', ', ','45','new york','Manhattan',10001); 
INSERT INTO customer 
(cust_id,cust_type,cust_comp_name,cust_fname,cust_lname,cust_staddr,cust_state,cust_city,cust_zip) 
VALUES (4,'individual', ','*****','Baisan','12n','California','Bay area',34901); 
INSERT INTO customer 
(cust_id,cust_type,cust_comp_name,cust_fname,cust_lname,cust_staddr,cust_state,cust_city,cust_zip) 
VALUES (5,'Corporate','Weee.inc', ', ','TY','Texas','Austin',28709); 
INSERT INTO customer 
(cust_id,cust_type,cust_comp_name,cust_fname,cust_lname,cust_staddr,cust_state,cust_city,cust_zip) 
VALUES (6,'Corporate','DETE.inc', ', ','7','California','Irvine',34228); 
INSERT INTO customer 
(cust_id,cust_type,cust_comp_name,cust_fname,cust_lname,cust_staddr,cust_state,cust_city,cust_zip) 
VALUES (7,'Corporate','NXP semiconductors',',','1456','new york','Manhattan',10041); 
INSERT INTO customer 
(cust_id,cust_type,cust_comp_name,cust_fname,cust_lname,cust_staddr,cust_state,cust_city,cust_zip) 
VALUES (8,'individual', ','Henry','Cowill','Layfettest','new york','Manhattan',10081); 
INSERT INTO customer 
(cust_id,cust_type,cust_comp_name,cust_fname,cust_lname,cust_staddr,cust_state,cust_city,cust_zip) 
VALUES (9,'Corporate','Logos.inc', ', ','30HY','California','San Diego',34891); 
INSERT INTO customer 
(cust_id,cust_type,cust_comp_name,cust_fname,cust_lname,cust_staddr,cust_state,cust_city,cust_zip) 
VALUES (10,'individual', ','Thomas','Mason','univ st','Georgia','Atlanta',45003); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(1,'2021-11-03',5000000,'Sale',5,4); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(2,'2014-01-03',300000,'Purchase',3,6); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(3,'2019-03-24',7560000,'Sale',3,10); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(4,'2000-02-23',2000000,'Purchase',2,3); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(5,'2020-04-18',5600000,'Sale',6,7); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(6,'2006-06-20',5000000,'Purchase',10,8); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(7,'2010-07-06',4500000,'Sale',4,8); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(8,'2020-08-15',9000000,'Purchase',5,3); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(9,'2018-05-30',8500000,'Sale',7,10); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(10,'2016-04-25',6700000,'Purchase',5,8); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(11,'2011-03-25',11000000,'Purchase',10,4); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(12,'1999-01-01',5500000,'Sale',2,9); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(13,'2005-06-30',9500000,'Purchase',3,7); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(14,'1998-12-20',4500000,'Sale',6,10); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(15,'2021-02-03',1120000,'Sale',7,9); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(16,'2019-05-04',3900000,'Sale',6,6); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(17,'2007-07-31',96000000,'Purchase',4,10); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(18,'2006-07-22',5500000,'Sale',4,7); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(19,'2018-10-19',7650000,'Sale',3,3); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(20,'2003-11-20',4600000,'Purchase',1,1); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(21,'2018-06-17',750000,'Sale',4,9); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(22,'2014-07-11',23000000,'Sale',2,7); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(23,'2022-09-12',90000000,'Sale',6,9); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(24,'2005-12-19',85000000,'Purchase',7,10); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(25,'2021-07-27',75000000,'Sale',10,10); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(26,'2000-05-24',70000000,'Purchase',9,8); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(27,'17-02-20',46700000,'Sale',1,3); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(28,'2011-12-20',9800000,'Purchase',6,9); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(29,'1998-02-02',80000000,'Sale',4,10); 
INSERT INTO cust_prop(t_id,t_date,t_amount,t_type,cust_id,prop_id) 
VALUES(30,'2000-08-05',55000000,'Purchase',6,10); 
commit; 
use cust_info; 
SELECT  
CUST_PROP.PROP_ID, 
CUST_PROP.T_AMOUNT AS SALE_AMOUNT, 
CONCAT(PROPERTY.PROP_STADDR, ', ', PROPERTY.PROP_CITY, ', ', 
PROPERTY.PROP_STATE, ', ', PROPERTY.PROP_ZIP) AS FULL_ADDRESS 
FROM CUST_PROP 
JOIN PROPERTY ON CUST_PROP.PROP_ID = PROPERTY.PROP_ID 
 
WHERE CUST_PROP.T_TYPE = 'Sale' 
ORDER BY CUST_PROP.T_AMOUNT DESC 
LIMIT 1; 
 
SELECT  
    PROP_TYPE.PROP_TYPE, 
    SUM(CUST_PROP.T_AMOUNT) AS TOTAL_PURCHASE 
FROM CUST_PROP 
JOIN PROPERTY ON CUST_PROP.PROP_ID = PROPERTY.PROP_ID 
JOIN PROP_TYPE ON PROPERTY.TYPE_ID = PROP_TYPE.TYPE_ID 
WHERE CUST_PROP.T_TYPE = 'Purchase' 
GROUP BY PROP_TYPE.PROP_TYPE 
ORDER BY PROP_TYPE.PROP_TYPE; 
 
SELECT  
    SUM(CUST_PROP.T_AMOUNT) AS TOTAL_SALE_TEXAS 
FROM CUST_PROP 
JOIN PROPERTY ON CUST_PROP.PROP_ID = PROPERTY.PROP_ID 
WHERE CUST_PROP.T_TYPE = 'Sale' 
  AND PROPERTY.PROP_STATE = 'Texas'; 
 
SELECT  
    CUSTOMER.CUST_TYPE, 
    SUM(CASE WHEN CUST_PROP.T_TYPE = 'Sale' THEN CUST_PROP.T_AMOUNT ELSE 0 END) 
AS TOTAL_SALE, 
    SUM(CASE WHEN CUST_PROP.T_TYPE = 'Purchase' THEN CUST_PROP.T_AMOUNT ELSE 0 
END) AS TOTAL_PURCHASE 
FROM CUST_PROP 
JOIN CUSTOMER ON CUST_PROP.CUST_ID = CUSTOMER.CUST_ID 
WHERE EXTRACT(YEAR FROM CUST_PROP.T_DATE) > 2005 
GROUP BY CUSTOMER.CUST_TYPE; 
 
SELECT * 
FROM CUSTOMER 
WHERE CUST_ID = ( 
    SELECT CUST_ID 
    FROM CUST_PROP 
    GROUP BY CUST_ID 
    ORDER BY COUNT(*) DESC 
    LIMIT 1 
);