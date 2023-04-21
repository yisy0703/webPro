DROP SEQUENCE B_SEQ;
DROP TABLE B CASCADE CONSTRAINTS;
CREATE TABLE B(
    BNO NUMBER(8) PRIMARY KEY,
    BTITLE VARCHAR2(100) NOT NULL,
    BCONTENT CLOB,
    BFILE VARCHAR2(4000)
);
CREATE SEQUENCE B_SEQ MAXVALUE 99999999 NOCYCLE NOCACHE;
-- search조건 없을 때
SELECT * FROM B ORDER BY BNO DESC;
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM B ORDER BY BNO DESC) A)
    WHERE RN BETWEEN 1 AND 20;
-- search조건이 btitle일 때
SELECT * FROM B where btitle like '%'||'제'||'%'  ORDER BY BNO DESC;
-- write
INSERT INTO B VALUES (B_SEQ.NEXTVAL, '제목1','<h1>내용</h1><h6>test</h6>','nothing.jpg');
INSERT INTO B VALUES (B_SEQ.NEXTVAL, '제목2','<h1>내용</h1><h6>test</h6>',NULL);
INSERT INTO B VALUES (B_SEQ.NEXTVAL, '제목3','<h1>내용</h1><h6>test</h6>',NULL);
INSERT INTO B VALUES (B_SEQ.NEXTVAL, '제목4','<h1>내용</h1><h6>test</h6>',NULL);
INSERT INTO B VALUES (B_SEQ.NEXTVAL, '제목5','<h1>내용</h1><h6>test</h6>',NULL);
INSERT INTO B VALUES (B_SEQ.NEXTVAL, '제목6','<h1>내용</h1><h6>test</h6>',NULL);
INSERT INTO B VALUES (B_SEQ.NEXTVAL, '제목7','<h1>내용</h1><h6>test</h6>',NULL);
INSERT INTO B VALUES (B_SEQ.NEXTVAL, '제목8','<h1>내용</h1><h6>test</h6>',NULL);
INSERT INTO B VALUES (B_SEQ.NEXTVAL, '제목9','<h1>내용</h1><h6>test</h6>',NULL);
INSERT INTO B VALUES (B_SEQ.NEXTVAL, '제목10','<h1>내용</h1><h6>test</h6>','nothing.jpg');
INSERT INTO B VALUES (B_SEQ.NEXTVAL, '제목11','<h1>내용</h1><h6>test</h6>','nothing.jpg');
commit;
-- detail
SELECT * FROM B WHERE BNO=1;
-- update
UPDATE B SET BTITLE = 'TITLE1',
            BFILE = NULL,
            BCONTENT = 'CONTENT1'
        WHERE BNO = 1;
commit;
delete from b where bno=2;
rollback;
-- 갯수
SELECT COUNT(*) FROM B WHERE BTITLE LIKE '%'||'제'||'%' ;
SELECT * FROM B;