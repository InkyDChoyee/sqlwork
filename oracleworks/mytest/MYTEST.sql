--  1. 조인의 종류(10점) 와 2. 해당 문제가 발생한 원인(20점) 을 원인 란에 기술

CREATE TABLE DEPARTMENT(
DEPTCODE NUMBER,
DEPTNAME VARCHAR2(10)
);
DROP TABLE DEPARTMENT;

CREATE TABLE EMPLOYEE(
EMPNO NUMBER,
EMPNAME VARCHAR2(10),
DEPTNO NUMBER
);

INSERT INTO DEPARTMENT VALUES(10, '가부서');
INSERT INTO DEPARTMENT VALUES(20, '나부서');
INSERT INTO DEPARTMENT VALUES(30, '다부서');
INSERT INTO DEPARTMENT VALUES(40, '라부서');

INSERT INTO EMPLOYEE VALUES(101, '김가', 10);
INSERT INTO EMPLOYEE VALUES(201, '이나', 20);
INSERT INTO EMPLOYEE VALUES(301, '박다', 30);
INSERT INTO EMPLOYEE VALUES(401, '최라', 40);

select * from DEPARTMENT;
select * from EMPLOYEE;


SELECT a.EMPNO, a.EMPNAME, a.DEPTNO, b.DEPTNAME
FROM EMPLOYEE a, DEPARTMENT b
WHERE a.DEPTNO = b.DEPTCODE;

SELECT a.EMPNO, a.EMPNAME, a.DEPTNO, b.DEPTNAME
FROM EMPLOYEE a JOIN DEPARTMENT b
ON a.deptno = b.DEPTCODE;



--3. 해결할 수 있는 조치사항(20점), 4. 조치사항이 적용된 ANSI 구문(20점), 5. 오라클 전용 구문으로 변경(30점) 