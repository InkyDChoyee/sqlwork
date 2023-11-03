-- 행순서 관련함수
-- lead(): 하위 행의 값을 상이 행에 출력함
-- lag(): 상위 행의 값을 하위 행에 출력함
CREATE TABLE EMP_INFO(
    EMP_NO      varchar2(3),     -- 사원번호
    NAME         varchar2(20),   -- 사원이름
    SAL            number         -- 급여($달러 기준)
);


insert into EMP_INFO values('100', '김하나', 24000);
insert into EMP_INFO values('101', '이하나', 7000);
insert into EMP_INFO values('102', '박하나', 8000);
insert into EMP_INFO values('103', '최하나', 12000);
insert into EMP_INFO values('104', '정하나', 6000);
insert into EMP_INFO values('105', '오하나', 15000);
insert into EMP_INFO values('106', '임하나', 21000);
insert into EMP_INFO values('107', '고하나', 16000);
insert into EMP_INFO values('108', '윤하나', 9000);
insert into EMP_INFO values('109', '한하나', 13000);

truncate table EMP_INFO;

drop table EMP_INFO;

select * from EMP_INFO;

-- LEAD() OVER()
-- SAL2 = 3행 위로 출력
-- SAL3 = NULL인 경우 
select EMP_NO,
        NAME,
        SAL,
        LEAD(SAL, 3) OVER(order by SAL desc) SAL2,
        LEAD(SAL, 3, 0) OVER(order by SAL desc) SAL3
from EMP_INFO;

-- LAG() OVER()
-- SAL2 - 3행 아래로 출력함
select EMP_NO,
        NAME,
        SAL,
        LAG(SAL, 3) OVER(order by SAL desc) SAL2,
        LAG(SAL, 3, 0) OVER(order by SAL desc) SAL3
from EMP_INFO;


commit;