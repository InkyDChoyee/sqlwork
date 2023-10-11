-- 학교 데이터베이스 구축
-- 학과 테이블 생성
CREATE TABLE major(
    subject    VARCHAR2(20) PRIMARY KEY,
    mp         VARCHAR2(20) NOT NULL,     -- 필수 입력
    location   VARCHAR2(30) NOT NULL
);

-- 학과 추가
INSERT INTO major(subject, mp, location)
VALUES ('소프트웨어학과', '02-1234-5678', 'B동 3층');
INSERT INTO major(subject, mp, location)
VALUES ('화학공학과', '02-2222-7777', 'B동 4층');
INSERT INTO major(subject, mp, location)
VALUES ('전기전자공학과', '02-3333-8888', 'B동 5층');

-- 오류 : 열에 대한 값이 너무 큼
-- 학과명 자료의 크기 변경
ALTER TABLE major MODIFY subject VARCHAR2(30);

-- 전체 데이터 조회
SELECT * FROM major;

-- 학과명과 전화번호만 출력
-- 레일블 바꾸기 = 별칭 as (as 생략 가능)
SELECT subject AS 학과명, mp AS 전화번호 FROM major;


COMMIT;