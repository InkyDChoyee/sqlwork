-- department 테이블
CREATE TABLE department(
    deptno       VARCHAR2(4) PRIMARY KEY,
    deptname    VARCHAR2(20) NOT NULL,
    office          VARCHAR2(20)
);

INSERT INTO department VALUES('1000', '인사팀', '서울');
INSERT INTO department VALUES('1001', '전산팀', '인천');
INSERT INTO department VALUES('1002', '전산팀', '수원');
INSERT INTO department (deptno, deptname) VALUES('1003', '영업팀');
-- '1002번' 부서 이름을 '총무팀'으로 바꾸기
UPDATE department
SET deptname = '총무팀'
WHERE deptno = '1002';

-- employee 테이블 생성 
CREATE TABLE employee(
    empno      NUMBER(3) PRIMARY KEY,
    empname   VARCHAR2(20) NOT NULL,
    sal           NUMBER(10),
    createdate DATE DEFAULT SYSDATE,
    deptno     VARCHAR2(4),
    FOREIGN KEY(deptno) REFERENCES department(deptno) -- 외래키
);

INSERT INTO employee VALUES (100, '이강', 2500000, SYSDATE, '1000');
INSERT INTO employee VALUES (101, '김산', 2000000, SYSDATE, '1001');
INSERT INTO employee VALUES (102, '박달', 3000000, SYSDATE, '1002');
INSERT INTO employee VALUES (103, '강태양', 3500000, SYSDATE, '1000');
INSERT INTO employee VALUES (104, '최우주', 5000000, SYSDATE, '1001');
INSERT INTO employee VALUES (105, '우영우', 4000000, SYSDATE, '1002');
-- '강태양' 사원의 급여를 '3000000'원으로 변경
UPDATE employee
SET sal = 3000000
WHERE empname = '강태양';

COMMIT;


SELECT * FROM employee;
SELECT * FROM department;


-- 부서별 급여 총액을 구하시오
SELECT deptno, SUM(sal) 
FROM employee
GROUP BY deptno; 

-- 부서이름과 부서별 급여 총액을 출력하시오
-- employee, department 테이블 사용(조인)
SELECT d.deptno,
          d.deptname,
          SUM(e.sal)
FROM department d, employee e
WHERE d.deptno = e.deptno
GROUP BY d.deptno, d.deptname;

-- ROLLUP(칼럼1, 칼럼2) : GROUP BY절에서 소계, 총계를 만들어 줌
SELECT d.deptno,
          SUM(e.sal)
FROM department d, employee e
WHERE d.deptno = e.deptno
GROUP BY ROLLUP(d.deptno);

-- CUBE(칼럼1, 칼럼2) : GROUP BY절에서 모든 소계, 총계를 입체적으로 만듬
SELECT d.deptno,
          d.deptname,
          SUM(e.sal)
FROM department d, employee e
WHERE d.deptno = e.deptno
GROUP BY CUBE(d.deptno, d.deptname)
ORDER BY deptname;

-- SUM(칼럼) OVER(정렬) - 누적합계
SELECT empno,
         empname,
         sal,
         SUM(sal) OVER (ORDER BY empno) SAL_SUM  -- 칼럼명 출력시 소문자로 사용하는 방법 = ""쌍따옴표로 묶어준다 => "sal_sum"
FROM employee;

-- 순위 RANK() OVER(ORDER BY 칼럼) 함수
SELECT empno,
         empname,
         sal,
         RANK() OVER (ORDER BY sal DESC) 급여_RANK, 
         DENSE_RANK() OVER(ORDER BY sal DESC) 급여_DENSE_RANK
FROM employee;

