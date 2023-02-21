-- BOARD TABLE DROP & CREATE
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








-- 