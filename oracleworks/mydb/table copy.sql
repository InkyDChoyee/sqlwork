
select * from drink2;

-- 테이블 복사(생성)
create table drink2 as
select * from drink;

-- 재귀복사(insert into ~ select) : values 사용안함
insert into drink2
(select * from drink2);

-- rownum (sudo column) - 제공된 관리자 칼럼
select rownum, drink_code, drink_name
from drink2
where rownum >=1 and rownum <= 10;

-- rownum 11번부터 나오게=>from절에서 서브쿼리 사용 = 인라인 뷰 
select *  -- 칼럼을 사용하면 안됨
from (select rownum rn, drink_code, drink_name from drink2)
--where rownum >=1 and rownum <= 10;     -- rownum사용 = 검색 안됨
where rn >= 21 and rn <= 30;                   -- rownum의 별칭으로 하면 검색 됨