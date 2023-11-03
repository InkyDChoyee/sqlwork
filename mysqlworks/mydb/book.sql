-- bookmall 구축
-- book 테이블
create table book (
	bookid    int primary key,
    bookname  varchar(60) not null,
    publisher varchar(60) not null,
    price     int not null
);

-- 도서 자료 추가
insert into book values (1, '축구의 역사', '굿스포츠', 7000);
insert into book values (2, '축구 아는 여자', '나무수', 13000);
insert into book values (3, '축구의 이해', '대한미디어', 22000);
insert into book values (4, '골프 바이블', '대한미디어', 35000);
insert into book values (5, '피겨 교본', '굿스포츠', 8000);
insert into book values (6, '양궁의 실제', '굿스포츠', 6000);
insert into book values (7, '야구의 추억', '이상미디어', 20000);
insert into book values (8, '야구를 부탁해', '이상미디어', 13000);
insert into book values (9, '올림픽 이야기', '삼성당', 7500);
insert into book values (10, 'Olympic Chanpions', 'Person', 13000);

select * from book;

-- '축구의 역사'를 출간한 출판사를 검색하시오
select publisher from book
where bookname = '축구의 역사';

select publisher from book
where bookname like '축구의 역사';

-- 도서 이름에 '축구'가 포함된 출판사를 검색하시오
select publisher from book
where bookname like '%축구%';

-- 도서 이름에 '축구'가 포함되지 않은 출판사를 검색하시오
select bookname, publisher from book
where bookname not like '%축구%';

-- 축구에 관한 도서 중 가격이 20000원 이상인 도서를 검색하시오
select * from book
where bookname like '%축구%' and price >= 20000;

-- 정렬
-- 도서를 이름 순으로 정렬하시오(오름차순)
select * from book
order by bookname;

-- 도서를 가격순으로 정렬하시오(오름차순)
-- 가격이 같으면 이름을 내림차순으로 정렬하시오
select * from book
order by price asc, bookname desc;