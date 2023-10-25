-- 실행 계획 = 옵티마이저
SELECT * FROM board;

-- 작성자가 admin0000인 게시글 검색
SELECT * FROM board WHERE bwriter = 'admin0000';

-- 인덱스 생성
-- CREATE INDEX 인덱스이름 ON 테이블명(칼럼명)
CREATE INDEX idx_b1 ON board(bwriter);

-- 오라클 힌트 적용
-- /*+ INDEX(테이블명 인덱스명) */
-- 작성자가 admin0000인 게시글 검색
SELECT /*+ INDEX(board idx_b1) */ * FROM board WHERE bwriter = 'admin0000';


-- ROWNUM을 이용한 페이지처리
SELECT ROWNUM, bno, btitle, bcontent, bwriter, bdate 
FROM board
WHERE ROWNUM >= 1 AND ROWNUM <= 10;
-- WHERE ROWNUM >= 11 AND ROWNUM <= 20;

-- ROWNUM이 1을 포함해야 하므로 rn을 사용하여 페이지 처리함
SELECT * 
FROM (SELECT ROWNUM rn, bno, btitle, bcontent, bwriter, bdate 
         FROM board)
WHERE rn >= 11 AND rn <= 20
ORDER BY bno DESC;

-- ROWID : 데이터를 구분할 수 있는 유일한 값
--            데이터 파일의 저장 블록을 확인할 수 있음
-- ROWID 데이터 검색을 할 수 있음
SELECT ROWID, bno, btitle
FROM board;

SELECT ROWID, bno, btitle
FROM board
WHERE ROWID = 'AAATQWAAHAAAAOsAAC';












COMMIT;

DROP INDEX idx_b1;