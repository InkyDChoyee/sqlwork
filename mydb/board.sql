-- 자바 게시판 구현할 board 테이블 생성 
CREATE TABLE board(
    bno          NUMBER PRIMARY KEY,
    btitle         VARCHAR2(100) NOT NULL,
    bcontent    CLOB NOT NULL,                  -- CLOB(Character Large Of Byte)
    bwriter      VARCHAR2(50) NOT NULL,
    bdate        DATE DEFAULT SYSDATE        -- 게시글 추가시 자동으로 추가됨
);

-- 시퀀스 생성(bno 자동 순번 입력) 
-- NOCACHE = 저장하지 않음, 초기화되면 1부터 시작함
CREATE SEQUENCE seq NOCACHE;   -- 테이블X, 객체O

DROP SEQUENCE seq;

-- 게시글 추가
INSERT INTO board (bno, btitle, bcontent, bwriter)
VALUES (seq.NEXTVAL, '가입 인사', '안녕하세요~ 만나서 반갑습니다', 'today10');
INSERT INTO board (bno, btitle, bcontent, bwriter)
VALUES (seq.NEXTVAL, '공지 사항', '천장 에어컨 청소합니다', 'admin0000');

TRUNCATE TABLE board;

ROLLBACK;

COMMIT;

-- 전체 검색
SELECT * FROM board
ORDER BY bno DESC;
