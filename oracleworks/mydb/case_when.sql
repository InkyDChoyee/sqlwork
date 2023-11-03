-- 조건 처리 함수
CREATE TABLE Mytest(
    class       varchar2(1),   -- 반
    name      varchar2(6)   -- 이름
);

insert into Mytest values ('A', '조조');
insert into Mytest values ('A', '조조');
insert into Mytest values ('A', '조조');
insert into Mytest values ('B', '유비');
insert into Mytest values ('B', '관우');
insert into Mytest values ('C', '여포');
insert into Mytest values ('C', '여포');

create table mytest2(
    col1    number(1)
);

insert into mytest2 values (null);
insert into mytest2 values (0);
insert into mytest2 values (null);
insert into mytest2 values (0);
insert into mytest2 values (null);




select * from Mytest;

commit;

-- 전체 인원수
select count(*)
from Mytest;

-- 반 별 인원수 
select class, count(name) 인원수
from Mytest
group by class;

-- 반 별 인원수(중복 이름 제거후) 계산
select class,
        count(DISTINCT name)
from Mytest
group by class;

-- DECODE(칼럼명, 조건, 참, 거짓)
select 
        count(decode(class, 'A', 1)) A,
        count(decode(class, 'B', 1)) B,
        count(decode(class, 'C', 1)) C
from Mytest;


-- case when then end 구문으로 변경
select
    count
    (case when class='A' then 1 end) A,
    count
    (case when class='B' then 1 end) B,
    count
    (case when class='C' then 1 end) C
from Mytest;




-- mytest2 조건 처리
select * from mytest2;

-- col1의 데이터가 null이면 -1로 표기
select 
    decode(t.col1, null, -1, 0) DATA1,

    case when t.col1 is null then -1
          else t.col1
    end DATA2
from mytest2 t;