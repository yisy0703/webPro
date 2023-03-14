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
-- (5) 회원정보 수정
UPDATE MVC_MEMBER 
  SET MPW='1',
      MNAME='송중기',
      MEMAIL='SONG@S.COM',
      MPHOTO = 'NOIMG.JPG',
      MBIRTH = '1995-12-12',
      MADDRESS = '서대문'
  WHERE MID='song';
-- (6) 회원 리스트(top-n)
SELECT * FROM MVC_MEMBER ORDER BY MRDATE DESC; -- 신입회원순
SELECT *
  FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM MVC_MEMBER ORDER BY MRDATE DESC) A)
  WHERE RN BETWEEN 4 AND 6;
-- (7) 전체 등록된 회원수
SELECT COUNT(*) CNT FROM MVC_MEMBER;
-- (8) 회원탈퇴
DELETE FROM MVC_MEMBER WHERE MID='eee';
COMMIT;





