-- dept테이블
CREATE TABLE dept(
    deptid  NUMBER PRIMARY KEY,         -- 기본키
    deptname VARCHAR2(20) NOT NULL,  -- NULL 불허 (값이 비어있으면 안됨)
    location VARCHAR2(20) NOT NULL
);

-- 부서 자료 추가
INSERT INTO dept(deptid, deptname, location)
VALUES (10, '전산팀', '서울');
INSERT INTO dept(deptid, deptname, location)
VALUES (2, '관리팀', '인천');
INSERT INTO dept(deptid, deptname, location)
VALUES (30, '마케팅팀', '수원');

SELECT * FROM dept;
COMMIT;

-- 부서이름에서 팀을 제외한 이름만 출력
SELECT 
SUBSTR(deptname, 1, LENGTH(deptname)-1) AS 팀명1,
REPLACE(deptname,'팀','') AS 팀명2
FROM dept;



COMMIT;