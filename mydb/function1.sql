-- 숫자 타입 내장 함수
-- 제공 테이블 : dual

-- 절대값 구하기 : ABS(숫자)
SELECT ABS(-10) FROM dual;

-- 반올림 : ROUND(숫자, 자리수)
SELECT ROUND(127.67, 1) FROM dual;   -- 소수 첫째 자리
SELECT ROUND(127.67, 0) FROM dual;   -- 소수에서 반올림
SELECT ROUND(127.67, -1) FROM dual;  -- 1의 자리 에서 반올림
SELECT ROUND(127.67, -2) FROM dual;  -- 10의 자리에서 반올림

-- 버림(내림) : TRUNC(숫자, 자리수)
SELECT TRUNC(127.67, 1) FROM dual;  -- 소수 첫째자리까지 표시
SELECT TRUNC(127.67, 0) FROM dual;  -- 소수 자리 버림   = SELECT FLOOR(숫자, 자리수) FROM 테이블; = 정수만 표시
SELECT TRUNC(127.67, -1) FROM dual; -- 1의자리 버림
SELECT TRUNC(127.67, -2) FROM dual; -- 10의 자리 버림

-- 거듭제곱 : POWER(밑, 지수)
SELECT POWER(2, 3) FROM dual;


-- 문자 타입 내장 함수

-- 소문자로 변경 : LOWER('대문자')
SELECT LOWER('ABCD') FROM dual;
-- 대문자로 변경 : UPPER('소문자')
SELECT UPPER('abc') FROM dual;

-- 문자열의 일부 추출 :SUBSTR(문자열, 시작 인덱스, 추출개수)
-- 인덱스는 1번부터 시작
SELECT SUBSTR('abcd', 1, 2) FROM dual;

-- 문자열을 찾아 바꾸기 : REPLACE(문자열, 변경 전 문자, 변경 후 문자)
SELECT UPPER(REPLACE('abcd', 'c', 'e')) FROM dual;

-- 문자열의 길이 : LENGTH(문자열)
SELECT LENGTH('abcd') FROM dual;

-- 마스킹 : LPAD(문자열, 전체길이, 특정문자) => 왼쪽부터 특정 문자로 채움
SELECT LPAD('today', 10, '*') FROM dual;
-- 마스킹 : RPAD(문자열, 전체길이, 특정문자) => 오른쪽부터 특정 문자로 채움
SELECT RPAD('today', 10, '*') FROM dual;


-- 주문 테이블
-- 고객별 평균 주문 금액을 100원 단위로 반올림
SELECT custid,
         SUM(saleprice) AS 합계금액,
         COUNT(saleprice) AS 주문건수,
         ROUND(AVG(saleprice), -2) AS 평균주문금액
FROM orders
GROUP BY custid;

-- 도서 테이블
-- 책 제목의 글자수 : 공백문자 포함
-- 책 제목의 바이트수 : 한글 - 3byte, 영어, 특수문자 - 1byte
SELECT bookname,
          LENGTH(bookname) AS 글자수,
          LENGTHB(bookname) AS 바이트수
FROM book;

-- 책 제목 '축구'를 '농구'로 변경
SELECT bookname ,
          REPLACE(bookname, '축구', '농구') AS bookname
FROM book;

-- 고객 테이블
-- 고객 이름별 같은 성을 가진 고객의 인원수
SELECT SUBSTR(name, 1, 1) 성,
          COUNT(*) 인원
FROM customer
GROUP BY SUBSTR(name, 1, 1);


COMMIT;