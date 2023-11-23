-- c##을 붙이지 않아도 되는 방법
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- jweb user 계정(db) : (c##mydb)
CREATE USER jweb IDENTIFIED BY pwjweb;  -- 문자열로 하지 않음 ('' 따옴표 안씀)

-- 권한 부여, 리소스 공간 확보
GRANT CONNECT, RESOURCE, DBA TO jweb;