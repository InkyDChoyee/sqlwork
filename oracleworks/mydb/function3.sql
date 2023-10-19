-- 조건에 관련된 함수
-- DECODE(칼럼명, 조건, 참인값, 거짓인값)  -- 단점 : 값 지정 가능, 범위 지정 불가능
-- 성별이 남자이면 'M', 여자이면 'F'로 출력
SELECT ename 사원,
          gender 성별,
          DECODE(gender, '남자', 'M', 'F') gender
FROM emp;

-- 조건에  관련된 구문(if ~ else구문과 유사)
-- CASE WHEN THEN END 구문
/* 
    CASE
          WHEN 조건1 THEN 결과1
          WHEN 조건2 THEN 결과2
          ELSE 결과3
     END 칼럼명(레이블)
*/
SELECT ename 사원번호,
         gender 성별,
    CASE 
        WHEN gender = '남자' THEN 'M'
        ELSE 'F'
     END gender
FROM emp;

-- 급여에 따른 직급 표시
-- 급여가 350만원 이상이면 직급 -> '과장'으로 표시
-- 급여가 250만원 이상이면 직급 -> ' 대리'로 표시
-- 나머지 -> '사원'으로 표시
SELECT ename 사원번호,
         salary 급여,
    CASE 
        WHEN salary >= 3500000 THEN '과장'
        WHEN salary >= 2500000 THEN '대리'
        ELSE '사원'
     END 직급
FROM emp
ORDER BY salary DESC;

-- salary의 개수
SELECT COUNT(salary)
FROM emp;

-- null값에 0을 표시 : NVL()
-- NVL(인수1, 인수2) 
-- 인수1이 null이 아니면 인수1 출력
-- 인수1이 null이면 인수2 출력
SELECT ename 사원이름,
          NVL(salary, 0) 급여      -- UPDATE 가 아님, 보이는 것만 0
FROM emp;

-- NVL() 0으로 처리 후에 개수를 세면 COUNT 된다
SELECT COUNT(NVL(salary, 0))
FROM emp;

-- 실습 테이블 생성
CREATE TABLE k1(
    ID    VARCHAR2(3),
    CNT NUMBER(2)
);

INSERT INTO k1 VALUES('가', 5);
INSERT INTO k1 VALUES('나', NULL);
INSERT INTO k1 VALUES('다', 5);
INSERT INTO k1 VALUES('라', NULL);
INSERT INTO k1 VALUES('마', 10);

SELECT * FROM k1;


-- NVL() 0으로 처리 후에 개수를 세면 COUNT 된다
SELECT COUNT(CNT) FROM k1;  -- 3
SELECT COUNT(NVL(CNT, 0)) FROM k1;  -- 5

-- 평균 구하기
SELECT SUM(CNT) / COUNT(CNT)  -- 6.6666...
FROM k1;
SELECT SUM(CNT) / COUNT(NVL(CNT,0))  -- 4
FROM k1;

SELECT AVG(CNT)    -- 6.6666...
FROM k1;
SELECT AVG(NVL(CNT,0))   -- 4
FROM k1;

-- 최소값 구하기
SELECT MIN(CNT) FROM k1;    -- 5
SELECT MIN(NVL(CNT, 0)) FROM k1;   -- 0

COMMIT;