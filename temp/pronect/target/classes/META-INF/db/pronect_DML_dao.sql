----------------------------------------------------------------------
-----------------------------  MEMBER_DAO  ---------------------------
----------------------------------------------------------------------
-- (1) 회원id 중복체크
SELECT COUNT(*) FROM MEMBER WHERE MID='hong';
-- (2) 회원 닉네임 중복체크
SELECT COUNT(*) FROM MEMBER WHERE MNICKNAME='홍씨성을가진서자';
-- (3) 회원가입
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MIMAGE, MROLE)
            VALUES('hong', '홍씨성을가진서자', '1', '홍길동', 'hong@chosun.com', null, '백엔드 개발자');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MIMAGE, MROLE)
            VALUES('kim', '킴정은', '1', '킴첨지', 'yse297@gmail.com', null, '백엔드 개발자');
-- (4) 로그인
SELECT * FROM MEMBER WHERE MID='hong' AND MPW='1';
-- (5) mid로 dto가져오기(로그인 성공시 session에 넣기 위함)
SELECT * FROM MEMBER WHERE MID='hong';
-- (6) 회원정보 수정
UPDATE MEMBER
    SET MNICKNAME='홍씨성을가진서자',
        MPW='1',
        MNAME='홍길동',
        MMAIL='hong@chosun.com',
        MIMAGE='hong.jpg',
        MROLE='백엔드 개발자'
    WHERE MID='hong';
-- (7) 회원정보 수정(관리자 모드)
UPDATE MEMBER
    SET MANAGER='Y',
        MSTATE='Y'
    WHERE MID='hong';
-- (8) 회원 리스트(top-n)
    -- 검색어 없을 때
SELECT * FROM (SELECT ROWNUM RN, A.* 
    FROM (SELECT * FROM MEMBER ORDER BY MDATE DESC) A)
    WHERE RN BETWEEN 1 AND 10;
    -- 검색어 mid
SELECT * FROM (SELECT ROWNUM RN, A.* 
    FROM (SELECT * FROM MEMBER WHERE MID LIKE '%'||'te'||'%' ORDER BY MDATE DESC) A)
    WHERE RN BETWEEN 1 AND 10;
    -- 검색어 MANAGER
SELECT * FROM (SELECT ROWNUM RN, A.* 
    FROM (SELECT * FROM MEMBER WHERE MANAGER=UPPER('y') ORDER BY MDATE DESC) A)
    WHERE RN BETWEEN 1 AND 10;
-- (9) 전체 등록된 회원수
    -- 검색어 없을 때
SELECT COUNT(*) FROM MEMBER;
    -- 검색어 mid
SELECT COUNT(*) FROM MEMBER WHERE MID LIKE '%'||'te'||'%';
    -- 검색어 MANAGER
SELECT COUNT(*) FROM MEMBER WHERE MANAGER='Y';
-- (10) 회원탈퇴처리
UPDATE MEMBER
    SET MSTATE='N' WHERE MID='kim';
COMMIT;
-- (11) 이름과 이메일로 아이디 찾기
SELECT * FROM MEMBER WHERE MNAME='킴첨지' AND MMAIL='yse297@gmail.com';
-- (12) 이름과 이메일과 아이디로 비밀번호 찾기
SELECT * FROM MEMBER WHERE MNAME='킴첨지' AND MMAIL='yse297@gmail.com' AND MID='kim';
----------------------------------------------------------------------
----------------------------  FREEBOARD  -----------------------------
----------------------------------------------------------------------
-- (1) 글 목록 출력
    -- 1 schItem이 null이거나 ''일 때
SELECT * FROM (SELECT ROWNUM RN, A.*, (SELECT COUNT(*) FROM FCOMMENT WHERE FID=A.FID) commentCnt
        FROM (SELECT * FROM FBOARD ORDER BY FGROUP DESC, FSTEP) A)
    WHERE RN BETWEEN 1 AND 30;
    -- 2 schItem이 'all'일 때
SELECT * FROM (SELECT ROWNUM RN, A.*, (SELECT COUNT(*) FROM FCOMMENT WHERE FID=A.FID) commentCnt
        FROM (SELECT * FROM FBOARD 
        WHERE FTITLE LIKE '%'||'찌'||'%' OR FCONTENT LIKE '%'||'찌'||'%' OR MID LIKE '%'||'찌'||'%'
        ORDER BY FGROUP DESC, FSTEP) A)
    WHERE RN BETWEEN 1 AND 10;
    -- 3 schItem이 'mid'일 때
SELECT * FROM (SELECT ROWNUM RN, A.*, (SELECT COUNT(*) FROM FCOMMENT WHERE FID=A.FID) commentCnt
        FROM (SELECT * FROM FBOARD 
        WHERE MID LIKE '%'||'abc'||'%'
        ORDER BY FGROUP DESC, FSTEP) A)
    WHERE RN BETWEEN 1 AND 10;
    -- 4 schItem이 'ftitle'일 때
SELECT * FROM (SELECT ROWNUM RN, A.*, (SELECT COUNT(*) FROM FCOMMENT WHERE FID=A.FID) commentCnt
        FROM (SELECT * FROM FBOARD 
        WHERE FTITLE LIKE '%'||'찌'||'%'
        ORDER BY FGROUP DESC, FSTEP) A)
    WHERE RN BETWEEN 1 AND 10;
    -- 5 schItem이 'fcontent'일 때
SELECT * FROM (SELECT ROWNUM RN, A.*, (SELECT COUNT(*) FROM FCOMMENT WHERE FID=A.FID) commentCnt
        FROM (SELECT * FROM FBOARD 
        WHERE FCONTENT LIKE '%'||'곧'||'%'
        ORDER BY FGROUP DESC, FSTEP) A)
    WHERE RN BETWEEN 1 AND 10;
    -- 6 schItem이 'ftitle+fcontent'일 때
SELECT *FROM (SELECT ROWNUM RN, A.*, (SELECT COUNT(*) FROM FCOMMENT WHERE FID=A.FID) commentCnt
        FROM (SELECT * FROM FBOARD 
        WHERE FTITLE LIKE '%'||'찌'||'%' OR FCONTENT LIKE '%'||'찌'||'%'
        ORDER BY FGROUP DESC, FSTEP) A)
    WHERE RN BETWEEN 1 AND 10;
-- (2) 검색시 글 갯수
    -- 1 schItem이 null이거나 ''일 때
SELECT COUNT(*) FROM FBOARD;
    -- 2 schItem이 'all'일 때
SELECT COUNT(*) FROM FBOARD WHERE FTITLE LIKE '%'||'찌'||'%' OR FCONTENT LIKE '%'||'찌'||'%' OR MID LIKE '%'||'찌'||'%';
    -- 3 schItem이 'mid'일 때
SELECT COUNT(*) FROM FBOARD WHERE MID LIKE '%'||'te'||'%';
    -- 4 schItem이 'ftitle'일 때
SELECT COUNT(*) FROM FBOARD WHERE FTITLE LIKE '%'||'찌'||'%';
    -- 5 schItem이 'fcontent'일 때
SELECT COUNT(*) FROM FBOARD WHERE FCONTENT LIKE '%'||'미안'||'%';
    -- 6 schItem이 'ftitle+fcontent'일 때
SELECT COUNT(*) FROM FBOARD WHERE FTITLE LIKE '%'||'곧'||'%' OR FCONTENT LIKE '%'||'곧'||'%';

-- (3) 글쓰기(원글쓰기)
INSERT INTO FBOARD (FID, MID, FTITLE, FCONTENT, FFILE,
                    FGROUP, FSTEP, FINDENT, FIP)
            VALUES (FBOARD_SEQ.NEXTVAL, 'kim', '평양냉면 드실라우?','맛있읍네다', NULL,
                    FBOARD_SEQ.CURRVAL,0,0,'192.0.0.2');
-- (4) hit 1회 올리기
UPDATE FBOARD SET FHIT = FHIT + 1 WHERE FID=1;
-- (5) 글번호(fid)로 글전체 내용(boardDto) 가져오기
SELECT * FROM FBOARD WHERE FID=13;
-- (6) 글 수정하기(fid, ftitle, fcontent, ffilename, frdate(SYSDATE), fip 수정)
UPDATE FBOARD 
    SET FTITLE = '제목 바꿈',
        FCONTENT = '본문 바꿈',
        FFILE = null
    WHERE FID = 52;
-- (7) 글 삭제하기
COMMIT;
    -- 댓글 선삭제
    DELETE FROM FCOMMENT WHERE FID=1;
DELETE FROM FBOARD WHERE FID=1;
ROLLBACK;
-- 3번글에 답변 쓰기
-- (8) 답변글 쓰기 전 단계(원글의 fgroup과 같고, 원글의 fstep보다 크면 fstep을 하나 증가하기)
UPDATE FBOARD SET FSTEP = FSTEP + 1 WHERE FGROUP=3 AND FSTEP>0;
-- (9) 답변글 쓰기
INSERT INTO FBOARD (FID, MID, FTITLE, FCONTENT,
                    FGROUP, FSTEP, FINDENT, FIP)
        VALUES (FBOARD_SEQ.NEXTVAL, 'hong', '답변이 진짜 가능한', '완전 자유로운 자유게시판', 
                3, 1, 1, '111.1.1.1');
COMMIT;
----------------------------------------------------------------------
-------------------  FREEBOARD_COMMENT(FCOMMENT)  --------------------
----------------------------------------------------------------------
-- (1)댓글 쓰기(fcommentWrite)
INSERT INTO FCOMMENT (FCID, MID, FCCONTENT, FCIP, FID, FCGROUP, FCSTEP, FCINDENT)
            VALUES (FCOMMENT_SEQ.NEXTVAL,'king99','버거킹 드세요 먹을거 없어요 근처에','197.0.0.1',1, FCOMMENT_SEQ.CURRVAL, 0, 0);
-- 상세보기에서 댓글리스트(id = fcommentList)
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM FCOMMENT WHERE FID=1 ORDER BY FCGROUP, FCSTEP) A)
    WHERE RN BETWEEN 1 AND 10;
-- 댓글 갯수(id = fcommentTotCnt)
SELECT COUNT(*) FROM FCOMMENT WHERE FID=1;
-- 대댓글 쓰기 전 (id = fcommentReplyPreStep)
UPDATE FCOMMENT SET FCSTEP=FCSTEP+1 WHERE FCGROUP=2 AND FCSTEP>0;
-- 대댓글 쓰기 (id = fcommentReply)
INSERT INTO FCOMMENT (FCID, MID, FCCONTENT, FCIP, FID, FCGROUP, FCSTEP, FCINDENT)
    VALUES (FCOMMENT_SEQ.NEXTVAL,'king99','버거킹 드세요 먹을거 없어요 근처에','197.0.0.1',1, 2, 2, 2);
-- 댓글 수정( id = fcommentModify)
UPDATE FCOMMENT SET FCCONTENT = '댓글내용 바꿨당' WHERE FCID=5;
COMMIT;
-- 댓글 삭제 (id = fcommentDelete)
DELETE FROM FCOMMENT WHERE FCID=5;
SELECT * FROM FCOMMENT WHERE FID=1 ORDER BY FCGROUP, FCSTEP;
ROLLBACK;
-- 댓글번호로 댓글 dto 가져오기(id = fcommentContent)
SELECT * FROM FCOMMENT WHERE FCID=1;