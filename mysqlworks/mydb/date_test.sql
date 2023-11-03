-- 날짜
select now() from dual;

create table date_test1(
	reg_date date,
    hire_date date
);

insert into date_test1 values (now(), '2023-10-01');
insert into date_test1 values (now(), '2023-10-11');
insert into date_test1 values (now(), '2023/07/30');
insert into date_test1 values (now(), '2023-9-3');
-- insert into date_test1 values (now(), str_to_date('20231011', '%y%m%d'));
-- now()가 문제 - 경고
select * from date_test1;


create table date_test2(
	reg_date date default (current_date()),   -- 날짜
    create_date timestamp default now(),      -- 날짜와 시간
    hire_date date                            -- 특정한 날짜
);

-- 날짜 입력 시 '-'하이픈 사용
insert into date_test2(hire_date) values ('2023-07-31');
insert into date_test2(hire_date) values ('2023-10-05');

select * from date_test2;