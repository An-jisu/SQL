/* 1번 문제*/
USE smDB;
CREATE TABLE studentTBL
(studentID INT NOT NULL PRIMARY KEY, 
 Name VARCHAR(5) NOT NULL, 
 Grade SMALLINT NOT NULL, 
 Department VARCHAR(10) NOT NULL, 
 Entrance DATE, 
 Graduation DATE);
 SELECT * FROM studentTBL;
 
 /* 2-(1)번 문제*/
USE sqldb;
CREATE TABLE testTBL
(id INT AUTO_INCREMENT PRIMARY KEY, 
 userName CHAR(3),
 age INT);
INSERT INTO testTBL VALUES(NULL, '지연', 25);
INSERT INTO testTBL VALUES(NULL, '유나', 22);
SELECT * FROM testTBL;

 /* 2-(2)번 문제*/
USE sqlDB;
SELECT userID AS ‘사용자’, AVG(amount) AS ‘구매개수’ FROM buyTBL 
 GROUP BY userID HAVING AVG(amount)>3;

/* 3번 문제*/
USE smDB;
CREATE TABLE shopTBL
(ID VARCHAR(8) NOT NULL PRIMARY KEY, 
 Name VARCHAR(5) NOT NULL, 
 Age SMALLINT,
 Price INT NOT NULL,
 Product VARCHAR(10) NOT NULL,
 Amount SMALLINT NOT NULL);
INSERT INTO shopTBL VALUES('aaa', '김시영', 21, 100, '컴퓨터', 2);
INSERT INTO shopTBL VALUES('bbb', '이만석', 27, 20, '운동화', 3);
INSERT INTO shopTBL VALUES('ccc', '왕눈이', 33, 50, '스마트폰', 1);
INSERT INTO shopTBL VALUES('ddd', '오진석', 35, 120, '컴퓨터', 2);
INSERT INTO shopTBL VALUES('eee', '서정진', 19, 43, '가방', 1);
INSERT INTO shopTBL VALUES('fff', '김바로', 22, 110, '컴퓨터', 1);
INSERT INTO shopTBL VALUES('ggg', '박서수', 23, 68, '지갑', 5);
INSERT INTO shopTBL VALUES('hhh', '유정은', 43, 25, '마우스', 10);
INSERT INTO shopTBL VALUES('iii', '권수연', 28, 10, '화장품', 3);
SELECT * FROM shopTBL;

/* 3-(2)번 문제*/
SELECT ID AS '사용자', Amount AS '제품명' FROM shopTBL
 WHERE Amount=(SELECT MAX(Amount) FROM shopTBL) or
 Amount=(SELECT MIN(Amount) FROM shopTBL) ORDER BY Amount DESC;

/* 3-(3)번 문제*/
SELECT * FROM shopTBL WHERE Name LIKE '_정%';

/* 3-(4)번 문제*/
DELETE FROM shopTBL  WHERE Name = '왕눈이';
SELECT * FROM shopTBL;
 
 /* 3-(5)번 문제*/
UPDATE shopTBL SET Price = price*2 WHERE Product = '컴퓨터';
SELECT * FROM shopTBL;

SELECT * FROM userTBL;
SELECT * FROM buyTBL;
SELECT * FROM productTbl;
 
INSERT INTO userTBL VALUES('aaa', '안지수', 0, 21, '여', '2001-01-20', '서울시');
INSERT INTO userTBL VALUES('bbb', '김나연', 0, 23, '여', '1999-08-03', '경기도');
INSERT INTO userTBL VALUES('ccc', '이철수', 0, 23, '남', '1999-11-07', '인천');




INSERT INTO buyTBL VALUES('aaa', 200, 1, 'Outer');
INSERT INTO buyTBL VALUES('bbb', 500, 1, 'Shoes');
INSERT INTO buyTBL VALUES('ccc', 150, 1, 'Skirt');

INSERT INTO productTbl VALUES('Outer', 10);
INSERT INTO productTbl VALUES('Top', 12);
INSERT INTO productTbl VALUES('Dress', 7);
INSERT INTO productTbl VALUES('Pants', 16);
INSERT INTO productTbl VALUES('Skirt', 4);
INSERT INTO productTbl VALUES('Shoes', 2);