-- mydb 생성
create database mydb;

-- 작업 전에 사용 db 실행
use mydb;

-- 테이블 생성
create table test(
	no	int,			-- 숫자자료형
    msg	varchar(100)	-- 문자자료형
);

insert into test values (1, '좋은 하루 되세요~');
insert into test values (2, 'Good luck!!');


commit;

select * from test;