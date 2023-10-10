-- ex4 테이블 생성
CREATE TABLE ex4(
    id VARCHAR2(10) PRIMARY KEY,         -- 기본키 제약조건
    password VARCHAR2(10) NOT NULL
);

INSERT INTO ex4 VALUES ('sky2003', 'u1234');
INSERT INTO ex4 VALUES ('sky2003', 'u54321');   -- 무결성 제약조건 위배 (삽입 불가)
INSERT INTO ex4 VALUES ('todat123', 'u23456', 25);
INSERT INTO ex4(id, password) VALUES ('today321', 'u3456');
-- 자료형의 크기보다 큰 데이터 입력 불가
INSERT INTO ex4(id, password, age) VALUES ('today231', 'u34561234567', 35);

COMMIT;

-- 나이(age) 칼럼 추가
ALTER TABLE ex4 ADD age NUMBER(3);

-- 자료형의 크기 변경 (VARCHAR2 10 -> 12)
ALTER TABLE ex4 MODIFY password VARCHAR2(12);


SELECT * FROM ex4;