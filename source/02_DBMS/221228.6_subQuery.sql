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
    SELECT ENAME, SAL, ROUND((SELECT AVG(SAL) FROM EMP))-SAL "DIFF"
        FROM EMP
        WHERE SAL < (SELECT AVG(SAL) FROM EMP);
    
-- 단일행 다중열 서브쿼리
    -- ex. SCOTT의 JOB과 부서번호가 같은 직원의 모든 필드 출력.
    SELECT JOB, DEPTNO  FROM EMP WHERE ENAME='SCOTT'; -- 단일행 다중열 서브쿼리
    SELECT * FROM EMP
        WHERE (JOB, DEPTNO) = (SELECT JOB, DEPTNO  FROM EMP WHERE ENAME='SCOTT')
            AND ENAME <> 'SCOTT';

-- ★ 3. 다중행 서브쿼리 : IN, ALL, ANY=SOME, EXISTS
-- (1) IN : 서브쿼리 결과 중 하나라도 일치하면 참
    -- ex. 부서별 입사일이 가장 늦은 사람의 이름, 입사일, 부서번호
    SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO; -- 다중행 다중열 서브쿼리
    SELECT ENAME, HIREDATE, DEPTNO FROM EMP
        WHERE (DEPTNO, HIREDATE) IN
                    (SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO); -- 메인쿼리
    -- ex. 급여가 3000이상 받는 사원이 소속된 부서의 사원들의 모든 필드
    SELECT DEPTNO FROM EMP WHERE SAL >= 3000; -- 다중행 단일열 서브쿼리
    SELECT * FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL >= 3000);--메인쿼리

-- (2) ALL ; 서브쿼리 결과가 모두 만족하면 참
    -- ex. 30번 부서직원 모두의 급여보다 큰 직원의 모든 필드
    SELECT SAL FROM EMP WHERE DEPTNO=30; -- 950, 1250, 1500, 1600, 2850 서브쿼리
    SELECT * FROM EMP
        WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO=30); -- 다중행서브쿼리 이용
    
    SELECT * FROM EMP
        WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30); -- 단일행서브쿼리 이용
-- (3) ANY=SOME ; 서브쿼리 결과가 하나라도 만족하면 참
    -- ex. 30번 부서직원 하나만이라도 급여가 큰 직원의 모든 필드
    SELECT SAL FROM EMP WHERE DEPTNO=30; -- 다중행 단일열 서브쿼리
    SELECT * FROM EMP
        WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO=30); -- 다중행 서브쿼리 이용
    SELECT * FROM EMP
        WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30); -- 단일행 서브쿼리 이용

-- (4) EXISTS : 서브쿼리 결과가 존재하면 참
    -- 직속부하가 있는 직원들의 사번, 이름, 급여
    SELECT EMPNO, ENAME, SAL FROM EMP MANAGER
        WHERE EXISTS (SELECT * FROM EMP WHERE MANAGER.EMPNO=MGR); -- 서브쿼리 이용
    SELECT DISTINCT M.EMPNO, M.ENAME, M.SAL
        FROM EMP W, EMP M
        WHERE W.MGR=M.EMPNO; -- SELF JOIN 이용
    -- 직속부하가 없는 직원들의 사번, 이름, 급여
    SELECT EMPNO, ENAME, SAL FROM EMP MANAGER
        WHERE NOT EXISTS (SELECT * FROM EMP WHERE MANAGER.EMPNO=MGR);--서브쿼리 이용
    SELECT M.EMPNO, M.ENAME, M.SAL
        FROM EMP W, EMP M
        WHERE W.MGR(+)=M.EMPNO AND W.ENAME IS NULL; -- SELF JOIN 이용




-- ★ 총 연습문제
--1. 사원테이블에서 가장 먼저 입사한 사람의 이름, 급여, 입사일
SELECT ENAME, SAL, HIREDATE
    FROM EMP
    WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP);
-- 2. 회사에서 가장 급여가 적은 사람의 이름, 급여
SELECT ENAME, SAL
    FROM EMP
    WHERE SAL = (SELECT MIN(SAL) FROM EMP);
-- 3. 회사 평균보다 급여를 많이 받는 사람의 이름, 급여, 부서코드
SELECT ENAME, SAL, DEPTNO
    FROM EMP
    WHERE SAL > (SELECT AVG(SAL) FROM EMP);
--4. 회사 평균 이하의 급여를 받는 사람의 이름, 급여, 부서명
SELECT ENAME, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND SAL <= (SELECT AVG(SAL) FROM EMP);
--5. SCOTT보다 먼저 입사한 사람의 이름, 급여, 입사일, 급여 등급
SELECT ENAME, SAL, HIREDATE, GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL AND
        HIREDATE <(SELECT HIREDATE FROM EMP WHERE ENAME='SCOTT');
--6. 5번(SCOTT보다 먼저 입사한 사람의 이름, 급여, 입사일, 급여 등급)에 부서명 추가하고 급여가 큰 순 정렬
SELECT ENAME, SAL, HIREDATE, GRADE, DNAME
    FROM EMP E, SALGRADE, DEPT D
    WHERE SAL BETWEEN LOSAL AND HISAL AND E.DEPTNO=D.DEPTNO AND
        HIREDATE <(SELECT HIREDATE FROM EMP WHERE ENAME='SCOTT')
    ORDER BY SAL DESC;
--7. BLAKE 보다 급여가 많은 사원들의 사번, 이름, 급여
SELECT EMPNO, ENAME, SAL FROM EMP
    WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME='BLAKE');
--8. MILLER보다 늦게 입사한 사원의 사번, 이름, 입사일
SELECT EMPNO, ENAME, HIREDATE FROM EMP
    WHERE HIREDATE > (SELECT HIREDATE FROM EMP WHERE ENAME='MILLER');
--9. 사원전체 평균 급여보다 급여가 많은 사원들의 사번, 이름, 급여
SELECT EMPNO, ENAME, SAL 
    FROM EMP
    WHERE SAL > (SELECT AVG(SAL) FROM EMP);
--10. CLARK와 같은 부서번호이며, 사번이 7698인 직원의 급여보다 많은 급여를 받는 사원의 
    -- 사번, 이름, 급여
SELECT DEPTNO FROM EMP WHERE ENAME='CLARK'; -- 서브쿼리(CLARK의 부서번호)
SELECT SAL FROM EMP WHERE EMPNO=7698;  -- 서브쿼리(7698사번 직원의 급여)
SELECT EMPNO, ENAME, SAL FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME='CLARK') AND
        SAL>(SELECT SAL FROM EMP WHERE EMPNO=7698);

--11.  응용심화. CLARK와 같은 부서명이며, 사번이 7698인 직원의 급여보다 많은 급여를 받는 사원의 
    -- 사번, 이름, 급여
SELECT DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME='CLARK';--서브쿼리1(부서명)
SELECT SAL FROM EMP WHERE EMPNO=7698;  -- 서브쿼리(7698사번 직원의 급여)
SELECT EMPNO, ENAME, SAL 
    FROM EMP E, DEPT D 
    WHERE E.DEPTNO=D.DEPTNO AND
        DNAME = (SELECT DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME='CLARK')
        AND SAL>(SELECT SAL FROM EMP WHERE EMPNO=7698);
--12. BLAKE와 같은 부서에 있는 모든 사원의 이름과 입사일자
SELECT ENAME, HIREDATE 
    FROM EMP 
    WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='BLAKE');
--13. 평균 급여 이상을 받는 모든 종업원에 대해서 사원번호와 이름 단 급여가 많은 순으로 출력)
SELECT EMPNO, ENAME 
    FROM EMP 
    WHERE SAL>=(SELECT AVG(SAL) FROM EMP) 
    ORDER BY SAL DESC;






