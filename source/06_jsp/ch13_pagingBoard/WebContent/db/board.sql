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
  RDATE   DATE DEFAULT SYSDATE NOT NULL    -- 글쓴 시점(날짜+시간)
);
-- 1. 글갯수
SELECT COUNT(*) FROM BOARD;

-- 2. 글목록(글그룹이 최신인 글이 위로)
SELECT * FROM BOARD ORDER BY REF DESC;

-- 3. 글쓰기(원글쓰기) - 글쓴이, 글제목, 글본문, 이메일, PW
  -- 글번호를 생성
  SELECT NVL(MAX(NUM),0)+1 FROM BOARD;
INSERT INTO BOARD (NUM, WRITER, SUBJECT, CONTENT, EMAIL, 
                    PW, REF, RE_STEP, RE_INDENT, IP)
  VALUES ((SELECT NVL(MAX(NUM),0)+1 FROM BOARD), '홍길동', '제목1', '본문\n방가', null,
                    '111', (SELECT NVL(MAX(NUM),0)+1 FROM BOARD), 0, 0, '192.168.0.1' );
INSERT INTO BOARD (NUM, WRITER, SUBJECT, CONTENT, EMAIL, 
                    PW, REF, RE_STEP, RE_INDENT, IP)
  VALUES ((SELECT NVL(MAX(NUM),0)+1 FROM BOARD), '지길동', '제목2', '본문\n방가', null,
                    '111', (SELECT NVL(MAX(NUM),0)+1 FROM BOARD), 0, 0, '192.168.0.1');

-- 4. 글번호로 글상세보기 내용(DTO) 가져오기
SELECT * FROM BOARD WHERE NUM=2;

-- 5. 조회수 올리기
UPDATE BOARD SET READCOUNT = READCOUNT + 1 WHERE NUM=2;

-- 6. 글 수정
UPDATE BOARD SET SUBJECT = '수정된제목1',
                CONTENT = '수정된 본문\n방가',
                EMAIL = 'hong@hong.com',
                PW ='111',
                IP='127.0.0.1'
            WHERE NUM=1;

-- 7. 글삭제(비밀번호를 맞게 입력한 경우만 삭제)
COMMIT;
DELETE FROM BOARD WHERE NUM=1 AND PW='111';
ROLLBACK;
-- 데이터 조작
DELETE FROM BOARD;
COMMIT;

INSERT INTO BOARD (NUM, WRITER, SUBJECT, CONTENT, EMAIL, 
                    PW, REF, RE_STEP, RE_INDENT, IP)
  VALUES ((SELECT NVL(MAX(NUM),0)+1 FROM BOARD), '홍길동', '제목1', '본문\n방가', null,
                    '111', (SELECT NVL(MAX(NUM),0)+1 FROM BOARD), 0, 0, '192.168.0.1' );
INSERT INTO BOARD (NUM, WRITER, SUBJECT, CONTENT, EMAIL, 
                    PW, REF, RE_STEP, RE_INDENT, IP)
  VALUES ((SELECT NVL(MAX(NUM),0)+1 FROM BOARD), '지길동', '제목2', '본문\n방가', null,
                    '111', (SELECT NVL(MAX(NUM),0)+1 FROM BOARD), 0, 0, '192.168.0.1' );
UPDATE BOARD SET READCOUNT = 11 WHERE NUM=1;
SELECT * FROM BOARD ORDER BY REF DESC;
COMMIT;










