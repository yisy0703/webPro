-- [ IV ] 단일행함수
-- 함수 = 단일행함수 + 그룹함수(집계함수)
SELECT HIREDATE, TO_CHAR(HIREDATE, 'YYYY-MM-DD') FROM EMP; -- 단일행 단일행 적용
SELECT ENAME, INITCAP(ENAME) FROM EMP; -- 단일행함수(INPUT 1행 -> OUTPUT 1행)
SELECT SUM(SAL), AVG(SAL) FROM EMP; -- 그룹함수(INPUT n행 -> OUTPUT 1행)
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO;-- 그룹함수(INPUT n행 -> OUTPUT 1행)

-- ★ 단일행함수의 종류 : 숫자관련함수, 문자관련함수, 날짜관련함수, 형변환함수, NVL(), ETC...
-- 1. 숫자관련함수 
    -- DUAL테이블 : 오라클에서 제공한 1행1열짜리 DUMMY TABLE
SELECT * FROM DUAL;
DESC DUAL;
SELECT * FROM DUMMY;
DESC DUMMY;
SELECT ABS(-1) FROM DUMMY; -- 절대값
SELECT FLOOR(34.5678) FROM DUAL; -- 소수점에서 내림(버림)
SELECT FLOOR(34.5678*100)/100 FROM DUAL; -- 소수점 두번째 자리에서 내림(버림)
SELECT TRUNC(34.5678, 2) FROM DUAL; -- 소수점 두번째 자리에서 내림(버림)
SELECT TRUNC(34.5678) FROM DUAL;    -- 소수점에서 내림(버림)
SELECT TRUNC(34.5678, -1) FROM DUAL; -- 일의 자리에서 내림(버림)
    -- ex. EMP테이블에서 이름, 급여(십의 자리에서 내림)
SELECT ENAME, SAL, TRUNC(SAL, -2) FROM EMP;
SELECT CEIL(34.5678) FROM DUAL; -- 소수점에서 올림

SELECT ROUND(34.5678) FROM DUAL; -- 소수점에서 반올림
SELECT ROUND(34.5678, 2) FROM DUAL; -- 소수점 두번째 자리까지 나오도록 반올림
SELECT ROUND(34.5678, -1) FROM DUAL;   -- 일의 자리에서 반올림

SELECT MOD(9,2) FROM DUAL; -- 나머지 연산자 (9%2)
    -- ex. 홀수년도에 입사한 사원의 모든 정보 출력
SELECT * FROM EMP WHERE MOD(TO_CHAR(HIREDATE, 'RR'), 2) = 1;

-- 2. 문자관련함수 
-- ① 대소문자 관련
SELECT INITCAP('WELCOME TO ORACLE') FROM DUAL; -- 첫문자만 대문로
SELECT INITCAP('welcome to oracle') FROM DUAL;
SELECT UPPER('ABCabc') FROM DUAL; -- 대문자로
SELECT LOWER('ABCabc') FROM DUAL; -- 소문자로
    -- ex. 이름이 SCOTT 인 직원의 모든 필드
SELECT * FROM EMP WHERE UPPER(ENAME)='SCOTT';
SELECT * FROM EMP WHERE INITCAP(ENAME)='Scott';
    -- ex. job이 MANAGER 인 직원의 모든 필드
SELECT * FROM EMP WHERE UPPER(JOB) = 'MANAGER';
SELECT * FROM EMP WHERE INITCAP(JOB) = 'Manager';
SELECT * FROM EMP WHERE LOWER(JOB) = 'manager';

-- ② 문자연결(concat함수, ||연산자)
SELECT 'AB'||'CD'||'EF'||'GH' FROM DUAL;
SELECT CONCAT(CONCAT('AB','CD'), CONCAT('EF','GH')) FROM DUAL;
    -- ex. SMITH는 manager다
SELECT CONCAT(CONCAT(ENAME, '는 '), CONCAT(JOB, '다')) FROM EMP;
SELECT ENAME || '는 ' || JOB || '다' FROM EMP;

-- ③ SUBSTR(STR, 시작위치, 문자갯수) : STR을 시작위치부터 문자갯수만큼 문자 추출
                    -- (시작위치가 1부터, 시작위치가 음수이면 끝부터 자리수를 셉니다)
  -- SUBSTRB(STR, 시작바이트위치, 문자바이트수)
SELECT SUBSTR('ORACLE', 3, 2) FROM DUAL; -- 3번째 글자부터 2글자 추출
SELECT SUBSTRB('ORACLE', 3, 2) FROM DUAL;-- 3번째 바이트부터 2바이트 추출
SELECT SUBSTR('데이터베이스', 4, 3) FROM DUAL; -- 4번째 글자부터 3글자 추출(베이스)
SELECT SUBSTRB('데이터베이스', 4, 3) FROM DUAL;-- 4번째 바이트부터 3바이트 추출(이)
    -- O R A C L E
    -- 1 2 3 4 5 6(위치)
    ---6-5-4-3-2-1(위치)
SELECT SUBSTR('WELCOME TO ORACLE', -1, 1) FROM DUAL; -- -1번째 글자부터 한글자 추출
SELECT SUBSTR('ORACLE', -2, 2) FROM DUAL; -- 마지막 글자 2글자 추출
SELECT SUBSTR(123, 2, 1) FROM DUAL; -- 숫자도 가능(숫자를 문자로 바꿔 2번째 부터 1글자 추출)
    -- ex. 9월에 입사한 사원의 모든 필드 'RR/MM/DD'
SELECT * FROM EMP WHERE SUBSTR(HIREDATE, 4, 2)='09'; -- DATE형도 가능
SELECT * FROM EMP WHERE SUBSTR(TO_CHAR(HIREDATE,'RR/MM/DD'), 4, 2)='09';
    -- ex. 9일에 입사한 사원의 모든 필드 'RR/MM/DD'
SELECT * FROM EMP WHERE SUBSTR(HIREDATE, -2, 2) = '09';
SELECT * FROM EMP WHERE SUBSTR(TO_CHAR(HIREDATE,'RR/MM/DD'), -2, 2) = '09';

-- ④ LENGTH(STR) : STR의 글자수
   -- LENGTHB(STR) : STR의 바이트 수
SELECT LENGTH('ABCD') FROM DUAL; -- 글자수
SELECT LENGTHB('ABCD') FROM DUAL; -- 바이트수
SELECT LENGTH('오라클') FROM DUAL; -- 결과 : 3
SELECT LENGTHB('오라클') FROM DUAL; -- 결과 : 9













