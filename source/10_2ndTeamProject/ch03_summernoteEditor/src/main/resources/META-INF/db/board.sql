DROP SEQUENCE Board_SQ;
DROP TABLE Board;
CREATE TABLE Board(
    BNO NUMBER(8) PRIMARY KEY,
    BTITLE VARCHAR2(100) NOT NULL,
    BCONTENT CLOB,
    BFILE1 VARCHAR2(4000),
    BFILE2 VARCHAR2(4000),
    bfile3 varchar2(4000)
);
CREATE SEQUENCE Board_SQ MAXVALUE 99999999 NOCYCLE NOCACHE;
-- list
SELECT * FROM Board ORDER BY BNO DESC;
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM Board ORDER BY BNO DESC) A)
    WHERE RN BETWEEN 2 AND 2;
-- write
INSERT INTO board VALUES (Board_SQ.NEXTVAL, '제목1','<h1>내용1</h1><h6>test</h6>','101.jpg','102.jpg','103.jpg');
INSERT INTO board VALUES (Board_SQ.NEXTVAL, '제목2','<h1>내용2</h1><h6>test</h6>', null, '102.jpg', null);
INSERT INTO board VALUES (Board_SQ.NEXTVAL, '제목3','<h1>내용3</h1><h6>test</h6>', null, null, null);
INSERT INTO board VALUES (Board_SQ.NEXTVAL, '제목4','<h1>내용4</h1><h6>test</h6>', null, '102.jpg', null);
commit;
-- detail
SELECT * FROM board WHERE BNO=1;
-- update
UPDATE board SET BTITLE = 'TITLE1',
            BFILE1 = '101.jpg',
            BFILE2 = '102.jpg',
            BFILE3 = NULL,
            BCONTENT = 'CONTENT1'
        WHERE BNO = 1;
commit;
delete from board where bno=2;
rollback;
-- getCnt
select count(*) from board;
select * from board;