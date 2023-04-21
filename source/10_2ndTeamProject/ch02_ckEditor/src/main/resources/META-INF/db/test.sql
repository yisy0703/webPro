DROP SEQUENCE B_SEQ;
DROP TABLE B CASCADE CONSTRAINTS;
CREATE TABLE B(
    BNO    NUMBER(8) PRIMARY KEY,
    BTITLE VARCHAR2(100) NOT NULL,
    BCONTENT CLOB,
    BFILE VARCHAR2(4000)
);
CREATE SEQUENCE B_SEQ MAXVALUE 99999999 NOCYCLE NOCACHE;
-- id = writeBboard
INSERT INTO B VALUES (B_SEQ.NEXTVAL, '제목1', '<h1>내용</h1><h6>test</h6>','nothing.jpg');
INSERT INTO B VALUES (B_SEQ.NEXTVAL, '제목2', '<h1>내용</h1><h6>test</h6>',null);
INSERT INTO B VALUES (B_SEQ.NEXTVAL, '제목3','<h1>내용</h1><h6>test</h6>',NULL);
INSERT INTO B VALUES (B_SEQ.NEXTVAL, '제목4','<h1>내용</h1><h6>test</h6>',NULL);
INSERT INTO B VALUES (B_SEQ.NEXTVAL, '제목5','<h1>내용</h1><h6>TEST</h6>',NULL);
INSERT INTO B VALUES (B_SEQ.NEXTVAL, '제목6','<h1>본문</h1><h6>TEST</h6>',NULL);
INSERT INTO B VALUES (B_SEQ.NEXTVAL, '제목7','<h1>본문</h1><h6>TEST</h6>',NULL);
INSERT INTO B VALUES (B_SEQ.NEXTVAL, '제목8','<h1>본문</h1><h6>TEST</h6>',NULL);
INSERT INTO B VALUES (B_SEQ.NEXTVAL, '제목9','<h1>내용</h1><h6>test</h6>',NULL);
INSERT INTO B VALUES (B_SEQ.NEXTVAL, '제목10','<h1>내용글</h1><h6>test</h6>','nothing.jpg');
INSERT INTO B VALUES (B_SEQ.NEXTVAL, '글1','<h1>본문</h1><h6>test</h6>','nothing.jpg');
-- id=listBboard
  -- ① schItem이 null이나 ''일 때
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM B ORDER BY BNO DESC) A)
  WHERE RN BETWEEN 6 AND 11;
  -- ② schItem이 'btitle'일 때
SELECT * FROM (SELECT ROWNUM RN, A.* FROM 
      (SELECT * FROM B WHERE BTITLE LIKE '%'||'1'||'%' ORDER BY BNO DESC) A)
  WHERE RN BETWEEN 1 AND 11;
  -- ③ schItem이 'bcontent'일 때
SELECT * FROM (SELECT ROWNUM RN, A.* FROM 
      (SELECT * FROM B WHERE BCONTENT LIKE '%'||'내'||'%' ORDER BY BNO DESC) A)
  WHERE RN BETWEEN 1 AND 11;  
  -- ④ schItem이 'btitleBcontent'일 때
SELECT * FROM (SELECT ROWNUM RN, A.* FROM 
      (SELECT * FROM B WHERE BTITLE LIKE '%'||'글'||'%' OR BCONTENT LIKE '%'||'글'||'%'  ORDER BY BNO DESC) A)
  WHERE RN BETWEEN 1 AND 11;

-- id=cntBboard
  -- ① schItem이 null이나 ''일 때
SELECT COUNT(*) FROM B;
  -- ② schItem이 'btitle'일 때
SELECT COUNT(*) FROM B WHERE BTITLE LIKE '%'||'1'||'%';
  -- ③ schItem이 'bcontent'일 때
SELECT COUNT(*) FROM B WHERE BCONTENT LIKE '%'||'내'||'%';
  -- ④ schItem이 'btitleBcontent'일 때
SELECT COUNT(*) FROM B WHERE BTITLE LIKE '%'||'글'||'%' OR BCONTENT LIKE '%'||'글'||'%';

-- id = detailBboard
SELECT * FROM B WHERE BNO=1;

-- id = updateBboard
UPDATE B SET BTITLE = '글1',
            BFILE = 'nothing.jpg',
            BCONTENT = '본문입니다'
      WHERE BNO=1;
      
-- id = deleteBboard
DELETE FROM B WHERE BNO=2;
COMMIT;