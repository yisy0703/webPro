-- dao에 들어갈 query
-- (1) 회원id 중복체크
SELECT * FROM MVC_MEMBER WHERE MID='aaa';
-- (2) 회원가입
INSERT INTO MVC_MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('aaa','1','홍길동','hong@naver.com','NOIMG.JPG','1998/12/12','서대문');
COMMIT;
-- (3) 로그인
SELECT * FROM MVC_MEMBER WHERE mID='aaa' and mPW='1';
-- (4) mid로 dto가져오기(로그인 성공시 session에 넣기 위함)
SELECT * FROM MVC_MEMBER WHERE MID='aaa';








