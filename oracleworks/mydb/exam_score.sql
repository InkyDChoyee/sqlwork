-- 등급 매기기, ntitle()
CREATE TABLE exam_score(
    이름      VARCHAR2(20),
    국어      NUMBER,
    영어      NUMBER,
    수학      NUMBER
);

INSERT INTO exam_score VALUES('고하나', 116, 77, 75);
INSERT INTO exam_score VALUES('이하나', 101, 69, 80);
INSERT INTO exam_score VALUES('박하나', 118, 62, 60);
INSERT INTO exam_score VALUES('정하나', 96, 72, 70);
INSERT INTO exam_score VALUES('최하나', 103, 77, 55);
INSERT INTO exam_score VALUES('김하나', 78, 66, 61);
INSERT INTO exam_score VALUES('한하나', 85, 72, 75);
INSERT INTO exam_score VALUES('장하나', 99, 70, 53);
INSERT INTO exam_score VALUES('윤하나', 105, 75, 69);
INSERT INTO exam_score VALUES('임하나', 117, 69, 73);


SELECT * FROM exam_score;


-- NTILE(수) OVER(ORDER BY 칼럼명) 수 만큼 등급으로 분류
-- 국어 과목 등급 검색
SELECT 이름,
          NTILE(8) OVER(ORDER BY 국어 DESC) 등급,
          국어
FROM exam_score;

-- 윤하나를 제외한 국어 과목 등급 검색
SELECT 이름,
          NTILE(8) OVER(ORDER BY 국어 DESC) 등급,
          국어
FROM exam_score
WHERE 이름 <> '윤하나';  -- '<>'는 '='의 반대

-- 전체 과목으로 등급 검색
SELECT 이름,
          NTILE(8) OVER(ORDER BY 국어) 국어등급,
          국어,
          NTILE(8) OVER(ORDER BY 영어) 영어등급,
          영어,
          NTILE(8) OVER(ORDER BY 수학) 수학등급,
          수학
FROM exam_score;