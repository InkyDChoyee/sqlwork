-- 뷰(VIEW)
-- UPDATE, DELETE가능(하지만 제약이 있다), INSERT INTO불가능
-- 주소에 '대한민국'을 포함하는 고객들로 구성된 뷰를 만드시오
CREATE VIEW vw_customer
AS SELECT * FROM customer
WHERE address LIKE '대한민국%';

SELECT * FROM vw_customer;

-- 이름이 김연아를 신유빈으로 변경
UPDATE vw_customer
     SET name = '신유빈'
WHERE name = '김연아';

-- 고객아이디가 '3'인 고객을 삭제
-- 참조하고 있는 order 테이블이 있어서 삭제 불가
DELETE FROM vw_customer
WHERE custid = 3;


COMMIT;

-- VIEW 삭제
DROP VIEW vw_customer;


-- 고객과 고객의 주문에 관한 정보를 검색
-- 검색한 정보로 뷰 만들기
CREATE VIEW vw_book_order AS       -- view 로 만드는 방법
SELECT cs.name, bk.bookname, od.saleprice
FROM book bk, customer cs, orders od 
WHERE bk.bookid = od.bookid
   AND cs.custid = od.custid
ORDER BY cs.name;

SELECT * FROM vw_book_order;

SELECT COUNT(*)
FROM vw_book_order;


COMMIT;