DROP table M;
CREATE TABLE M(
    id varchar2(20),
    name varchar2(20),
    age NUMBER(3),
    birth DATE
);
insert into m values ('aaa','홍길동',20,'23/04/04');
SELECT * FROM M;
COMMIT;