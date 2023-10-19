-- 게시판 테이블 생성
CREATE TABLE boards(
    bno          NUMBER PRIMARY KEY,
    btitle         VARCHAR2(100) NOT NULL,
    bcontent    CLOB NOT NULL,                  -- CLOB(Character Large Of Byte)
    bwriter      VARCHAR2(50) NOT NULL,
    bdate        DATE DEFAULT SYSDATE,        -- 게시글 추가시 자동으로 추가됨
    bfilename   VARCHAR2(50),
    bfiledata    BLOB                                  -- BLOB(Binary Large Of Byte)
);

-- 시퀀스 생성(bno 자동 순번 입력) 
-- NOCACHE = 저장하지 않음, 초기화되면 1부터 시작함
CREATE SEQUENCE seq_bno NOCACHE;   -- 테이블X, 객체O

-- 게시글 추가
INSERT INTO boards (bno, btitle, bcontent, bwriter)
VALUES (seq_bno.NEXTVAL, 'smartPhone', '삼성 갤럭시 s21입니다', 'today');

INSERT INTO boards (bno, btitle, bcontent, bwriter, bdate, bfilename, bfiledata)
VALUES (seq_bno.NEXTVAL, 'smartPhone', '삼성 갤럭시 s21입니다', 'today', SYSDATE, null, null);

SELECT * FROM boards WHERE bwriter = 'sky123'
ORDER BY bno DESC;

ROLLBACK;

COMMIT;

DROP TABLE boards;


-- 전체 검색
SELECT * FROM boards
ORDER BY bno DESC;



-- 글 번호 5번의 제목을 '아이폰 15'로 변경
UPDATE boards
SET btitle = '아이폰 15',
      bcontent = '아이폰 15 제품입니다'
WHERE bno = 5;

-- 1번 게시글 삭제   -- COMMIT을 하지 않으면 자바에 반영X 
DELETE FROM boards
WHERE bno = 1;