-- ♣ 테이블 및 시퀀스 삭제
DROP TABLE PERSON;
DROP TABLE JOB;
DROP SEQUENCE PERSON_PNO_SQ;

-- ♣ 테이블 및 시퀀스 생성
CREATE TABLE JOB(
    JNO NUMBER(2) PRIMARY KEY,
    JNAME VARCHAR2(30)
);
CREATE TABLE PERSON(
    PNO NUMBER(5) PRIMARY KEY,
    PNAME VARCHAR2(30) NOT NULL,
    JNO NUMBER(2) REFERENCES JOB(JNO) NOT NULL,
    KOR NUMBER(3) CHECK(KOR>=0),
    ENG NUMBER(3) CHECK(ENG>=0),
    MAT NUMBER(3) CHECK(MAT>=0)
);
CREATE SEQUENCE PERSON_PNO_SQ MAXVALUE 99999 NOCACHE NOCYCLE;

-- ♣ 더미데이터 insert (정우성 ~ 송혜교)
INSERT INTO JOB VALUES (10,'배우');
INSERT INTO JOB VALUES (20,'가수');
INSERT INTO JOB VALUES (30,'엠씨');
SELECT * FROM JOB;
INSERT INTO PERSON VALUES (PERSON_PNO_SQ.NEXTVAL, '정우성', 10, 90, 80, 81);
INSERT INTO PERSON VALUES (PERSON_PNO_SQ.NEXTVAL, '박세영', 10, 80, 90, 80);
INSERT INTO PERSON VALUES (PERSON_PNO_SQ.NEXTVAL, '배수지', 20, 20, 90, 90);
INSERT INTO PERSON VALUES (PERSON_PNO_SQ.NEXTVAL, '설현',   20, 95, 95, 95);
INSERT INTO PERSON VALUES (PERSON_PNO_SQ.NEXTVAL, '송혜교', 10,100,100,100);
SELECT * FROM PERSON;
COMMIT;

-- ♣ 기능별 query 작성 (1, 2, 3)
-- 1번 : PNAME, JNAME, KOR, ENG, MAT을 입력받아 INSERT
INSERT INTO PERSON 
    VALUES (PERSON_NO_SQ.NEXTVAL, '홍길동', (SELECT JNO FROM JOB WHERE JNAME='가수'), 
            81,83,85);
ROLLBACK;
-- 2번 : 직업명을 입력받아 등수,이름(pNO),직업명,국어(kor),영어(eng),수학(mat),총점을 출력(총점기준으로 내림차순 정렬)


-- 3번 : 모든 행의 등수, 이름(pNO),직업명,국어(kor),영어(eng),수학(mat),총점을 출력(총점기준으로 내림차순 정렬)

            
-- 1번과 2번 기능에서 현재 가능한 직업명 list
SELECT JNAME FROM JOB;








