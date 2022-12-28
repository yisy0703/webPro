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





