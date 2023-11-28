-- addrbook table 생성
CREATE TABLE addrbook(
    bnum        NUMBER PRIMARY KEY,
    username   VARCHAR2(20) NOT NULL,
    tel            VARCHAR2(20),
    email        VARCHAR2(30) UNIQUE,
    gender      VARCHAR2(6),
    regdate     TIMESTAMP DEFAULT SYSTIMESTAMP
);

CREATE SEQUENCE seq_bnum NOCACHE;    -- 자동 순번

-- 테스트 데이터 넣기
INSERT INTO addrbook(bnum, username, tel, email, gender)
VALUES(seq_bnum.NEXTVAL, '이순신', '010-1212-1212', 'ship12@naver.com', '남');

-- 이메일 중복 체크 O
INSERT INTO addrbook(bnum, username, tel, email, gender)
VALUES(seq_bnum.NEXTVAL, '김시민', '010-1234-1234', 'ship12@naver.com', '남');

SELECT * FROM addrbook;

-- 이메일 khit@kh.kr 찾기
SELECT email FROM addrbook
WHERE email = 'khit@kh.kr';

-- 특정 주소 삭제 테스트
DELETE FROM addrbook WHERE bnum = 7;

-- 주소 수정 테스트
UPDATE addrbook SET username = '테스터2', tel ='010-9999-9999', gender='여'
WHERE bnum = 12;




COMMIT;

DROP TABLE addrbook;

DROP SEQUENCE seq_bnum;