-- 조인 연습
-- product, product_review
select * from product;
select * from product_review;

-- 리뷰가 있는 상품의 정보를 검색하시오
-- 리뷰 테이블에 product_name 칼럼을 조인
SELECT p.product_code 상품번호, 
          p.product_name 상품이름, 
          p.price 가격, 
          r.review_no 리뷰번호, 
          r.member_id 작성자, 
          r.content 리뷰, 
          r.regdate 일자
FROM product p, product_review r
WHERE p.product_code = r.product_code;


SELECT p.product_name,
          r.*
FROM product p, product_review r
WHERE p.product_code = r.product_code;

-- ANSI(미국협회) 조인 - STANDARD JOIN(표준 조인)
-- 내부조인(INNER JOIN ~ ON)
SELECT p.product_code 상품번호, 
          p.product_name 상품이름, 
          p.price 가격, 
          r.review_no 리뷰번호,
          r.member_id 작성자,
          r.content 리뷰, 
          r.regdate 일자
FROM product p INNER JOIN product_review r   -- INNER 생략 가능
   ON p.product_code = r.product_code;



-- 리뷰의 유무와 상관없이 모든 상품의 정보를 검색
SELECT p.product_code 상품번호, 
          p.product_name 상품이름, p.price 가격, 
          r.review_no 리뷰번호, 
          r.member_id 작성자, 
          r.content 리뷰, 
          r.regdate 일자
FROM product p LEFT OUTER JOIN product_review r   -- OUTER 생략 가능
   ON p.product_code = r.product_code;
   
   
   
   
-- 리뷰가 없는 상품의 정보를 검색하시오
SELECT p.product_code 상품번호, 
          p.product_name 상품이름, p.price 가격, 
          r.review_no 리뷰번호, 
          r.member_id 작성자, 
          r.content 리뷰, 
          r.regdate 일자
FROM product p LEFT OUTER JOIN product_review r   -- OUTER 생략 가능
   ON p.product_code = r.product_code
WHERE  r.content IS null;   
   
   
SELECT a.product_name "상품후기가 없는 상품"   -- ""를 사용하면 별칭에 띄어쓰기 가능
FROM product a LEFT OUTER JOIN product_review b
   ON a.product_code = b.product_code
WHERE b.content IS null;



-- 상품 리뷰 테이블에 product_name 칼럼 추가
-- 스칼라 서브쿼리 : 한 칼럼만 반환, SELECT 절에서 사용
SELECT A.review_no,
          A.product_code,
         (SELECT B.product_name    -- 칼럼 하나만 반화한다
          FROM product B
          WHERE A.product_code = B.product_code)
          product_name,
          A.content,
          A.member_id
FROM product_review A;





COMMIT;