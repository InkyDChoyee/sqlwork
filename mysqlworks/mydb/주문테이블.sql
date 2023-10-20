use mydb;

create table 장바구니(
    번호 int primary key auto_increment,
	아이템 varchar(20),
    가격 int
);
drop table 장바구니;

insert into 장바구니(아이템, 가격) values('두부', 2000);
insert into 장바구니(아이템, 가격) values('김치', 6500);
insert into 장바구니(아이템, 가격) values('콩나물', 1000);
insert into 장바구니(아이템, 가격) values('스팸', 3500);
insert into 장바구니(아이템, 가격) values('소세지', 3000);

select * from 장바구니;

-- 가격별로 정렬하시오
select * from 장바구니
order by 가격;

-- 아이템의 총 개수, 가격의 평균 구하기
select count(*) 개수,
       round(avg(가격),0) 평균가격,
	   max(가격) 최고가,
       min(가격) 최저가
from 장바구니;

-- 번호가 3번인 아이템 검색
select * from 장바구니
where 번호 = 3;







create table 주문테이블(
	주문번호   varchar(10) primary key,
    고객번호   int not null,
    주문일    date  not null,
    주문가격   int  not null,
    배송도시   varchar(10),
    배송완료일  date,
    결제금액   int not null,
    할인금액    int not null
);

drop table 주문테이블;

insert into 주문테이블 values('A0100', 24680, 20170704, 55000, '서울', 20170707, 45000, 10000);
insert into 주문테이블 values('X0300', 13579, 20170801, 70000, '부산', null, 50000, 20000);

select * from 주문테이블;