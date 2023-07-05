USE sqlDB;
SELECT * FROM userTBL;
/*정렬해서 보기(디폴트값 오름차순)*/
SELECT Name, mDATE FROM userTBL ORDER BY mDATE;
/*정렬해서 보기(내림차순)*/
SELECT Name, mDATE FROM userTBL ORDER BY mDATE DESC;
/*정렬해서 보기(키내림차순으로, 같으면 이름 오름차순)*/
SELECT Name, height FROM userTBL ORDER BY height DESC, name ASC;
/*정렬해서 보기(주소 중복된거 1개만-DISTINCT열이름 앞에!)*/
SELECT DISTINCT addr FROM userTBL ORDER BY addr;

USE employees;
/*정렬해서 보기(오름차순인데, 5개만)*/
SELECT emp_no, hire_date FROM employees ORDER BY hire_date LIMIT 5;
/*정렬해서 보기(오름차순인데, 100번째 부터 5개)*/
SELECT emp_no, hire_date FROM employees ORDER BY hire_date LIMIT 100,5;

USE sqlDB;
SELECT * FROM buyTBL;
/*정렬해서 보기(단가가 높은 순으로(내림차순),중복 제거-DISTINCT열이름 앞에!)*/
SELECT DISTINCT prodName, price FROM buyTBL ORDER BY price DESC;

/*테이블 복사(buyTBL2 만들기)*/
CREATE TABLE buyTBL2(SELECT * FROM buyTBL);
SELECT * FROM buyTBL2;

/*테이블 복사(buyTBL3-특정 열만 복사)*/
CREATE TABLE buyTBL3(SELECT userID, prodName FROM buyTBL);
SELECT * FROM buyTBL3;


