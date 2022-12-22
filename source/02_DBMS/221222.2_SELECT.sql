-- [ II ] SELECT 문 - 조회
-- 1. SELECT 문장 작성법
    -- 현재 계정(실행 : CTRL+ENTER)
SHOW USER;
SELECT * FROM TAB; -- 현 계정이 가지고 있는 테이블 정보
SELECT * FROM EMP; -- EMP테이블의 모든 열(필드), 모든 행
SELECT * FROM DEPT; -- DEPT 테이블의 모든 열(필드), 모든 행
SELECT * FROM SALGRADE;

-- 2. 특정 열만 출력
DESC EMP; -- EMP테이블의 구조
SELECT EMPNO, ENAME, SAL, JOB FROM EMP; -- EMPNO, ENAME, SAL, JOB필드 모든 행 검색
SELECT EMPNO, ENAME, SAL, JOB, MGR, SAL, COMM FROM EMP;
SELECT EMPNO AS "사 번", ENAME AS "이름", SAL AS "급여", JOB AS "직책" FROM EMP;
SELECT EMPNO "사 번", ENAME "이름", SAL "급여", JOB  "직책" FROM EMP;
SELECT EMPNO "사 번", ENAME 이름, SAL 급여, JOB  직책 FROM EMP;
SELECT EMPNO NO, ENAME NAME, SAL SALARY, JOB FROM EMP; -- 필드에 별칭을 두는 경우

-- 3. 특정 행 출력 : WHERE 절(조건절) -- 비교연산자 : 같다(=), 다르다(!=, ^=, <>), >, >=, <, <=
SELECT EMPNO "사번", ENAME "이름", SAL "급여" FROM EMP WHERE SAL = 3000; -- 같다
SELECT EMPNO NO, ENAME NAME, SAL FROM EMP WHERE SAL != 3000; -- 다르다
SELECT EMPNO NO, ENAME NAME, SAL FROM EMP WHERE SAL ^= 3000; -- 다르다
SELECT EMPNO NO, ENAME NAME, SAL FROM EMP WHERE SAL <> 3000; -- 다르다
    -- 비교 연산자는 숫자, 문자, 날짜형 모두 가능
    -- ex1. 사원이름(ENAME)이 'A','B','C'로 시작하는 사원의 모든 필드
    -- A < AA < AAA < AAAA < AAAAA < AAAAAA < AAAAAAA < AA..A < A...AB ..
SELECT * FROM EMP WHERE ENAME < 'D';
    -- ex2. 81년도 이전에 입사한 사원의 모든 필드
SELECT * FROM EMP WHERE HIREDATE < '81/01/01';
    -- ex3. 부서번호(DEPTNO)가 10번 사원의 모든 필드
SELECT * FROM EMP WHERE DEPTNO=10;
    -- ex4. 이름(ENAME)이 FORD인 직원의 EMPNO, ENAME, MGR(상사의 사번)을 출력
    -- SQL문 대소문자 구별없음. 데이터 대소문자 구별
select empno, ename, mgr from emp where ename='FORD';
    
-- 4. 조건절에 논리연산자 : AND OR NOT
    -- ex1. 급여(SAL)가 2000이상 3000이하인 직원의 모든 필드
SELECT * FROM EMP WHERE SAL>=2000 AND SAL<=3000;
    -- ex2. 82년도에 입사한 사원의 모든 필드
SELECT * FROM EMP WHERE HIREDATE>='82/01/01' AND HIREDATE<='82/12/31';
-- 날짜 표기법 셋팅 (현재 : YY/MM/DD 또는 RR/MM/DD)
ALTER SESSION SET NLS_DATE_FORMAT = 'MM-DD-YYYY';
SELECT * FROM EMP WHERE HIREDATE>='01-01-1982' AND HIREDATE<='12-31-1982';
SELECT * FROM EMP 
    WHERE TO_CHAR(HIREDATE, 'RR/MM/DD')>='82/01/01' 
        AND TO_CHAR(HIREDATE, 'RR/MM/DD')<='82/12/31';
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
    -- ex3. 연봉이 2400이상인 직원 ENAME, SAL, 연봉(SAL*12)을 출력
SELECT ENAME, SAL, SAL*12 ANNUALSAL 
    FROM EMP                     -- (1)
    WHERE ANNUALSAL >= 2400;     -- (2) WHERE절에는 필드 별칭 사용 불가
SELECT ENAME, SAL, SAL*12 ANNUALSAL -- (3)번째
    FROM EMP                      -- (1)번째
    WHERE SAL*12 > 2400;          -- (2)번째
    -- ex4. 연봉이 10,000 이상인 직원의 ENAME, SAL, 연봉(연봉순으로)
SELECT ENAME, SAL, SAL*12 "연봉" -- (3)
    FROM EMP           -- (1)
    WHERE SAL*12>2400  -- (2)
    ORDER BY 연봉;      -- (4)
    -- ex5. 10번 부서(DEPTNO)이거나 JOB이 MANAGER인 직원의 모든 필드
SELECT * FROM EMP WHERE DEPTNO=10 OR JOB='MANAGER';
    -- ex6. 부서번호가 10번 부서가 아닌 직원의 모든 필드
SELECT * FROM EMP WHERE DEPTNO != 10;
SELECT * FROM EMP WHERE NOT DEPTNO = 10;











