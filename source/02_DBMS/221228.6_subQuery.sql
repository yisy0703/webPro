-- [ VI ] Sub Query : 메인 QUERY(SQL문) 안에 QUERY(SQL문)이 내포

-- ★ 1. 서브 쿼리 개념
-- 서브쿼리가 필요한 ex. 급여를 제일 많이 받는 사람의 이름과 급여
    SELECT ENAME, MAX(SAL) FROM EMP; -- 에러
    SELECT ENAME, MAX(SAL) FROM EMP GROUP BY ENAME; -- 다 찍혀
    SELECT MAX(SAL) FROM EMP; -- 서브쿼리
    SELECT ENAME, SAL FROM EMP
        WHERE SAL = (SELECT MAX(SAL) FROM EMP); -- 메인 쿼리
        
-- 서브쿼리 종류(1) 단일행 서브쿼리(서브쿼리의 실행결과가 단일행) : = > >= < <= != 
    -- ex. scott이 근무하는 부서이름 출력
SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT'; -- 서브쿼리
SELECT DNAME FROM DEPT 
    WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT'); -- 메인 쿼리

SELECT DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME='SCOTT';-- JOIN이용

-- 서브쿼리 종류(2)다중행 서브쿼리(서브쿼리 실행결과가 2행이상) : IN, > ALL, ANY(SOME), EXISTS
    -- ex. job이 MANAGER인 사람의 부서이름
    SELECT DEPTNO FROM EMP WHERE JOB='MANAGER'; -- 서브쿼리 결과가 3행
    SELECT DNAME FROM DEPT 
        WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB='MANAGER'); -- 메인쿼리

-- ★ 2. 단일행서브쿼리
    -- ex. SCOTT과 동일한 부서번호에서 근무하는 사원의 이름과 급여
    SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT'; -- 서브쿼리
    SELECT ENAME, SAL FROM EMP 
        WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT') AND ENAME <> 'SCOTT'; -- 메인쿼리
    -- ex. SCOTT과 동일한 근무지에서 근무하는 사원의 이름과 급여
        -- 데이터 추가 (DALLAS 50번 부서, 50번 부서의 HONG 사원)
        SELECT * FROM DEPT WHERE LOC='DALLAS';
        INSERT INTO DEPT VALUES (50, 'IT', 'DALLAS');
        INSERT INTO EMP (EMPNO, ENAME, DEPTNO) VALUES (9999, 'HONG', 50);
        SELECT * FROM EMP;
    SELECT LOC FROM DEPT D, EMP E
        WHERE D.DEPTNO=E.DEPTNO AND ENAME='SCOTT'; -- 서브쿼리
    SELECT ENAME, SAL
        FROM EMP E, DEPT D
        WHERE E.DEPTNO=D.DEPTNO AND LOC=(SELECT LOC FROM DEPT D, EMP E
                    WHERE D.DEPTNO=E.DEPTNO AND ENAME='SCOTT')
            AND ENAME != 'SCOTT'; -- 메인쿼리
        ROLLBACK; -- DML(추가, 수정, 삭제, 검색) 명령어 취소
    -- ex. 최초입사일과 최초입사자를 출력
    SELECT MIN(HIREDATE) FROM EMP; -- 단일행 서브쿼리
    SELECT HIREDATE, ENAME FROM EMP
        WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP); -- 메인쿼리
    -- ex. 최근입사일과 최근입사자를 출력
    SELECT MAX(HIREDATE) FROM EMP; -- 서브쿼리
    SELECT HIREDATE, ENAME FROM EMP
        WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP); -- 메인쿼리
    -- ex. 최초입사일, 최초입사자 이름, 최근입사일, 최근입사자 이름
    SELECT E1.HIREDATE, E1.ENAME, E2.HIREDATE, E2.ENAME
        FROM EMP E1, EMP E2
        WHERE E1.HIREDATE = (SELECT MIN(HIREDATE) FROM EMP)
            AND E2.HIREDATE=(SELECT MAX(HIREDATE) FROM EMP); -- 메인쿼리
    SELECT 
        (SELECT MIN(HIREDATE) FROM EMP) FIRSTDAY,
        (SELECT ENAME FROM EMP WHERE HIREDATE=(SELECT MIN(HIREDATE) FROM EMP)) FIRSTMAN,
        (SELECT MAX(HIREDATE) FROM EMP) LASTDAY,
        (SELECT ENAME FROM EMP WHERE HIREDATE=(SELECT MAX(HIREDATE) FROM EMP)) LASTMAN
    FROM DUAL;
    
    -- ex. SCOTT 과 같은 부서에 근무하는 사람들의 급여합
    SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT'; -- 서브쿼리
    SELECT SUM(SAL) FROM EMP 
        WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT'); -- 메인쿼리
    -- ex. soctt과 동일한 job을 가진 사원의 모든 필드
    SELECT JOB FROM EMP WHERE ENAME='SCOTT'; -- 서브쿼리 
    SELECT * FROM EMP WHERE JOB=(SELECT JOB FROM EMP WHERE ENAME='SCOTT'); -- 메인쿼리
    -- ex. DALLAS에서 근무하는 사원의 이름과 부서번호
    SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS'; -- 서브쿼리
    SELECT ENAME, DEPTNO FROM EMP 
        WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS'); -- 메인쿼리
    -- ex. 'KING'이 직속상사인 사원의 이름과 급여
    SELECT EMPNO FROM EMP WHERE ENAME='KING'; -- 서브쿼리
    SELECT ENAME, SAL FROM EMP
        WHERE MGR=(SELECT EMPNO FROM EMP WHERE ENAME='KING'); -- 메인쿼리
    
    SELECT W.ENAME, W.SAL
        FROM EMP W, EMP M
        WHERE W.MGR=M.EMPNO AND M.ENAME='KING'; -- SELF JOIN이용
    -- ex1. 평균급여 이하로 받는 사원의 이름과 급여를 출력
    SELECT AVG(SAL) FROM EMP; -- 서브쿼리
    SELECT ENAME, SAL FROM EMP WHERE SAL <= (SELECT AVG(SAL) FROM EMP); -- 메인쿼리
    -- ex2. 평균급여 이하로 받는 사원의 이름과  급여, 평균급여를 출력
    SELECT ENAME, SAL, ROUND((SELECT AVG(SAL) FROM EMP)) "AVG_SAL"
        FROM EMP
        WHERE SAL < (SELECT AVG(SAL) FROM EMP); -- 메인쿼리
    
    -- ex3. 평균급여 이하로 받는 사원의 이름과  급여, 평균급여와의 차이를 출력








