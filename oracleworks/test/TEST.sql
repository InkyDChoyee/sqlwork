CREATE TABLE test(
    action VARCHAR2(1000)
);

DROP TABLE test;

INSERT INTO test VALUES ('계정 생성 및 권한부여를 수행합니다');

SELECT * FROM test;

COMMIT;