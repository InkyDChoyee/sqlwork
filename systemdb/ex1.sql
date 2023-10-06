-- 스키마:system
-- 테이블 생성
CREATE TABLE ex1(
    column1 CHAR(10),         -- 고정길이 문자 (10Byte) 
    column2 VARCHAR2(10)      -- 가변길이 문자 (10Byte) 
);


-- 데이터 추가
INSERT INTO ex1(column1, column2) VALUES ('abc', 'abc');   -- "" 사용X '' 사용O
INSERT INTO ex1 VALUES ('당산', '당산');            -- 칼럼 모두에 넣을 때는 생략 가능

-- 데이터 조회
SELECT column1, LENGTH(column1), column2, LENGTH(column2) FROM ex1;

-- 트랜잭션 : COMMIT, ROLLBACK
COMMIT;