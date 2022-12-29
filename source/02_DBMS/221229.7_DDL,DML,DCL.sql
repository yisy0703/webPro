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
    PRICE     NUMBER(8, 2)  -- PRICE필드의 타입은 숫자 전체 8자리, 소수점 2, 소수점앞 6. 소수점은 자리수 포함되지 않음
);












