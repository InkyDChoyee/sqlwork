-- jweb, member 테이블 생성
CREATE TABLE member(
    mno       INT,
    id           VARCHAR2(20) NOT NULL UNIQUE,
    passwd    VARCHAR2(20) NOT NULL,
    name       VARCHAR2(30) NOT NULL,
    email       VARCHAR2(50),
    gender     VARCHAR2(6),
    joindate    TIMESTAMP DEFAULT SYSTIMESTAMP,
    PRIMARY KEY(mno)
);

CREATE SEQUENCE seq_mno NOCACHE;

INSERT INTO member(mno, id, passwd, name, email, gender)
VALUES(seq_mno.NEXTVAL, 'khit', 'm123467', '김기용', 'khit@gamil.com', '남');

COMMIT;

-- id가 khit인 회원 조회
SELECT * FROM member WHERE id = 'khit';

-- id와 비밀번호가 일치하는 회원 조회
SELECT * FROM member WHERE id='khit' and passwd='m123467';

SELECT * FROM member;