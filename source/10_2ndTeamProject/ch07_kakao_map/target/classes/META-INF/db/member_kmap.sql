DROP TABLE MEMBER CASCADE CONSTRAINTS;
CREATE TABLE MEMBER(
    ID VARCHAR2(30) PRIMARY KEY,
    PW VARCHAR2(30) NOT NULL,
    NAME VARCHAR2(30) NOT NULL,
    EMAIL VARCHAR2(30),
    BIRTH DATE NOT NULL,
    RDATE DATE NOT NULL,
    ADDRESS VARCHAR2(200));
-- 1. 회원가입시 id 중복체크를 위한 SQL
SELECT * FROM MEMBER WHERE ID='aaa';
-- 2. 회원가입 SQL
INSERT INTO MEMBER (ID, PW, NAME, EMAIL, BIRTH, RDATE, ADDRESS) 
    VALUES ('aaa','1','홍길동',null, '1990-01-01',SYSDATE, '서울시 서대문구 신촌로 141');

INSERT INTO MEMBER (ID, PW, NAME, EMAIL, BIRTH, RDATE, ADDRESS) 
    VALUES ('bbb','22','윤봉길',null, '1908-06-21',SYSDATE, '충남 예산군 덕산면 덕산온천로 391');
INSERT INTO MEMBER (ID, PW, NAME, EMAIL, BIRTH, RDATE, ADDRESS) 
    VALUES ('ccc','3','이봉창',null, '1900-08-10',SYSDATE, '서울 용산구 백범로 281-9');
INSERT INTO MEMBER (ID, PW, NAME, EMAIL, BIRTH, RDATE, ADDRESS) 
    VALUES ('ddd','456','유관순',null, '1902-12-16',SYSDATE, '충남 천안시 동남구 병천면 탑원리 산31-2');
INSERT INTO MEMBER (ID, PW, NAME, EMAIL, BIRTH, RDATE, ADDRESS) 
    VALUES ('eee','5','박차정',null, '1910-05-07',SYSDATE, '부산시 동래구 칠산동 319-1');
COMMIT;
-- 3. 로그인할 때 (ID/PW)
SELECT * FROM MEMBER WHERE ID='aaa';
-- 4. ID로 DTO 가져오기
SELECT * FROM MEMBER WHERE ID='aaa';
-- 5. 회원정보 수정
UPDATE MEMBER SET PW='111',
                NAME='김길동',
                EMAIL='a@a.com',
                BIRTH='1990-01-01',
                ADDRESS='제주특별자치도 제주시 첨단로 242'
        WHERE ID='aaa';
COMMIT;
SELECT * FROM member;