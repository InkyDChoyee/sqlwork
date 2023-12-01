-- board 테이블 생성
CREATE TABLE board(
    bno             NUMBER PRIMARY KEY,
    title             VARCHAR2(100) NOT NULL,
    content        CLOB NOT NULL,
    createdate     TIMESTAMP DEFAULT SYSTIMESTAMP,
    modifydate    TIMESTAMP,
    hit               NUMBER DEFAULT 0,
    filename        VARCHAR2(50), 
    id                VARCHAR2(30) NOT NULL,
    FOREIGN KEY(id) REFERENCES member(id) ON DELETE CASCADE
);
CREATE SEQUENCE seq_bno NOCACHE;

INSERT INTO board (bno, title, content, id)
VALUES (seq_bno.NEXTVAL, '글제목', '글내용입니다', 'khit');

-- 게시글 3번 삭제
DELETE FROM board WHERE bno=3;

-- 글번호가 1번인 게시글의 제목, 내용 수정
UPDATE board SET title = '안녕하세요', content = '가입인사입니다 잘부탁드립니다' WHERE bno = 1;

-- 글 번호가 1번인 게시글의 추천수를 1 증가
UPDATE board SET hit = hit+1 WHERE bno = 1;

SELECT * FROM board;

SELECT * FROM board ORDER BY createdate DESC;

COMMIT;