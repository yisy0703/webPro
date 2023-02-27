-- ★★ CustomerDao(아이디중복체크, 회원가입, 로그인, 상세보기, 정보수정, top-N 리스트, 회원수)
-- 1. 회원가입시 CID 중복체크
SELECT * FROM CUSTOMER WHERE CID='aaa';

-- 2. 회원가입
INSERT INTO CUSTOMER (CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CGENDER, CBIRTH)
    VALUES ('ggg','1','홍길숙','010-1234-1234','h@h.com', '서초','f','1995-12-12');

-- 3. 로그인(CID/CPW)
SELECT * FROM CUSTOMER WHERE CID='ggg' AND CPW='1';

-- 4. 상세보기 (CID로 DTO 가져오기, 로그인 성공시 session에 추가할 값)
SELECT * FROM CUSTOMER WHERE CID='ggg';

-- 5. 회원정보 수정
UPDATE CUSTOMER SET CPW = '1',
                    CNAME = '홍길순',
                    CTEL = '010-1111-1111',
                    CEMAIL = 'h@h.co.kr',
                    CADDRESS = '부산',
                    CGENDER = 'f',
                    CBIRTH = '1995-01-01'
            WHERE CID = 'ggg';

-- 6. 회원 리스트 보기(첫화면 main.jsp에서 사용할 부분 - cid, cpw, cname, cemail, caddress)
SELECT * FROM CUSTOMER ORDER BY CID; -- 전체 (cid순으로 정렬)
SELECT *
    FROM (SELECT ROWNUM RN, CID, CPW, CNAME, CEMAIL, CADDRESS
                FROM (SELECT * FROM CUSTOMER ORDER BY CID))
    WHERE RN BETWEEN 4 AND 6;

-- 7. 등록된 회원수
SELECT COUNT(*) TOTCNT FROM CUSTOMER;


-- ★★FileboardDao(top-N 리스트, 글갯수, 글쓰기(원글1, 답변글2개query), hit올리기, 상세보기, 글수정, 글삭제)
-- 1. 글목록(top-N 리스트 : startRow부터 endRow까지)
    SELECT F.*, CNAME, CEMAIL
        FROM FILEBOARD F, CUSTOMER C  
        WHERE F.CID = C.CID
        ORDER BY FREF DESC, FRE_STEP; -- 전체 출력
SELECT *
    FROM (SELECT ROWNUM RN, A.* 
            FROM (SELECT F.*, CNAME, CEMAIL
                        FROM FILEBOARD F, CUSTOMER C  
                        WHERE F.CID = C.CID
                        ORDER BY FREF DESC, FRE_STEP) A )
    WHERE RN BETWEEN 3 AND 4; -- 완성된 top-N
    
-- 2. 등록된 글 수
SELECT COUNT(*) FROM FILEBOARD;

-- 3. 원글쓰기
INSERT INTO FILEBOARD (fNUM, CID, fSUBJECT, fCONTENT, fFILENAME, fPW, fREF, fRE_STEP, fRE_LEVEL, fIP)
    VALUES (FILEBOARD_SEQ.NEXTVAL, 'ccc', '글3','본문3',null,'1', 
            FILEBOARD_SEQ.CURRVAL, 0,0,'198.12.1.1');
SELECT * FROM FILEBOARD WHERE FNUM=4; -- 방금 쓴 원글 4번글

-- 4. 답변글 쓰기전 step A -- 4번글에 대한 답변글 쓰기 전작업
UPDATE FILEBOARD SET fRE_STEP = fRE_STEP + 1 WHERE fREF=4 AND fRE_STEP>0;

-- 5. 답변글 쓰기 -- 4번글의 답변
INSERT INTO FILEBOARD (fNUM, CID, fSUBJECT, fCONTENT, fFILENAME, fPW, fREF, fRE_STEP, fRE_LEVEL, fIP)
    VALUES (FILEBOARD_SEQ.NEXTVAL, 'bbb', '글3-답1', null,null, '1', 4, 1, 1, '192.1.1.1');
    
SELECT * FROM FILEBOARD WHERE fREF = 4 ORDER BY FRE_STEP; -- 4번 그룹 확인

-- 6. 글 상세보기(fnum으로 dto가져오기)
SELECT F.*, CNAME, CEMAIL FROM FILEBOARD F, CUSTOMER C WHERE F.CID=C.CID AND fNUM=4;

-- 7. 조회수 올리기
UPDATE FILEBOARD SET fHIT = fHIT+1 WHERE fNUM=4;

-- 8. 글 수정하기
UPDATE FILEBOARD SET fSUBJECT = '수정된 제목',
                    fCONTENT = '수정된 본문',
                    fFILENAME = NULL,
                    fPW = '1',
                    fIP = '192.168.10.30'
                WHERE fNUM=4;
                
-- 9. 글 삭제하기
COMMIT;
DELETE FROM FILEBOARD WHERE fNUM=1 AND fPW='1';
ROLLBACK;

-- ★★ BookDao(top-N 리스트, 책갯수, 책등록, 상세보기)
-- 1. 책목록(top-N구문)
SELECT * FROM BOOK ORDER BY BRDATE DESC;-- 신간 도서 순으로 전체 리스트 출력
SELECT * 
    FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM BOOK ORDER BY BRDATE DESC) A)
    WHERE RN BETWEEN 2 AND 3; -- 완성된 top-N

-- 2. 등록된 책 갯수
SELECT COUNT(*) CNT FROM BOOK;

-- 3. 책등록
INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '이것은 자바다', 30000, 'noImg.png','NOTHING.JPG','책설명',20);
    
-- 4. 책 상세보기(bID로 dto가져오기)
SELECT * FROM BOOK WHERE BID=1;

COMMIT;