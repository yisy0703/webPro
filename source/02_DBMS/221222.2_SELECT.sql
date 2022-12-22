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

-- 5. 산술연산자
SELECT EMPNO, ENAME, SAL, SAL*1.1 UPGRADESAL FROM EMP;
    -- ex. 모든 사원의 이름(ename), 월급(sal), 상여(comm), 연봉(sal*12+comm)을 출력
SELECT ENAME, SAL, COMM, SAL*12+COMM 연봉 FROM EMP;
    -- 산술연산의 결과는 NULL을 포함하면 결과는 NULL
    -- NVL(NULL일 수도 있는 필드명, 대치값)을 이용 ; 필드명과 대치값은 타입이 일치
SELECT ENAME, SAL, COMM, SAL*12+NVL(COMM, 0) 연봉 FROM EMP;
    -- 모든 사원의 ENAME, MGR(상사사번)을 출력 (상사가 없으면 CEO로 출력)
SELECT ENAME, NVL(TO_CHAR(MGR),'CEO') MGR FROM EMP;

-- 6. 연결연산자(||) : 필드나 문자를 연결
SELECT ENAME || '은' || JOB EMPLOYEE FROM EMP;
    -- ex. 모든 사원에 대하여 'SMITH : ANNUAL SALARY = XXXX' 포맷으로 출력 (연봉=SAL*12+COMM)
SELECT ENAME || ' : ANNUAL SALARY = ' || (SAL*12+NVL(COMM,0)) MESSAGE FROM EMP;

-- 7. 중복제거(DISTINCT)
SELECT DISTINCT JOB FROM EMP;
SELECT DISTINCT DEPTNO FROM EMP;

-- ★ 연습문제 꼭 풀기
    --1. emp 테이블의 구조 출력
DESC EMP; 
    --2. emp 테이블의 모든 내용을 출력 
SELECT * FROM EMP;
    --3. 현 scott 계정에서 사용가능한 테이블 출력
SHOW USER;
SELECT * FROM TAB;
    --4. emp 테이블에서 사번, 이름, 급여, 업무, 입사일 출력
SELECT EMPNO, ENAME, SAL, JOB, HIREDATE FROM EMP;
    --5. emp 테이블에서 급여가 2000미만인 사람의 사번, 이름, 급여 출력
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL<2000;
    --6. 입사일이 81/02이후에 입사한 사람의 사번, 이름, 업무, 입사일 출력
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE >= '81/03/01';

    -- ※날짜설정이 RR/MM/DD가 아닌 경우의 고려
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP 
    WHERE TO_CHAR(HIREDATE,'RR/MM/DD') >= '81/02/01';
    --7. 업무가 SALESMAN인 사람들 모든 자료 출력
SELECT * FROM EMP WHERE JOB = 'SALESMAN';
    --8. 업무가 CLERK이 아닌 사람들 모든 자료 출력
SELECT * FROM EMP WHERE JOB != 'CLERK';
SELECT * FROM EMP WHERE JOB <> 'CLERK';
SELECT * FROM EMP WHERE JOB ^= 'CLERK';
SELECT * FROM EMP WHERE NOT JOB = 'CLERK';
    --9. 급여가 1500이상이고 3000이하인 사람의 사번, 이름, 급여 출력
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL>=1500 AND SAL<=3000;
    --10. 부서코드가 10번이거나 30인 사람의 사번, 이름, 업무, 부서코드 출력
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO=10 OR DEPTNO=30;
    --11. 업무가 SALESMAN이거나 급여가 3000이상인 사람의 사번, 이름, 업무, 부서코드 출력
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE JOB='SALESMAN' OR SAL>=3000;
    --12. 급여가 2500이상이고 업무가 MANAGER인 사람의 사번, 이름, 업무, 급여 출력
SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE SAL>=2500 AND JOB = 'MANAGER';
    --13.“ename은 XXX 업무이고 연봉은 XX다” 스타일로 모두 출력(연봉은 SAL*12+COMM)
SELECT ENAME||'은(는) '||job||'업무이고 연봉은'||(SAL*12+NVL(COMM,0)) ||'다' FROM EMP;
    -- CF. "ENAME의 상여는 800" (연결연산자로 하면 NULL은 출력 안 됨)
SELECT ENAME || '의 상여금은 ' || NVL(COMM,0) FROM EMP;

-- 8. SQL연산자(BETWEEN, IN, LIKE, IS NULL)
 -- (1) BETWEEN A AND B ; A부터 B까지 (A, B포함)
    -- ex.SAL이 1500이상 3000이하인 직원의 사번, 이름, 급여
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL>=1500 AND SAL<=3000;
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL BETWEEN 1500 AND 3000;
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL BETWEEN 3000 AND 1500; -- 불가
    -- ex. sal이 1500미만, 3000초과
SELECT * FROM EMP WHERE SAL NOT BETWEEN 1500 AND 3000;
    -- ex. 이름이 'A','B','C'로 시작하는 직원의 모든 필드
SELECT * FROM EMP WHERE ENAME BETWEEN 'A' AND 'D' AND ENAME!='D'; -- 'A'~'D'까지/'D'는 제외
    -- ex. 82년도에 입사한 직원의 모든 필드 출력
SELECT * FROM EMP WHERE HIREDATE BETWEEN '82/01/01' AND '82/12/31';

 -- (2) IN
    -- ex. 부서번호가 10, 20, 40번 부서인 직원의 모든 필드
SELECT * FROM EMP WHERE DEPTNO=10 OR DEPTNO=20 OR DEPTNO=40;
SELECT * FROM EMP WHERE DETPNO IN (10,20,40);
    -- ex. 부서번호가 10,20,40번을 제외한 부서 직원의 모든 필드
SELECT * FROM EMP WHERE NOT (DEPTNO=10 OR DEPTNO=20 OR DEPTNO=40);
SELECT * FROM EMP WHERE DEPTNO NOT IN (10,20,40);
    -- ex. 사번이 7902, 7788, 7566인 사원의 모든 필드
SELECT * FROM EMP WHERE EMPNO IN (7902, 7788, 7566);
    -- ex. 직책이 MANAGER이거나 ANALYST인 사원의 모든 필드
SELECT * FROM EMP WHERE JOB IN ('MANAGER', 'ANALYST');

 -- (3) LIKE 









