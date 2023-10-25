-- ROLLUP(), CUBE(), GROUPING SETS()
CREATE TABLE tbl_dept(
    dept_no     VARCHAR2(3),
    job_nm      VARCHAR2(30),
    salary       NUMBER
);

INSERT INTO tbl_dept VALUES ('100', '증권사', 3300000);
INSERT INTO tbl_dept VALUES ('100', '관리자', 4300000);
INSERT INTO tbl_dept VALUES ('100', '관리자', 3500000);
INSERT INTO tbl_dept VALUES ('200', '증권사', 5000000);
INSERT INTO tbl_dept VALUES ('200', '데이터분석가', 4000000);
INSERT INTO tbl_dept VALUES ('200', '관리자', 6000000);

SELECT * FROM tbl_dept;

-- 부서 전체의 인원수와 급여 합계
SELECT COUNT(dept_no) 인원수,
         SUM(salary) 급여합계
FROM tbl_dept;

-- 부서별, 직업 이름별 인원수 및 급여 합계
SELECT dept_no 부서, 
          job_nm 직업이름,
         COUNT(dept_no) 인원수,
         SUM(salary) 급여합계
FROM tbl_dept
GROUP BY dept_no, job_nm;

-- 부서별, 직업 이름별 인원수 및 급여 합계(소계, 총계)
SELECT dept_no 부서, 
          job_nm 직업,
         COUNT(dept_no) 인원수,
         SUM(salary) 급여합계
FROM tbl_dept
GROUP BY ROLLUP (dept_no, job_nm);

SELECT dept_no 부서, 
          job_nm 직업,
         COUNT(dept_no) 인원수,
         SUM(salary) 급여합계
FROM tbl_dept
GROUP BY CUBE (dept_no, job_nm)
ORDER BY dept_no;

-- 부서별, 직업 이름별 인원수 및 급여 합계(소계, 총계가 나오지 않음)
SELECT dept_no 부서, 
          job_nm 직업,
         COUNT(dept_no) 인원수,
         SUM(salary) 급여합계
FROM tbl_dept
GROUP BY GROUPING SETS (dept_no, job_nm)
ORDER BY dept_no;




DROP TABLE tbl_dept;

COMMIT;
