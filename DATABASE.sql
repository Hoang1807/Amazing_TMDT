USE master
CREATE DATABASE AMAZING_TMDT
GO
USE AMAZING_TMDT

CREATE TABLE USERS(
	USER_PHONE VARCHAR(11) PRIMARY KEY,
	USER_PASSWORD VARCHAR(50) NOT NULL,
	USER_FULLNAME NVARCHAR(264) NOT NULL,
	USER_IMAGE VARCHAR(MAX),
	USER_EMAIL VARCHAR(50) NOT NULL
);

CREATE TABLE SHIPPER(
	SHIPPER_ID UNIQUEIDENTIFIER PRIMARY KEY,
	SHIPPER_PASSWORD VARCHAR(50) NOT NULL,
	SHIPPER_DATE DATE NOT NULL,
	SHIPPER_AVATAR VARCHAR(MAX) NOT NULL,
	SHIPPER_PHONE VARCHAR(11) NOT NULL,
	SHIPPER_LICENSE VARCHAR(MAX) NOT NULL,
	SHIPPER_FULLNAME NVARCHAR(264) NOT NULL
);

CREATE TABLE INVOICE(
	INVOICE_ID INT IDENTITY(1,1) PRIMARY KEY,
	INVOICE_ADDRESS VARCHAR(MAX) NOT NULL,
	INVOICE_DATE DATETIME NOT NULL,
	INVOICE_NOTE NVARCHAR(MAX),
	INVOICE_SHIPPINGSTATUS BIT DEFAULT(0),
	SHIPPER_ID UNIQUEIDENTIFIER REFERENCES SHIPPER(SHIPPER_ID),
	USER_PHONE VARCHAR(11) REFERENCES USERS(USER_PHONE) NOT NULL
);

CREATE TABLE STORE(
	STORE_ID UNIQUEIDENTIFIER PRIMARY KEY,
	STORE_PASSWORD VARCHAR(50) NOT NULL,
	STORE_ADDRESS NVARCHAR(MAX),
	STORE_NAME NVARCHAR(128) NOT NULL,
	STORE_PHONE VARCHAR(11) NOT NULL,
	STORE_EMAIL VARCHAR(128) NOT NULL,
	STORE_IMAGE VARCHAR(MAX) NULL
);

CREATE TABLE CATEGORY(
	CATE_ID UNIQUEIDENTIFIER PRIMARY KEY,
	CATE_NAME NVARCHAR(128) NOT NULL,
	STORE_ID UNIQUEIDENTIFIER REFERENCES STORE(STORE_ID) NOT NULL
);

CREATE TABLE PRODUCT(
	PRODUCT_ID UNIQUEIDENTIFIER PRIMARY KEY,
	PRODUCT_NAME NVARCHAR(128) NOT NULL,
	PRODUCT_DESCRIPTION NVARCHAR(MAX),
	CATE_ID UNIQUEIDENTIFIER REFERENCES CATEGORY(CATE_ID) NOT NULL
);

CREATE TABLE TYPE(
	TYPE_ID UNIQUEIDENTIFIER PRIMARY KEY,
	TYPE_NAME VARCHAR(128) NOT NULL,
	TYPE_PRICE INT NOT NULL,
	TYPE_QUANTITY INT NOT NULL,
	TYPE_IMAGE VARCHAR(MAX) NOT NULL,
	PRODUCT_ID UNIQUEIDENTIFIER REFERENCES PRODUCT(PRODUCT_ID) NOT NULL,
);

CREATE TABLE INVOICE_DETAIL(
	INVOICE_ID INT REFERENCES INVOICE(INVOICE_ID),
	PRODUCT_ID UNIQUEIDENTIFIER REFERENCES PRODUCT(PRODUCT_ID),
	PRIMARY KEY(INVOICE_ID, PRODUCT_ID),
	INVOICE_DT_PRICE INT NOT NULL,
	INVOICE_DT_QUANTITY INT NOT NULL,
);