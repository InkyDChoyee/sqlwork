-- 날짜와 시간

-- 현재 날짜 출력
SELECT SYSDATE FROM dual;

-- 현재 날짜와 시간 출력
SELECT SYSTIMESTAMP FROM dual;

-- 현재 날짜 형식 변환 => TO_CHAR()함수 사용
SELECT TO_CHAR(SYSDATE, 'YYYY') AS 년도,
          TO_CHAR(SYSDATE, 'MM') AS 월,
          TO_CHAR(SYSDATE, 'DD') AS 일,
          TO_CHAR(SYSDATE, 'YYYY-MM-DD') AS 날짜
FROM dual;

-- 현재 날짜와 시간 형식 변환
SELECT TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD HH:MI:SS') 시간형식
FROM dual;

-- 변환 함수 : TO_NUMBER() = 문자를 숫자로 바꿔줌
SELECT TO_NUMBER('320') 
FROM dual;


-- 날짜 연산

-- 현재날짜에서 10일 전, 후 출력
SELECT SYSDATE - 10 FROM dual;
SELECT SYSDATE + 10 FROM dual;

-- 특정 날짜에서 10일 전, 후 출력
SELECT TO_DATE('2023-09-01') + 10 FROM dual;
SELECT TO_DATE('2023-09-01') - 10 FROM dual;

-- 월 더하기 빼기
-- ADD_MONTHS()
SELECT ADD_MONTHS(SYSDATE, 3) 결과 FROM dual;
SELECT ADD_MONTHS(SYSDATE, -3) 결과 FROM dual;
SELECT ADD_MONTHS(TO_DATE('2023-05-01'), 3) 결과 FROM dual;
SELECT ADD_MONTHS(TO_DATE('2023/5/1'), -3) 결과 FROM dual;

-- 개월수 계산하기
-- MONTHS_BETWEEN(종료일, 시작일)
SELECT FLOOR(MONTHS_BETWEEN(SYSDATE,'2023-1-1')) 총개월수1,
          ROUND(MONTHS_BETWEEN(SYSDATE,'2023-1-1'), 0) 총개월수2
FROM dual;

SELECT FLOOR(MONTHS_BETWEEN('2023-12-31','2023-1-1')) 총개월수1,   -- 버림
          ROUND(MONTHS_BETWEEN('2023-12-31','2023-1-1'), 0) 총개월수2  -- 반올림
FROM dual;


-- orders 테이블에서 날짜 시간 함수 사용하기
-- 서점은 주문일로부터 10일 후 매출을 확정한다
-- 각 주문의 확정일자를 구하시오
SELECT orderid 주문번호,
         orderdate 주문일,
         TO_DATE(orderdate) + 10 확정일자
FROM orders;

-- 주문 일에 3개월을 더하고 빼기
-- 주문 번호가 6번에서 10번까지 출력
SELECT  orderid 주문번호,
          orderdate 주문일,
          ADD_MONTHS(TO_DATE(orderdate), 3) 더한결과,
          ADD_MONTHS(TO_DATE(orderdate), -3) 뺀결과
FROM orders
-- WHERE orderid >= 6 AND orderid <= 10;
WHERE orderid BETWEEN 6 AND 10;


-- 주문번호가 10인 도서의 주문일로부터 오늘까지의 총 개월수를 구하시오
SELECT orderid 주문번호,
          orderdate 주문날짜, 
          TO_CHAR(SYSDATE, 'YYYY-MM-DD') 오늘날짜,
          ROUND(MONTHS_BETWEEN(SYSDATE, orderdate), 0) AS 총개월수
FROM orders
WHERE orderid = 10;




COMMIT;