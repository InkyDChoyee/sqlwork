-- 새로운 사용자(user) 생성
CREATE USER c##mydb IDENTIFIED BY pwmydb;
-- 세션(저장을 유지)을 생성할 권한 부여
GRANT CREATE SESSION TO c##mydb;
-- 테이블 자원(resource)을 생성할 권한 부여
GRANT CREATE TABLE, RESOURCE TO c##mydb;
-- DBA에 접속(연결)할 권한 부여
GRANT CONNECT, DBA TO c##mydb;

CREATE USER c##mytest IDENTIFIED BY pwmytest;
GRANT CREATE SESSION TO c##mytest;
GRANT CREATE TABLE, RESOURCE TO c##mytest;
GRANT CONNECT, DBA TO c##mytest;