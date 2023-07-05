use sqlDB;
SET @myVar1 = 5;
SET @myVar2 = 3;
SET @myVar3 = 4.25;
SET @myVar4 = '가수 이름 ==>';

SELECT @myVar1;
SELECT @myVar2 + @myVar3;
SELECT @myVar4, Name FROM userTBL WHERE height>180;

SET @myVar1 = 3;
PREPARE myQuery
	FROM 'SELECT NAME, height from userTBL ORDER BY height LIMIT ?';
EXECUTE myQuery USING @myVar1;


/*  명시적인 형 변환  */
SELECT AVG(amount) AS '평균 구매 개수' FROM buyTBL;
SELECT CAST(AVG(amount) AS SIGNED INTEGER) AS '평균 구매 개수' FROM buyTBL;
SELECT CONVERT(AVG(amount), SIGNED INTEGER) AS '평균 구매 개수' FROM buyTBL;

SELECT CAST('2020$12$12' AS DATE);
SELECT CAST('2020%12%12' AS DATE);

/*  암묵적인 형 변환  */
SELECT '100'+'200';
SELECT CONCAT('100', '200');
SELECT CONCAT(100, '200'); /*정수를 문자로 변환*/
SELECT 1>'2mega'; /*2가 정수로 변환*/
SELECT 3>'2MEGA'; /*2가 정수로 변환*/
SELECT 0='mega2'; /*문자로 변환(문자이면 0으로)*/


SELECT IF(100>200, '참이다', '거짓이다');
SELECT IFNULL(NULL, '널이군요');
SELECT IFNULL(100, '널이군요');
SELECT NULLIF(100, 100), NULLIF(200, 100);/*같으면 널, 다르면 앞에꺼*/

/*케바케로*/
SELECT CASE 10
 WHEN 1 THEN '일'
 WHEN 5 THEN '오'
 WHEN 10 THEN '십'
 ELSE '모름'
END AS 'case연습';

/*문자열 함수*/
SELECT ASCII('A'), CHAR(65);

SELECT BIT_LENGTH('abc'), CHAR_LENGTH('abc'), LENGTH('abc'); /*알파벳 하나당 3*/
SELECT BIT_LENGTH('가나다'), CHAR_LENGTH('가나다'), LENGTH('가나다'); /*한글자당 9*/


SELECT ELT(2, '하나', '둘', '셋'),
       FIELD('둘', '하나', '둘', '셋'),
       FIND_IN_SET('둘', '하나,둘,셋'),
       INSTR('하나둘셋', '둘'),
       LOCATE('둘', '하나둘셋');
       
SELECT FORMAT(123456.123456, 4); /*소수점 몇째까지*/

SELECT BIN(31), HEX(31), OCT(31);

SELECT INSERT('abcdefghi', 3, 4, '@@@@'), 
	   INSERT('abcdefghi', 3, 2, '@@@@');
SELECT LEFT('abcdefghi', 3), RIGHT('abcdefghi', 3);

SELECT LCASE('abcdEFGH'), UCASE('abcdEFGH'); /*대소문자 변환*/

SELECT LPAD('이것이', 5, '##'), RPAD('이것이', 5, '##');
SELECT LTRIM('   이것이'), RTRIM('이것이    '); /*공백잘라줌*/
SELECT TRIM('   이것이   '), TRIM(BOTH 'ㅋ' FROM 'ㅋㅋㅋ재밌어요.ㅋㅋㅋ'); /*양쪽특정한 거 자르기*/
SELECT TRIM('   이것이   '), TRIM(LEADING 'ㅋ' FROM 'ㅋㅋㅋ재밌어요.ㅋㅋㅋ'); /*앞에 특정한 거 자르기*/
SELECT TRIM('   이것이   '), TRIM(TRAILING 'ㅋ' FROM 'ㅋㅋㅋ재밌어요.ㅋㅋㅋ'); /*뒤에 특정한 거 자르기*/

SELECT REPEAT('이것이', 3);
SELECT REPLACE('이것이 MySQL이다', '이것이', 'This is');
SELECT REVERSE('MySQL'); /*거꾸로 써줌*/
SELECT CONCAT('이것이', SPACE(10), 'MySQL이다'); /*띄어쓰기*/
SELECT SUBSTRING('대한민국만세', 3, 2);
SELECT SUBSTRING_INDEX('cafe.naver.com', '.', 2); /*2번째 점 이후 날려줌*/
SELECT SUBSTRING_INDEX('cafe.naver.com', '.', -2); /*오른쪽에서 2번째 점 이후 날려줌*/





/* 날짜함수  */

SELECT ADDDATE('2020-01-01', INTERVAL 31 DAY),
  ADDDATE('2020-01-01', INTERVAL 1 MONTH);
SELECT SUBDATE('2020-01-01', INTERVAL 31 DAY),
  SUBDATE('2020-01-01', INTERVAL 1 MONTH);  
  
SELECT ADDTIME('2020-01-01 23:59:59', '1:1:1'), 
  ADDTIME('15:00:00', '2:10:10');
  
SELECT YEAR(CURDATE()), MONTH(CURDATE()),DAY(CURDATE());
SELECT HOUR(CURTIME()), MINUTE(CURRENT_TIME()), 
     SECOND(CURRENT_TIME), MICROSECOND(CURRENT_TIME);

SELECT DATE(NOW()), TIME(NOW());
SELECT DATEDIFF('2020-01-01', NOW()), TIMEDIFF('23:23:59', '12:11:10');
SELECT DAYOFWEEK(CURDATE()), MONTHNAME(CURDATE()), DAYOFYEAR(CURDATE());
SELECT LAST_DAY('2020-02-01');
SELECT MAKEDATE(2025, 32);
SELECT MAKETIME(12, 11, 10);
SELECT PERIOD_ADD(202001, 11), PERIOD_DIFF(202001, 201812);
SELECT QUARTER('2020-07-07');
SELECT TIME_TO_SEC('12:11:10');






