-------------------------------------------------
---------------  MVC_MEMBER ---------------------
-------------------------------------------------
-- DROP & CREATE
DROP TABLE MVC_MEMBER CASCADE CONSTRAINTS;
CREATE TABLE MVC_MEMBER(
    mID VARCHAR2(30) PRIMARY KEY,
    mPW VARCHAR2(30) NOT NULL,
    mNAME VARCHAR2(30) NOT NULL,
    mEMAIL VARCHAR2(30) UNIQUE,
    mPHOTO VARCHAR2(30) NOT NULL, -- 회원가입시 사진업로드를 안 할시 기본 이미지로(NOIMG.JPG)
    mBIRTH DATE,
    mADDRESS VARCHAR2(300),
    mRDATE DATE DEFAULT SYSDATE NOT NULL    
);
-- DUMMY DATA
INSERT INTO MVC_MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('gayun','1','김가연','gayun@naver.com','gayun.jpg','1972/09/09','광주광역시');
INSERT INTO MVC_MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('gico','1','지코','gico@naver.com','gico.jpg','1992/09/14','서울시');
INSERT INTO MVC_MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('go','1','고소영','go@naver.com','go.jpg','1972/10/06','서울시');
INSERT INTO MVC_MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('ham','1','함소원','ham@naver.com','ham.jpg','1976/06/16','서울시');
INSERT INTO MVC_MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('han','1','한지민','han@naver.com','han.jpg','1982/11/05','서울시');
INSERT INTO MVC_MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('jang','1','장동건',null,'jang.jpg',null,null);
INSERT INTO MVC_MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('jo','1','조현우',null,'jo.jpg',null,null);
INSERT INTO MVC_MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('kang','1','강동원',null,'kang.jpg',null,null);
INSERT INTO MVC_MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('kim','1','김태희',null,'kim.jpg',null,null);
INSERT INTO MVC_MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('lee','1','이선빈',null,'lee.jpg',null,null);
INSERT INTO MVC_MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('lim','1','임요한',null,'lim.jpg',null,null);
INSERT INTO MVC_MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('park','1','박보검',null,'park.jpg',null,null);
INSERT INTO MVC_MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('rain','1','비',null,'rain.jpg',null,null);
INSERT INTO MVC_MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('sgy','1','송가연',null,'sgy.jpg',null,null);
INSERT INTO MVC_MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('son','1','손흥민',null,'son.jpg',null,null);
INSERT INTO MVC_MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('song','1','송중기',null,'song.jpg',null,null);
-------------------------------------------------------------------------
---------------------------  FILEBOARD  ---------------------------------
-------------------------------------------------------------------------
DROP TABLE FILEBOARD;
DROP SEQUENCE FILEBOARD_SEQ;
CREATE SEQUENCE FILEBOARD_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE TABLE FILEBOARD(
    fID NUMBER(6) PRIMARY KEY,
    mID VARCHAR2(30) REFERENCES MVC_MEMBER(MID),
    fTITLE VARCHAR2(100) NOT NULL,
    fCONTENT VARCHAR2(1000),
    fFILENAME VARCHAR2(30),
    fRDATE    DATE DEFAULT SYSDATE,
    fHIT     NUMBER(6) DEFAULT 0,
    fGROUP   NUMBER(6) NOT NULL,
    fSTEP    NUMBER(3) NOT NULL,
    fINDENT  NUMBER(3) NOT NULL,
    fIP      VARCHAR2(20) NOT NULL);
-- DUMMY DATA (원글과 답변)
INSERT INTO FILEBOARD (FID, MID, FTITLE, FCONTENT, FFILENAME, FGROUP, FSTEP, FINDENT, FIP)
  VALUES (FILEBOARD_SEQ.NEXTVAL, 'gico','제목','본문', null, 
    FILEBOARD_SEQ.CURRVAL, 0,0, '192.168.0.31');
INSERT INTO FILEBOARD (FID, MID, FTITLE, FCONTENT, FFILENAME, FGROUP, FSTEP, FINDENT, FIP)
  VALUES (FILEBOARD_SEQ.NEXTVAL, 'go','title','content', 'a.docx', 
    FILEBOARD_SEQ.CURRVAL, 0,0, '196.168.0.1');
SELECT * FROM FILEBOARD ORDER BY FGROUP DESC, FSTEP;
-- 위 1 번글에 대한 답변글
UPDATE FILEBOARD SET FSTEP = FSTEP + 1 WHERE FGROUP=1 AND FSTEP>0;
INSERT INTO FILEBOARD (FID, MID, FTITLE, FCONTENT, FFILENAME, FGROUP, FSTEP, FINDENT, FIP)
  VALUES (FILEBOARD_SEQ.NEXTVAL, 'jang','reply',null, null, 
    1, 1, 1, '194.161.13.11');
UPDATE FILEBOARD SET FSTEP = FSTEP + 1 WHERE FGROUP=1 AND FSTEP>0;
INSERT INTO FILEBOARD (FID, MID, FTITLE, FCONTENT, FFILENAME, FGROUP, FSTEP, FINDENT, FIP)
  VALUES (FILEBOARD_SEQ.NEXTVAL, 'jo','reply2',null, null, 
    1, 1, 1, '194.161.13.11');
SELECT * FROM FILEBOARD ORDER BY FGROUP DESC, FSTEP;
-------------------------------------------------------------------------
-----------------------------  ADMIN  -----------------------------------
-------------------------------------------------------------------------
DROP TABLE ADMIN;
CREATE TABLE ADMIN(
  aID VARCHAR2(30) PRIMARY KEY,
  aPW VARCHAR2(30) NOT NULL,
  aNAME VARCHAR2(30) NOT NULL
);
INSERT INTO ADMIN VALUES ('admin', '1', '김관리');
COMMIT;