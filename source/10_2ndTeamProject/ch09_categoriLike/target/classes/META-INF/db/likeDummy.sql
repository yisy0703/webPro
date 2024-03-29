DROP TABLE cLIKE CASCADE CONSTRAINTS;
DROP TABLE MBMER CASCADE CONSTRAINTS
DROP TABLE CATEGORY CASCADE CONSTRAINTS;

-- 멤버
CREATE TABLE MEMBER(
    mID VARCHAR2(50) PRIMARY KEY,
    mPW VARCHAR2(50) NOT NULL,
    mNAME VARCHAR2(50) NOT NULL
);
INSERT INTO MEMBER VALUES ('a','1','홍');
INSERT INTO MEMBER VALUES ('b','1','홍');

-- 카테고리
CREATE TABLE category(
    cno number(3) primary key,
    main VARCHAR2(50) not null, -- 주 카테고리
    sub VARCHAR2(50) not null   -- 서브 카테고리
);
DROP SEQUENCE category_SQ;
CREATE SEQUENCE category_SQ MAXVALUE 999 NOCACHE NOCYCLE;
INSERT INTO category VALUES (category_SQ.NEXTVAL, '개발','독서');
INSERT INTO category VALUES (category_SQ.nextval, '개발','재테크');
INSERT INTO category VALUES (category_SQ.nextval, '개발','IT');
INSERT INTO category VALUES (category_SQ.nextval, '일상','요가');
INSERT INTO category VALUES (category_SQ.nextval, '일상','요리');

-- 좋아요
CREATE TABLE cLIKE(
    clno NUMBER(5) PRIMARY KEY,
    mID VARCHAR2(50),
    cno NUMBER(3),
    FOREIGN KEY(mID) REFERENCES MEMBER(mID),
    FOREIGN KEY(cno) REFERENCES category(cno)
);
DROP SEQUENCE cLIKE_SQ;
CREATE SEQUENCE cLIKE_SQ MAXVALUE 99999 NOCACHE NOCYCLE;
INSERT INTO cLIKE VALUES (cLIKE_SQ.NEXTVAL, 'a',(SELECT cno FROM CATEGORY WHERE SUB='독서'));
INSERT INTO CLIKE VALUES (CLIKE_SQ.NEXTVAL, 'a', (SELECT cno FROM CATEGORY WHERE SUB='요리'));
SELECT * FROM cLIKE WHERE MID='a';
SELECT * FROM cLIKE;
DELETE FROM cLIKE WHERE MID='a' AND cno=(SELECT cno FROM category WHERE SUB='요리');
COMMIT;

-- CLIKE.XML의 id="categoryList"
SELECT CNO||',' CNO, MAIN, SUB FROM CATEGORY ORDER BY CNO;
-- CLIKE.XML의 ID="myClikeList"
SELECT * FROM CLIKE WHERE MID='a';
-- CLIKE.XML의 ID="myClikeInsert"
INSERT INTO cLIKE VALUES (cLIKE_SQ.NEXTVAL, 'a',(SELECT cno FROM CATEGORY WHERE SUB='독서'));
-- CLIKE.XML의 ID="myClikeDelete"
DELETE FROM cLIKE WHERE MID='a' AND cno=(SELECT cno FROM category WHERE SUB='요리');

SELECT * FROM MEMBER WHERE MID='a' AND MPW='1';