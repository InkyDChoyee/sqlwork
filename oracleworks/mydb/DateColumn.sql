-- 날짜 칼럼 
-- 1. DATE DEFAULT SYSDATE = 현재 날짜와 시간
-- 2. DATE = 특정 날짜

-- 날짜
select sysdate from dual;

-- 날짜와 시간
select systimestamp from dual;

-- 20일 전 날짜
select sysdate - 20 from dual;

-- 특정한 날에서 20일 전의 날짜
select to_date ('2023-10-25') -20 from dual;

-- 서점의 주문 확정일자
select orderid 주문번호,
        orderdate 주문일,
        to_date(orderdate) + 10 확정일
from orders;



create table date_test1(
    reg_date        date,
    hire_date       date
);

-- 자바 클래스와 연동시에 사용
create table date_test2(
    reg_date        date default sysdate,
    hire_date       date
);

-- 추가1
insert into date_test1 values (sysdate, '2023-11-01');
insert into date_test1 values (sysdate, to_date('2023-11-01'));

-- 추가2
insert into date_test2(hire_date) VALUES ('2023-11-01');
insert into date_test2(hire_date) values (to_date('2023-11-01'));

select * from date_test1;
select * from date_test2;

commit;

drop table date_test;