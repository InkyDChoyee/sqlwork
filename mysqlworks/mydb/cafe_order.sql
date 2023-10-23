-- 제2정규화(음료, 주문 테이블)

create table drink (
	drink_code    varchar(3) primary key,  -- 음료코드
    drink_name	  varchar(20) not null     -- 음료이름
);

create table cafe_order(
	order_no    int primary key auto_increment,  -- 주문번호
    drink_code  varchar(20) not null,            -- 음료코드
    order_cnt   int not null,                    -- 주문수량
    foreign key(drink_code) references drink(drink_code)
    on delete cascade  -- 부모키의 데이터가 삭제되면 자식 데이터가 자동으로 삭제됨
);

-- drink 자료 추가
insert into drink values ('A01', '아메리카노');
insert into drink values ('B01', '카페라떼');
insert into drink values ('C01', '허브차');

-- cafe_order 자료 추가
insert into cafe_order(drink_code, order_cnt)
values('A01', 3);
insert into cafe_order(drink_code, order_cnt)
values('B01', 1);
insert into cafe_order(drink_code, order_cnt)
values('C01', 2);


select * from drink;

select * from cafe_order;

drop table cafe_order;

-- 음료테이블에 있는 카페라떼 삭제(음료코드'B01')
-- 주문 테이블의 'B01'도 자동 삭제
delete from drink where drink_code = 'B01';
delete from cafe_order where drink_code = 'C01';


-- 주문테이블에 음료 이름을 포함하여 출력하세요
-- 내부조인
select a.drink_name, b.*
from drink a, cafe_order b
where a.drink_code = b.drink_code;

select a.drink_name, b.*
from drink a inner join cafe_order b
using(drink_code);

-- 외부조인 
-- 주문에 관계 없이 주문정보와 음료는 모두 출력
select a.drink_name, b.*
from drink a left outer join cafe_order b
using(drink_code);


-- 주문이 없는 상품을 검색하시오
select a.drink_name "주문이 없는 상품"
from drink a left outer join cafe_order b
on a.drink_code = b.drink_code
where b.order_no is null;

