-- 수강료 테이블
CREATE TABLE summer_price(
    subject VARCHAR2(20) PRIMARY KEY,
    price    NUMBER
);

INSERT INTO summer_price VALUES('C', 30000);
INSERT INTO summer_price VALUES('JAVA', 45000);
INSERT INTO summer_price VALUES('Python', 40000);

-- 여름학기 등록 테이블
CREATE TABLE summer_register(
    sid      NUMBER PRIMARY KEY,
    subject VARCHAR2(20),
    FOREIGN KEY(subject) REFERENCES summer_price(subject)
);

INSERT INTO summer_register VALUES (100, 'C');
INSERT INTO summer_register VALUES (101, 'JAVA');
INSERT INTO summer_register VALUES (200, 'Python');
INSERT INTO summer_register VALUES (201, 'JAVA');

-- 200번 학생의 수강 신청 취소
DELETE FROM summer_register
WHERE sid = 200;
-- 삭제이상 없음
-- 'Pytho'강좌 수강료
SELECT price
FROM summer_price
WHERE subject = 'Python';

-- 수강료 테이블에 'C++' 강좌를 35000원으로 삽입
INSERT INTO summer_price VALUES ('C++', 35000);

-- 수강 신청 정보 확인하기
SELECT * FROM summer_price;

SELECT regit.sid 학번, regit.subject 수강과목 , price.subject 강좌, price.price 가격
FROM summer_price price
LEFT OUTER JOIN summer_register regit
ON price.subject = regit.subject;

-- 'JAVA' 수강료를 45000원에서 40000원으로 변경하기
UPDATE summer_price
SET price = 40000
WHERE subject = 'JAVA';

-- 수강료가 가장 싼 과목
SELECT MIN(price) 
FROM summer_price;
-- 메인쿼리(서브쿼리)
SELECT subject, price
FROM summer_price
WHERE price = (SELECT MIN(price) FROM summer_price);

-- 



ROLLBACK;

SELECT * FROM summer_price;
SELECT * FROM summer_register;

COMMIT;

DROP TABLE summer_price;
DROP TABLE summer_register;