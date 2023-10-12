-- 서브 쿼리(Sub Query) = 부속질의(중첩 쿼리)
-- SELECT문 내부에 또 다른 SELECT문이 존재

-- 도서 중 가격이 가장 높은 도서를 검색
SELECT MAX(price) FROM book;

-- 도서 중에서 가장 비싼 도서의 이름을 검색하시오
SELECT bookname 
FROM book
WHERE price = (SELECT MAX(price) FROM book);

-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오
SELECT custid FROM orders;

SELECT name
FROM customer
WHERE custid IN(1, 2, 3, 4);

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



COMMIT;