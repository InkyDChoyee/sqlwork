-- 테이블 생성 (RESOURCE 확보됨)
CREATE TABLE test(
    msg     VARCHAR2(30)
);

-- DBA권한 부여 확인
INSERT INTO test VALUES ('테스트 입니다');

SELECT * FROM test;