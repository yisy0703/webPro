----------------------------------------------------------------------
-------------------------  DROP EVERYTHING  --------------------------
----------------------------------------------------------------------
-- DROP TABLE
DROP TABLE GSTATUS;
DROP TABLE GROUP_BOARD_REPLY;
DROP TABLE GROUP_BOARD;
DROP TABLE SCD_ACHIVE;
DROP TABLE SCD_COMMENT;
DROP TABLE SCHEDULE;
DROP TABLE GCOMMENT; 
DROP TABLE MYGROUP;
DROP TABLE NBOARD;
DROP TABLE QBOARD;
DROP TABLE FCOMMENT;
DROP TABLE FBOARD;
DROP TABLE MEMBER CASCADE CONSTRAINTS;

-- DROP SEQ
DROP SEQUENCE GSTATUS_SEQ;
DROP SEQUENCE GROUP_BOARD_REP_SEQ;
DROP SEQUENCE GROUP_BOARD_SEQ;
DROP SEQUENCE MYGROUP_SEQ;
DROP SEQUENCE SCHEDULE_SEQ;
DROP SEQUENCE SCH_CMT_SEQ;
DROP SEQUENCE GCOMMENT_SEQ;
DROP SEQUENCE NBOARD_SEQ;
DROP SEQUENCE QBOARD_SEQ;
DROP SEQUENCE FCOMMENT_SEQ;
DROP SEQUENCE FBOARD_SEQ;
----------------------------------------------------------------------
-----------------------------  MEMBER  -------------------------------
----------------------------------------------------------------------
-- TABLE
CREATE TABLE MEMBER(
    MID       VARCHAR2(100) PRIMARY KEY,
    MNICKNAME VARCHAR2(100) NOT NULL,
    MPW       VARCHAR2(100) NOT NULL,
    MNAME     VARCHAR2(100) NOT NULL,
    MMAIL     VARCHAR2(100) NOT NULL,
    MDATE     DATE          DEFAULT SYSDATE,
    MSCORE    NUMBER(5)     DEFAULT 0,
    MEVALNUM  NUMBER(4)     DEFAULT 0,
    MANAGER   VARCHAR2(1)   DEFAULT 'N',
    MSTATE    VARCHAR2(1)   DEFAULT 'Y',
    MIMAGE    VARCHAR2(100),
    MROLE     VARCHAR2(100)
);
----------------------------------------------------------------------
----------------------------  FREEBOARD  -----------------------------
----------------------------------------------------------------------
-- TABLE
CREATE TABLE FBOARD(
    FID      NUMBER(5)      PRIMARY KEY,
    MID      VARCHAR2(100)  REFERENCES MEMBER(MID) NOT NULL,
    FTITLE   VARCHAR2(300)  NOT NULL,
    FCONTENT VARCHAR2(4000) NOT NULL,
    FFILE    VARCHAR2(100),
    FRDATE   DATE           DEFAULT SYSDATE,
    FGROUP   NUMBER(5)      NOT NULL,
    FSTEP    NUMBER(2)      NOT NULL,
    FINDENT  NUMBER(2)      NOT NULL,
    FIP      VARCHAR2(100)  NOT NULL,
    FHIT     NUMBER(7)      DEFAULT 0,
    FLIKE    NUMBER(5)      DEFAULT 0
);
-- SEQUENCE
CREATE SEQUENCE FBOARD_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
----------------------------------------------------------------------
-------------------  FBOARD_COMMENT(FCOMMENT)  -----------------------
----------------------------------------------------------------------
-- TABLE
CREATE TABLE FCOMMENT(
    FCID      NUMBER(5)      PRIMARY KEY,
    MID       VARCHAR2(100)  REFERENCES MEMBER(MID) NOT NULL,
    FCCONTENT VARCHAR2(1000) NOT NULL,
    FCIP      VARCHAR2(100)  NOT NULL,
    FCRDATE   DATE           DEFAULT SYSDATE,
    FID      NUMBER(5)       REFERENCES FBOARD(FID) NOT NULL,
    FCGROUP   NUMBER(5)      NOT NULL,
    FCSTEP    NUMBER(2)      NOT NULL,
    FCINDENT  NUMBER(2)      NOT NULL
);
-- SEQUENCE
CREATE SEQUENCE FCOMMENT_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
----------------------------------------------------------------------
----------------------------  QNABOARD  -----------------------------
----------------------------------------------------------------------
-- TABLE
CREATE TABLE QBOARD(
    QID      NUMBER(5)      PRIMARY KEY,
    MID      VARCHAR2(100)  REFERENCES MEMBER(MID) NOT NULL,
    QTITLE   VARCHAR2(300)  NOT NULL,
    QCONTENT VARCHAR2(4000) NOT NULL,
    QFILE    VARCHAR2(100),
    QRDATE   DATE           DEFAULT SYSDATE,
    QGROUP   NUMBER(5)      NOT NULL,
    QSTEP    NUMBER(2)      NOT NULL,
    QINDENT  NUMBER(2)      NOT NULL
);
-- SEQUENCE
CREATE SEQUENCE QBOARD_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
----------------------------------------------------------------------
----------------------------  NBOARD  --------------------------------
----------------------------------------------------------------------
-- TABLE
CREATE TABLE NBOARD(
    NID      NUMBER(5)      PRIMARY KEY,
    MID      VARCHAR2(100)  REFERENCES MEMBER(MID) NOT NULL,
    NTITLE   VARCHAR2(300)  NOT NULL,
    NCONTENT VARCHAR2(4000) NOT NULL,
    NFILE    VARCHAR2(100),
    NRDATE   DATE           DEFAULT SYSDATE
);
-- SEQUENCE
CREATE SEQUENCE NBOARD_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
----------------------------------------------------------------------
-----------------------------  GROUP  --------------------------------
----------------------------------------------------------------------
-- TABLE
CREATE TABLE MYGROUP(
    GID        NUMBER(5)      PRIMARY KEY,
    GCHARACTER VARCHAR2(1)    NOT NULL,
    MID        VARCHAR2(100)  REFERENCES MEMBER(MID) NOT NULL,
    GTITLE     VARCHAR2(300)  NOT NULL,
    GCONTENT   VARCHAR2(4000) NOT NULL,
    GPEOPLE    NUMBER(2)      DEFAULT 1,
    GCURPEOPLE NUMBER(2)      DEFAULT 1,
    GLANGUAGE1 VARCHAR2(100),
    GLANGUAGE2 VARCHAR2(100),
    GLANGUAGE3 VARCHAR2(100),
    GDEV       VARCHAR2(1) DEFAULT 'N',
    GDESIGN    VARCHAR2(1) DEFAULT 'N',
    GPM        VARCHAR2(1) DEFAULT 'N',
    GRDATE     DATE           DEFAULT SYSDATE,
    GSDATE     DATE           NOT NULL,
    GFDATE     DATE           NOT NULL,
    GHIT       NUMBER(5)      DEFAULT 0,
    GLOC       VARCHAR2(100),
    GCOMPLETE  VARCHAR2(1)    DEFAULT 'N'
);
-- SEQUENCE
CREATE SEQUENCE MYGROUP_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
----------------------------------------------------------------------
-------------------------  GROUP COMMENT  ----------------------------
----------------------------------------------------------------------
CREATE TABLE GCOMMENT(
    GCID      NUMBER(5)      PRIMARY KEY,
    MID       VARCHAR2(100)  REFERENCES MEMBER(MID) NOT NULL,
    GCCONTENT VARCHAR2(1000) NOT NULL,
    GCIP      VARCHAR2(100)  NOT NULL,
    GCRDATE   DATE           DEFAULT SYSDATE,
    GID       NUMBER(5)      REFERENCES MYGROUP(GID) NOT NULL
);
-- SEQUENCE
CREATE SEQUENCE GCOMMENT_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;

----------------------------------------------------------------------
---------------------------  SCHEDULE  -------------------------------
----------------------------------------------------------------------
CREATE TABLE SCHEDULE (
    SCD_ID NUMBER(5) PRIMARY KEY,
    GID NUMBER(5),
    MID VARCHAR2(100) NOT NULL, 
    SCD_TITLE VARCHAR2(200) NOT NULL,
    SCD_MEMO VARCHAR2(500),
    SCD_START DATE NOT NULL,
    SCD_END DATE,
    FOREIGN KEY (GID) REFERENCES MYGROUP (GID),
    FOREIGN KEY (MID) REFERENCES MEMBER (MID)
);
-- SEQUENCE
CREATE SEQUENCE SCHEDULE_SEQ INCREMENT BY 1 START WITH 11111 MINVALUE 11111 MAXVALUE 99999 NOCYCLE CACHE 50000 ORDER;

----------------------------------------------------------------------
------------------------  SCHEDULE_COMMENT  --------------------------
----------------------------------------------------------------------
CREATE TABLE SCD_COMMENT (
    SCD_CMT_ID NUMBER(5) PRIMARY KEY,
    SCD_ID NUMBER(5) REFERENCES SCHEDULE(SCD_ID) NOT NULL,
    MID VARCHAR2(100) REFERENCES MEMBER(MID) NOT NULL,
    SCD_CMT_IMPORTANT VARCHAR2(1) DEFAULT 'N' NOT NULL,
    SCD_CMT_CONTENT VARCHAR2(200) NOT NULL,
    SCD_CMT_MEMO VARCHAR2(500),
    SCD_CMT_START DATE NOT NULL,
    SCD_CMT_END DATE
);
-- SEQUENCE
CREATE SEQUENCE SCH_CMT_SEQ INCREMENT BY 1 START WITH 11111 MINVALUE 11111 MAXVALUE 99999 NOCYCLE CACHE 50000 ORDER;

----------------------------------------------------------------------
------------------------  SCHEDULE_ACHIVE  ---------------------------
----------------------------------------------------------------------
CREATE TABLE SCD_ACHIVE (
    SCD_ID NUMBER(5) REFERENCES SCHEDULE(SCD_ID) NOT NULL,
    MID VARCHAR2(100) REFERENCES MEMBER(MID) NOT NULL,
    SCD_ACHIVE VARCHAR2(1) DEFAULT 'N' NOT NULL
);

----------------------------------------------------------------------
--------------------------  GROUP_BOARD  -----------------------------
----------------------------------------------------------------------
CREATE TABLE GROUP_BOARD (
    GROUP_BID NUMBER(5) PRIMARY KEY,
    GID NUMBER(5) NOT NULL,
    MID VARCHAR2(100) NOT NULL,
    GROUP_BOARD_TITLE VARCHAR2(500) NOT NULL,
    GROUP_BOARD_CONTENT CLOB NOT NULL,
    GROUP_BOARD_FILE VARCHAR2(1000),
    GROUP_BOARD_HIT NUMBER(5) DEFAULT 0,
    GROUP_BOARD_IP VARCHAR2(100) NOT NULL,
    GROUP_BOARD_LIKE NUMBER(5) DEFAULT 0,
    GROUP_BOARD_RDATE DATE DEFAULT SYSDATE,
    FOREIGN KEY (GID) REFERENCES MYGROUP (GID),
    FOREIGN KEY (MID) REFERENCES MEMBER (MID)
);

-- SEQUENCE
CREATE SEQUENCE GROUP_BOARD_SEQ INCREMENT BY 1 START WITH 11111 MINVALUE 11111 MAXVALUE 99999 NOCYCLE CACHE 50000 ORDER;
----------------------------------------------------------------------
-----------------------  GROUP_BOARD_REPLY  --------------------------
----------------------------------------------------------------------
CREATE TABLE GROUP_BOARD_REPLY (
    GROUP_REPID NUMBER(5) PRIMARY KEY,
    GROUP_BID NUMBER(5) NOT NULL,
    MID VARCHAR2(100) NOT NULL,
    GROUP_BOARD_REP_CONTENT VARCHAR2(1000) NOT NULL,
    GROUP_BOARD_REP_LIKE NUMBER(5) DEFAULT 0,
    GROUP_BOARD_REP_RDATE DATE DEFAULT SYSDATE,
    FOREIGN KEY (GROUP_BID) REFERENCES GROUP_BOARD (GROUP_BID),
    FOREIGN KEY (MID) REFERENCES MEMBER (MID)
);

-- SEQUENCE
CREATE SEQUENCE GROUP_BOARD_REP_SEQ INCREMENT BY 1 START WITH 11111 MINVALUE 11111 MAXVALUE 99999 NOCYCLE CACHE 50000 ORDER;
----------------------------------------------------------------------
--------------------------  GROUP STATUS  ----------------------------
----------------------------------------------------------------------
-- TABLE (0: 프로젝트 종료로 인한 참가 실패 / 1: 대기 / 2: 진행중 / 3: 완료 / 4: 중간탈주)
CREATE TABLE GSTATUS(
    GSID     NUMBER(5)     PRIMARY KEY,
    MID      VARCHAR2(100) REFERENCES MEMBER(MID) NOT NULL,
    GID      NUMBER(5)     REFERENCES MYGROUP(GID) NOT NULL,
    GSSTATUS NUMBER(1)     DEFAULT 0 NOT NULL 
);
-- SEQUENCE
CREATE SEQUENCE GSTATUS_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;