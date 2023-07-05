USE sqlDB;

SET @myVar1 = 5;
SET @myVar2 = 3;
SET @myVar3 = 4.25;
SET @myVar4 = '가수 이름==>';

SELECT @myVar1;
SELECT @myVar2 + @myVar3;
SELECT @myVar4, Name FROM userTBL WHERE height>180;

SET @myVar1 = 3;
PREPARE myQuery
   FROM 'SELECT Name, HEIGHT from userTBL ORDER BY height LIMIT ?';
EXECUTE myQuery USING @myVar1;




SELECT AVG(amount) AS '평균 구매 개수' FROM buyTBL;
SELECT CAST(AVG(amount) AS SIGNED INTEGER) AS '평균 구매 개수' FROM buyTBL;
SELECT CONVERT(AVG(amount), SIGNED INTEGER) AS '평균 구매 개수' FROM buyTBL;

SELECT CAST('2020$12$12' AS DATE);
SELECT CAST('2020/12/12' AS DATE);
SELECT CAST('2020%12%12' AS DATE);

SELECT '100'+'200'; 
SELECT CONCAT('100', '200'); 
SELECT CONCAT(100, '200');
SELECT 1>'2mega';
SELECT 3>'2MEGA';
SELECT 0='mega2';




SELECT IF(100>200, '참이다', '거짓이다');
SELECT IFNULL(NULL, '널이군요');
SELECT IFNULL(100, '널이군요');
SELECT NULLIF(100, 100), NULLIF(200, 100);

SELECT CASE 6
 WHEN 1 THEN '일'
 WHEN 5 THEN '오'
 WHEN 10 THEN '십'
 ELSE '모름'
END AS 'case연습';

-- 문자열 함수 --
SELECT ASCII('A'), CHAR(65);

SELECT BIT_LENGTH('abc'), CHAR_LENGTH('abc'), LENGTH('abc');
SELECT BIT_LENGTH('가나다'), CHAR_LENGTH('가나다'), LENGTH('가나다');

SELECT CONCAT_WS('/', '2020', '01', '01');

SELECT ELT(2, '하나', '둘', '셋'),
       FIELD('둘', '하나', '둘', '셋'),
       FIND_IN_SET('둘', '하나,둘,셋'),
       INSTR('하나둘셋', '둘'),
       LOCATE('둘', '하나둘셋');
       
SELECT FORMAT(123456.123456, 4);

SELECT BIN(31), HEX(31), OCT(31);

SELECT INSERT('abcdefghi', 3, 4, '@@@@'), 
	   INSERT('abcdefghi', 3, 2, '@@@@');
SELECT LEFT('abcdefghi', 3), RIGHT('abcdefghi', 3);

SELECT LCASE('abcdEFGH'), UCASE('abcdEFGH');

SELECT LPAD('이것이', 5, '##'), RPAD('이것이', 5, '##');
SELECT LTRIM('   이것이'), RTRIM('이것이    ');
SELECT TRIM('   이것이   '), TRIM(BOTH 'ㅋ' FROM 'ㅋㅋㅋ재밌어요.ㅋㅋㅋ');
SELECT TRIM('   이것이   '), TRIM(LEADING 'ㅋ' FROM 'ㅋㅋㅋ재밌어요.ㅋㅋㅋ');
SELECT TRIM('   이것이   '), TRIM(TRAILING 'ㅋ' FROM 'ㅋㅋㅋ재밌어요.ㅋㅋㅋ');

SELECT REPEAT('이것이', 3);
SELECT REPLACE('이것이 MySQL이다', '이것이', 'This is');
SELECT REVERSE('MySQL');
SELECT CONCAT('이것이', SPACE(10), 'MySQL이다');
SELECT SUBSTRING('대한민국만세', 3, 2);
SELECT SUBSTRING_INDEX('cafe.naver.com', '.', 2);
SELECT SUBSTRING_INDEX('cafe.naver.com', '.', -2);


-- 조인 --
use sqldb;
select * from buytbl inner join usertbl 
  on buytbl.userID = usertbl.userID
  WHERE buyTBL.userID = 'JYP';
  
SELECT B.userID, U.name, B.prodName, U.addr, U.mobile1+U.mobile2 AS '연락처'
  FROM buyTBL B INNER JOIN userTBL U on B.userID = U.userID ORDER BY U.userID;

-- 중복된 거 한번만 나오도록 --
SELECT DISTINCT U.userID, U.name, U.addr FROM userTBL U INNER JOIN buyTBL B 
  ON U.userID = B.userID ORDER BY U.userID;


USE sqlDB;
CREATE TABLE stdTBL
(stdName VARCHAR(10) NOT NULL PRIMARY KEY, 
addr CHAR(4) NOT NULL);

CREATE TABLE clubTBL
(clubName VARCHAR(10) NOT NULL PRIMARY KEY,
roomNo CHAR(4) NOT NULL);

CREATE TABLE stdclubTBL
(num int AUTO_INCREMENT NOT NULL PRIMARY KEY, 
stdName VARCHAR(10) NOT NULL, 
clubName VARCHAR(10) NOT NULL,
FOREIGN KEY(stdName) REFERENCES stdTBL(stdName), 
FOREIGN KEY(clubName) REFERENCES clubTBL(clubName));

INSERT INTO stdTBL VALUES('김범수', '경남'), ('성시경', '서울'), ('조용필', '경기'), ('은지원', '경북'), ('바비킴', '서울');
INSERT INTO clubTBL VALUES('수영', '101호'), ('바둑', '102호'), ('축구', '103호'), ('봉사', '104호');
INSERT INTO stdclubTBL VALUES(NULL, '김범수', '바둑'), (NULL, '김범수', '축구'), (NULL, '조용필', '축구'), 
(NULL, '은지원', '축구'), (NULL, '은지원', '봉사'), (NULL, '바비킴', '봉사');

USE sqlDB;
SELECT * FROM stdTBL;
SELECT * FROM clubTBL;
SELECT * FROM stdclubTBL;

SELECT S.stdName, S.addr, C.clubName, C.roomNo 
  FROM stdTBL S INNER JOIN stdclubTBL SC ON S.stdName = SC.stdName
			   INNER JOIN clubTBL C ON SC.clubName = C.clubName ORDER BY S.stdName;

SELECT C.clubName, C.roomNO, S.stdName, S.addr 
  FROM stdTBL S INNER JOIN stdclubTBL SC ON SC.stdName = S.stdName
				INNER JOIN clubTBL C ON SC.clubName = C.clubName ORDER BY C.clubName;
                
                
USE sqlDB;                

SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
  FROM userTBL U LEFT OUTER JOIN buyTBL B ON U.userID = B.userID ORDER BY U.userID;

SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
  FROM buyTBL B RIGHT OUTER JOIN userTBL U ON U.userID = B.userID ORDER BY U.userID;

SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
  FROM buyTBL B RIGHT OUTER JOIN userTBL U ON U.userID = B.userID WHERE B.prodName IS NULL ORDER BY U.userID;
                
-- self join --                
USE sqlDB;
CREATE TABLE empTBL (emp CHAR(3), manager CHAR(3), empTel VARCHAR(8));

SELECT * FROM empTBL;

INSERT INTO empTBL VALUES('나사장', NULL, '0000');
INSERT INTO empTBL VALUES('김재무', '나사장', '2222');
INSERT INTO empTBL VALUES('김부장', '김재무', '2222-1');
INSERT INTO empTBL VALUES('이부장', '김재무', '2222-2');
INSERT INTO empTBL VALUES('우대리', '이부장', '2222-2-1');
INSERT INTO empTBL VALUES('지사원', '이부장', '2222-2-2');
INSERT INTO empTBL VALUES('이영업', '나사장', '1111');
INSERT INTO empTBL VALUES('한과장', '이영업', '1111-1');
INSERT INTO empTBL VALUES('최정보', '나사장', '3333');
INSERT INTO empTBL VALUES('윤차장', '최정보', '3333-1');
INSERT INTO empTBL VALUES('이주임', '윤차장', '3333-1-1');

SELECT A.emp AS '부하직원', B.manager AS '직속상관', B.empTel AS '직속상관연락처'
FROM empTBL A INNER JOIN empTBL B ON A.manager = B.emp WHERE A.emp = '우대리';

                
                
                
                
                
                
                
                
                
                
                





