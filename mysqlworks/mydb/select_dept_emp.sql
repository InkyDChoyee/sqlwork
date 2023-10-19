select * from department;
select * from employee;

-- 삽입 오류 체크 : 부서 테이블에 아이디가 30이 없어서 에러 
insert into employee values (106, '양신입', 25, null, 30);

-- 급여가 300만원 이상이고, 
select empid, empname
from employee
where sal >= 4000000 
  and deptid = 10;
  
-- 급여가 많은 순으로 정렬하시오
select *
from employee
order by sal desc;

-- 사원의 총인원, 급여 총액과 급여 평균을 구하시오
select count(*) as 총인원,
	   sum(sal) as 급여총액, 
	   round(avg(sal), -2) as 급여평균
from employee;

-- 부서별 급여 총액을 구하시오
select deptid as 부서번호, sum(sal) as 급여총액
from employee
group by deptid with rollup;

-- 부서이름을 포함한 사원의 모든 정보
select b.deptname 부서명, a.*
from employee as a, department as b
where a.deptid = b.deptid;
 
select b.deptname 부서명, a.*
from employee as a inner join department as b
  on a.deptid = b.deptid;
  
select b.deptname 부서명, a.*
from employee as a inner join department as b
  using (deptid);

-- 부서이름별 급여 총액
select deptid 부서번호, deptname 부서명, sum(sal) 급여총액, round(avg(sal), -2) 급여평균
from employee as a, department as b
where a.deptid = b.deptid
group by deptid, deptname with rollup;

select deptid 부서번호, deptname 부서명, sum(sal) 급여총액, round(avg(sal), -2) 급여평균
from employee as a inner join department as b
  on a.deptid = b.deptid
group by deptid, deptname with rollup;

select deptid 부서번호, deptname 부서명, sum(sal) 급여총액, round(avg(sal), -2) 급여평균
from employee as a inner join department as b
using(deptid)
group by deptid, deptname with rollup;

-- 최고 급여와 최저 급여를 받는 사원
select *
from employee
where sal = (select max(sal) from employee) 
   or sal = (select min(sal) from employee);
 
 -- 백두산 사원의 급여를 430만원으로 수정하세요
 update employee
 set sal = 4300000
 where empid = 102;  -- 기본키로만 변경이 가능함
 
 -- 사원의 급여 순위를 구하시오
 select empname 사원이름,
	    sal 급여,
        rank() over(order by sal desc) 급여순위1,
	    dense_rank() over(order by sal desc) 급여순위2
 from employee;