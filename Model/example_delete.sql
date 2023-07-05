use sqlDB;
CREATE TABLE testTBL1(id int, userName char(3), age int);
SELECT * FROM testTBL1;
INSERT INTO testTBL1 VALUES(1, '홍길동', 25);
INSERT INTO testTBL1(id, userName) VALUES(2, '설현');
INSERT INTO testTBL1(userName, age, id) VALUES('조아', 26, 3);

CREATE TABLE testTBL2(id int auto_increment PRIMARY KEY, userName char(3), age int);
SELECT * FROM testTBL2;
INSERT INTO testTBL2 VALUES(NULL, '지연', 25);
INSERT INTO testTBL2 VALUES(NULL, '유나', 22);
INSERT INTO testTBL2 VALUES(NULL, '유정', 21);
SELECT LAST_INSERT_ID();
/*100부터 번호 매김*/
ALTER TABLE testTBL2 auto_increment=100;
INSERT INTO testTBL2 VALUES(NULL, '찬미', 23);
/*1000부터 3씩 건너뛰어 번호 매김*/
ALTER TABLE testTBL2 auto_increment=1000;
SET @@auto_increment_increment = 3;
INSERT INTO testTBL2 VALUES(NULL, '나연', 20);
INSERT INTO testTBL2 VALUES(NULL, '정현', 18);
INSERT INTO testTBL2 VALUES(NULL, '모모', 19);

/*employees에 있는 샘플 데이터 가져오려고 함(테이블 새로만들고, insert into(select from)*/
USE sqlDB;
CREATE TABLE testTBL4(id int, Fname varchar(50), Lname varchar(50));
SELECT *FROM testTBL4;

USE employees;
SELECT * FROM employees;
INSERT INTO testTBL4
 SELECT emp_no, first_name, last_name FROM employees.employees;
 
/*employees에 있는 샘플 데이터 가져오려고 함(테이블 만드는 동시에 넣어줌-insert into 없이)*/
CREATE TABLE testTBL5
 (SELECT emp_no, first_name, last_name FROM employees.employees);
SELECT * FROM testTBL5;

/*기존의 데이터 업데이트(Fname이 Kyoichi라는 사람의 Lname을 없음으로 바꾸기)*/
SELECT *FROM testTBL4;
UPDATE testTBL4
  SET Lname = '없음' WHERE Fname = 'Kyoichi';

/*기존의 데이터 업데이트(가격 1.5배 오름.)*/
SELECT * FROM buyTBL;
UPDATE buyTBL SET price = price*1.5;

/*데이터 삭제(Georgi 지움)*/
DELETE FROM testTBL4 WHERE Fname = 'Georgi';

/*데이터 삭제하는 3가지의 차이 보기
DELETE가 시간 제일 많이 걸림(해당 데이터만 바뀜)
DROP(구조까지 바뀜)
TRUNCATE(구조 남김. DELETE가 시간 조금 더 걸림)
----> 테이블 완전히 지울 때: DROP, 데이터 한두개: DELETE*/
CREATE TABLE bigTBL1(SELECT * FROM employees.employees);
CREATE TABLE bigTBL2(SELECT * FROM employees.employees);
CREATE TABLE bigTBL3(SELECT * FROM employees.employees);

DELETE FROM bigTBL1;
DROP TABLE bigTBL2;
TRUNCATE TABLE bigTBL3;

/*userID를 PRIMARY KEY로 지정하여 똑같은 ID데이터 넣으면 오류
그 아래것도 모두 안들어감 (IGNORE 써서 오류 난거 무시하고 넣기)*/
SELECT * FROM userTBL;
CREATE TABLE memberTBL(SELECT userID, name, addr FROM userTBL LIMIT 3);
SELECT * FROM memberTBL;
ALTER TABLE memberTBL
  ADD CONSTRAINT pk_memberTBL PRIMARY KEY(userID);
INSERT IGNORE INTO memberTBL values('BBK', '바비코', '미국');
INSERT IGNORE INTO memberTBL values('SJH', '서장훈', '서울');
INSERT IGNORE INTO memberTBL values('HJY', '현주협', '경기도');



