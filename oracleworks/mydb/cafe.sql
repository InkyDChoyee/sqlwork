CREATE TABLE drink(
    drink_code   VARCHAR2(3) PRIMARY KEY,     -- 음료 코드
    drink_name   VARCHAR2(30) NOT NULL       -- 음료 이름
);

INSERT INTO drink VALUES ('A01', '아메리카노');
INSERT INTO drink VALUES ('B01', '카페라떼');
INSERT INTO drink VALUES ('C01', '자몽');


CREATE TABLE cafe_order(
    order_no    VARCHAR2(10) PRIMARY KEY,    -- 주문 번호
    drink_code  VARCHAR2(3),                       -- 음료 코드
    order_cnt   NUMBER NOT NULL,             -- 주문 수량
    FOREIGN KEY(drink_code) REFERENCES drink(drink_code)  -- 외래키
);

DROP TABLE cafe_order;
DROP TABLE drink;

INSERT INTO cafe_order VALUES ('2023100101', 'A01', 3);
INSERT INTO cafe_order VALUES ('2023100102', 'B01', 1);
INSERT INTO cafe_order VALUES ('2023100123', 'A01', 2);

SELECT * FROM drink;
SELECT * FROM cafe_order;

-- 동등 조인
SELECT b.order_no 주문번호, 
          b.drink_code 음료코드, 
          a.drink_name 음료명, 
          b.order_cnt 주문수량
FROM drink a, cafe_order b
WHERE a.drink_code = b.drink_code;
-- 내부 조인
SELECT b.order_no 주문번호, 
          b.drink_code 음료코드, 
          a.drink_name 음료명, 
          b.order_cnt 주문수량
FROM drink a INNER JOIN cafe_order b
   ON a.drink_code = b.drink_code;
-- 내부조인 USING 사용
SELECT b.order_no 주문번호, 
          drink_code 음료코드, 
          a.drink_name 음료명, 
          b.order_cnt 주문수량
FROM drink a INNER JOIN cafe_order b
USING(drink_code);


-- 주문이 없는 음료를 포함해서 모든 정보 출력
SELECT NVL(b.order_no, ' ') 주문번호, 
          a.drink_code 음료코드, 
          a.drink_name 음료명, 
          NVL(b.order_cnt, '0') 주문수량
FROM drink a, cafe_order b
WHERE a.drink_code = b.drink_code(+);
-- 외부 조인
SELECT NVL(b.order_no, ' ') 주문번호, 
          a.drink_code 음료코드, 
          a.drink_name 음료명, 
          NVL(b.order_cnt, '0') 주문수량
FROM drink a LEFT OUTER JOIN cafe_order b
   ON a.drink_code = b.drink_code;
-- 외부 조인 USING 사용   
SELECT  NVL(b.order_no, ' ') 주문번호, 
          drink_code 음료코드, 
          a.drink_name 음료명, 
          NVL(b.order_cnt, '0') 주문수량
FROM drink a LEFT OUTER JOIN cafe_order b
USING(drink_code);


COMMIT;