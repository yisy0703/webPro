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
INSERT INTO BOOK 
  VALUES (BOOK_SQ.NEXTVAL, 'SPRING','김작가',SYSDATE, 'noImg.png','noImg.png','스프링개념서');
INSERT INTO BOOK (bNUM, bTITLE, bWRITER, bRDATE, bIMG1, bINFO)
    VALUES (BOOK_SQ.NEXTVAL, 'JSP','박제이',SYSDATE, 'noImg.png','jsp 개념서');
INSERT INTO BOOK (bNUM, bTITLE, bWRITER, bRDATE, bIMG2, bINFO)
    VALUES (BOOK_SQ.NEXTVAL, 'ORACLE','홍작가',SYSDATE, 'noImg.png','스프링개념서2');
INSERT INTO BOOK (bNUM, bTITLE, bWRITER, bRDATE, bINFO)
    VALUES (BOOK_SQ.NEXTVAL, 'JAVA','이자바',SYSDATE, '스프링개념서3')
-- id = modifyBook (책수정)

-- ★ ★ ★ ★ ★ member.xml ★ ★ ★ ★ ★ 
-- id = idConfirm (mid가 id인 데이터 갯수) : public int idConfirm(String mid);
SELECT COUNT(*) FROM MEMBER WHERE MID='aaa';
--	id = joinMember(회원가입)

--	id = getDetailMember(mid로 Member dto가져오기)

--	id = modifyMember(회원정보 수정);








