USE sqlDB;
SELECT * FROM buyTBL;

/*사용자별로 그룹지어 보기-집계함수(SUM),열 이름 표시(AS), 구매개수 내림차순으로*/
SELECT userID AS '사용자 아이디', SUM(amount) AS '총 구매 개수' FROM buyTBL
 GROUP BY userID ORDER BY SUM(amount) DESC; 
/*총 구매 액수 가장 큰 사람-집계함수(SUM)*/
SELECT userID AS '사용자 아이디', SUM(price*amount) AS '총 구매액'
  FROM buyTBL GROUP BY userID ORDER BY SUM(price*amount) DESC;
/*총 구매 갯수의 평균-집계함수(AVG)*/ 
SELECT userID, AVG (amount) AS '평균 구매 개수' FROM buyTBL
 GROUP BY userID;
/*시험!!!! 키가 큰 사람과 작은 사람-집계함수(MIN, MAX), HAVING*/ 
SELECT Name, height FROM userTBL
 WHERE height=(SELECT MAX(height) FROM userTBL) or
 height=(SELECT MIN(height) FROM userTBL);
/*건수를 세줌-집계함수(COUNT)*/ 
SELECT COUNT(*) FROM userTBL;
/*전번 적은 사람의 수 세기-집계함수(COUNT)*/ 
SELECT COUNT(mobile1) AS '휴대폰이 있는 사용자' FROM userTBL;

/*employees에 있는 데이터 개수*/
USE employees;
SELECT COUNT(*) FROM employees;
  
/*조건식에 집계함수 같이 사용되면 HAVING!! 이때는 조건이 group by뒤에. 원래는 조건 group by전*/
USE sqlDB;
SELECT userID AS '사용자 아이디', SUM(price*amount) AS '총 구매액' 
  FROM buyTBL GROUP BY userID HAVING SUM(price*amount)>1000 ORDER BY SUM(price*amount) DESC;

/*소합계와 총합계-ROLLUP*/
SELECT num, groupName, SUM(price*amount) AS '비용' FROM buyTBL
 GROUP BY groupName, num WITH ROLLUP;
  
/*구매가격이 제일 높은 사람과 낮은 사람의 아이디*/ 
SELECT * FROM buyTBL;
SELECT userID, price FROM buyTBL
 WHERE price=(SELECT MAX(price) FROM buyTBL) or
 price=(SELECT MIN(price) FROM buyTBL);

  