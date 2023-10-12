select * from orders;

-- 주문 테이블의 칼럼과 자료형 구조 보기
DESC orders;

-- 통계 함수 (개수-COUNT, 합계-SUM, 평균-AVG, 최대값-MAX, 최소값-MIN)
SELECT COUNT(orderid) AS 총판매건수
FROM orders;
-- COUNT(*) = '*' 모든 칼럼
-- COUNT(칼럼명) = 특정 칼럼

SELECT SUM(saleprice) AS 총판매액,
          AVG(saleprice) AS 총평균액
FROM orders;

SELECT COUNT(*) AS 총고객수, COUNT(phone) AS 전화번호수 
FROM customer;

-- 고객이 주문한 도서의 총판매액 계산
SELECT SUM(saleprice) AS 총판매액
FROM orders;

-- 고객별로 주문한 도서의 총판매액을 계산
-- 그룹으로 묶을 때 사용 - GROUP BY 칼럼명
-- 도서수량이 3권이상인 자료 검색
-- GROUP BY절에서 조건이 있는 경우 = HAVING 사용
SELECT custid, 
    COUNT(*) AS 도서수량,
    SUM(saleprice) AS 총판매액
FROM orders
GROUP BY custid
    HAVING COUNT(*) >= 3
    AND SUM(saleprice) >= 35000;


-- 도서중에서 최대가격, 최저가격 알기
SELECT MAX(price) 최고가격, MIN(price) 최저가격
FROM book;

-- 고객 출력
SELECT * FROM customer;

-- '3번 고객(안산)'이 주문한 도서의 총 판매액 구하기
SELECT sum (saleprice) as 총판매액
FROM orders
WHERE custid = 3;

-- 조인(JOIN)
-- 동등조인(EQUI HOIN = equal(=)을 사용하는 조인
-- 테이블A,칼럼명 = 테이블B.칼럼명 (칼럼 = 외래키)
-- 고객의 이름과 고객이 주문한 주문가격을 검색하시오
SELECT customer.name, orders.saleprice
FROM customer, orders
WHERE customer.custid = orders.custid;

-- 별칭 사용 조인
-- 고객 이름별 1차 정렬(오름차순), 주문 가격별 내림차순 2차 정렬
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
ORDER BY cus.name, ord.saleprice desc;

-- 3번 고객의 아이디와 도서 이름과 주문 가격 검색
SELECT custid, bookname, saleprice
FROM orders, book
WHERE orders.bookid = book.bookid
AND orders.custid = 3;




COMMIT;