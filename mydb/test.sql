-- 실습문제
-- 1. 모든 고객의 이름과 주소를 검색하시오
SELECT name AS 이름, address AS 주소
FROM customer;

-- 2. 모든 고객의 이름, 주소, 전화번호를 검색하시오
SELECT name AS 이름, address AS 주소, phone AS 전화번호
FROM customer;

-- 3. 주소가 '영국'인 고객을 검색하시오
SELECT name AS 영국주소고객, address AS 주소
FROM customer
WHERE address LIKE '%영국%';

-- 4. 고객의 이름이 김연아 혹은 안산인 고객을 검색하시오
SELECT name 
FROM customer
WHERE name IN('김연아', '안산');

-- 5. 주소가 '대한민국'이 아닌 고객을 검색하시오
SELECT name AS 주소가대한민국이아닌고객, address AS 외국주소 
FROM customer
WHERE address NOT LIKE '%대한민국%';

-- 6. 전화번호가 없는 고객을 검색하시오
SELECT name AS 전화번호없는고객 
FROM customer
WHERE phone IS NULL;

-- 7. 고객을 이름순으로 정렬하시오
SELECT name AS 이름순으로정렬 FROM customer
ORDER BY name;

-- 8. 고객의 총 인원수를 구하시오
SELECT COUNT(*) AS 총인원수 
FROM customer;


COMMIT;
