DROP TABLE FRIEND;
CREATE TABLE FRIEND(
    no number(3) primary key,
    name varchar2(30) not null,
    tel varchar2(30) not null,
    addr varchar2(300) );
DROP SEQUENCE FRIEND_SQ;
CREATE SEQUENCE FRIEND_SQ NOCACHE;
INSERT INTO FRIEND VALUES (FRIEND_SQ.NEXTVAL, '홍','010-9999-9999','서울');
select * from FRIEND order by no;
select * from
    (select ROWNUM RN, A.* FROM (select * from FRIEND order by no) A)
    WHERE RN BETWEEN 2 AND 8;
SELECT COUNT(*) FROM FRIEND;
SELECT * FROM FRIEND ORDER BY NO DESC;
COMMIT;