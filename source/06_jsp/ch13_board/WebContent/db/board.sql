-- BOARD TABLE DROP & CREATE
DROP TABLE BOARD;
CREATE TABLE BOARD(
  NUM     NUMBER(5,0) PRIMARY KEY, -- 글번호
  WRITER  VARCHAR2(30) NOT NULL,   -- 글작성자
  SUBJECT VARCHAR2(100) NOT NULL,  -- 글제목
  CONTENT VARCHAR2(4000) NOT NULL, -- 본문
  EMAIL   VARCHAR2(30),            -- 작성자 이메일
  READCOUNT NUMBER(5) DEFAULT 0,   -- 글 HIT수 (조회수)
  PW      VARCHAR2(30) NOT NULL,   -- 글 삭제시 쓸 비밀번호
  REF     NUMBER(5,0) NOT NULL,    -- 글그룹(원글의 경우 글번호로/답변글일경우 원글의 REF로)
  RE_STEP NUMBER(3) NOT NULL,      -- 글그룹내 출력 순서(원글 0)
  RE_INDENT NUMBER(3) NOT NULL,    -- 글 LIST 출력시 글 제목 들여쓰기 정도(원글0)
  IP      VARCHAR2(30) NOT NULL,   -- 글 작성시 컴퓨터 IP 주소
  RDATE   DATE DEFAULT SYSDATE     -- 글쓴 시점(날짜+시간)
);
-- 1. 글갯수

-- 2. 글목록(글그룹이 최신인 글이 위로)

-- 3. 글쓰기(원글쓰기) - 글쓴이, 글제목, 글본문, 이메일, PW

-- 4. 글번호로 글상세보기 내용(DTO) 가져오기

-- 5. 조회수 올리기

-- 6. 글삭제(비밀번호를 맞게 입력한 경우만 삭제)










