-- 계절학기 수강료, 등록 테이블
select * from summer_price;
select * from summer_register;

-- 학생의 모든 수강정보를 검색하시오
SELECT a.*, b.price
FROM summer_register a, summer_price b
WHERE a.subject  = b.subject;

SELECT a.*, b.price
FROM summer_register a INNER JOIN summer_price b
   ON a.subject = b.subject;

-- JOIN ~ USING(칼럼) = 조인 칼럼 이름이 같은 경우 사용 (별칭 사용 불가)
SELECT a.sid, subject, b.price
FROM summer_register a INNER JOIN summer_price b
USING (subject);
   
   
INSERT INTO summer_register VALUES (301, 'Python');   
-- 과목별 수강료 합계
-- ROLLUP(), CUBE()
-- NVL(과목, '총계') = 과목이 null이 아니면 과목 출력
--                      = 과목이 null이면 '총계'를 출력
SELECT NVL(a.subject, '총계') 수강과목,
         SUM(b.price) 수강료합계
FROM summer_register a, summer_price b
WHERE a.subject  = b.subject
GROUP BY ROLLUP (a.subject);


COMMIT;

