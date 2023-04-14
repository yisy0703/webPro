-- ★ ★ ★ ★ ★ book.xml ★ ★ ★ ★ ★ 
-- id = mainList (신간도서순 bookList)
SELECT * FROM BOOK ORDER BY BRDATE DESC;
-- id = bookList (startRow~endRow까지 bookList) 출력순서:bTITLE 기준
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM BOOK ORDER BY BTITLE) A)
  WHERE RN BETWEEN 2 AND 4;
-- id = totCntBook (등록된 책 갯수)
SELECT COUNT(*) FROM BOOK;
-- id = getDetailBook (책번호로 dto가져오기)
SELECT * FROM BOOK WHERE BNUM=1;
-- id = registerBook (책등록)
INSERT INTO BOOK (bNUM, bTITLE, bWRITER, bRDATE, bIMG1, bIMG2, bINFO)
  VALUES (BOOK_SQ.NEXTVAL, 'PYTHON','김파이',SYSDATE, 'noImg.png','noImg.png','파이썬');
INSERT INTO BOOK (bNUM, bTITLE, bWRITER, bRDATE, bIMG1, bINFO)
    VALUES (BOOK_SQ.NEXTVAL, 'JPA','박제이',SYSDATE, 'noImg.png','JPA 개념서');
INSERT INTO BOOK (bNUM, bTITLE, bWRITER, bRDATE, bIMG2, bINFO)
    VALUES (BOOK_SQ.NEXTVAL, 'MYBATIS','마이바',SYSDATE, 'noImg.png','마이바티스 개념서');
INSERT INTO BOOK (bNUM, bTITLE, bWRITER, bRDATE, bINFO)
    VALUES (BOOK_SQ.NEXTVAL, '사장학개론','김승호',SYSDATE, '『돈의 속성』의 저자 김승호 회장의 신간이다.');
-- id = modifyBook (책수정)
UPDATE BOOK SET
    BTITLE = 'MYHOBBY',
    BWRITER = '최마이',
    BRDATE = '23/01/01',
    BIMG1 = 'noImg.png',
    BIMG2 = 'noImg.png',
    BINFO = '마이바티스가 아니고 마이하비'
  WHERE BNUM=6;
SELECT * FROM BOOK ORDER BY BRDATE;

-- ★ ★ ★ ★ ★ member.xml ★ ★ ★ ★ ★ 
-- id = idConfirm (mid가 id인 데이터 갯수) : public int idConfirm(String mid);
SELECT COUNT(*) FROM MEMBER WHERE MID='aaa';
--	id = joinMember(회원가입)
INSERT INTO MEMBER VALUES ('bbb','1','김길석','kim@naver.com','04312','안양');
--	id = getDetailMember(mid로 Member dto가져오기)
SELECT * FROM MEMBER WHERE MID = 'bbb';
--	id = modifyMember(회원정보 수정);
UPDATE MEMBER SET MPW='1',
                MNAME='김길순',
                MMAIL = 'shin@gmail.com',
                MADDR='서울시 용산구',
                MPOST = '01234'
    WHERE MID='bbb';