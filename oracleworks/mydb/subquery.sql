-- 서브 쿼리(Sub Query) = 부속질의(중첩 쿼리)
-- SELECT문 내부에 또 다른 SELECT문이 존재

-- 도서 중 가격이 가장 높은 도서를 검색
SELECT MAX(price) FROM book;

-- 도서 중에서 가장 비싼 도서의 이름을 검색하시오
-- 단일행 = 결과가 한개 => '='사용
SELECT bookname 
FROM book
WHERE price = (SELECT MAX(price) FROM book);

-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오
SELECT custid FROM orders;

SELECT name
FROM customer
WHERE custid IN(1, 2, 3, 4);

-- 다중행 서브쿼리 = 결과가 여러개 => 'IN' 사용
SELECT name
FROM customer
WHERE custid IN(SELECT custid FROM orders);

-- 조인 방식(ORACLE JOIN)
SELECT DISTINCT cus.name
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;
-- 조인 방식(INNER JOIN)
SELECT DISTINCT cus.name
FROM customer cus INNER JOIN orders ord
    ON cus.custid = ord.custid;


-- FROM절에 있는 서브쿼리 - 인라인뷰라고도 함
-- 고객 번호가 2 이하인 고객의 이름과 그 고객의 판매액 검색
SELECT cs.name, SUM(od.saleprice)
FROM customer cs, orders od
WHERE cs.custid = od.custid
   AND cs.custid <= 2
GROUP BY cs.name;

-- 서브쿼리 사용
SELECT cs.name, SUM(od.saleprice)
FROM (SELECT * FROM customer
          WHERE customer.custid <= 2) cs,
         orders od
WHERE cs.custid = od.custid
GROUP BY cs.name;

-- 동등조인
-- 서브쿼리 사용
SELECT cs.name, SUM(od.saleprice) total
FROM customer cs, orders od
WHERE cs.custid = od.custid
AND cs.custid <= 2
GROUP BY cs.name
Having SUM(od.saleprice) >= 30000;

/*
    실행 순서
    1. FROM절 테이블명
    2. WHERE, GROUP BY
    3. SELECT절
    4. ORDER절
*/

SELECT * FROM product;
SELECT * FROM product_review;
-- 스칼라 서브쿼리 : SELECT 절에 있는 SELECT문을 말함
-- 상품 리뷰 테이블에 있는 상품 이름 검색
SELECT r.product_code, 
          r.member_id,
          r.content,
          (SELECT product_name FROM product d
          WHERE r.product_code = d.product_code) product_name
FROM product_review r;


COMMIT;