create DATABASE FLOWER;
CREATE TABLE CUSTOMER(
CUSTID VARCHAR(10)PRIMARY KEY ,
CUSTNAME VARCHAR(20),
ADDRESS VARCHAR(30),
PHNO INT(10));
DESC CUSTOMER; 

CREATE TABLE SUPPLIER(
SID VARCHAR(10),
SNAME VARCHAR(30),
SPHNO NUMERIC,
PRIMARY KEY(SID));
desc SUPPLIER;

CREATE TABLE STAFF(
STID VARCHAR(10) PRIMARY KEY,
STNAME VARCHAR(30),
SALARY LONG);
DESC STAFF;

CREATE TABLE FLOWERS(
FID VARCHAR(10) PRIMARY KEY,
FNAME VARCHAR(30),
PRICE LONG,
SID VARCHAR(10),
CONSTRAINT FK FOREIGN KEY(SID) REFERENCES SUPPLIER(SID)
ON DELETE CASCADE
ON UPDATE CASCADE);
DESC FLOWERS;
CREATE TABLE TRANSACTION(
TID VARCHAR(10) PRIMARY KEY,
DATE date,
FID VARCHAR(10),
CONSTRAINT  FOREIGN KEY(FID) REFERENCES FLOWERS(FID)ON DELETE CASCADE ON UPDATE CASCADE,
CUSTID VARCHAR(10),
CONSTRAINT  FOREIGN KEY(CUSTID)REFERENCES  CUSTOMER(CUSTID)ON DELETE CASCADE ON UPDATE CASCADE,
STID VARCHAR(10),
CONSTRAINT  FOREIGN KEY(STID) REFERENCES STAFF(STID)ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO CUSTOMER
VALUES('1','HUZAIF','BANGALORE','123456789'),
('2','AZEEM','RAMNAGAR','987654321');
SELECT * FROM CUSTOMER;
INSERT INTO CUSTOMER
VALUES('3','ADY','KOLAR','123498765'),
('4','PHEENY','NORTH','987651234'),
('5','ZEN','BANGALORE','918273645');

COMMIT;
update CUSTOMER
SET CUSTNAME='JAVERIYA'
WHERE CUSTID='5';
select * from customer;

update CUSTOMER
SET CUSTNAME=''
WHERE CUSTID='5';
select * from customer;


INSERT INTO STAFF
VALUES('01','SUFIYAN','25000'),
('02','SUBIN','15000'),
('03','NITIN','18000'),
('04','RITHWIK','15000'),
('05','AKASH','15000');
SELECT * FROM STAFF;


INSERT INTO SUPPLIER
VALUES('001','VENUS','979312508'),
('002','ROOPA','997312508'),
('003','SAUMYA','805213979'),
('004','TEJASWINI','679312508'),
('005','SHIFA','939712508');
SELECT * FROM SUPPLIER;


INSERT INTO FLOWERS
VALUES('101','JASMINE','300','001'),
('102','ROSE','800','002'),
('103','HIBISCUS','250','002'),
('104','ORCHIDS','1000','003'),
('105','TULIPS','2000','004'),
('106','LILIES','1650','005');

SELECT * FROM FLOWERS;


INSERT INTO TRANSACTION
VALUES('201','14/02/22','102','5','01'),
('202','14/02/22','105','2','03'),
('203','08/08/22','101','1','01'),
('204','12/02/22','103','3','02'),
('205','5/12/22','104','4','05'),
('206','27/07/22','106','1','04');
SELECT * FROM TRANSACTION;

SELECT CUSTNAME,FNAME
FROM CUSTOMER C,STAFF S,TRANSACTION T,FLOWERS F
WHERE C.CUSTID=T.CUSTID AND S.STID=T.STID AND F.FID=T.FID
AND S.STNAME='SUFIYAN'
AND FID='102';





 