-- ROWNUM(행번호) 
-- 행 수를 제한하고 싶을 때 사용, SUDO COLUMNE 이라 함
CREATE TABLE ex_score(
    name    VARCHAR2(10),
    score    NUMBER(3)
);

DROP TABLE ex_score;

INSERT INTO ex_score VALUES ('김하나', 94);
INSERT INTO ex_score VALUES ('고하나', 85);
INSERT INTO ex_score VALUES ('이하나', 100);
INSERT INTO ex_score VALUES ('박하나', 97);
INSERT INTO ex_score VALUES ('정하나', 87);
INSERT INTO ex_score VALUES ('최하나', 87);
INSERT INTO ex_score VALUES ('윤하나', 91);
INSERT INTO ex_score VALUES ('임하나', 77);
INSERT INTO ex_score VALUES ('장하나', 80);
INSERT INTO ex_score VALUES ('함하나', 95);

-- 1부터 5행까지 정보 출력
SELECT ROWNUM, name, score 
FROM ex_score
WHERE ROWNUM <= 5;

SELECT ROWNUM, name, score 
FROM ex_score
WHERE ROWNUM BETWEEN 1 AND 5; 

-- 2부터 6행까지 데이터 검색 => 불가
-- ROWNUM은 항상 1부터 시작해야 한다
SELECT ROWNUM, name, score 
FROM ex_score
WHERE ROWNUM >= 2 AND ROWNUM <= 6;

-- 점수를 높은순 정렬하여 검색하시오
-- 점수가 높은 순으로 5명을 검색하시오
SELECT ROWNUM, name, score 
FROM ex_score
ORDER BY score DESC;

SELECT ROWNUM, name, score
FROM (SELECT ROWNUM, name, score FROM ex_score ORDER BY score DESC)
WHERE ROWNUM <= 5;

-- 성적 순위
SELECT name 이름, 
          score 점수,     
          RANK() OVER(ORDER BY score DESC) 순위,
          DENSE_RANK() OVER(ORDER BY score DESC) 순위2
FROM ex_score;



COMMIT;