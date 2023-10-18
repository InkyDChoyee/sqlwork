-- 연예인 테이블
CREATE TABLE entertainers(
    name       VARCHAR2(30),
    birthday    VARCHAR2(20),
    job          VARCHAR2(30)
);

INSERT INTO entertainers 
      VALUES ('양동근', '19790601', '배우, 가수');
INSERT INTO entertainers 
      VALUES ('박은빈', '19920904', '배우');
INSERT INTO entertainers 
      VALUES ('장기하', '19820220', '가수, 작가');
      
-- 직업이 가수인 연예인은
-- 속성값이 원자값이어야 한다
-- 직업이 가수인 연예인은? 검색의 어려움이 있음
SELECT * 
FROM entertainers
WHERE job LIKE '%가수%';   -- = 사용하면 불가. LIKE 사용하면 되긴 됨

-- 연예인 테이블, 직업 테이블로 분해


-- 연예인 테이블, 직업 테이블로 분해
CREATE TABLE entertainer(
    name       VARCHAR2(20),
    birthday    VARCHAR2(20)
);

INSERT INTO entertainer 
      VALUES ('양동근', '19790601');
INSERT INTO entertainer 
      VALUES ('박은빈', '19920904');
INSERT INTO entertainer 
      VALUES ('장기하', '19820220');
      
SELECT * FROM entertainer;


CREATE TABLE job(
    ename      VARCHAR2(20),
    jobname   VARCHAR2(30)
);

INSERT INTO job
           VALUES ('양동근','배우');
INSERT INTO job
           VALUES ('양동근','가수');
INSERT INTO job
           VALUES ('박은빈','배우');
INSERT INTO job
           VALUES ('장기하','가수');
INSERT INTO job
           VALUES ('장기하','작가');

SELECT * FROM job;


-- 연예인의 이름고 생년월일, 직업 정보를 검색
-- 동등조인
SELECT a.*, b.jobname
FROM entertainer a, job b 
WHERE a.name = b.ename;

DROP TABLE job;

-- 내부조인
SELECT a.*, b.jobname
FROM entertainer a INNER JOIN job b
   ON a.name = b.ename;


COMMIT;