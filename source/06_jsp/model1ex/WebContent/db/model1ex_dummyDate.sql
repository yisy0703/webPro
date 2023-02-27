-- 회원(CUSTOMER) 테이블 - 6개(aaa,bbb,ccc,ddd,eee,fff)
INSERT INTO CUSTOMER (CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CGENDER, CBIRTH) 
  VALUES ('aaa','1','홍길동','010-9999-9123', 'aaa@naver.com', '서대문','m','1991-01-01');
INSERT INTO CUSTOMER (CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CGENDER, CBIRTH) 
  VALUES ('bbb','1','김길동','010-9999-9999', 'bbb@naver.com', '마포','m','1992-01-01');
INSERT INTO CUSTOMER (CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CGENDER, CBIRTH) 
  VALUES ('ccc','1','박길동','010-9999-8888', null, '인천','m','1993-01-01');
INSERT INTO CUSTOMER (CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CGENDER, CBIRTH) 
  VALUES ('ddd','1','지길동','010-9999-7777', 'ddd@naver.com', '일산','m','1994-01-01');
INSERT INTO CUSTOMER (CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CGENDER, CBIRTH) 
  VALUES ('eee','1','신길동','010-9999-6666', null, null, null, null);
INSERT INTO CUSTOMER (CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CGENDER, CBIRTH) 
    VALUES ('fff','1','유길동', null, null, null, null, null);
SELECT * FROM CUSTOMER ORDER BY cRDATE DESC;

-- 파일첨부게시판(FILEBOARD) 테이블 - 3개(글1, 글2, 글2-1) - 하나는 첨부파일 1.docx이 있는 걸로
SELECT * FROM FILEBOARD ORDER BY fREF DESC, fRE_STEP;

INSERT INTO FILEBOARD (FNUM, CID, FSUBJECT, FCONTENT, FFILENAME, FPW, 
                      FREF, FRE_STEP, FRE_LEVEL, FIP)
  VALUES (FILEBOARD_SEQ.NEXTVAL, 'aaa','글1','본문', '1.docx', '1', 
          FILEBOARD_SEQ.CURRVAL, 0, 0, '192.0.0.1'); -- 원글 글1(첨부파일 있음)
          
INSERT INTO FILEBOARD (FNUM, CID, FSUBJECT, FCONTENT, FFILENAME, FPW, 
                      FREF, FRE_STEP, FRE_LEVEL, FIP)
  VALUES (FILEBOARD_SEQ.NEXTVAL, 'aaa','글2','본문', NULL, '1', 
          FILEBOARD_SEQ.CURRVAL, 0, 0, '192.0.0.1'); -- 원글 글2(첨부파일 없음)
          
INSERT INTO FILEBOARD (FNUM, CID, FSUBJECT, FCONTENT, FFILENAME, FPW, 
                      FREF, FRE_STEP, FRE_LEVEL, FIP)
  VALUES (FILEBOARD_SEQ.NEXTVAL, 'bbb','글2-답1','본문', NULL, '1', 
          2, 1, 1, '192.0.0.1'); -- 답변글 글2-1(첨부파일 없음)

-- 도서(BOOK)테이블 dummy data  - 15개
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '내일의 부',16000,'100.jpg','noImg.png','좋아',10);
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '3층 서기실의 암호',20000,'101.jpg','noImg.png','태영호 증언',10);
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '당신이 글을 쓰면 좋겠습니다',14000,'102.jpg','noImg.png','좋아',5);
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '울트라러닝',16000,'103.jpg','noImg.png','좋아',5);
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '내가 왔다',11500,'104.jpg','noImg.png','좋아',10);
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '나의 서툰 위로가 너에게 닿기를',13000,'105.jpg','noImg.png','좋아',30);
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '아직 멀었다는 말',13500,'106.jpg','noImg.png','좋아',10);
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '소금 지방 산열',33000,'107.jpg','noImg.png','좋아',10);
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '디레버리징',20000,'108.jpg','noImg.png','좋아',10);
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '너와 나의 암호말',18000,'109.jpg','noImg.png','좋아',5);
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '오늘도 펭수, 내일도 펭수',17000,'110.jpg','noImg.png','좋아',10);
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '지적대화를 위한 넓고 얕은 지식2',1600,'111.jpg','noImg.png','좋아',30);
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '트렌드코리아 2020',2000,'112.jpg','noImg.png','2020 트렌드 키워드 ',15);
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '여행의 이유',1800,'113.jpg','noImg.png','김영하의 여행 경험',10);
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '작은 아씨들',2000,'114.jpg','noImg.png','좋다 ',10);

COMMIT;
SELECT * FROM CUSTOMER ORDER BY cRDATE DESC;
SELECT * FROM FILEBOARD ORDER BY fREF DESC, fRE_STEP;
SELECT * FROM BOOK ORDER BY bRDATE DESC;