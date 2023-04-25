DROP TABLE CBOARD CASCADE CONSTRAINTS;
DROP SEQUENCE CBOARD_SQ;
CREATE SEQUENCE CBOARD_SQ MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE TABLE CBOARD(
    bID NUMBER(6),
    bNAME VARCHAR2(50) NOT NULL,
    bTITLE VARCHAR2(100) NOT NULL,
    bCONTENT VARCHAR2(1000),
    bDATE DATE DEFAULT SYSDATE NOT NULL,
    bHIT NUMBER(6) DEFAULT 0 NOT NULL,
    bGROUP NUMBER(6) NOT NULL,
    bSTEP NUMBER(3) NOT NULL,
    bINDENT NUMBER(3) NOT NULL,
    bIP VARCHAR2(20) NOT NULL,
    PRIMARY KEY(bID)
);
INSERT INTO CBOARD (bID, bNAME, bTITLE, bCONTENT, bGROUP, bSTEP, bINDENT, bIP)
    VALUES (CBOARD_SQ.NEXTVAL, '홍길동','제목1','본문1',
    CBOARD_SQ.CURRVAL, 0, 0, '127.0.0.1');
    
-- mapper에 들어갈 query 

-- id=boardList : 글목록 (startRow ~ endRow까지)
SELECT * FROM CBOARD ORDER BY BGROUP DESC, BSTEP;
SELECT * FROM (SELECT ROWNUM RN, A.*, (SELECT COUNT(*) FROM BCOMMENT WHERE BID=A.BID) commentCnt
            FROM (SELECT * FROM CBOARD ORDER BY BGROUP DESC, BSTEP) A)
        WHERE RN BETWEEN 1 AND 20;

-- id=boardTotCnt : 전체 글 갯수
SELECT COUNT(*) FROM CBOARD;

-- id=boardWrite : 원글쓰기
INSERT INTO CBOARD (bID, bNAME, bTITLE, bCONTENT, bGROUP, bSTEP, bINDENT, bIP)
    VALUES (CBOARD_SQ.NEXTVAL, '신길동','제목2','본문2',CBOARD_SQ.CURRVAL, 0, 0, '127.0.0.1');

-- id=boardHitUp : bID글 조회수 1회 올리기
UPDATE CBOARD SET bHIT = bHIT+1 WHERE bID=2;

-- id=getBoardDto : bID로 DTO가져오기(상세글 보기)
SELECT * FROM CBOARD WHERE BID=2;

-- id=boardReplyPreStep : 답변글 쓰기전 step A
UPDATE CBOARD SET BSTEP=BSTEP+1 WHERE BGROUP=2 AND BSTEP>0;

-- id=boardReply : 답변글 쓰기(2번글의 답변)
INSERT INTO CBOARD (bID, bNAME, bTITLE, bCONTENT, bGROUP, bSTEP, bINDENT, bIP)
    VALUES (CBOARD_SQ.NEXTVAL, '답변자','글2첫답','본문2답변',2,1,1,'127.0.0.1');

-- id=boardUpdate : 글 수정하기
UPDATE CBOARD SET BNAME='김김김',
                    BTITLE = '바뀐제목',
                    BCONTENT = '바뀐내용',
                    BIP = '192.168.20.44'
        WHERE BID=2;
        
-- id=boardDelete : 글삭제하기
-- DELETE FROM CBOARD WHERE BID=1;
COMMIT;
SELECT to_char(bdate,'yyyy/mm/dd hh12:mi:ss') FROM CBOARD ORDER BY BGROUP DESC, BSTEP;

-- 댓글
DROP TABLE BCOMMENT;
CREATE TABLE BCOMMENT(
    CNUM NUMBER(5) PRIMARY KEY,
    bID NUMBER(6) REFERENCES cBOARD(bID),
    CNAME VARCHAR2(100) NOT NULL,
    CMEMO VARCHAR2(4000) NOT NULL,
    CDATE DATE DEFAULT SYSDATE,
    CGROUP NUMBER(5),
    CSTEP NUMBER(2),
    CINDENT NUMBER(2),
    CIP VARCHAR2(100) 
);
DROP SEQUENCE COMMENT_SQ;
CREATE SEQUENCE COMMENT_SQ NOCACHE NOCYCLE;
-- 댓글 쓰기 (id = commentWrite)
INSERT INTO BCOMMENT (CNUM, BID, CNAME, CMEMO, CGROUP, CSTEP, CINDENT, CIP)
    VALUES (COMMENT_SQ.NEXTVAL, 3, '개똥이','좋아요',COMMENT_SQ.CURRVAL, 0,0, '127.0.0.');
INSERT INTO BCOMMENT (CNUM, BID, CNAME, CMEMO, CGROUP, CSTEP, CINDENT, CIP)
    VALUES (COMMENT_SQ.NEXTVAL, 3, '소똥이','두번째로 좋아요',COMMENT_SQ.CURRVAL, 0,0, '127.0.0.');
INSERT INTO BCOMMENT (CNUM, BID, CNAME, CMEMO, CGROUP, CSTEP, CINDENT, CIP)
    VALUES (COMMENT_SQ.NEXTVAL, 3, '말똥이','세번째로 좋아요',COMMENT_SQ.CURRVAL, 0,0, '127.0.0.');
-- 상세보기에서 댓글리스트(id = commentList)
SELECT * FROM BCOMMENT WHERE BID=3 ORDER BY CGROUP DESC, CSTEP;
SELECT * 
    FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM BCOMMENT WHERE BID=3 ORDER BY CGROUP DESC, CSTEP) A)
    WHERE RN BETWEEN 2 AND 4;
-- 댓글 갯수(id = commentTotCnt)
SELECT COUNT(*) FROM BCOMMENT where bid=3;
-- 답변 댓글 쓰기 전 (id = commentReplyPreStep)
UPDATE BCOMMENT SET CSTEP=CSTEP+1 WHERE CGROUP=2 AND CSTEP>0;
-- 답변 댓글 쓰기 (id = commentReply)
INSERT INTO BCOMMENT (CNUM, BID, CNAME, CMEMO, CGROUP, CSTEP, CINDENT, CIP)
    VALUES (COMMENT_SQ.NEXTVAL, 3, '답쟁이','뭐가 좋아요',2, 1,1, '127.0.0.');
UPDATE BCOMMENT SET CSTEP=CSTEP+1 WHERE CGROUP=2 AND CSTEP>0;
INSERT INTO BCOMMENT (CNUM, BID, CNAME, CMEMO, CGROUP, CSTEP, CINDENT, CIP)
    VALUES (COMMENT_SQ.NEXTVAL, 3, '답쟁이','대답하세요',2, 1,1, '127.0.0.');
-- 댓글 수정( id = commentModify)
UPDATE BCOMMENT SET
    CNAME = '홍길동',
    CMEMO = '그렇죠',
    CDATE = SYSDATE,
    CIP = '127.0.0.1'
    WHERE CNUM=1;
COMMIT;
-- 댓글 삭제 (id = commentDelete)
DELETE FROM BCOMMENT WHERE CNUM=1;
SELECT * FROM BCOMMENT WHERE BID=3 ORDER BY CGROUP DESC, CSTEP;
ROLLBACK;
SELECT COMMENT_SQ.CURRVAL FROM BCOMMENT;
-- 댓글번호로 댓글 dto 가져오기(id = commentDetail)
SELECT * FROM BCOMMENT WHERE CNUM=1;