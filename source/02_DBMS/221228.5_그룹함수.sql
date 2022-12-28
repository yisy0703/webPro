-- [ V ] 그룹함수 : SUM, AVG, MIN, MAX, COUNT, STDDEV(표준편차), VARIANCE(분산)
SELECT MAX(SAL) FROM EMP;
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO; -- 부서별
SELECT MAX(SAL) FROM EMP; -- 최대 급여를 받는 사람의 이름과 최대급여 -> VI. 서브쿼리
SELECT ENAME, SAL FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP);

-- ★  1. 그룹함수들 실습
SELECT ROUND(AVG(SAL),2) FROM EMP;
SELECT AVG(SAL), SUM(SAL)/COUNT(SAL) FROM EMP;
SELECT SUM(COMM) FROM EMP; -- 평균 : 2200/14(157.14) OR 2200/4(550)
SELECT SUM(COMM), COUNT(COMM), AVG(COMM) FROM EMP; -- 모든 그룹함수는 null값을 제외
SELECT COUNT(*) FROM EMP; -- 테이블 행수

--sal의 평균, 합, 최소값, 최대값, 분산, 표준편차, 갯수(평균, 분산, 표준편차 소수점 한자리에서 반올림)
SELECT ROUND(AVG(SAL),1), SUM(SAL), MIN(SAL), MAX(SAL), 
        ROUND(VARIANCE(SAL),1), ROUND(STDDEV(SAL),1)
    FROM EMP;
-- 그룹함수 MIN, MAX, COUNT는 숫자형, 문자형, 날짜형 모두 가능

SELECT AVG(SAL)-2*STDDEV(SAL), AVG(SAL)+2*STDDEV(SAL) FROM EMP; -- 95.44%의 SAL
-- 탄탄ex1. 입사한지 가장 오래된 사원의 입사일과 가장 최근에 입사한 사원의 입사일을 출력. 
SELECT MIN(HIREDATE), MAX(HIREDATE) FROM EMP;
-- 탄탄ex2. (결과) 80/12/17:14620일째 83/01/12:13864일째
SELECT MIN(HIREDATE)||':'||TRUNC(SYSDATE-MIN(HIREDATE))||'일째' FIRST,
        MAX(HIREDATE)||':'||TRUNC(SYSDATE-MAX(HIREDATE))||'일째' LAST
    FROM EMP;

-- 탄탄ex3.  (결과) 80년12월17일 최초입사:14,620일째 83년01월12일 최근입사 :13,864일째
SELECT TO_CHAR(MIN(HIREDATE), 'RR"년"MM"월"DD"일 최초입사:"') ||
        TRIM(TO_CHAR(TRUNC(SYSDATE-MIN(HIREDATE)), '99,999'))|| '일째' FIRST,
       TO_CHAR(MAX(HIREDATE), 'RR"년"MM"월"DD"일 최근입사:"') ||
        TRIM(TO_CHAR(TRUNC(SYSDATE-MAX(HIREDATE)), '99,999')) || '일째' LAST
    FROM EMP; -- TO_CHAR가 연결연산자를 만나면 ' ' 자동 추가
-- 탄탄ex4. 10번 부서 소속의 사원 중에서 COMM을 받는 사원의 수를 구해 보시오.
SELECT COUNT(COMM) FROM EMP WHERE DEPTNO=10 AND COMM>0;
--       3              1         2

-- ★ 2. GROUP BY 절
-- 부서번호별 최대 급여, 평균 급여 (부서번호 순 정렬)
SELECT DEPTNO, MAX(SAL), AVG(SAL) FROM EMP GROUP BY DEPTNO ORDER BY DEPTNO;
    -- GROUP BY 절에서는 컬럼의 별칭을 사용할 수 없다(ORDER BY절에서만 컬럼별칭 사용가능)
SELECT DEPTNO 부서, MAX(SAL), AVG(SAL) FROM EMP GROUP BY DEPTNO ORDER BY 부서;
--              3                          1             2            4

-- 부서이름별 최대급여, 평균 급여 (평균급여순 정렬)
SELECT DNAME, MAX(SAL), AVG(SAL) AVG_SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    GROUP BY DNAME
    ORDER BY AVG_SAL;

    -- ex. SAL이 5000미만인 사원에 대해서만 부서번호별 사원수, 최대급여, 최소급여, 평균급여
            -- (부서번호 순 정렬)
SELECT DEPTNO, COUNT(*), MAX(SAL), MIN(SAL), AVG(SAL)
    FROM EMP
    WHERE SAL<5000
    GROUP BY DEPTNO
    ORDER BY DEPTNO;

-- ★ 3. HAVING 절 : 그룹함수의 결과 조건
    -- 부서번호별 평균 급여(평균급여가 2000이상인 부서만 출력)
SELECT DEPTNO, AVG(SAL) AVG_SAL   
    FROM EMP              
    GROUP BY DEPTNO       
    HAVING AVG(SAL) > 2000 -- HAVING 절에서 필드의 별칭 사용 불가
    ORDER BY DEPTNO;  -- 필드의 별칭은 ORDER BY절에만 사용 가능







