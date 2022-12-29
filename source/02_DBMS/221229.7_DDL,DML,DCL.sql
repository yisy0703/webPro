--[ VII ] DDL, DCL, DML
--SQL = DDL(테이블 생성, 테이블삭제, 테이블구조변경, 테이블 모든 데이터 제거) + 
--      DML(SELECT, INSERT, UPDATE, DELETE) + 
--      DCL(사용자계정 생성, 사용자에게권한부여, 권한박탈, 사용자계정삭제, 트랜젝션 명령어)

-- ★ ★ ★ DDL ★ ★ ★
-- 1. 테이블 생성(CREATE TABLE 테이블명...) : 테이블 구조를 정의하기
CREATE TABLE BOOK (
    BOOKID NUMBER(4), -- BOOKID 필드의 타입은 숫자 4자리
    BOOKNAME VARCHAR2(20), -- BOOKNAME필드의 타입은 문자 20BYTE
    PUBLISHER VARCHAR2(20), -- PUBLISHER 필드의 타입은 문자 20BYTE
    RDATE     DATE,         -- RDATE 필드의 타입은 DATE형
    PRICE     NUMBER(8, 2),  -- PRICE필드의 타입은 숫자 전체 8자리, 소수점 2, 소수점앞 6. 소수점은 자리수 포함되지 않음
    PRIMARY KEY(BOOKID) -- 제약조건 : BOOKID필드가 주키(PRIMARY KEY : NOT NULL, UNIQUE)
);
SELECT * FROM BOOK;
DESC BOOK;

DROP TABLE BOOK; -- 테이블 삭제
CREATE TABLE BOOK(
    BID       NUMBER(4) PRIMARY KEY,
    BNAME     VARCHAR2(20),
    PUBLISHER VARCHAR2(20),
    RDATE     DATE,
    PRICE     NUMBER(8));
SELECT * FROM BOOK;
DESC BOOK;

    -- ex. EMP와 유사한 EMP01 테이블 : EMPNO(숫자4), ENAME(문자10), SAL(숫자7,2)
CREATE TABLE EMP01(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    SAL   NUMBER(7,2)
);
SELECT * FROM EMP01;
    -- ex. DEPT01 테이블 : DEPTNO(숫자2:PK), DNAME(문자14), LOC(문자13)
CREATE TABLE DEPT01 ( 
    DEPTNO NUMBER(2) PRIMARY KEY,
    DNAME  VARCHAR2(14),
    LOC    VARCHAR2(13)
);
SELECT * FROM DEPT01;
-- 서브쿼리를 이용한 테이블 생성
CREATE TABLE EMP02
    AS
    SELECT * FROM EMP; -- 서브쿼리 결과로 EMP02 테이블 생성 후 데이터도 들어감(제약조건 미포함)
SELECT * FROM EMP02;
DESC EMP02;
    -- EMP03 : EMP 테이블에서 EMPNO, ENAME, DEPTNO만 추출한 데이터
CREATE TABLE EMP03 AS SELECT EMPNO, ENAME, DEPTNO FROM EMP;
SELECT * FROM EMP03;
    -- EMP04 : EMP테이블에서 10번 부서만 추출한 데이터
CREATE TABLE EMP04 AS SELECT * FROM EMP WHERE DEPTNO=10;
SELECT * FROM EMP04;
    -- EMP05 : EMP테이블 구조만 추출(데이터를 추출하지 않음)
CREATE TABLE EMP05 AS SELECT * FROM EMP WHERE 0=1;
SELECT * FROM EMP05;

DESC EMP;
SELECT * FROM EMP;
SELECT ROWNUM, EMPNO, ENAME, JOB FROM EMP; -- 테이블에서 행의 논리적 순서(읽어들인 순서)

-- 2. 테이블 구조 변경 (ALTER TABLE 테이블명 ADD || MODIFY || DROP ~)
-- (1) 필드 추가(ADD)
SELECT * FROM EMP03; -- EMPNO(수4), ENAME(문10), DEPTNO(수2)
ALTER TABLE EMP03 ADD (JOB VARCHAR2(20), SAL NUMBER(7,2) );
SELECT * FROM EMP03; -- 필드 추가시 데이터 NULL로
ALTER TABLE EMP03 ADD (COMM NUMBER(7,2));
--(2) 필드 수정(MODIFY)
SELECT * FROM EMP03; -- EMPNO(수4), ENAME(문10), DEPTNO(수2), JOB, SAL, COMM은 NULL
ALTER TABLE EMP03 MODIFY (EMPNO VARCHAR2(5)); -- 숫자데이터가 들어있어서 숫자로만 변경.
ALTER TABLE EMP03 MODIFY (EMPNO NUMBER(5)); 
ALTER TABLE EMP03 MODIFY (EMPNO NUMBER(4)); -- 숫자 데이터는 줄이는게 안 됨
ALTER TABLE EMP03 MODIFY (SAL VARCHAR2(10)); -- NULL 필드는 마음대로 수정 가능
ALTER TABLE EMP03 MODIFY (ENAME VARCHAR2(20)); -- 문자데이터 늘리거나 줄이거나 가능
DESC EMP03;
SELECT * FROM EMP03;
SELECT MAX(LENGTH(ENAME)) FROM EMP03;
ALTER TABLE EMP03 MODIFY (ENAME VARCHAR2(6)); -- 가능
ALTER TABLE EMP03 MODIFY (ENAME VARCHAR2(5)); -- 불가능
-- (3)필드 삭제(DROP)
ALTER TABLE EMP03 DROP COLUMN JOB; -- NULL인 필드 삭제(NULL이 아닌 필드는 데이터까지 삭제)
SELECT * FROM EMP03;
ALTER TABLE EMP03 DROP COLUMN DEPTNO;
-- 논리적으로 특정 필드를 접근 못하도록(낮)
ALTER TABLE EMP03 SET UNUSED (COMM);
SELECT * FROM EMP03;
--논리적으로 접근 불가했던 필드 물리적으로 삭제(새벽)
ALTER TABLE EMP03 DROP UNUSED COLUMNS;

-- 3. 테이블 삭제(DROP TABLE 테이블명)
DROP TABLE EMP01;
SELECT * FROM EMP01;
DROP TABLE DEPT; -- EMP테이블에서 DEPT테이블을 참조하는 경우 EMP테이블을 삭제한 후 DEPT 테이블 삭제

-- 4. 테이블의 모든 행을 제거(TRUNCATE TABLE 테이블명)
SELECT * FROM EMP03;
TRUNCATE TABLE EMP03; -- ROLLBACK 안 됨
SELECT * FROM EMP03;

-- 5. 테이블명 변경(RENAME 테이블명 TO 바꿀테이블명)
SELECT * FROM EMP02;
RENAME EMP02 TO EMP2;
SELECT * FROM EMP2;

-- 6. 데이터 딕셔너리(접근불가) VS. 데이터딕셔너리 뷰(접근용)
-- 종류
    --(1) USER_XXX : 현 계정이 소유하고 있는 객체(테이블, 제약조건, 뷰, 인덱스)
       -- USER_TABLES, USER_CONSTRAINTS, USER_INDEXES, USER_VIEWS
SELECT * FROM USER_TABLES;
SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM USER_INDEXES;
SELECT * FROM USER_VIEWS;
    --(2) ALL_XXX : 현 계정에서 접근 가능한 객체(테이블, 제약조건, 뷰, 인덱스)
       -- ALL_TABLES, ALL_CONSTRAINTS, ALL_INDEXES, ALL_VIEWS
SELECT * FROM ALL_TABLES;
SELECT * FROM ALL_VIEWS;
    --(3) DBA_XXX ; DBA권한에서만 접근가능. DBMS의 모든 객체
       -- DBA_TABLES, DBA_CONSTRAINTS, DBA_INDEXES, DBA_VIEWS
SELECT * FROM DBA_TABLES;
        
-- ★ ★ ★ DML ★ ★ ★
-- 1. INSERT INTO 테이블명 VALUES (값1, 값2, ...);
   -- INSERT INTO 테이블명 (필드명1, 필드명2,..) VALUES (값1, 값2, ..);
SELECT * FROM DEPT01;
ROLLBACK;
INSERT INTO DEPT01 VALUES (50, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT01 VALUES (60, 'SALES', NULL); -- 명시적으로 NULL추가
INSERT INTO DEPT01 (DEPTNO, DNAME, LOC) VALUES (70, 'RESEARCH', '서대문');
INSERT INTO DEPT01 (LOC, DEPTNO, DNAME) VALUES ('마포', 80, 'IT');
INSERT INTO DEPT01 (DEPTNO, DNAME) VALUES (90, 'OPERATION'); -- 묵시적으로 NULL 추가
SELECT * FROM DEPT01;
-- 서브쿼리를 이용한 INSERT
    -- ex. dept테이블에서 10~30번 부서를 dept01테이블로 
INSERT INTO DEPT01 SELECT * FROM DEPT WHERE DEPTNO<40;
SELECT * FROM DEPT01;
-- EX. BOOK (BID는 11, BNAME은 '스포츠의학', 출판사는 '한솔출판', 출판일은 오늘, 가격은 90000)
DESC BOOK;
INSERT INTO BOOK VALUES (11, '스포츠의학', '한솔출판', SYSDATE, 90000);

-- 트랜젝션 명령어 (DML명령어에서만 적용)
    -- 트랜젝션은 데이터 처리의 한 단위. DML 명령어들이 실행됨과 동시에 트랜잭션이 진행.
COMMIT; -- 현 트랜젝션의 작업을 DB에 반영
INSERT INTO BOOK VALUES (12, '스포츠의학', '한솔출판', SYSDATE, 90000);
SELECT * FROM BOOK;
ROLLBACK;-- 현 트랜젝션의 작업을 취소

-- ※ 연습문제 (1페이지) ※
DROP TABLE SAM01;
CREATE TABLE SAM01(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB   VARCHAR2(9),
    SAL   NUMBER(7,2)
);
SELECT * FROM SAM01;
INSERT INTO SAM01 (EMPNO, ENAME, JOB, SAL) 
    VALUES (1000,'APPLE','POLICE',10000);
INSERT INTO SAM01 VALUES (1010,'BANANA','NURSE',15000);
INSERT INTO SAM01 VALUES (1020,'ORANGE','DOCTOR',25000);
INSERT INTO SAM01 (EMPNO, ENAME, SAL) VALUES (1030,'VERY',25000);
INSERT INTO SAM01 VALUES (1040,'CAT',NULL, 2000);
INSERT INTO SAM01 
    SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE DEPTNO=10;
SELECT * FROM SAM01;
COMMIT;







