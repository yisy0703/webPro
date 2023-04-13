-- TABLE & SEQUENCE DROP
DROP TABLE MVC_BOARD;
DROP SEQUENCE MVC_BOARD_SEQ;
-- TABLE & SEQUENCE CREATE
CREATE TABLE MVC_BOARD(
  bID   NUMBER(6),
  bNAME VARCHAR2(50) NOT NULL,
  bTITLE VARCHAR2(100) NOT NULL,
  bCONTENT VARCHAR2(1000),
  bDATE    DATE DEFAULT SYSDATE NOT NULL, -- 작성일
  bHIT     NUMBER(6) DEFAULT 0 NOT NULL,  -- 조회수
  bGROUP   NUMBER(6) NOT NULL, -- 원글이면 BID와 같고, 답변글의 경우 원글의 BGROUP과 같다
  bSTEP    NUMBER(3) NOT NULL, -- 같은 그룹내 출력 순서
  bINDENT  NUMBER(3) NOT NULL, -- 들여쓰기 정도
  bIP      VARCHAR2(20),
  PRIMARY KEY(BID)
);
CREATE SEQUENCE MVC_BOARD_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;
-- DUMMY DATA
SELECT * FROM MVC_BOARD;
INSERT INTO MVC_BOARD (BID, BNAME, BTITLE, BCONTENT, BGROUP, BSTEP, BINDENT, BIP)
 VALUES (MVC_BOARD_SEQ.NEXTVAL, '홍','제목', NULL, MVC_BOARD_SEQ.CURRVAL, 0,0,'192.1.1.1');
INSERT INTO MVC_BOARD (BID, BNAME, BTITLE, BCONTENT, BGROUP, BSTEP, BINDENT, BIP)
 VALUES (MVC_BOARD_SEQ.NEXTVAL, '김','비와', NULL, MVC_BOARD_SEQ.CURRVAL, 0,0,'192.1.1.2');
SELECT * FROM MVC_BOARD;
  -- 2번글의 답글
INSERT INTO MVC_BOARD (BID, BNAME, BTITLE, BCONTENT, BGROUP, BSTEP, BINDENT, BIP)
 VALUES (MVC_BOARD_SEQ.NEXTVAL, '이','답','답', 2, 1, 1, '127.0.0.1');
 
-- mapper에 들어갈 query 

-- 1. 글목록(startRow ~ endRow까지) id=boardList
SELECT * FROM MVC_BOARD ORDER BY BGROUP DESC, BSTEP;
SELECT * 
  FROM (SELECT ROWNUM RN, A.* 
        FROM (SELECT * FROM MVC_BOARD ORDER BY BGROUP DESC, BSTEP) A)
  WHERE RN BETWEEN 2 AND 3;

-- 2. 전체 글 갯수 id=boardTotCnt
SELECT COUNT(*) FROM MVC_BOARD;

-- 3. 원글 쓰기 id=boardWrite
INSERT INTO MVC_BOARD (BID, BNAME, BTITLE, BCONTENT, BGROUP, BSTEP, BINDENT, BIP)
 VALUES (MVC_BOARD_SEQ.NEXTVAL, '홍','TITLE', NULL, MVC_BOARD_SEQ.CURRVAL, 0,0,'192.1.1.1');

-- 4. bID로 조회수 1 올리기 id=boardHitUp
UPDATE MVC_BOARD SET bHIT = bHIT + 1 WHERE bID=1;
SELECT * FROM MVC_BOARD;

-- 5. bID로 DTO가져오기 (글상세보기, 글수정VIEW, 답변글VIEW) id=getBoardDto
SELECT * FROM MVC_BOARD WHERE bID=1;

-- 6. 글 수정 id=boardUpdate
UPDATE MVC_BOARD 
  SET BNAME = '홍수정',
      BTITLE = '제목바꿈',
      BCONTENT = '본문바꿈',
      BIP = '163.1.1.1'
  WHERE BID=1;

-- 7. 글 삭제 id=boardDelete
DELETE FROM MVC_BOARD WHERE bID=1;
SELECT * FROM MVC_BOARD;

-- 8. 답변글 저장전 작업(STEP ⓐ : 예시에서는 2번글의 답변) id=boardReplyPreStep 
UPDATE MVC_BOARD SET BSTEP = BSTEP + 1
  WHERE BGROUP = 2 AND BSTEP > 0;

-- 9. 답변글 쓰기 (예시는 2번의 답변) id=boardReply
SELECT * FROM MVC_BOARD WHERE bID=2;
INSERT INTO MVC_BOARD (BID, BNAME, BTITLE, BCONTENT, BGROUP, BSTEP, BINDENT, BIP)
  VALUES (MVC_BOARD_SEQ.NEXTVAL, '진','T', NULL, 2, 1, 1, '126.1.1.1');
COMMIT;
SELECT * FROM MVC_BOARD ORDER BY BGROUP DESC, BSTEP;

-- myBatis를 사용할 때 insert 65이상을 인위적으로 넣기 위한 setting(참조:https://jun7222.tistory.com/310)
-- cmd 창을 관리자권한으로 열고
-- sqlplus /nolog
-- SQL>conn /as sysdba;
-- SQL>alter system set processes=200 scope=spfile;
                          --값은 적당하게
-- SQL>shutdown immediate;
-- SQL>startup;
-- allocation, limit 값이 늘어난 걸 확인
select * from v$resource_limit where resource_name='processes';