-- 부서(dept)와 사원 테이블 생성
CREATE TABLE department(
    deptid  NUMBER PRIMARY KEY,         -- 기본키
    deptname VARCHAR2(20) NOT NULL,  -- NULL 불허 (값이 비어있으면 안됨)
    location VARCHAR2(20) NOT NULL
);

-- 부서 자료 추가
INSERT INTO department(deptid, deptname, location)
VALUES (10, '전산팀', '서울');
INSERT INTO department(deptid, deptname, location)
VALUES (2, '관리팀', '인천');
INSERT INTO department(deptid, deptname, location)
VALUES (30, '마케팅팀', '수원');

-- 자료 검색 (특정 칼럼 검색)
SELECT deptid, deptname FROM department;

-- 모든 칼럼 검색 ('*' 사용)
SELECT * FROM department;

-- 특정한 데이터(행:로우) 검색 ->  WHERE 조건절 사용
-- 부서이름이 전산팀인 row(레코드) 검색
SELECT * FROM department 
WHERE deptname = '전산팀';


UPDATE department SET deptid = 20
WHERE deptid = 2;

-- 자료 수정(부서 이름 변경 - 관리팀 -> 경영팀)
UPDATE department SET deptname = '경영팀'
WHERE deptid = 20;

-- 마지막 COMMIT한 시점 까지 실행 취소
ROLLBACK;

-- 자료 삭제(부서 번호가 30번인 마케팅팀 삭제)
DELETE  FROM department
WHERE deptid = 30;


-- 영속화
COMMIT;


