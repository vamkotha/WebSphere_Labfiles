

-- Generated by Relational Schema Center on Sun Oct 08 23:37:03 EDT 2006 for DB2 Universal Database Express V8.2


CREATE SCHEMA WASADMIN;

CREATE TABLE WASADMIN.CUSTOMER
  (EMAIL VARCHAR(250) NOT NULL,
   NAME VARCHAR(250),
   ADDRESS VARCHAR(250),
   CITY VARCHAR(250),
   STATE1 VARCHAR(250),
   ZIP INTEGER NOT NULL);

ALTER TABLE WASADMIN.CUSTOMER
  ADD CONSTRAINT PK_CUSTOMER PRIMARY KEY (EMAIL);

CREATE TABLE WASADMIN.LINEITEM
  (ID INTEGER NOT NULL,
   QUANTITY INTEGER NOT NULL,
   PURCHASE_ID INTEGER,
   PRODUCT_ID INTEGER);

ALTER TABLE WASADMIN.LINEITEM
  ADD CONSTRAINT PK_LINEITEM PRIMARY KEY (ID);

CREATE TABLE WASADMIN.PURCHASE
  (ID INTEGER NOT NULL,
   TOTAL DOUBLE NOT NULL,
   ADDRESS VARCHAR(250),
   CITY VARCHAR(250),
   STATE1 VARCHAR(250),
   ZIP INTEGER NOT NULL,
   CUSTOMER_EMAIL VARCHAR(250));

ALTER TABLE WASADMIN.PURCHASE
  ADD CONSTRAINT PK_PURCHASE PRIMARY KEY (ID);

CREATE TABLE WASADMIN.PRODUCT
  (ID INTEGER NOT NULL,
   NAME VARCHAR(250),
   DESCR VARCHAR(250),
   PRICE DOUBLE NOT NULL,
   IMAGEURI VARCHAR(250));

ALTER TABLE WASADMIN.PRODUCT
  ADD CONSTRAINT PK_PRODUCT PRIMARY KEY (ID);