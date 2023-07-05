USE sqlDB;
SELECT * FROM userTBL;
SELECT * FROM userTBL WHERE name='김경호';
SELECT * FROM userTBL WHERE birthYear>=1970 OR height>=182;
SELECT * FROM userTBL WHERE birthYear<1970 OR height<=182;
SELECT * FROM userTBL WHERE height>=180 AND height<=183;
SELECT * FROM userTBL WHERE height BETWEEN 180 AND 183;
SELECT  Name, addr FROM userTBL WHERE addr='경남' OR addr='전남' OR addr='경북';
SELECT  Name, addr FROM userTBL WHERE addr IN('경남', '전남', '경북');

SELECT Name, height FROM userTBL WHERE Name LIKE '김%';
SELECT Name, height FROM userTBL WHERE Name Like '_종신';
SELECT Name, height FROM userTBL WHERE Name Like '_용%';

SELECT height FROM userTBL WHERE Name='김경호';
SELECT Name, height FROM userTBL WHERE height>177;
SELECT Name, height FROM userTBL 
  WHERE height>(SELECT height FROM userTBL WHERE Name='김경호');
  
-- 경남지역에 사는 사람보다 키가 큰 사람의 이름과 키 : 오류!!! 경남에 사는 사람은 여러 명(ANY넣어)--
SELECT Name, height FROM userTBL 
  WHERE height > ANY(SELECT height FROM userTBL WHERE addr='경남');
  
-- 서울에 있는 사람보다 키가 작은 사람의 아이디 --
SELECT userID FROM userTBL 
  WHERE height < ANY(SELECT height from userTBL WHERE addr='서울');
  
