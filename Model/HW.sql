USE sqlDB;

SELECT * FROM buyTBL INNER JOIN userTBL userTBL
   ON buyTBL.userID = userTBL.userID
   WHERE buyTBL.userID = 'JYP';
   
SELECT B.userID, U.name, B.prodName, U.addr, U.mobile1+U.mobile2 AS '연락처'
  FROM buyTBL B INNER JOIN userTBL U ON B.userID = U.userID ORDER BY U.userID;
  
SELECT distinct U.userID, U.name, U.addr FROM userTBL U 
INNER JOIN buyTBL B on U.userID = B.userID ORDER BY U.userID;
  
/*  3개 테이블 조인하기  */
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

SELECT * FROM stdTBL;
SELECT * FROM clubTBL;
SELECT * FROM stdclubTBL;

SELECT S.stdName, S.addr, C.clubName, C.roomNo 
FROM stdTBL S INNER JOIN stdclubTBL SC ON S.stdName = SC.stdName
			 INNER JOIN clubTBL C ON SC.clubName = C.clubName
ORDER BY S.stdName;
SELECT C.clubName, C.roomNO, S.stdName, S.addr 
FROM stdTBL S INNER JOIN stdclubTBL SC ON SC.stdName = S.stdName
INNER JOIN clubTBL C ON SC.clubName = C.clubName
ORDER BY C.clubName;


SELECT U.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 AS '연락처'
 FROM buyTBL B RIGHT OUTER JOIN userTBL U ON U.userID = B.userID
 WHERE B.prodName IS NULL;
  
  
SELECT S.stdName, S.addr, C.clubName, C.roomNo
  FROM stdTBL S LEFT OUTER JOIN stdclubTBL SC ON S.stdName = SC.stdName
  LEFT OUTER JOIN clubTBL C ON SC.clubName = C.clubName; 
  
SELECT C.clubName, C.roomNo, S.stdName, S.addr
  FROM stdTBL S LEFT OUTER JOIN stdclubTBL SC ON S.stdName=SC.stdName
  Right OUTER JOIN clubTBL C ON SC.CLUBnAME=C.clubName;
  
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
FROM empTBL A INNER JOIN empTBL B ON A.manager = B.emp 
WHERE A.emp = '우대리';

---------------------------------------------------------------------------
USE hwDB;
CREATE TABLE deptTBL (DPTNO INT PRIMARY KEY, DNAME CHAR(3), LOC VARCHAR(8));
INSERT INTO deptTBL VALUES(1, '회계', '서울');
INSERT INTO deptTBL VALUES(2, '기획', '경기');
INSERT INTO deptTBL VALUES(3, '영업', '서울');
INSERT INTO deptTBL VALUES(4, '개발', '제주도');
INSERT INTO deptTBL VALUES(5, '관리', '대전');
SELECT * FROM deptTBL;

CREATE TABLE empTBL (EMPNO INT PRIMARY KEY, ENAME VARCHAR(5), JOB VARCHAR(5), 
                     MGR INT, HIREDATE DATE, SAL INT, COMM INT, DEPTNO INT,
                     FOREIGN KEY(DEPTNO) REFERENCES deptTBL(DPTNO));
INSERT INTO empTBL VALUES(7369, '영희', '회계사', 7902, '1980-12-27', 800, NULL, 1);
INSERT INTO empTBL VALUES(7499, '상현', '영업사원', 7698, '1981-02-20', 1600, 300, 3);
INSERT INTO empTBL VALUES(7521, '경희', '영업사원', 7698, '1981-02-22', 1250, 500, 3);
INSERT INTO empTBL VALUES(7566, '혁신', '기획자', 7839, '1981-02-02', 2975, NULL, 2);
INSERT INTO empTBL VALUES(7654, '정수', '영업사원', 7698, '1981-09-28', 1250, 1400, 3);
INSERT INTO empTBL VALUES(7698, '성진', '매니저', 7839, '1981-05-01', 2850, NULL, 3);
INSERT INTO empTBL VALUES(7782, '지현', '매니저', 7839, '1981-06-09', 2450, NULL, 1);
INSERT INTO empTBL VALUES(7788, '현석', '분석가', 7566, '1987-06-28', 3000, NULL, 2);
INSERT INTO empTBL VALUES(7839, '나라', '대표', NULL, '1981-11-17', 5000, NULL, 1);
INSERT INTO empTBL VALUES(7844, '민지', '영업사원', 7698, '1981-09-08', 1500, 0, 3);
INSERT INTO empTBL VALUES(7876, '필두', '기획보조', 7788, '1987-07-13', 1100, NULL, 2);
INSERT INTO empTBL VALUES(7900, '주혁', '회계사', 7698, '1981-12-03', 950, NULL, 3);
INSERT INTO empTBL VALUES(7902, '윤희', '프로그래머', 7566, '1981-12-03', 3000, NULL, 4);
INSERT INTO empTBL VALUES(7934, '송이', '프로그래머', 7782, '1982-01-23', 1300, NULL, 4);
SELECT * FROM empTBL;

CREATE TABLE gradeTBL (GRADE INT, LOWSAL INT, HIGHSAL INT);
INSERT INTO gradeTBL VALUES(1, 700, 1200);
INSERT INTO gradeTBL VALUES(2, 1201, 1400);
INSERT INTO gradeTBL VALUES(3, 1401, 2000);
INSERT INTO gradeTBL VALUES(4, 2001, 3000);
INSERT INTO gradeTBL VALUES(5, 3001, 9999);
SELECT * FROM gradeTBL;

/*  (1)	경희와 현석의 부서명(부서이름)을 조회 하시오. */
SELECT E.ENAME, D.DNAME FROM deptTBL D 
  INNER JOIN empTBL E ON D.DPTNO = E.DEPTNO WHERE E.ENAME='경희' OR E.ENAME='현석';
  
/*  (2)	모든 직원들의 이름, 월급여, 월급여등급을 조회 하시오.  */
SELECT E.ENAME, E.SAL, G.GRADE FROM empTBL E, gradeTBL G 
  WHERE E.SAL BETWEEN G.LOWSAL AND G.HIGHSAL;

/*  (3)	각 직원의 이름과 해당 직속상사 이름을 조회 하시오.  */  
SELECT A.ENAME, B.ENAME AS '직속상사' FROM empTBL A 
  INNER JOIN empTBL B ON A.MGR=B.EMPNO;

/*  (4)	이름, 부서명을 조회하되, 직원 테이블에 부서번호가 5에 속한 사원이 없지만, 부서번호 5인 부서명도 출력되게 하시오.  */  
SELECT E.ENAME, D.DNAME FROM deptTBL D 
  LEFT OUTER JOIN empTBL E ON D.DPTNO = E.DEPTNO;

/*  (5)	부서번호가 3인 직원들의 이름, 직급, 부서번호, 부서위치를 조회 하시오.  */
SELECT E.ENAME, E.JOB, E.DEPTNO, D.LOC FROM empTBL E 
  INNER JOIN deptTBL D ON D.DPTNO = E.DEPTNO WHERE E.DEPTNO=3;

/*  (6)	커미션을 받는 직원의 이름, 커미션, 부서이름, 부서위치를 조회 하시오.  */
SELECT E.ENAME, E.COMM, D.DNAME, D.LOC FROM empTBL E 
  INNER JOIN deptTBL D ON D.DPTNO = E.DEPTNO WHERE E.COMM IS NOT NULL;

/*  (7)	제주도에서 근무하는 직원의 이름, 직급, 부서번호, 부서명을 조회 하시오.   */
SELECT E.ENAME, E.JOB, E.DEPTNO, D.DNAME FROM empTBL E 
  INNER JOIN deptTBL D ON D.DPTNO = E.DEPTNO WHERE D.LOC='제주도';

/*  (8)	이름에 ‘현’자가 들어간 직원의 이름과 부서명을 조회 하시오.  */
SELECT E.ENAME, D.DNAME FROM empTBL E 
  INNER JOIN deptTBL D ON D.DPTNO = E.DEPTNO WHERE E.ENAME LIKE '%현%';
  
   
   
   
   