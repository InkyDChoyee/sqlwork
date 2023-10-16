-- event 테이블 만들기
CREATE TABLE event (
    event_no       NUMBER PRIMARY KEY,        -- 이벤트 번호
    event_name    VARCHAR2(50) NOT NULL,    -- 이벤트 이름
    start_date      VARCHAR2(20) NOT NULL,    -- 이벤트 시작일
    end_date       VARCHAR2(20) NOT NULL     -- 이벤트 종료일
);

-- 자동 일련번호
CREATE SEQUENCE  seq_eno NOCACHE;

INSERT INTO event(event_no, event_name, start_date, end_date)
VALUES (seq_eno.NEXTVAL, '20% 할인 쿠폰 증정', '2023-10-10', '2023-10-20');
INSERT INTO event(event_no, event_name, start_date, end_date)
VALUES (seq_eno.NEXTVAL, '마우스 패드 증정', '2023-11-15', '2023-11-25');
INSERT INTO event(event_no, event_name, start_date, end_date)
VALUES (seq_eno.NEXTVAL, '20% 할인 쿠폰 증정', '2023-12-10', '2023-12-20');

DROP TABLE evnet;

SELECT * FROM event;

-- 이벤트 기간 동안에 리뷰를 작성한 고객
-- 리뷰테이블과 이벤트 테이블 조인
-- 일대다(이벤트와 리뷰)
-- 비동등조인(>=, <=, BETWEEN AND)
SELECT e.event_name,
         r.member_id,
         r.content,
         r.regdate
FROM event e, product_review r
WHERE r.regdate BETWEEN e.start_date AND e.end_date; 

-- 내부조인(INNER JOIN ON)
SELECT e.event_name,
         r.member_id,
         r.content,
         r.regdate
FROM event e INNER JOIN product_review r
   ON r.regdate
        >= e.start_date AND r.regdate <= e.end_date;
   -- = BETWEEN e.start_date AND e.end_date; 
   






COMMIT;